<template>

<div class="navbar">
  <a class="active" href="javascript:void(0)" @click="goto('/transfer')"><i class="fa fa-fw fa-home"></i> 转账</a>
  <a href="javascript:void(0)" @click="goto('/burn')"><i class="fa fa-fw fa-search"></i> 挖矿</a>
  <a href="javascript:void(0)" @click="goto('/poi')"><i class="fa fa-fw fa-envelope"></i> POI</a>

</div>

</template>

<script>
  // import h5Copy from '../js_sdk/junyi-h5-copy/junyi-h5-copy/junyi-h5-copy.js'

// import {abi} from './config';
  export default {
    data() {
      return {
          isActive: 0
      }
    },
    onLoad() {},
    methods: {
      goto(url) {
        this.$router.push({ path: url})
      }
    },
  }
</script>

<style scoped lang="scss">
/* Style the navigation bar */
.navbar {
  width: auto;
  background-color: #555;
  overflow: auto;
  bottom: 0;
  left: 0;
  right: 0;


}

/* Navbar links */
.navbar a {
  width: 27%;

  display: inline-block !important;
  text-align: center;
  padding: 12px;
  color: white;
  text-decoration: none;
  font-size: 17px;
}

/* Navbar links on mouse-over */
.navbar a:hover {
  background-color: #000;
}

/* Current/active navbar link */
.active {
  background-color: #4CAF50;
}

/* Add responsiveness - will automatically display the navbar vertically instead of horizontally on screens less than 500 pixels */
@media screen and (max-width: 500px) {
  .navbar a {
    float: none;
    display: block;
  }
}
</style>
