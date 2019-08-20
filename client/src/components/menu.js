import React, {Component} from 'react';
import moment from 'moment';
import PropTypes from 'prop-types';
import {connect} from 'react-redux';
import {getMenu} from '../actions/menu'

class Menu extends Component {

    static propTypes = {
        dataMenu: PropTypes.object,
        isShowLoader: PropTypes.array,
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
                             { this.props.dataMenu[key].child.length > 0 ? <div>child here </div>:<div></div> }
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