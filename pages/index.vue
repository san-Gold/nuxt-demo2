<template>
  <h1
    @click="
      () => {
        $router.push(`/login`)
      }
    "
  >
    nuxt docker-compose
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
      a: 'a',
      b: 'b',
      c: 'c',
      f: 'f',
      e: 'e',
    }
  },
  methods: {
    close() {
      console.log('close')
    },
  },
}
</script>
