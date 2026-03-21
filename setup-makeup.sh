#!/bin/bash

# 1. Update Navigation
cat << 'INNEREOF' > src/navigation.ts
import { getPermalink } from './utils/permalinks';

export const headerData = {
  links: [
    { text: 'Features', href: getPermalink('/#features') },
    { text: 'Process', href: getPermalink('/#process') },
    { text: 'The Story', href: getPermalink('/about') },
    { text: 'Pricing', href: getPermalink('/pricing') },
  ],
  actions: [
    { text: 'Claim Your URL', variant: 'primary', href: '/pricing' }
  ],
};

export const footerData = {
  links: [
    {
      title: 'Address.Makeup | Beauty Artistry 💄',
      links: [
        { text: "Claim Your Site – $99", href: getPermalink('/pricing') },
        { text: 'The Story', href: getPermalink('/about') },
        { text: 'Support', href: getPermalink('/contact') },
      ],
    },
  ],
  secondaryLinks: [
    { text: 'Terms of Service', href: getPermalink('/terms') },
    { text: 'Privacy Policy', href: getPermalink('/privacy') },
  ],
  socialLinks: [],
  footNote: '© 2026. All rights reserved.',
};
INNEREOF

# 2. Update Pricing Data
cat << 'INNEREOF' > src/data/pricingData.ts
export const lifetimeDeal = {
  title: 'Makeup Studio Plan',
  subtitle: 'Boutique Websites for MUAs',
  price: 99,
  period: 'One-time payment',
  items: [
    { description: 'Premium Vanity URL (address.makeup/yourstudio)' },
    { description: 'Real-time Instagram Portfolio Sync' },
    { description: 'Aesthetic High-Glam Design' },
    { description: 'Mobile-First User Experience' },
    { description: 'Integrated Booking Links' },
    { description: 'Zero Maintenance / No Monthly Fees' },
    { description: 'Same Day Setup Guaranteed' },
  ],
  callToAction: { target: '_blank' as const, text: 'Claim Your Studio\'s Website', href: '#', variant: 'success' },
};
INNEREOF

# 3. Update Home Page
cat << 'INNEREOF' > src/pages/index.astro
---
import Layout from '~/layouts/PageLayout.astro';
import Header from '~/components/widgets/Header.astro';
import Hero2 from '~/components/widgets/Hero2.astro';
import Features from '~/components/widgets/Features.astro';
import Steps2 from '~/components/widgets/Steps2.astro';
import Content from '~/components/widgets/Content.astro';
import Pricing from '~/components/widgets/Pricing.astro';
import { headerData } from '~/navigation';
import FAQs from '~/components/widgets/FAQs.astro';
import { lifetimeDeal } from '~/data/pricingData';

const metadata = { 
  title: 'Address.Makeup | Boutique Websites for Makeup Artists', 
  description: 'Your Artistry Deserves a Digital Masterpiece. High-end websites with automated Instagram sync and vanity URLs for elite MUAs.' 
};
---
<Layout metadata={metadata}>
  <Fragment slot="header"><Header {...headerData} isSticky /></Fragment>
  
  <Hero2
    tagline="Boutique Web Development for MUAs"
    title='<span class="text-accent dark:text-white">Your Artistry Deserves a Digital Masterpiece.</span>'
    subtitle="We build elegant, high-converting websites that sync with your makeup portfolio in real-time. Stand out with a professional address while you focus on the glam."
    actions={[{ variant: 'primary', text: 'Claim Your Studio\'s Website', href: '/pricing/' }, { text: 'Features', href: '#features' }]}
    image={{ src: '/images/hero-poster.webp', width: 1024, height: 576 }}
  />

  <Features
    id="features"
    title="Everything Your Studio Needs"
    subtitle="Essential elements of a high-performance beauty website in a single, beautiful package."
    items={[
        { 
          title: 'Aesthetic Artistry Design', 
          description: 'Our layouts are custom-crafted to mirror the luxury and lighting of a professional makeup suite. We prioritize high-resolution imagery that tells your brand story and builds instant trust.', 
          icon: 'tabler:palette' 
        },
        { 
          title: 'Automated Portfolio Feeds', 
          description: 'Every time you post a fresh makeover or bridal transformation on Instagram, your website updates automatically. Your site stays as fresh as your latest client application.', 
          icon: 'tabler:brand-instagram' 
        },
        { 
          title: 'Booking & Strategy', 
          description: 'We integrate your booking engine into a mobile-optimized layout. We ensure bridal inquiries and appointment requests are just one tap away for local clients.', 
          icon: 'tabler:info-circle' 
        },
        { 
          title: 'Professional Technical Suite', 
          description: 'Hosting, SSL security, and global delivery. We handle the enterprise-grade tech so your high-res portfolio loads instantly on any device.', 
          icon: 'tabler:cloud-computing' 
        },
    ]}
  />

  <Content
    isReversed={false}
    tagline="Always Current. Zero Stress."
    title="Your site stays as fresh as your latest makeover."
    items={[
        { title: 'Real-time Instagram Sync', description: 'Your portfolio updates automatically every time you post a new look.', icon: 'tabler:refresh' },
        { title: 'Automatic Content Refresh', description: 'No more outdated galleries. Your latest work is always front and center.', icon: 'tabler:camera' },
    ]}
    image={{ src: '/images/testimonial-2.webp', alt: 'Makeup Artist working on a client' }}
  >
    <Fragment slot="content">
      <h3 class="text-2xl font-bold tracking-tight dark:text-white sm:text-3xl mb-2">
        <span class="text-accent dark:text-white">Instant Glam Portfolio</span>
      </h3>
      <p>We automatically sync your latest Instagram posts directly to your homepage so your site reflects your current artistry and skill level.</p>
    </Fragment>
  </Content>

  <div id="process" class="scroll-mt-20">
    <Steps2
      isReversed={true}
      title="The Path to a Better Presence"
      subtitle="Three simple steps to your new digital studio."
      items={[
        { title: '01. Secure Your Brand', description: 'Choose your preferred vanity URL (address.makeup/yourname).', icon: 'tabler:number-1' },
        { title: '02. We Build & Sync', description: 'Our studio crafts your site and connects your social feeds for auto-updates.', icon: 'tabler:number-2' },
        { title: '03. Launch & Glow', description: 'Go live and start attracting high-value clients and bridal bookings.', icon: 'tabler:number-3' },
      ]}
      image={{ src: '/images/testimonial-6.webp', alt: 'Makeup Artist process' }}
    />
  </div>

  <Pricing title='Ready to elevate your beauty brand?' prices={[lifetimeDeal]} />

  <FAQs
    title="Deep Dive: How Address.Makeup Works"
    items={[
        { 
          title: 'What is a Vanity URL exactly?', 
          description: 'A Vanity URL is a branded link like <strong>address.makeup/yourstudio</strong>. It replaces messy booking links in your bio with a luxury experience.', 
          icon: 'tabler:link' 
        },
        { 
          title: 'Does it work for Bridal MUAs?', 
          description: 'Absolutely. It is the perfect home for bridal portfolios, service menus, and inquiry forms. It establishes you as the local authority in beauty.', 
          icon: 'tabler:bolt' 
        },
        { 
          title: 'Do I need technical skills?', 
          description: 'None. If you can take a photo of a client and post it to Instagram, you can maintain your Address.Makeup website.', 
          icon: 'tabler:tool' 
        },
    ]}
  />
</Layout>
INNEREOF

# 4. Update About Page
cat << 'INNEREOF' > src/pages/about.astro
---
import Hero2 from '~/components/widgets/Hero2.astro';
import Content from '~/components/widgets/Content.astro';
import Layout from '~/layouts/PageLayout.astro';
import Pricing from '~/components/widgets/Pricing.astro';
import { lifetimeDeal } from '~/data/pricingData';

const metadata = { 
  title: 'The Story | Address.Makeup', 
  description: 'Why we build boutique websites for the world’s best makeup artists.' 
};
---
<Layout metadata={metadata}>
  <Hero2
    tagline="The Story"
    title='Elite Websites for <span class="text-accent">Elite MUAs</span>'
    subtitle="We believe your digital address should be as beautiful as the transformations you create at the vanity. Your website is your digital handshake."
    actions={[{ variant: 'primary', text: 'Secure My Address', href: '/pricing/' }]}
    image={{ src: '/images/hero-poster.webp', alt: 'Address.Makeup Professional Branding' }}
  />
  
  <Content
    isReversed={false}
    items={[
        { 
          title: 'Mirror Your Luxury', 
          description: 'You’ve perfected your craft. Why settle for a generic booking link? We believe your digital home should mirror the luxury and vibe of your studio.', 
          icon: 'tabler:award' 
        },
        { 
          title: 'Focus on Artistry, Not Tech', 
          description: 'Makeup artists are creators, not developers. We handle the code so your online presence stays perfect while you focus on the glam.', 
          icon: 'tabler:brush' 
        },
    ]}
  >
    <Fragment slot="content">
      <h3 class="text-3xl font-bold mb-4">Our Beauty Philosophy</h3>
      <p class="text-lg text-muted">In the modern beauty industry, "Generic" is the enemy of "Luxury." We provide a clean, dedicated digital address that establishes you as a local authority.</p>
    </Fragment>
    <Fragment slot="image">
       <img src="/images/testimonial-4.webp" alt="Professional makeup studio" class="rounded-lg shadow-xl w-full" />
    </Fragment>
  </Content>
  <Pricing title="Ready to Own Your Professional Identity?" prices={[lifetimeDeal]} />
</Layout>
INNEREOF

# 5. Update Components (Announcement, Sticky Footer, Logo)
cat << 'INNEREOF' > src/components/widgets/Announcement.astro
<div class="dark text-sm bg-black hidden md:flex items-center justify-center overflow-hidden px-3 py-2 relative text-ellipsis whitespace-nowrap">
  <div class="flex items-center gap-2">
    <span>✨ </span><span class="text-white font-medium">Claim your professional <strong>address.makeup/yourstudio</strong> vanity URL today.</span>
  </div>
  <div class="absolute right-4 top-0 h-full flex items-center"><span class="text-white font-medium">Same-day setup. Just $99</span></div>
</div>
INNEREOF

cat << 'INNEREOF' > src/components/widgets/StickyFooterCTA.astro
---
import Button from '~/components/ui/Button.astro';
---
<div class="sticky bottom-0 z-40 w-full flex-none">
  <div class="bg-white dark:bg-slate-900 border-t dark:border-slate-800 shadow-t-lg">
    <div class="max-w-7xl auto px-4 sm:px-6 py-3 flex justify-center items-center">
      <Button
        variant="primary"
        text="Claim Your Studio's Website - $99"
        href="/pricing"
      />
    </div>
  </div>
</div>
INNEREOF

cat << 'INNEREOF' > src/components/Logo.astro
---
---
<a href="/" class="flex items-center">
  <img src="/images/logo.webp" alt="Address.Makeup" class="h-10 w-auto mr-2 rtl:mr-0 rtl:ml-2" loading="lazy" decoding="async">
  <span class="self-center text-2xl md:text-xl font-bold text-gray-900 whitespace-nowrap dark:text-white">
    Address.Makeup
  </span>
</a>
INNEREOF

# 6. Git Push
git add .
git commit -m "Refactor: Target Makeup Studio owners (Address.Makeup)"
git push

echo "Successfully refactored for Address.Makeup and pushed to Github."
