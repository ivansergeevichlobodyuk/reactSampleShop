import React, {Component} from 'react';
import moment from 'moment';
import PropTypes from 'prop-types';
import {connect} from 'react-redux';
import {getMenu} from '../actions/menu'
import Menu from './menu'

/**
 * Just a wrapper under list items
 *
 */
export default class Ordering extends Component {

    /**
     *
     * @type {{isShowLoader: *, categoryData: {number, private, static, extends, public, protected, string, bool, constructor, interface, any}, list: string | f.elements.object | Object | CKEDITOR.tools.object | {findKey, merge} | number, orderingData: {number, private, static, extends, public, protected, string, bool, constructor, interface, any}}}
     */
    static propTypes = {
        orderingData: PropTypes.object,
    }


    /**
     * Renders menu
     *
     * @returns {*}
     */
    render() {
        return(
            <ul>
                <li className={this.props.orderingData == 'price'?'active':'inactive'} onClick={(e)=>{this.orderBy('price')}} >SortByPrice:</li>
                <li className={this.props.orderingData == 'title'?'active':'inactive'} click={(e)=>{this.orderBy('name')}}>SortByTitle:</li>
            </ul>
        )
    }
}
//
//const mapDispatchToProps = (dispatch) => {
//     return {
//         orderBy: ( orderValue ) =>{
//            dispatch(orderDataBy(orderValue))
//         }
//
//     }
//}
