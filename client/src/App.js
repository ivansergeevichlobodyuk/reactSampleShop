import React, { Component } from 'react';
import {Router, Route} from 'react-router-dom'
import ProductsList from './components/productsList'
import {createBrowserHistory } from 'history'

export default class App extends Component{

    constructor(props){
        super(props);
        this.history = createBrowserHistory();
    }


    render(){
        return (
            <Router history={this.history}>
                <div className="uk-danger">
                    <Route path="/shop1/:category?/:oder?/:limitOffset?/" component={ProductsList} />
                </div>
            </Router>
        );
    }

}
