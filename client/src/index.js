import React from 'react';
import ReactDOM from 'react-dom';
import Root from './containers/root.js';
import registerServiceWorker from './registerServiceWorker';

ReactDOM.render(<Root />, document.getElementById('root'));

registerServiceWorker();