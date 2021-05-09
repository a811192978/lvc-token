<template>
  <div id="app">
    <router-view></router-view>
    <!-- <Tab/> -->
  </div>
</template>

<script>
// import Tab from './components/Tab.vue'

export default {
  name: 'App',
  components: {
    // Tab
  }
}
</script>

<style lang="scss">
@import url('./common/common.scss');
html,
body {
  margin: 0;
  padding: 0;
  font-family: PingFangSC-Light, PingFang SC;
  // font-size: 20px;
  background-color: #ffffff;
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #ffffff;
  min-height: 100%;
    background: url(./assets/bg.jpg);
   background-size: 100% 100%;
  background-color: #ffffff;
}

</style>
