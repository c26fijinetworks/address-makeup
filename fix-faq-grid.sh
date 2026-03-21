#!/bin/bash

# Update the index.astro file to include the 4th FAQ item
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
          description: 'None whatsoever. If you can take a photo of a client and post it to Instagram, you can maintain your Address.Makeup website.', 
          icon: 'tabler:tool' 
        },
        { 
          title: 'Is it really a one-time payment?', 
          description: 'Yes. Most website builders charge $300+/year. We charge a one-time setup fee for our labor and boutique design. You own it for life with zero monthly SaaS taxes.', 
          icon: 'tabler:coin' 
        },
    ]}
  />
</Layout>
INNEREOF

# Execution: Git Push
git add .
git commit -m "UI: Added 4th FAQ item to fix homepage grid layout"
git push

echo "SUCCESS: Homepage FAQ grid fixed and pushed to Github."
