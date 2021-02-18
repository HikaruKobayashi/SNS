<template>
  <section id="top_page">
    <ul>
      <li>
        <div></div>
      </li>
      <li>
        <div>
          <h1>SNSをはじめよう</h1>
          <Signup />
          <Login />
        </div>
      </li>
    </ul>
  </section>
</template>

<script>
import Login from '~/components/Login.vue'
import Signup from '~/components/Signup.vue'
export default {
  components: {
    Login,
    Signup
  }
}
</script>

<style>
#top_page {
  width: 100%;
}
#top_page > ul {
  list-style: none;
  padding: 0;
}
#top_page > ul > li {
  width: 50%;
  height: 100vh;
  text-align: center;
}
#top_page > ul > li:nth-child(1) > div {
  width: 100%;
  height: 100%;
  background: url(../assets/img/sns_top_img.jpg) no-repeat;
  background-size: cover;
}
#top_page > ul > li > div > h1 {
  font-size: 50px;
}
#top_page > ul > li > div > p {
  width: 300px;
  padding: 10px 60px;
  margin: 10px auto;
  cursor: pointer;
  border-radius: 50px;
  background: linear-gradient(rgb(52,62,98), rgb(24,26,41));
}
#top_page > ul > li > div > p > a {
  color: #f3f3f3;
  text-decoration: none;
}

@media screen and (min-width: 1000px) {
  #top_page > ul {
    display: flex;
  }
  #top_page > ul > li:nth-child(2) > div {
    padding-top: 350px;
  }
}
@media screen and (max-width: 800px) {
  #top_page > ul > li {
    width: 100%;
    height: 50vh;
  }
  #top_page > ul > li:nth-child(2) > div {
    padding-top: 100px;
  }
  #top_page > ul > li > div > h1 {
    font-size: 45px;
  }
}
</style>