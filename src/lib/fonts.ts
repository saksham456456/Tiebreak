import { Space_Grotesk, Inter, JetBrains_Mono } from 'next/font/google';

export const fontSpaceGrotesk = Space_Grotesk({
  subsets: ['latin'],
  variable: '--font-space-grotesk',
  display: 'swap',
  fallback: ['system-ui', 'sans-serif'],
});

export const fontInter = Inter({
  subsets: ['latin'],
  variable: '--font-inter',
  display: 'swap',
  fallback: ['system-ui', 'sans-serif'],
});

export const fontJetBrainsMono = JetBrains_Mono({
  subsets: ['latin'],
  variable: '--font-jetbrains-mono',
  display: 'swap',
  fallback: ['monospace'],
});

// Aliases matching PROJECT.md interface contract
export const spaceGrotesk = fontSpaceGrotesk;
export const inter = fontInter;
export const jetbrainsMono = fontJetBrainsMono;
