import React, {Component} from 'react';
import moment from 'moment';
import PropTypes from 'prop-types';
import {connect} from 'react-redux';
import {getMenu} from '../actions/menu'
import Menu from './menu'
//import Ordering from './ordering'
import {receivingList} from '../actions/list'

/**
 * Just a wrapper under list items
 *
 */
class ListGoods extends Component {

    /**
     *
     * @type {{isShowLoader: *, categoryData: {number, private, static, extends, public, protected, string, bool, constructor, interface, any}, list: string | f.elements.object | Object | CKEDITOR.tools.object | {findKey, merge} | number, orderingData: {number, private, static, extends, public, protected, string, bool, constructor, interface, any}}}
     */
    static propTypes = {
        listGoods: PropTypes.object,
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
        this.props.getProductsList(this.props.categoryData, this.props.orderingData, this.props.limitOffsetData);
    }

    /**
     * Renders just a list
     *
     * @returns {*}
     */
    render() {
        return(
            <div>
                <ul>
                    { this.props.isShowLoader==false? (this.props.listGoods.pagination.map( (itm,key ) =>
                        <li key={key+'goods'}><a href="#">{itm.nameUa}</a></li>
                    )):('LOding list goods')
                    }
                </ul>
            </div>
        )
    }
}

/**
 *
 * @param dispatch
 * @returns {{getProductsList: getProductsList}}
 */
const mapDispatchToProps = (dispatch) => {
    return {
        getProductsList: (category,ordering,limitOffset) => {
            dispatch(receivingList(category,ordering,limitOffset))
        }
    }
}

/**
 *
 * @param store
 * @returns {{listGoods: *, isShowLoader: *}}
 */
const mapStateToProps = (store) => {
    const {listGoods,isShowLoader} = store.goods;
    console.log("list goods pagination", store.goods);
    return {
        listGoods:listGoods,
        isShowLoader:isShowLoader
    }
}

export default connect(mapStateToProps ,mapDispatchToProps)(ListGoods)
