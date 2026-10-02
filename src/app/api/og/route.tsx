import { ImageResponse } from 'next/og';

export const runtime = 'edge';

export async function GET(request: Request) {
  try {
    const { searchParams } = new URL(request.url);
    const _id = searchParams.get('id');

    return new ImageResponse(
      <div
        style={{
          height: '100%',
          width: '100%',
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
          justifyContent: 'center',
          backgroundColor: '#09090b',
          color: '#fafafa',
          fontFamily: 'sans-serif',
        }}
      >
        <div style={{ fontSize: 80, marginBottom: 20 }}>🧬</div>
        <h1 style={{ fontSize: 64, fontWeight: 900, marginBottom: 20, margin: 0 }}>
          My Dev Tools DNA
        </h1>
        <p style={{ fontSize: 32, color: '#a1a1aa', margin: 0 }}>
          React: 85% • Vim: 92% • PostgreSQL: 68%
        </p>
        <div style={{ marginTop: 60, fontSize: 24, color: '#3f3f46' }}>tiebreak.com</div>
      </div>,
      {
        width: 1200,
        height: 630,
      }
    );
  } catch (err) {
    console.error(err);
    return new Response(`Failed to generate the image`, {
      status: 500,
    });
  }
}
