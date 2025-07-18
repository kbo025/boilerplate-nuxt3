<template>
  <div class="error-page">
    <h1 v-if="error.statusCode === 404">404 - Página no encontrada</h1>
    <h1 v-else>Ha ocurrido un error</h1>
    <p>{{ error.message }}</p>
    <NuxtLink to="/">Volver al inicio</NuxtLink>
  </div>
</template>

<script lang='ts' setup>
const props = withDefaults(defineProps<{
  error?: {
    message?: string
    statusCode?: number
  }
}>(), {
  error: undefined
})

const error = props.error ?? { message: 'Error inesperado', statusCode: 500 }
</script>


<style scoped>
.error-page {
  text-align: center;
  margin-top: 5rem;
}
</style>