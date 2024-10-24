import {AppRegistry} from 'react-native';
import App from './App';
import {name as appName} from './app.json';

console.log('Index.js is being executed');

if (global.HermesInternal) {
  console.log('Running on Hermes engine');
} else {
  console.log('Not running on Hermes engine');
}

AppRegistry.registerComponent(appName, () => {
  console.log('AppRegistry.registerComponent called');
  return App;
});
