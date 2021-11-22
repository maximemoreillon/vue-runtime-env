<template>
  <div>VUE_APP_MY_VARIABLE: {{my_variable}}</div>
</template>

<script>
export default {
  name: 'App',
  data: () => ({
    my_variable: process.env.VUE_APP_MY_VARIABLE
  })
}
</script>
