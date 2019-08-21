import React, {Component} from 'react';
import moment from 'moment';
import PropTypes from 'prop-types';
import {connect} from 'react-redux';
import {getMenu} from '../actions/menu'

export class Subitem extends Component{

    constructor(props){
        super(props);
        this.list = '';
    }

    static propTypes = {
        subDataMenu: PropTypes.object,
    }

    handleData = (keys) => {
        keys.map((itm,inx) => {
           this.list = <li key={itm + inx}>{this.props.subDataMenu[itm].data.categoryNameBy}</li>
        })
    }

    render() {
        console.log('this list ', this.list);
        const li = this.handleData(Object.keys(this.props.subDataMenu));
        return <ul>{ this.list}</ul>
    }

}