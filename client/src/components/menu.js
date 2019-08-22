import React, {Component} from 'react';
import moment from 'moment';
import PropTypes from 'prop-types';
import {connect} from 'react-redux';
import {getMenu} from '../actions/menu'


class Menu extends Component {


    static propTypes = {
        dataMenu: PropTypes.object,
        isShowLoader: PropTypes.bool,
        menuKeys: PropTypes.array
    }

    /**
     * Mounting component and get all data
     *
     * @param nextProps
     */
    componentDidMount(nextProps) {
        this.props.getMenu();
    }


    /**
     * Renders nested list with unlimited nested levels
     *
     *
     * @param child
     * @param nested
     * @returns {*}
     */
    renderNestedList = ( child, nested = false ) => {
            if ( nested == true ){
                return (
                 <ul>
                 {
                     Object.keys(child).map((keyChild) =>
                         <li key={child[keyChild].data.id}>{child[keyChild].data.categoryNameBy}
                         {this.renderNestedList(child[keyChild].child, true)}
                         </li>
                     )
                 }
                </ul>)
            }else{
                if ( Object.keys(child.child).length == 0 ){
                    return (<li key={child.data.id}>{child.data.categoryNameBy}</li>)
                }
                if ( Object.keys(child.child).length > 0 ){
                    console.log("child child ", child.child);
                    return (
                        <li key={child.data.id}>{child.data.categoryNameBy}
                            <ul>
                                {
                                    Object.keys(child.child).map(key =>
                                        <li key={key}>
                                            {child.child[key].data.categoryNameBy}
                                            {this.renderNestedList(child.child[key].child, true)}
                                        </li>
                                    )
                                }
                            </ul>
                        </li>
                    )
                }
            }
    }

    /**
     * Renders menu
     *
     * @returns {*}
     */
    render() {
        return(<div>
            {this.props.isShowLoader === false ?(
                <div>
                    { this.props.menuKeys.map( (key, inc) =>
                        <ul>
                            { this.renderNestedList(this.props.dataMenu[key]) }
                        </ul>
                    )}
                </div>
            ):(<div>Loading......</div>)
            }
        </div>);
    }
}

const mapStateToProps = (store) => {
    const {dataMenu,isShowLoader} = store.menu
    return {
        menuKeys: Object.keys(dataMenu),
        dataMenu:dataMenu,
        isShowLoader:isShowLoader
    }
}

const mapDispatchToProps = (dispatch) => {
    return {
        getMenu: () => {
           dispatch(getMenu())
        }
    }
}


export default connect(mapStateToProps ,mapDispatchToProps)(Menu)