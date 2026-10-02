export default function PrivacyPage() {
  return (
    <main className="prose dark:prose-invert mx-auto max-w-3xl p-8 pt-24">
      <h1>Privacy Policy</h1>
      <p>Last updated: October 2026</p>

      <h2>1. Information We Collect</h2>
      <p>
        When you use Tiebreak anonymously, we assign you an anonymous UUID (<code>anon_id</code>).
        We collect your voting history, IP address (hashed for abuse prevention), and browser
        user-agent. If you choose to create an account, we collect your email address and
        authentication provider details.
      </p>

      <h2>2. How We Use Your Information</h2>
      <p>
        We use your votes to rank items via our Elo-based ranking engine. Your voting patterns are
        also used to generate a &quot;Taste Profile&quot; which is publicly shareable if you choose
        to share it. We do not sell your data to third parties.
      </p>

      <h2>3. Cookies and Tracking</h2>
      <p>
        We use cookies strictly for maintaining your anonymous session (
        <code>tiebreak_anon_id</code>) and preventing abuse (rate limiting). We do not use
        third-party advertising trackers.
      </p>

      <h2>4. Data Retention and Deletion</h2>
      <p>
        You may request the deletion of your account and associated votes at any time by contacting
        support. Note that while your personal identifier will be removed, the aggregate effect of
        your votes on global rankings remains.
      </p>
    </main>
  );
}
