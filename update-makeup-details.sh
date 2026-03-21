#!/bin/bash

# 1. Update Pricing Widget (Labels, Placeholders, and Logic)
cat << 'INNEREOF' > src/components/widgets/Pricing.astro
---
import { Icon } from 'astro-icon/components';
import Button from '~/components/ui/Button.astro';
import Headline from '~/components/ui/Headline.astro';
import WidgetWrapper from '~/components/ui/WidgetWrapper.astro';
import type { Price } from '~/types';

const { title, subtitle, tagline, prices = [], classes = {}, ...rest } = Astro.props;
---

<WidgetWrapper {...rest} id="pricing" classes={{ container: 'max-w-7xl scroll-mt-16', ...classes.container }} hasBackground>
  <Headline {title} {subtitle} {tagline} classes={{ headline: 'max-w-3xl' }} />
  
  <div class="flex justify-center">
    {prices.map((price) => (
      <div class="relative overflow-visible flex flex-col rounded-lg border-2 border-primary p-8 text-center shadow-2xl w-full max-w-lg bg-white dark:bg-slate-900">
        
        <div class="absolute -top-4 left-1/2 transform -translate-x-1/2 bg-accent text-white px-4 py-1 rounded-full text-sm font-bold uppercase tracking-widest">
            Lifetime Digital Address
        </div>

        <h3 class="text-2xl font-bold mt-2">{price.title}</h3>
        
        <div class="mt-8 flex-1">
          <div class="flex items-end justify-center">
            <span class="text-5xl font-bold tracking-tight text-primary">${price.price}</span>
            <span class="ml-1 text-xl font-medium text-muted">/ once</span>
          </div>
          <ul role="list" class="mt-8 space-y-4 text-left">
            {price.items.map((item) => (
              <li class="flex items-start">
                <Icon name="tabler:circle-check" class="w-6 h-6 text-green-500 flex-shrink-0" />
                <p class="ml-3 text-base text-muted">{item.description}</p>
              </li>
            ))}
          </ul>
        </div>
        
        <div class="mt-10 p-6 rounded-xl bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700">
          <form id="paypal-form" action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank">
            <input type="hidden" name="cmd" value="_xclick" />
            <input type="hidden" name="business" value="ZFG89TK2KESFG" />
            <input type="hidden" id="paypal-item-name" name="item_name" value="Address.Makeup Professional Vanity URL Setup" />
            <input type="hidden" name="item_number" value="AMURL99" />
            <input type="hidden" name="amount" value="99.00" />
            <input type="hidden" name="currency_code" value="USD" />
            <input type="hidden" name="no_shipping" value="1" />
            <input type="hidden" name="no_note" value="1" />
            <input type="hidden" name="solution_type" value="Sole">
            <input type="hidden" name="landing_page" value="billing">
            
            <div class="text-left mb-4">
              <label class="block text-sm font-bold mb-2 text-slate-700 dark:text-gray-300">
                1. Choose Your Vanity URL
              </label>
              <div class="relative">
                <input type="hidden" name="on0" value="Vanity URL" />
                <input 
                    type="text" 
                    id="vanity-input" 
                    name="os0" 
                    required 
                    class="w-full px-4 py-3 border-2 border-slate-300 rounded-lg focus:ring-primary focus:border-primary dark:bg-slate-900 dark:border-slate-600 transition-all font-semibold" 
                    placeholder="yourstudio" 
                />
              </div>
              
              <div class="mt-3 p-4 bg-blue-50 dark:bg-primary/10 rounded-lg border-2 border-dashed border-primary/40 flex items-center gap-3 overflow-hidden shadow-sm">
                <div class="bg-primary rounded-full p-1.5 flex-shrink-0">
                  <Icon name="tabler:world" class="w-4 h-4 text-white animate-pulse" />
                </div>
                <span class="text-base font-mono truncate leading-none">
                    <span class="text-slate-500 dark:text-slate-400 font-medium">https://</span><span id="vanity-preview" class="text-primary dark:text-blue-400 font-black text-lg underline decoration-accent/30 decoration-2 underline-offset-4">yourstudio</span><span class="text-slate-500 dark:text-slate-400 font-medium">.address.makeup</span>
                </span>
              </div>
            </div>

            <div class="text-left mb-6">
              <label class="block text-sm font-bold mb-2 text-slate-700 dark:text-gray-300">
                2. Studio Name
              </label>
              <input type="hidden" name="on1" value="Studio Name" />
              <input 
                type="text" 
                id="salon-name-input"
                name="os1" 
                required 
                class="w-full px-4 py-3 border-2 border-slate-300 rounded-lg dark:bg-slate-900 dark:border-slate-600 transition-all" 
                placeholder="Studio or Artist Name" 
              />
            </div>

            <button type="submit" class="w-full py-4 px-4 bg-primary hover:bg-blue-700 text-white font-extrabold rounded-lg shadow-lg hover:shadow-xl transform hover:-translate-y-0.5 transition-all duration-200 text-lg">
              Secure My URL Today
            </button>
            <div class="flex items-center justify-center gap-2 mt-4 text-slate-500">
                <Icon name="tabler:credit-card" class="w-4 h-4" />
                <p class="text-xs font-medium uppercase tracking-tighter">Secure Checkout (Card or PayPal)</p>
            </div>
          </form>
        </div>
      </div>
    ))}
  </div>
</WidgetWrapper>

<script is:inline>
  function initVanityPreview() {
    const vanityInput = document.getElementById('vanity-input');
    const vanityPreview = document.getElementById('vanity-preview');
    const studioInput = document.getElementById('salon-name-input');
    const paypalItemName = document.getElementById('paypal-item-name');
    
    if (vanityInput && vanityPreview && studioInput && paypalItemName) {
      const update = () => {
        let vVal = vanityInput.value.toLowerCase().replace(/[^a-z0-9]/g, '');
        vanityInput.value = vVal;
        vanityPreview.textContent = vVal || 'yourstudio';

        const studioVal = studioInput.value || 'New Studio';
        const displayVanity = vVal || 'yourstudio';
        
        paypalItemName.value = `Address.Makeup: ${displayVanity}.address.makeup (${studioVal})`;
      };

      vanityInput.addEventListener('input', update);
      studioInput.addEventListener('input', update);
      update();
    }
  }
  document.addEventListener('astro:page-load', initVanityPreview);
  initVanityPreview();
</script>
INNEREOF

# 2. Update Footer Widget Branding
cat << 'INNEREOF' > src/components/widgets/Footer.astro
---
import { Icon } from 'astro-icon/components';
import { getHomePermalink } from '~/utils/permalinks';

interface Link { text?: string; href?: string; ariaLabel?: string; icon?: string; }
interface Links { title?: string; links: Array<Link>; }
export interface Props { links: Array<Links>; secondaryLinks: Array<Link>; socialLinks: Array<Link>; footNote?: string; theme?: string; }

const { socialLinks = [], secondaryLinks = [], links = [], footNote = '', theme = 'light' } = Astro.props;
---

<footer class:list={[{ dark: theme === 'dark' }, 'relative border-t border-gray-200 dark:border-slate-800 not-prose']}>
  <div class="relative max-w-7xl mx-auto px-4 sm:px-6">
    
    <div class="flex justify-center py-8 md:py-12">
      {links.map(({ title, links: primaryLinks }) => (
        <div class="text-center">
          <div class="dark:text-gray-300 font-bold mb-2 uppercase tracking-widest text-sm">{title}</div>
            <ul class="text-sm flex flex-wrap justify-center items-center" role="list">
                {primaryLinks.map((link, index) => (
                    <li>
                        <a class="text-muted hover:text-gray-700 hover:underline dark:text-gray-400 transition" href={link.href}>{link.text}</a>
                        {index < primaryLinks.length - 1 && <span class="mx-2" aria-hidden="true">·</span>}
                    </li>
                ))}
            </ul>
        </div>
      ))}
    </div>

    <div class="flex flex-col-reverse items-center md:flex-row md:justify-between py-6 md:py-8 border-t border-gray-200 dark:border-slate-800">
      
      <div class="text-sm text-muted text-center md:text-left mt-4 md:mt-0">
        <div class="mb-1">
          <a class="font-bold text-xl hover:text-primary transition" href={getHomePermalink()}>Address.Makeup</a>
          <span class="hidden md:inline mx-2 text-gray-400">|</span>
          <span class="italic text-gray-500">Your Digital Masterpiece ✨</span>
        </div>
        <div>
          <Fragment set:html={footNote} />
        </div>
      </div>

      <div class="flex items-center justify-center gap-x-6">
        <div class="text-sm text-muted">
          {secondaryLinks.map(({ text, href }, index) => (
            <>
              <a class="text-muted hover:text-gray-700 dark:text-gray-400 hover:underline transition" href={href} set:html={text} />
              {index < secondaryLinks.length - 1 && <span class="px-1">·</span>}
            </>
          ))}
        </div>
      </div>
    </div>
  </div>
</footer>
INNEREOF

# 3. Final Navigation Clean up
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
      title: 'Address.Makeup | Boutique Artistry 💄',
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

# Execution: Git Push
git add .
git commit -m "FIX: Remaining hair salon references in Pricing and Footer"
git push

echo "SUCCESS: Final cleanup for Address.Makeup complete."
