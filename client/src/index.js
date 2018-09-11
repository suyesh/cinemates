import React from "react";
import ReactDOM from "react-dom";
import { ApolloProvider } from "react-apollo";
import { ApolloClient } from "apollo-client";
import { createHttpLink } from "apollo-link-http";
import { InMemoryCache } from "apollo-cache-inmemory";
import { Provider } from "react-redux";

import "./assets/css/main.css";
import App from "./components/App";
import registerServiceWorker from "./utils/serviceWorker";
import { configureStore } from "./store";

const httpLink = createHttpLink({
  uri: "http://localhost:3000/api"
});

const client = new ApolloClient({
  link: httpLink,
  cache: new InMemoryCache()
});

const store = configureStore();

ReactDOM.render(
  <ApolloProvider client={client}>
    <Provider store={store}>
      <App />
    </Provider>
  </ApolloProvider>,
  document.getElementById("root")
);
registerServiceWorker();
