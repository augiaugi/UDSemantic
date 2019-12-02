import React from 'react'
import { Breadcrumb } from 'semantic-ui-react'

export default class UDSemanticBreadcrumb extends React.Component {
  render() {
    return (
      //<h1>{attributes.id}</h1>
      //<h1>{this.props.id}</h1>

      <div>
        <Breadcrumb>
          <Breadcrumb.Section link>Home</Breadcrumb.Section>
          <Breadcrumb.Divider />
          <Breadcrumb.Section link>Store</Breadcrumb.Section>
          <Breadcrumb.Divider />
          <Breadcrumb.Section active>T-Shirt</Breadcrumb.Section>
        </Breadcrumb>
      </div>
    );
  }
}