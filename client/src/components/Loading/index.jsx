import React from "react";
import { Dimmer, Loader } from "semantic-ui-react";

const Loading = ({ loading, inverted, content }) => (
  <Dimmer inverted={inverted} active={loading}>
    <Loader content={content} />
  </Dimmer>
);

export default Loading;
