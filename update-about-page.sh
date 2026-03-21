#!/bin/bash

# Update the about.astro file with enriched content blocks and updated verbiage
cat << 'INNEREOF' > src/pages/about.astro
---
import Hero2 from '~/components/widgets/Hero2.astro';
import Content from '~/components/widgets/Content.astro';
import Layout from '~/layouts/PageLayout.astro';
import Pricing from '~/components/widgets/Pricing.astro';
import { lifetimeDeal } from '~/data/pricingData';

const metadata = { 
  title: 'The Story | Address.Makeup', 
  description: 'Why we build boutique websites for the world’s best makeup artists. Learn how we help MUAs dominate their local market.' 
};
---
<Layout metadata={metadata}>
  <!-- Hero Section -->
  <Hero2
    tagline="The Story"
    title='Elite Websites for <span class="text-accent">Elite MUAs</span>'
    subtitle="We believe your digital address should be as beautiful as the transformations you create at the vanity. Amazing artists lose clients when their online presence doesn't match their talent. We are here to bridge that gap."
    actions={[{ variant: 'primary', text: 'Claim My Lifetime Access', href: '/pricing/' }]}
    image={{ src: '/images/hero-poster.webp', alt: 'Address.Makeup Professional Branding' }}
  />
  
  <!-- Section 1: The "Why" with Icon List -->
  <Content
    isReversed={true}
    items={[
        { 
          title: 'The "Vanity Reveal" Moment', 
          description: 'The best time to show off your work is the second your client sees their transformation in the mirror. Our system captures that "glam glow" and puts it front and center on your professional URL.', 
          icon: 'tabler:sparkles' 
        },
        { 
          title: 'Local Search SEO', 
          description: 'When a bride-to-be searches "bridal makeup artist near me," Google looks for authority. A dedicated Address.Makeup URL signals that you are a high-end professional, not just a social media hobbyist.', 
          icon: 'tabler:map-pin' 
        },
        { 
          title: 'Client Retention', 
          description: 'A professional digital home builds deeper trust. Our system turns one-time bookings into lifelong clients by presenting your artistry in a luxury environment.', 
          icon: 'tabler:users' 
        },
    ]}
    image={{ src: '/images/testimonial-4.webp', alt: 'Makeup Artist working on a client' }}
  >
    <Fragment slot="content">
      <h3 class="text-2xl font-bold tracking-tight dark:text-white sm:text-3xl mb-2">
        Why your studio needs <span class="text-accent">Artistry on Autopilot ⭐⭐⭐⭐⭐</span>
      </h3>
      <p>Clients look at screens before they look at your portfolio. In the modern beauty industry, your digital presence is your handshake—we make sure yours is a 5-star introduction.</p>
    </Fragment>
  </Content>

  <!-- Section 2: Commitment & Technology -->
  <Content
    isReversed={false}
    items={[
        { 
          title: 'Zero Maintenance', 
          description: 'We know you are busy with back-to-back glam sessions. Once we set up your vanity URL and sync your feeds, you never have to log in or "manage" a website again.', 
          icon: 'tabler:settings' 
        },
        { 
          title: 'The "Wall of Artistry" Widget', 
          description: 'We automatically sync your best Instagram transformations directly to your site, building instant trust with new visitors 24/7 without you lifting a finger.', 
          icon: 'tabler:stars' 
        },
        { 
          title: 'One-Time Payment', 
          description: 'We don’t believe in monthly fees that eat your kit budget. $99 once, and you own the system for the life of your beauty business.', 
          icon: 'tabler:coin' 
        },
    ]}
    image={{ src: '/images/testimonial-3.webp', alt: 'MUA looking at portfolio' }}
  >
    <Fragment slot="content">
      <h2 class="text-3xl font-bold tracking-tight dark:text-white sm:text-4xl mb-4">Our Commitment to Your Success</h2>
      <p class="text-muted text-lg mb-6">We aren't just another tech company. We are a partner in your growth. We handle the code and the technical hurdles so you can stay focused on the glam.</p>
    </Fragment>
  </Content>

  <!-- CTA / Pricing Section -->
  <Pricing 
    title='<span class="text-accent dark:text-white">Invest in Your Studio’s Future.</span>' 
    prices={[lifetimeDeal]} 
  />

  <!-- Final Full-Width Aesthetic Section -->
  <section class="relative not-prose">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 pb-20">
        <div class="intersect-once intersect-no-queue motion-safe:md:opacity-0 motion-safe:md:intersect:animate-fade">
            <div class="relative m-auto max-w-5xl">
                <img src="/images/testimonial-6.webp" alt="A wall of professional beauty reviews" class="w-full mx-auto rounded-md shadow-lg" loading="lazy" />
            </div>
        </div>
    </div>
  </section>
</Layout>
INNEREOF

# Execution: Git Push
git add .
git commit -m "CONTENT: Enriched About page with Image/Text blocks and MUA verbiage"
git push

echo "SUCCESS: About page enriched and pushed to Github."
