<template>
  <div class="todos">
    <h1>TODOS APP</h1>
    <section>
      <input v-model="itemName" placeholder="Enter task" />
      <button @click="addItem">Добавить</button>
    </section>
    <ul>
      <li v-for="item in todos" :key="item.id">
        <span class="float-right" @click="removeItem(item)">&times;</span>
        <span v-text="item.task" />
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "Todos",
  data() {
    return {
      itemName: "",
      todos: [],
    };
  },
  created() {
    this.reload();
  },
  methods: {
    reload() {
      axios("/api/todos").then(({ data }) => {
        this.todos = data || [];
      });
    },
    addItem() {
      axios
        .post("/api/todos", {
          row: 1,
          done: false,
          icon: "none",
          task: this.itemName,
        })
        .then(() => {
          this.itemName = "";
          this.reload();
        });
    },
    removeItem(item) {
      axios
        .delete(`/api/todos/${item.id}`)
        .then(() => {
          this.reload();
        });
      this.items = this.items.filter((e) => e !== item);
    },
  },
};
</script>

<style>
.todos {
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 500px;
  margin: 32px auto;
  box-shadow: 5px 5px 5px 0px rgba(0, 0, 0, 0.75);
  border: 1px solid #aaa;
  padding: 32px;
}
hr {
  margin: 12px 0;
  border: none;
  border-top: 1px solid #aaa;
}
input {
  padding: 12px;
}
button {
  padding: 12px;
}
ul {
  list-style-type: none;
  text-align: left;
}
ul > li {
  border-top: 1px solid #333;
  padding: 12px;
}
ul > li:last-child {
  border-bottom: 1px solid #333;
}
.float-right {
  float: right;
  cursor: pointer;
}
</style>
