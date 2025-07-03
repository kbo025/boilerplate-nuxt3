// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2025-05-15',
  devtools: { enabled: true },
  css: [
    '~/styles/main.scss', // Incluye tu archivo SCSS global
  ],
  vite: {
    css: {
      preprocessorOptions: {
        scss: {
          additionalData: `@use "~/styles/variables.scss";`, // Importa automáticamente variables en todos los archivos SCSS
        },
      },
    },
  },
  modules: [
    '@nuxt/content',
    '@nuxt/eslint',
    '@nuxt/fonts',
    '@nuxt/icon',
    '@nuxt/image',
    '@nuxt/scripts',
    '@nuxt/test-utils',
    '@nuxt/ui'
  ],
  alias: {
    '@utils': '/utils', // Reemplaza con la ruta correcta
  },
  plugins: [],
})
