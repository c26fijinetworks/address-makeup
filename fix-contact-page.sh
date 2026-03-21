#!/bin/bash

# Update the contact.astro file with Makeup Studio verbiage
cat << 'INNEREOF' > src/pages/contact.astro
---
import Layout from '~/layouts/PageLayout.astro';
import HeroText from '~/components/widgets/HeroText.astro';
import GoogleContactForm from '~/components/widgets/GoogleContactForm.astro';

const metadata = {
  title: 'Contact | Address.Makeup',
  description: 'Reach out for white-glove setup or support for your makeup studio website.',
};
---
<Layout metadata={metadata}>
  <HeroText 
    tagline="Support"
    title="We handle everything." 
    subtitle="Have questions about the Address.Makeup Concept? Our team is ready to help your beauty brand shine online."
  />
  <GoogleContactForm />
</Layout>
INNEREOF

# Execution: Git Push
git add .
git commit -m "Refactor: Updated contact page for Address.Makeup"
git push

echo "SUCCESS: Contact page refactored and pushed to Github."
