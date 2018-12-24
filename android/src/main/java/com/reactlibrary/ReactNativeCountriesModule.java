package com.reactlibrary;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.bridge.WritableNativeArray;

import java.util.Locale;

public class ReactNativeCountriesModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    private WritableNativeArray countryNameList = new WritableNativeArray();
    private WritableNativeArray countryCodeList = new WritableNativeArray();
    private WritableNativeArray countryNameWithCode = new WritableNativeArray();

    public ReactNativeCountriesModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
        Locale[] locales = Locale.getAvailableLocales();
        for (Locale locale : locales) {
            String countryName = locale.getDisplayCountry();
            String countryIso = locale.getCountry();
            if (countryIso.trim().length() > 0) {
                countryCodeList.pushString(countryIso);
            }
            if (countryName.trim().length() > 0) {
                countryNameList.pushString(countryName);
            }
            if (countryIso.trim().length() > 0 && countryName.trim().length() > 0) {
                WritableMap map = Arguments.createMap();
                map.putString("code", countryIso);
                map.putString("name", countryName);
                countryNameWithCode.pushMap(map);
            }
        }
    }

    @ReactMethod
    public void getCountryNames(Promise promise) {
        try {
            promise.resolve(countryNameList);
        } catch (Exception e) {
            promise.reject(e);
        }
    }

    @ReactMethod
    public void getCountryNamesWithCodes(Promise promise) {
        try {
            promise.resolve(countryNameWithCode);
        } catch (Exception e) {
            promise.reject(e);
        }
    }

    @ReactMethod
    public void getCountryCodes(Promise promise) {
        try {
            promise.resolve(countryCodeList);
        } catch (Exception e) {
            promise.reject(e);
        }
    }

    @Override
    public String getName() {
        return "ReactNativeCountries";
    }
}