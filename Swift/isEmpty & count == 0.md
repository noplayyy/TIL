# isEmpty와 count == 0

리스트의 값이 비어있을 때 `list.count == 0`  혹은 `list.isEmpty` 를 사용한다.
문자열의 값이 비어있을 때를 확인할 때도 `string == ""` 혹은 `string.isEmpty` 를 사용한다.

직관적이라는 이점이 있어 `isEmpty` 를 주로 애용하곤 하지만, 실제로도 개발적 측면에서 `isEmpty` 를 사용하는 게 더 좋다.

## isEmpty

isEmpty는 true나 false를 반환한다.  
즉 문자열, 리스트의 시작 인덱스와 문자열, 리스트의 끝 인덱스가 같은지 여부를 확인하는 것이다.  
모든 문자를 헤아릴 필요가 없으니 시간복잡도가 O(1)이 된다.

## count

count는 문자열, 리스트 원소를 처음부터 시작해 끝까지 세어나간다.  
그러므로 count의 시간복잡도는 O(n)이다.  
빈 문자열이 있으면 걸리는 시간이 짧지만, 문자열이 길어졌을 때를 가정하면 계산하는데에 시간이 꽤 소요된다.  

### **결론적으로 isEmpty를 사용하는 것이 좋다.**