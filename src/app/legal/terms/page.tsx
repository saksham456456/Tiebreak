export default function TermsPage() {
  return (
    <main className="prose dark:prose-invert mx-auto max-w-3xl p-8 pt-24">
      <h1>Terms of Service</h1>
      <p>Last updated: October 2026</p>

      <h2>1. Acceptance of Terms</h2>
      <p>
        By accessing Tiebreak, you agree to these Terms of Service. If you do not agree, do not use
        the platform.
      </p>

      <h2>2. User Conduct and Abuse</h2>
      <p>
        You agree not to use automated scripts, bots, or malicious techniques to artificially
        inflate or deflate the ranking of any item. We employ rate limiting, IP hashing, and
        heuristic analysis. Votes deemed fraudulent will be silently discarded or rolled back.
      </p>

      <h2>3. Intellectual Property</h2>
      <p>
        The names, logos, and descriptors of items (e.g., software tools, languages) are the
        property of their respective trademark holders. Tiebreak uses them strictly for fair-use
        identification in comparative ranking.
      </p>

      <h2>4. Disclaimer of Warranties</h2>
      <p>
        Tiebreak is provided &quot;as is&quot;. We make no guarantees regarding the uptime of the
        service or the accuracy of the rankings.
      </p>
    </main>
  );
}
