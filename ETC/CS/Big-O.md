# Big-O 표기법

> 시간 복잡도를 표현하는 표기법

### big-O, big-Ω, big-θ 이게 뭔데?

- big-O: 시간의 상한을 나타낸다.
- big-Ω: 시간의 하한을 나타낸다.
- big-θ: 딱 맞는 시간을 나타낸다.

### 연습문제 기록하기

1. a와 b를 곱하는 코드이다. 수행 시간은?

   ```c
   int add(int a, int b){
       int sum = 0;
       for(int i=0;  i<b; i++){
           suma += a;
       }
       return sum;
   }
   ```

   답: O(b)

2. 다음은 $a^b$를 구하는 코드이다. 수행 시간은?

   ```c
   int power(int a, int b){
   	if(b<0){
   		retrun 0;
   	}
   	else if(b==0){
   		return 1;
   	}
   	else
   		return a*power(a,b-1);
   	}
   }
   ```

   답: O(b)

3. a%b를 계산하는 코드이다. 수행 시간은?

   ```c
   int mod(int a, int b){
   	if(b<=0){
   		retrun -1;
   	}
   	int div = a/b;
   	return a-div*b;
   }
   ```

   답: O(<script type="text/javascript" src="https://www.hostmath.com/Math/MathJax.js?config=OK"></script>)

4. 자연수를 나눗셈 하는 코드이다. 수행 시간은?

   ```c
   int div(int a, int b){
   	int count = 0;
   	int sum = b;
   	while(sum<=a){
   		sum +=b;
   		count++;
   	}
   	return count;
   }
   ```

   답: O(a/b)

5. 자연수의 제곱근을 구하는 코드이다. 제곱근이 자연수가 아닐 때 완전제곱이 아니라면 -1를 반환해야 한다. 완전제곱근인지 아닌지를 유추하는 방식은 n이 100이라면 먼저 50, 그 다음은 25로 시도해보는 방식을 사용한다. 즉 절반씩 시도해 본다.

   ```c
   int sqrt(int n){
   	return sqrt_help(n,1,n);}

   int sqrt_help(int n, int min, int max){
   	if(max<min) return -1;

   	int guess = (min+max)/2;
   	if (guess*guess ==n){
   		return guess;}
   	else if(guess*guess <n){
   		return sqrt_help(n,guess+1,max);}
   	else {
   		return sqrt_help(n,min,guess-1);}

   ```

   답: O($log~n$)  
   이유: $\frac{1}{2}$씩 줄어든다.

6. 자연수를 제곱근 하는 코드이다. 완전제곱근이 아니라면 -1를 반환하고 완전제곱근이 아닌지 확인하기 위해선 +1씩 증가 시키며 정답인지 확인한다.

   ```c
   int sqrt(int n){
   	for(int guess = 1; guess*guess <= n; guess++)
   		if (guess*guess ==n){
   			return guess;}
   	return -1;
   }
   ```

   답: O($\sqrt{n}$)

7. appendArray는 배열에 새로운 값이 추가할 때 마다 더 큰 크기의 배열을 새롭게 만든뒤 해당 배열을 반환하는 함수이다. copyArray 함수를 만들 때 반복적으로 호출 하기 위해 사용한다. 배열을 복사하는 데 걸리는 시간은?

   ```c
   int[] copyArray(int[] array){
   	int[] copy = new int[0];
   	for(int value : array){
   		copy = appendArray(copy, value);
   	}
   	return copy;
   }

   int[] appendArray(int[] array, int value){
   	int[] bigger = new int[array.length+1];
   	for(int i=0; i<array.length; i++){
   		bigger[i] = array[i];
   	}
   	bigger[bigger.length-1]=value;
    return bigger;
   }
   ```

   답: O($array.length^2$)  
   이유: 결국에는 이중 for문. 배열 개수를 카피해 저장.

8. 다음은 숫자의 각 자리수를 합하는 코드이다. 이 코드의 big-o 시간은?

   ```c
   int sumDigits(int n){
   	int sum = 0;
   	while(n>0){
   		sum+= n%10;
   		n/=10;
   	}
    return sum;
   }
   ```

   답: O($log~n$)

9. 다음은 정렬된 문자열 중 길이가 K인 모든 문자열을 출력하는 코드이다. 이 코드는 길이가 K인 모든 문자열을 생성한 뒤 해당 문자열이 정렬되어 있는지 확인하는 과정을 거친다. 이 코드의 수행 시간은?

   ```c
   int numChar = 26;
   void printSort(int remain){
   	printSort(remain, "");}

   void printSort(int remain, Stirng prefix){
   	if(remain == 0){
   		if(isInOrder(preifx){
   			print(prefix);
   		}
   	}else{
   		for(int i=0; i< numChars; i++){
   			char c = inhLetter(i);
   			printSort(remain-1,prefix+c)}
   	}
   }

   boolean isInOrder(String s){
   	for(int i =1; i<s.length(); i++){
   		//charAt string 형 중 하나만 char형 으로 바꿔준다.
   		int prev = inhLetter(s.charAt(i-1));
   		int curr= inhLetter(s.charAt(i));
   		if(prev>curr){
   			return false;}
   	}
    return true;}

   char inhLetter(int i){
   	return (char)(((int)'a')+i));}

   ```

   답: O($n^2$)  
   이유: 반복해서 한 번, 재귀로 한 번. 총 두 번.

10. 다음은 두 배열의 교집합(공통된 원소)의 개수를 세어 주는 코드이다. 각 배열에 중복된 값을 없다고 가정해도 좋다. 교집합을 구하기 위해 배열b를 정렬한 뒤 이진 탐색으로 배열 a를 차례로 살펴보면서 해당 원소가 b에 존재하는지 확인한다. 이 코드의 수행 시간은?

    ```c
    int intersect(int[] a,int[] b){
    	sort(b);
    	int inter = 0;
    	for(int x: a){
    		if(binarySearch(b, x)>=0){
    			inter++;}
    	}
     return inter;
    }
    ```

    답: O($nlog_2n$)
