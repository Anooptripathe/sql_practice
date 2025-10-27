def three_sums(num):
    num.sort()
    result=[]
    n=len(num)

    for i in range(n-2):
        if i>0 and num[i]==num[i-1]:
            continue

        left,right=i+1,n-1
        while(left<right):
            total=num[i]+num[left]+num[right]

            if total==0:
                result.append([num[i],num[left],num[right]])

                while left<right and num[left]==num[left+1]:
                    left+=1
                while left<right and num[right]==num[right-1]:
                    right-=1
                
                left+=1
                right-=1

            elif total<0:
                left+=1
            else:
                right-=1
    
    return result

num=[-2,0,1,1,-1]
# three_sums(num)

def check_first_letter(s1,s2):
    if s1[0]==s2[0]:
        return True
    else:
        return False
print(check_first_letter("Crow","Cow"))

print(check_first_letter("Crow","Down"))


