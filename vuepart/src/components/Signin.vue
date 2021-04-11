<template>
  <div class="outer">
    <div class="border p-10 border-grey-light shadow rounded">
      <h3 class="text-2xl mb-6 text-grey-darkest">Sign In</h3>
      <form @submit.prevent="signin">
        <div class="text-red" v-if="error">{{ error }}</div>

        <div class="">
          <label for="email" class="label">E-mail Address</label>
          <input type="email" v-model="email" class="input" id="email" placeholder="">
        </div>
        <div>
          <label for="password" class="label">Password</label>
          <input type="password" v-model="password" class="input" id="password" placeholder="">
        </div>
        <button type="submit" class="btn_class">Sign In</button>

        <div class="my-4"><router-link to="/signup" class="link-grey">Sign up</router-link></div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Signin',
  data () {
    return {
      email: '',
      password: '',
      error: ''
    }
  },
  created () {
    this.checkSignedIn()
  },
  updated () {
    this.checkSignedIn()
  },
  methods: {
    signin () {
      this.$http.plain.post('/signin', { email: this.email, password: this.password })
        .then(response => this.signinSuccessful(response))
        .catch(error => this.signinFailed(error))
    },
    signinSuccessful (response) {
      if (!response.data.csrf) {
        this.signinFailed(response)
        return
      }
      localStorage.csrf = response.data.csrf
      localStorage.signedIn = true
      this.error = ''
      this.$router.replace('/records')
    },
    signinFailed (error) {
      this.error = (error.response && error.response.data && error.response.data.error) || ''
      delete localStorage.csrf
      delete localStorage.signedIn
    },
    checkSignedIn () {
      if (localStorage.signedIn) {
        this.$router.replace('/records')
      }
    }
  }
}
</script>
<style>
div .outer {
  background: #ccc;
  border: 1px solid black;
  padding: 30px;
  margin-left: 30%;
  margin-right: auto;
  width: 25%;
}
.btn_class{
  font-weight: bold;
  cursor: pointer;
  background: green;
  color: white;
  justify-content: center;
  text-align: center;
  display: block;
  margin: 5px 0px;
}
.input {
  width: 100%;
}
</style>
