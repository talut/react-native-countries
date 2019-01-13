# React Native Countries

**React Native Countries v1.0.2** will provide you directly native countries list. The names of the countries come in the native language.

## Getting Started

##### Installation

----------

**With NPM**

```bash
npm install --save react-native-countries
```

**With YARN**

```bash
yarn add react-native-countries
```

##### Linking

-----

**Automatic linking**

```sh
react-native link react-native-countries
```

**Manual Linking**

**[Manual Installation for IOS and Android](/docs/manual-installation.md)** (If something went wrong with react-native link)

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
import React, {Component} from 'react';
import {Picker, StyleSheet, Text, View} from 'react-native';
import RNCountry from "react-native-countries";

export default class App extends Component {
    constructor(props) {
        super(props);
        this.state = {
            countryCode: "TR"
        }
    }

    componentWillMount() {
        let countryNamesWithCodes = RNCountry.getCountryNamesWithCodes;
        countryNamesWithCodes.sort((a, b) => a.name.localeCompare(b.name));
        this.setState({
            countryNameListWithCode: countryNamesWithCodes
        })
    }

    render() {
        return (
            <View style={styles.container}>
                <Picker
                    selectedValue={this.state.countryCode}
                    style={styles.picker}
                    onValueChange={(itemValue, itemIndex) => this.setState({countryCode: itemValue})}>
                    {this.state.countryNameListWithCode.map((val) => {
                        return <Picker.Item key={'country-item-' + val.code} label={val.name} value={val.code}/>
                    })}
                </Picker>
                <Text>Selected Country Code: {this.state.countryCode}</Text>
            </View>
        )
    }
}
const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center'
    },
    picker: {
        height: 50,
        width: 200
    }
});
```


### Example

You can find the usage example of the package in the example folder. 

```console
git clone https://github.com/talut/react-native-countries

cd react-native-countries/example

npm install

react-native run-ios or android
```

### Thanks

- Thanks to you [@cagriyilmaz](https://github.com/cagriyilmaz) for IOS part.

### License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
