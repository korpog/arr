f<-c(1,3,5)
g<-c(3,9,8)

f+g
d=6
if(d>4){print(d+1)}
if (d < 4){print(d + 1)} else {print (d - 100)}
apple<-c('red', 'green', 'yellow')
apple[2]
v<-(1:20)
for ( i in v) {
  print(i)
}
v[3] <- -8
v[3]
for ( i in v) {
  + print(i)}
#fibonacci
fib = c(1:100)
a = 0
b = 1
a
b
for (i in fib) {
  nxt = a + b
  a = b
  b = nxt
  print(nxt)
}
#ciag
a1 = -20
a2 = 3
e = c(3:10)
a1
a2
for (i in e) {
  nxt = 4 + i + a1 + a2
  a2 = nxt
  a1 = a2
  print(nxt)
}

#wykresy funkcji
x=seq(-4,pi,0.1)
y = x^{2}*(sin(x))
plot(x,y, type='l')

x=seq(-10,10 ,0.2)
y = sin(x)*cos(x)*log(x+1)
plot(x,y, type='l')

x=seq(0,20, 0.2)
y = log(x+2)*tan(x)
plot(x,y, type='l', col=c('purple'))

