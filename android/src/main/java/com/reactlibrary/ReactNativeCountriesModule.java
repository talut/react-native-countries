package com.reactlibrary;

import android.util.Log;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.bridge.WritableNativeArray;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class ReactNativeCountriesModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    private WritableNativeArray countryNameListNative = new WritableNativeArray();
    private WritableNativeArray countryCodeListNative = new WritableNativeArray();
    private WritableNativeArray countryNameWithCodeNative = new WritableNativeArray();


    ReactNativeCountriesModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
        Locale[] locales = Locale.getAvailableLocales();
        ArrayList<String> countryCodeList = new ArrayList<String>();
        ArrayList<String> countryNameList = new ArrayList<String>();
        for (Locale locale : locales) {
            String countryName = locale.getDisplayCountry();
            String countryIso = locale.getCountry();
            if (countryIso.trim().length() > 0 && countryName.trim().length() > 0 && !countryCodeList.contains(countryIso) && !countryNameList.contains(countryName)) {
                countryCodeList.add(countryIso);
                countryNameList.add(countryName);
                countryCodeListNative.pushString(countryIso);
                countryNameListNative.pushString(countryName);
                WritableMap map = Arguments.createMap();
                map.putString("code", countryIso);
                map.putString("name", countryName);
                countryNameWithCodeNative.pushMap(map);
            }
        }
    }

    @Override
    public Map<String, Object> getConstants() {
        final Map<String, Object> constants = new HashMap<>();
        constants.put("getCountryNames", countryNameListNative);
        constants.put("getCountryCodes", countryCodeListNative);
        constants.put("getCountryNamesWithCodes", countryNameWithCodeNative);
        return constants;
    }

    @Override
    public String getName() {
        return "ReactNativeCountries";
    }
}