<template>
  <div class="wk">
    <Header
      scroll-target="#scrolling"
      :title="this.work.title"
      :twitter="this.$store.state.main.link.twitter"
      :github="this.$store.state.main.link.github"
    />

    <v-img :src="work.img" contain height="200" />
    <v-container>
      <v-row cols="12" class="row">
        <v-col sm="12">
          <div class="text" v-html="compiledMarkdown"></div>
          <div class="exit">
            <v-icon @click="$router.push('/')">mdi-arrow-left</v-icon>
          </div>
        </v-col>
      </v-row>
    </v-container>

    <Footer :footer="this.$store.state.main.footer" />
  </div>
</template>

<script>
import Header from '@/components/Header.vue';
import Footer from '@/components/Footer.vue';
import { marked } from 'marked';

export default {
  name: 'Work',
  components: {
    Header,
    Footer,
  },
  computed: {
    work() {
      return this.$store.state.work.works[this.$route.params.id];
    },
    compiledMarkdown() {
      return marked(this.work.body);
    },
  },
};
</script>

<style scoped>
.row {
  display: flex;
  justify-content: center;
  text-align: center;
}

.text {
  text-align: left;
  display: inline-block;
  white-space: pre-line;
}

.exit {
  text-align: left;
}
</style>
