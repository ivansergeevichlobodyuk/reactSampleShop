import React from 'react';
import ReactDOM from 'react-dom';
import Root from './containers/root.js';
import registerServiceWorker from './registerServiceWorker';
import './css/index.css';
import '../node_modules/uikit/dist/css/uikit.min.css';

ReactDOM.render(<Root />, document.getElementById('root'));
registerServiceWorker();