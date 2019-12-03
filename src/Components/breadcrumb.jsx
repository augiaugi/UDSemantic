import React from 'react'
import { Breadcrumb } from 'semantic-ui-react'

export default class UDSemanticBreadcrumb extends React.Component {
  render() {
    return (
      //<h1>{attributes.id}</h1>
      //<h1>{this.props.id}</h1>

      <div>
        <Breadcrumb size={this.props.size}>
          <Breadcrumb.Section link>Home</Breadcrumb.Section>
          <Breadcrumb.Divider><font color="black">#</font></Breadcrumb.Divider>
          <Breadcrumb.Section link>Store</Breadcrumb.Section>
          <Breadcrumb.Divider><font color="black">#</font></Breadcrumb.Divider>
          <Breadcrumb.Section active><font color="black">T-Shirt</font></Breadcrumb.Section>
        </Breadcrumb>
      </div>
    );
  }
}