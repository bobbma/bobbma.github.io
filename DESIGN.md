# Design

## Source of truth
- Status: Active
- Last refreshed: 2026-08-12
- Primary product surfaces: Single-page academic portfolio at `bobbma.github.io`
- Evidence reviewed: `/home/myx/cv/resume/resume-zh_EN.tex`, public GitHub profile and repositories, supplied Google Scholar URL, `assets/yuexiao-ma.jpg`, official paper PDFs and publication pages

## Brand
- Personality: Precise, credible, technically ambitious, approachable
- Trust signals: Current affiliation, peer-reviewed venues, direct paper links, institutional email, reviewer service
- Avoid: Marketing-style claims, decorative gradients, generic AI imagery, crowded publication cards

## Product goals
- Goals: Establish Yuexiao Ma's research identity; make publications, experience, CV, and contact details easy to scan for an international audience
- Non-goals: Blog platform, publication CMS, live citation counter, exhaustive project archive
- Success signals: Visitors understand the research focus in one viewport and reach a paper, CV, Scholar profile, or email in one action

## Personas and jobs
- Primary personas: Academic peers, prospective collaborators, research hiring managers, students
- User jobs: Assess research fit, review selected work, verify background, initiate contact
- Key contexts of use: Desktop research browsing and mobile link sharing

## Information architecture
- Primary navigation: About, Research, Publications, Experience, Service
- Core routes/screens: One-page site with anchored sections
- Content hierarchy: Compact identity summary, complete publication record, research focus, timeline, professional service, contact

## Design principles
- Evidence first: Venue, contribution, and outcome carry more weight than decoration
- Dense and scholarly: Favor a compact CV-like reading rhythm over oversized editorial composition
- Direct access: Primary artifacts are one click away
- Tradeoffs: The complete publication record is shown; supporting descriptions stay short to keep the page scannable

## Visual language
- Color: Ink, paper white, muted blue, cyan accent, restrained warm highlight
- Typography: System sans for dense metadata and Source Serif for restrained headings; no display type above 56px
- Spacing/layout rhythm: 6px base rhythm with compact 64-80px sections and 18-24px publication rows
- Shape/radius/elevation: 2-6px radii; thin rules; minimal elevation
- Motion: Small entrance and hover transitions; fully disabled under reduced motion
- Imagery/iconography: One compact authentic portrait, paper-owned overview/first-page thumbnails, Lucide icons loaded from a pinned CDN

## Components
- Existing components to reuse: None; new repository
- New/changed components: Sticky navigation, compact identity header, dense publication entries with thumbnails and resource links, research focus list, experience timeline, theme switch
- Variants and states: Light/dark theme and mobile navigation
- Token/component ownership: CSS custom properties in `styles.css`

## Accessibility
- Target standard: WCAG 2.2 AA
- Keyboard/focus behavior: Visible focus rings, escape-close mobile navigation, semantic links and buttons
- Contrast/readability: High-contrast text and accent colors in both themes
- Screen-reader semantics: Landmark elements, heading hierarchy, descriptive labels
- Reduced motion and sensory considerations: Honors `prefers-reduced-motion`

## Responsive behavior
- Supported breakpoints/devices: Modern mobile and desktop browsers, 360px and wider
- Layout adaptations: Identity header and timeline collapse to one column; publication thumbnails remain visible at reduced size; navigation becomes a compact menu
- Touch/hover differences: Minimum 44px controls; hover styling is non-essential

## Interaction states
- Loading: Static site, no blocking data request
- Empty: Not applicable
- Error: External links remain independent; no dynamic content dependency
- Success: Copy-free direct navigation and mail links
- Disabled: Not applicable
- Offline/slow network: Core content and styling are local; web fonts/icons degrade gracefully

## Content voice
- Tone: Academic, concise, first person
- Terminology: Efficient AI, model compression, quantization, video generation
- Microcopy rules: State specific research outcomes; avoid inflated adjectives

## Implementation constraints
- Framework/styling system: Dependency-free HTML, CSS, and JavaScript for GitHub Pages
- Design-token constraints: All repeated colors, typography, and layout values use CSS custom properties
- Performance constraints: No framework bundle; optimized local portrait and compressed local paper thumbnails; fonts are optional enhancements
- Compatibility constraints: GitHub Pages user-site root deployment
- Test/screenshot expectations: HTML validation, verified paper/code links, responsive browser screenshots at desktop and mobile widths, visual-verdict score of 90+

## Open questions
- [ ] Confirm current postdoctoral start date and whether it should replace the Ph.D. entry as the primary role
- [ ] Confirm whether all 2026 publication statuses are final and public
- [ ] Add citation counts only if a stable, user-controlled data source becomes available
- [ ] Replace abstract/first-page thumbnails when official method figures or project pages become available
