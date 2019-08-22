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
export default class ProductsList extends Component {

    /**
     *
     * @type {{isShowLoader: *, categoryData: {number, private, static, extends, public, protected, string, bool, constructor, interface, any}, list: string | f.elements.object | Object | CKEDITOR.tools.object | {findKey, merge} | number, orderingData: {number, private, static, extends, public, protected, string, bool, constructor, interface, any}}}
     */
    static propTypes = {
        list: PropTypes.object,
        isShowLoader: PropTypes.bool,
        categoryData: PropTypes.string,
        orderingData: PropTypes.string,
        limitOffsetData: PropTypes.string
    }

    /**
     * Mounting component and get all data
     *
     * @param nextProps
     */
    componentDidMount(nextProps) {
        this.props.getProductsList();
    }

    /**
     * Renders menu
     *
     * @returns {*}
     */
    render() {
        return(
            <div>
                <Menu categoryData={this.props.categoryData} />
                <Ordering orderingData={this.props.orderingData} />
                <ListGoods categoryData={this.props.categoryData}
                           orderingData={this.props.orderingData}
                           limitOffset={this.props.limitOffsetData} />
            </div>
        )
    }
}
