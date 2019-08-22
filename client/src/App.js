import React, { Component } from 'react';
import Menu from './components/menu'
import {Router, Route} from 'react-router-dom'
import ProductList from './components/productsList'
import {createBrowserHistory } from 'history'

export default class App extends Component{

    constructor(props){
        super(props);
        this.history = createBrowserHistory();
    }

    /**
     *
     */
    componentDidMount() {

    }

    render(){
        return (
            <Router history={this.history}>
                <div className="uk-danger">
                    <Route path="/shop/(/:category)(/:oder)/(:limitOffset)/" component={ProductList} />

                </div>
            </Router>
        );
    }

}
