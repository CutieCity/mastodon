import React from 'react';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import { changeListEditorTitle, submitListEditor } from 'flavours/glitch/actions/lists';
import Button from 'flavours/glitch/components/button';
import IconButton from 'flavours/glitch/components/icon_button';
import { defineMessages, injectIntl } from 'react-intl';

const messages = defineMessages({
  label: { id: 'lists.new.title_placeholder', defaultMessage: 'New list title' },
  title: { id: 'lists.new.create', defaultMessage: 'Add list' },
});

const mapStateToProps = state => ({
  value: state.getIn(['listEditor', 'title']),
  disabled: state.getIn(['listEditor', 'isSubmitting']),
});

const mapDispatchToProps = dispatch => ({
  onChange: value => dispatch(changeListEditorTitle(value)),
  onSubmit: () => dispatch(submitListEditor(true)),
});

class NewListForm extends React.PureComponent {

  static propTypes = {
    value: PropTypes.string.isRequired,
    disabled: PropTypes.bool,
    intl: PropTypes.object.isRequired,
    onChange: PropTypes.func.isRequired,
    onSubmit: PropTypes.func.isRequired,
  };

  handleChange = e => {
    this.props.onChange(e.target.value);
  };

  handleSubmit = e => {
    e.preventDefault();
    this.props.onSubmit();
  };

  handleClick = () => {
    this.props.onSubmit();
  };

  render () {
    const { value, disabled, intl } = this.props;

    const label = intl.formatMessage(messages.label);
    const title = intl.formatMessage(messages.title);

    return (
      <form className='column-inline-form' onSubmit={this.handleSubmit}>
        <label>
          <span style={{ display: 'none' }}>{label}</span>

          <input
            className='setting-text'
            value={value}
            disabled={disabled}
            onChange={this.handleChange}
            placeholder={label}
          />
        </label>

        {/*
        <IconButton
          disabled={disabled || !value}
          icon='plus'
          title={title}
          onClick={this.handleClick}
        />
        */}
        <Button
          disabled={disabled || !value}
          text={title}
        />
      </form>
    );
  }

}

export default connect(mapStateToProps, mapDispatchToProps)(injectIntl(NewListForm));
