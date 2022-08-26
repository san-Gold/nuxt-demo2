<template>
  <h1
    @click="
      () => {
        $router.push(`/login`)
      }
    "
  >
    nuxt
  </h1>
</template>

<script>
export default {
  mounted() {
    console.log('环境接口地址', process.env.api)
  },
  head() {
    return {
      title: `Rick`,
    }
  },
  methods: {
    close() {
      console.log('close')
    },
  },
}
</script>
