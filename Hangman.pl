#Name-Avnish Kumar Entry no-2020csb1078
use strict;
use Term::ANSIColor;
use warnings;

print"GAME STARTS NOW-";
again: #goto statement called
#array with words
my @array=('computer','radio','calculator','teacher','bureau','police','geometry','president','subject','country','enviroment','classroom','animals','province','month','politics','puzzle','instrument','kitchen','language','vampire','ghost','solution','service','software','virus25','security','phonenumber','expert','website','agreement','support','compatibility','advanced','search','triathlon','immediately','encyclopedia','endurance','distance','nature','history','organization','international','championship','government','popularity','thousand','feature','wetsuit','fitness','legendary','variation','equal','approximately','segment','priority','physics','branche','science','mathematics','lightning','dispersion','accelerator','detector','terminology','design','operation','foundation','application','prediction','reference','measurement','concept','perspective','overview','position','airplane','symmetry','dimension','toxic','algebra','illustration','classic','verification','citation','unusual','resource','analysis','license','comedy','screenplay','production','release','emphasis','director','trademark','vehicle','aircraft','experiment');
#chosen word
my $picked=$array[rand @array];
print"\nRandom word to be guessed :: $picked";
my $lenpicked=length($picked);
my @result=("_");            #for storing matched letters
for(my $i=1;$i<$lenpicked;$i++)
{
    $result[$i]="_";
}
my @misses=();   #for storing unmatched letter or word
print"\n";
print"Initial word map is ";
print"@result";
my $hangman=6;    #denotes no of remained body parts
my $win=0;        #$
my $flag=0;   
my $leftletter=$lenpicked;    #to store how many letters have not been used
my @arr=split(//,$picked);    #for accessing letter by letter picked word $picked to array $arr
my $n=$lenpicked;             #stores length of picked word


sub printhangman{         #subroutine to print hangman status
    
my @hangmanarr0=split(//,"_______");
my @hangmanarr1=split(//," |    |");
my @hangmanarr2=split(//," |     ");
my @hangmanarr3=split(//," |     ");
my @hangmanarr4=split(//," |     ");
my @hangmanarr5=split(//," |     ");
my @hangmanarr6=split(//," |     ");
my @hangmanarr7=split(//,"_|_");

    my $step=$_[0];             #in this line $step denotes no of remained parts
    $step=6-$step;              #in this line $step denotes no of hanged parts and onwards in subroutine printhangman
    pop @_;                     #pop to have one element after again calling of hangman subroutine
    if($step>=1)                #hanged part >=1
    {
        $hangmanarr2[6]='O';
    }
    if($step>=2)                #hanged part>=2
    {
        $hangmanarr3[6]='|';
        $hangmanarr4[6]='|';
    }
    if($step>=3)                #hanged part>=3
    {
        $hangmanarr3[7]='/';
    }
    if($step>=4)                ##hanged part>=4
    {
        $hangmanarr3[5]='\\';
    }
    if($step>=5)                #hanged part>=5
    {
        $hangmanarr5[7]='\\';
    }
    if($step==6)                #hanged part=6
    {
        $hangmanarr5[5]='/';
    }
    
    #printing hangman
    print"@hangmanarr0\n";
    print"@hangmanarr1\n";
    print"@hangmanarr2\n";
    print"@hangmanarr3\n";
    print"@hangmanarr4\n";
    print"@hangmanarr5\n";
    print"@hangmanarr6\n";
    print"@hangmanarr7\n";
}

while($hangman>0 && $win==0){       #run till no of remained part i.e. $hangman is greater than 0 with not winning $win=0
    $flag=0;
    print "\nEnter a letter --> ";
    my $guess=<STDIN>;
    chop($guess);                #to remove \n from last
    for(my $j=0;$j<$lenpicked;$j++)
    {
        if("$arr[$j]"eq"$guess")     #checking input letter matching any letter of picked word or not
        {
            if("$result[$j]"eq"_")   #to avoid repeating of letters
            {
                $result[$j]=$guess;
                $flag=1;
            }
            else{
                print"------->Already filled with ($guess) <--------"; #message for repeated input
                $flag=1;
                $hangman--;
                last;
            }
        }
    }
    if($flag==0)    #putting wrong letter in misses as flag=0 represents no matching
    {
        push(@misses,$guess);
        $hangman--;
    }
    my $left=$lenpicked;
    for(my $i=0;$i<$lenpicked;$i++)
    {
        if("$result[$i]"eq"$arr[$i]")  #checking the latest result with array of picked word
        {
            $left--;
        }
        else{
            last;
        }
    }
    if($left==0)  #no of letters to be  chosen from $picked
    {
        $win=1;
    }

    print"\nNow word map is : @result";      #latest word filled status by @result

    #printing misses 
    my $size=@misses;
    if($size==0)
    {
        print"\nNo misses till now";
    } 
    else
    {
        print"\nMisses are : @misses";
    }       #printing misses 
    print"\nRemained body parts i.e. no of wrongs allowed now = $hangman\n";
    printhangman($hangman);      #call for printing latest hangman status     
}
#printing your status
if($win==1)        
{
    print"Yep!You won!!";
}
else{
    print"OOps!You lost!!";
}
print"\nDo you want to play once again?\n";
print"Enter- 1 for Yes or 0 for No - ";
my $choose=<STDIN>;   #taking input for playing again or exit
if($choose==1)
{
    goto again;      #for playing again
}
else{
    print"Thanku for playing";
}