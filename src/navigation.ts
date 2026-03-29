import { getPermalink } from './utils/permalinks';

export const headerData = {
  links: [
    { text: 'Features', href: getPermalink('/#features') },
    { text: 'How It Works', href: getPermalink('/#howitworks') },
    { text: 'The Story', href: getPermalink('/about') },
    { text: 'Live Demo', href: getPermalink('/demo') },
    { text: 'Pricing', href: getPermalink('/pricing') },
  ],
  actions: [
    { text: 'Get Started - $99', variant: 'primary', href: '/pricing' }
  ],
};

export const footerData = {
  links: [
    {
      title: 'Address.Makeup — Boutique Artistry for MUAs',
      links: [
        { text: "Claim Your Spot – $99", href: getPermalink('/pricing') },
        { text: 'Live Demo', href: getPermalink('/demo') },
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
  footNote: '💄 Address.Makeup — Fill Your Books on Autopilot. | © ' + new Date().getFullYear() + ' Address.Makeup',
};
