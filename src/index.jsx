import { View, Text } from "react-native";
import { StatusBar } from 'expo-status-bar';

export default function Index() {

  return (
    <View className="flex-1 items-center justify-center">
      <Text>¡Start from here!</Text>
      <Text className="font-bold text-xl">App.js</Text>
      <StatusBar style="auto" />
    </View>
  )
}
