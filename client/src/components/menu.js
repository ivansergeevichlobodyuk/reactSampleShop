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
                             {typeof this.props.dataMenu[key].child === 'object'?(<Subitem key={key} subDataMenu={this.props.dataMenu[key].child}/>):('')}
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