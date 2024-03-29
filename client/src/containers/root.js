import React, { Component } from 'react'
import { Provider } from 'react-redux'
import App from '../App.js';
import configureStore from '../store.jsx';
const store = configureStore();

export default class Root extends Component {
    render(){
        return (
            <Provider store={store}>
                <App />
            </Provider>
        )
    }
}