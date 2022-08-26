<template>
  <div
    @click="
      () => {
        $router.push(`/`)
      }
    "
  >
    about
  </div>
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
