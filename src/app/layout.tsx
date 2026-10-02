import type { Metadata } from 'next';
import { fontSpaceGrotesk, fontInter, fontJetBrainsMono } from '@/lib/fonts';
import './globals.css';

export const metadata: Metadata = {
  title: 'Tiebreak — Global Pairwise-Voting Sports Rankings',
  description: 'Vote on head-to-head sports matchups and discover community-ranked sports legends.',
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="en"
      className={`${fontSpaceGrotesk.variable} ${fontInter.variable} ${fontJetBrainsMono.variable} dark`}
      suppressHydrationWarning
    >
      <body className="min-h-screen bg-background font-sans text-foreground antialiased selection:bg-primary/20 selection:text-primary">
        {children}
      </body>
    </html>
  );
}
