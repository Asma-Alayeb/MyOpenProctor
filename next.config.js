/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',
  basePath: '/MyOpenProctor',
  assetPrefix: '/MyOpenProctor/',
  trailingSlash: true,
  images: { unoptimized: true },
};

module.exports = nextConfig;
