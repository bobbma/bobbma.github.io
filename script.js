const root = document.documentElement;
const languageButtons = document.querySelectorAll("[data-language]");
const translatedElements = document.querySelectorAll("[data-en][data-zh]");
const themeToggle = document.querySelector("#theme-toggle");
const menuToggle = document.querySelector("#menu-toggle");
const mobileNav = document.querySelector("#mobile-nav");
const metaTheme = document.querySelector('meta[name="theme-color"]');

function refreshIcons() {
  if (window.lucide) {
    window.lucide.createIcons();
  }
}

function setLanguage(language) {
  const normalizedLanguage = language === "zh" ? "zh" : "en";
  root.lang = normalizedLanguage === "zh" ? "zh-CN" : "en";

  translatedElements.forEach((element) => {
    element.textContent = element.dataset[normalizedLanguage];
  });

  languageButtons.forEach((button) => {
    const isActive = button.dataset.language === normalizedLanguage;
    button.classList.toggle("is-active", isActive);
    button.setAttribute("aria-pressed", String(isActive));
  });

  localStorage.setItem("language", normalizedLanguage);
}

function setTheme(theme) {
  const isDark = theme === "dark";
  root.dataset.theme = isDark ? "dark" : "light";
  themeToggle.innerHTML = `<i data-lucide="${isDark ? "sun" : "moon"}" aria-hidden="true"></i>`;
  themeToggle.setAttribute("aria-label", isDark ? "Use light theme" : "Use dark theme");
  metaTheme?.setAttribute("content", isDark ? "#11191d" : "#f6f7f4");
  localStorage.setItem("theme", isDark ? "dark" : "light");
  refreshIcons();
}

function setMenu(open) {
  mobileNav.hidden = !open;
  menuToggle.setAttribute("aria-expanded", String(open));
  menuToggle.setAttribute("aria-label", open ? "Close navigation" : "Open navigation");
  menuToggle.innerHTML = `<i data-lucide="${open ? "x" : "menu"}" aria-hidden="true"></i>`;
  refreshIcons();
}

languageButtons.forEach((button) => {
  button.addEventListener("click", () => setLanguage(button.dataset.language));
});

themeToggle.addEventListener("click", () => {
  setTheme(root.dataset.theme === "dark" ? "light" : "dark");
});

menuToggle.addEventListener("click", () => {
  setMenu(menuToggle.getAttribute("aria-expanded") !== "true");
});

mobileNav.querySelectorAll("a").forEach((link) => {
  link.addEventListener("click", () => setMenu(false));
});

document.addEventListener("keydown", (event) => {
  if (event.key === "Escape" && !mobileNav.hidden) {
    setMenu(false);
    menuToggle.focus();
  }
});

const sections = document.querySelectorAll("main section[id]");
const desktopLinks = document.querySelectorAll(".desktop-nav a");
const sectionObserver = new IntersectionObserver(
  (entries) => {
    const visibleSection = entries
      .filter((entry) => entry.isIntersecting)
      .sort((first, second) => second.intersectionRatio - first.intersectionRatio)[0];

    if (!visibleSection) return;
    desktopLinks.forEach((link) => {
      link.classList.toggle("is-current", link.hash === `#${visibleSection.target.id}`);
    });
  },
  { rootMargin: "-25% 0px -60%", threshold: [0.05, 0.25, 0.5] }
);

sections.forEach((section) => sectionObserver.observe(section));

document.querySelector("#year").textContent = new Date().getFullYear();

const preferredTheme = localStorage.getItem("theme") || (window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light");
const preferredLanguage = localStorage.getItem("language") || (navigator.language.startsWith("zh") ? "zh" : "en");

setTheme(preferredTheme);
setLanguage(preferredLanguage);
setMenu(false);
window.addEventListener("load", refreshIcons);

