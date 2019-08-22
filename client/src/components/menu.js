import React, {Component} from 'react';
import moment from 'moment';
import PropTypes from 'prop-types';
import {connect} from 'react-redux';
import {getMenu} from '../actions/menu'
import {Subitem} from "./subitem";

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
     * Renders menu
     *
     * @returns {*}
     */
    render() {
        return(<div>
            {this.props.isShowLoader === false ?(
                <div>
                    { this.props.menuKeys.map( (key, inc) =>
                         <li key={inc}>
                             {this.props.dataMenu[key].data.categoryNameUa}
                                {
                                    Object.keys(this.props.dataMenu[key].child).length > 0 ?
                                                (<ul>{
                                                        Object.keys(this.props.dataMenu[key].child).map((itmKey) =>
                                                        <li key={itmKey + key}>
                                                            {this.props.dataMenu[key].child[itmKey].data.categoryNameBy} child-{itmKey}
                                                        </li>)
                                                    }
                                                </ul>
                                                )
                                        :
                                        ""
                                }
                         </li>
                    )}
                </div>
            ):(<div>Loading......</div>)
            }
        </div>);
    }
}

const mapStateToProps = (store) => {
    const {dataMenu,isShowLoader} = store.menu
    console.log("menulist >>>> ",dataMenu);
    console.log( "store menu ", store.menu );
    console.log("is show loader ", isShowLoader);
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