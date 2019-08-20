import React, {Component} from 'react';
import moment from 'moment';
import PropTypes from 'prop-types';
import {connect} from 'react-redux';
import {getMenu} from '../actions/menu'

class Subitem extends Component{

    static propTypes = {
        subDataMenu: PropTypes.object,
        subDataKeys: PropTypes.object,
        isShowLoader: PropTypes.boolean,
        menuKeys: PropTypes.array
    }



    render() {

    }

}