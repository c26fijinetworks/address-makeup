export const lifetimeDeal = {
  title: 'Makeup Studio Plan<br/>(First 300 Studios)',
  subtitle: 'Lock in your $99 forever deal today.<br/><strong class="text-red-600 dark:text-red-400 text-lg">Price increases to $29/mo after the first 300 spots are gone.</strong>',
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
  callToAction: { target: '_blank' as const, text: 'Order Now Same Day', href: '#', variant: 'success' },
  hasRibbon: true,
  ribbonTitle: 'Selling Fast',
};
