# React Native Countries

**React Native Countries** will provide you directly native countries list. The names of the countries come in the native language.

## Getting Started

**With NPM**

```bash
npm install --save react-native-countries
```

**With YARN**

```bash
yarn add react-native-countries
```

**Automatic linking**

```sh
react-native link react-native-countries
```

**Manual Linking**

**[Manual Installation](/docs/manual-installation.md)** (If something went wrong with react-native link)

**With Cocoapods (IOS)**

İf you're using **Cocoapods** you should add this line to your **Podfile** file

```python
  pod 'ReactNativeCountries', :path => '../node_modules/react-native-countries/ios'
```

### Usage

```javascript
import RNCountry from "react-native-countries";
```

This package will provide you **3** different options to getting countries. 

##### getCountryNames

```javascript
RNCountry.getCountryNames
```

This constant will provide you only name of countries.

##### getCountryCodes

```javascript
RNCountry.getCountryCodes
```

This constant will provide you only A2 code of countries. (I.E: `EN, TR, FR`)

##### getCountryNamesWithCodes

```javascript
RNCountry.getCountryNamesWithCodes
```

This constant will provide you name and code of countries. (I.E: `[{code:'TR',name:'Turkey'},{code:'EN', name:'England'}]` )

### Sample Usage

```javascript
import React from 'react';
import {Picker,StyleSheet} from 'react-native';
import RNCountry from "react-native-countries";

class App extends React.Component{
  constructor(props){
    super(props);
    this.setState({
      countryCode: "TR"
    })
  }
  
  componentWillMount(){
    let countryNamesWithCodes = RNCountry.getCountryNamesWithCodes;
    countryNamesWithCodes.sort((a, b) => a.name.localeCompare(b.name));
    this.setState({
      countryNameListWithCode:countryNamesWithCodes
    })
  }
  
  render(){
    return(
      <View style={styles.container}>
      <Picker
      		selectedValue={this.state.countryCode}
  				style={styles.picker}
 					onValueChange={(itemValue, itemIndex) => this.setState({countryCode: itemValue})}>
  			{this.state.countryNameListWithCode.map((val)=>{
         return  <Picker.Item label={val.name} value={val.code} />
        })}
			</Picker>
      </View>
    )
  }
}
const styles = StyleSheet.create({
  container:{
    flex:1,
    justifyContent:'center',
    alignItems:'center'
  },
  picker:{
    height: 50, 
    width: 100
  }
})
```

### Version 0.0.14

- Soon



### Thanks

- Thanks to you [@cagriyilmaz](https://github.com/cagriyilmaz) for IOS part.

### License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
