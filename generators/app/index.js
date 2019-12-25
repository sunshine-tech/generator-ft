'use strict';
const Generator = require('yeoman-generator');
const chalk = require('chalk');
const yosay = require('yosay');


module.exports = class extends Generator {
  prompting() {
    // Have Yeoman greet the user.
    this.log(
      yosay(`Welcome to the flawless ${chalk.red('generator-flutter-screen')} generator!`)
    );


    const prompts = [
      {
        type: 'list',
        name: 'type',
        message: 'What kind of flutter generator would you want to create?',
        choices: ["BLoC Screen", "Stateful Widget"]
      },
      {
        type: 'input',
        name: 'name',
        message: 'Your project name',
        //Defaults to the project's folder name if the input is skipped
        default: this.appname
      }
    ];

    return this.prompt(prompts).then(props => {
      // To access props later use this.props.someAnswer;
      this.props = props;
    });
  }



  writing() {
    var that = this;

    function toFirstCase(name) {
      var lowercaseName = name.toLowerCase();
      return lowercaseName.charAt(0).toUpperCase() + lowercaseName.slice(1);
    }

    function toClassName(name) {
      var token = name.split('_');
      var firstCase = token.map(m => toFirstCase(m));
      return firstCase.join('');
    }

    function toFileName(name) {
      return name;
    }

    function copy(filename, folder, dstFolder) {
      var lowercaseName = that.props.name.toLowerCase();
      var destFileName = '';
      var srcFileName = filename;

      if (folder) {
        srcFileName = folder + '/' + filename;
      }
      if (filename === '_.dart') {
        destFileName = lowercaseName + filename.replace('_', '');
      } else {
        destFileName = lowercaseName + filename;
      }
      var dstFileName = `${lowercaseName}/${destFileName}`;
      if (dstFolder) {
        dstFileName = `${lowercaseName}/${dstFolder}/${destFileName}`;
      }
      that.fs.copyTpl(
        that.templatePath(srcFileName),
        that.destinationPath(dstFileName),
        {
          name: lowercaseName,
          Name: toClassName(lowercaseName)
        }
      );
    }

    function create_bloc() {
      copy('_.dart', 'bloc');
      copy('_bloc.dart', 'bloc');
      copy('_event.dart', 'bloc');
      copy('_home.dart', 'bloc');
      copy('_model.dart', 'bloc');
      copy('_repository.dart', 'bloc');
      copy('_repository_mock.dart', 'bloc');
      copy('_screen.dart', 'bloc');
      copy('_state.dart', 'bloc');
      copy('_entry_widget.dart', 'bloc/widgets', 'widgets');
      copy('_bottom_loader_widget.dart', 'bloc/widgets', 'widgets');
    }

    function create_widget() {
      var lowercaseName = that.props.name.toLowerCase();
      that.fs.copyTpl(
        that.templatePath(`stateful_widget.dart`),
        that.destinationPath(`${lowercaseName}_widget.dart`),
        {
          Name: toClassName(lowercaseName)
        }
      );
    }

    if (this.props.type == 'BLoC Screen') {
      create_bloc();
    }

    if (this.props.type == 'Stateful Widget') {
      create_widget();
    }

  }

  install() {
    // this.installDependencies();
  }
}
;
