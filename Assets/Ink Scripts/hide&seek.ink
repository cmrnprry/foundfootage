VAR readEnding = false
VAR ifFound = false
VAR PlacesLooked = 0
VAR dollcantfindrule = false
VAR hideFirst = ""
LIST SearchedIn = Livingroom, Bathroom, Kitchen, Bedroom_
LIST LiedAbout = UnderCouch

#background: default
Ugh... #friend 

#friend
I'm so bored. What took youu so long to get here? #friend 
*[Internet was acting up]
    Nice excuse. #friend 
    Lemme guess, lost track of time watching MeTube videos again? #friend 

*[I, uh, forgot...]
    Rude. #friend 

*[...]
    I know you're there. #friend
    Stop lurking. #friend

- Do you wanna play a game? #friend

I was looking into some of those creepy "games to play alone." #friend
Remember when we played Bloody Mary? Kinda like that. #friend
*[That's dumb.]
    OKAY AND? #friend
    It'll be more fun than just chatting. #friend
    
*[That doesn't sound like the best idea]
    Why, scared? #friend
    I think it'll be fun. #friend
    Better than just messing with the shit on my desk. #friend

*[You can't chicken out on me like before!]
    I won't, I promise! #friend
    Scout's honour! #friend

*[...]
    Helloooo? Anyone there? #friend
    You're usually so chatty. #friend
    If I do this, I'll need your help so you can't be quiet the whole time. #friend

- And it's not like it's real anyway. #friend
Theere's a few I think could be fun. #friend
Which do you wanna do? #friend
*[Hide and Seek]
    -> HideSeek


=== HideSeek ===
Really that one? #friend 
Okay, fine. #friend 
So for that one I need a doll, some candles and... a knife? #friend 
One second I'll be right back. #friend #background:black
...
...
...
Okay, got it. #friend #background:desk #item:doll #item:candle #item:knife
So now... #friend 
Hm... #friend 
I have to make a circle of candles, then sit across from the doll. #friend
Then I have to invite a spirit into the game. #friend
Then it's just normal hide and seek! #friend
*[Invite in a spirit? That doesn't sound like the best idea.]
    Oh it's fine. #friend
    This is a children's game right? #friend
    Even if a spirit does come in, it'll probably be a child. #friend
-> HideSeek.GameStart

*[How does the game end?]
    ~ readEnding = true
    -> HideSeek.HowToEndGame

*[...]
    -> HideSeek.GameStart
    
    
= HowToEndGame
Uhm... Good question, I didn't read that far. #friend
So the doll hides first and then...#friend 
WHAT?!#friend 
It says "Declare out loud that you found the doll, then stab it. You then have 30 seconds to hide." #friend
"The game ends if either the doll finds you OR you manage to stay hidden long enough for the spirit to get bored." #friend
*[What happens if it finds you?]
    ~ ifFound = true
    Mmmm, all it says is "Being found depends on the spirit." #friend
    "Some will leave after, some will demand an offering, and some will return the favour." #friend
    
*[Maybe we shouldn't so this...]
Why, scared? #friend
Like I said, this is all fake anyway. #friend

*[Happy I'm not the one doing this lol]
    Oh, shut up. #friend
    Next time YOU'LL have to do one of these. #friend
    -> HideSeek.GameStart
 
*[...]
    -> HideSeek.GameStart


- It'll all be fine, and if not, it'll be a fun, story to tell later. #friend
    -> HideSeek.GameStart

= GameStart
- One second. I'm gonna put my phone down while I set up. #friend #background:black
...
...
...
Okay done! #friend #background:candlelitdoll
Spooky, right?#friend
Okay I'm gonna close my eyes and start now, alright? #friend
You'll be able to see if anything happens. #friend
Ready? #friend
*[As I'll ever be.]
*[No]
*[Is it too late to just... not do this?]
Yupp! #friend
*[...]

- Okay, eyes closed! #friend
I want to play hide and seek. #friend
I am it first. #friend
If you want to play, I offer this doll as your body. #friend
Will you play with me? #friend #SFX: whispering
Stop messing with me, dude. I know that's just you. #friend
I will start count. You have 30 seconds. #friend
30, 29, 28, 27, 26... #friend #background:candles #Anim:dollleave #SFX:light_footsetps
5, 4, 3, 2, 1. #friend
Ready or not, here I- #friend
Oh fuck. #friend
It's gone? #friend
What the- how?? Are you messing with me? #friend
*[No, it just...]
    Shit, this has to be a prank, right? You and Finn are just messing with me right? #friend
    This really isn't funny. #friend
    You can come out now! #friend
    You got me, good. #friend
    -> HideSeek.YouGiveUp
    
    
*[Yeah]
    Well, haha, you got me. #friend
    Come out now, I give up. #friend
    -> HideSeek.YouGiveUp

*[no! check the vod]
    The vod- #friend
    I don't believe you. #friend
    I'm going to do it just to humor you. #friend #background:black
    "Stop messing with me, dude. I know that's just you." #friend #SFX: whispering
    "I will start count. You have 30 seconds." #friend
    What the actual fuck?! #friend
    This is you and Finn just messing with me right? Right!? #friend
    ...#friend
    ...#friend
    ...#friend
    Okay. #friend
    Okay. # friend
    Well. #friend
    Good job, Ash, now we have a haunted doll hiding somewhere in the house. #friend
    Cool. #friend
    Great. #friend
    I guess I have a doll to find. #friend
    -> SearchForDoll


*[...]
    Haha, you got me. #friend
    Come out now, I give up. #friend
    -> HideSeek.YouGiveUp

= YouGiveUp
You give up? #other #SFX: whispering
Are you sure? you barely tried. #other #SFX:whispering
Guys, stop this isn't funny. #friend
If you want it to stop, you better come find me. #other #SFX:whispering
Come find me. #other #SFX:whispering
Come find me. #other #SFX:whispering
Come find me. #other #SFX:whispering
You'll regret it if you don't. #other #SFX:giggling

*[what the fuck was that]
*[you're fucked lmao]
*[...]

- This is real, isn't it? #friend
It's real. I actually have to... #friend
Ha.. Hahaha... #friend
HAHAHA! #friend
*[you good?]
*[ash? you finally lose it?]
*[what's so funny?]
*[...]

- I've either completely lost it, #friend
or I'm the most unlucky person to ever have played hide and seek. #friend

{
    - readEnding:
        Let's go stab a haunted doll. #friend
        -> SearchForDoll
    - else:
        Let's go find a haunted doll, I guess. #friend
        -> SearchForDoll
}


=== SearchForDoll
Now if I were a haunted doll, where would I hide? #friend #Backgound:desk
*[bathroom]
    Ew, where even would it hide? #friend
    In the tub? #friend
    That's dumb. #friend
    The doors still closed and I know that thing can't reach the knob so, #friend
    probably not there. #friend
    I'm gonna check the living room. #friend #backgroung: livingroom
    -> SearchForDoll.LivingRoom
    
    
*[under the couch...?]
    That's so obvious. #friend
    Not even sure the doll is small enough to fit under there. #friend
    We can check anyway, lots of places to hide there I think. #friend #background:livingroom
    -> SearchForDoll.LivingRoom

*[in a  cabinet]
    Is it even strong enough to do that? #friend
    Might as well check I guess. #friend
    To the kitchen, I suppose. #friend
    -> SearchForDoll.Kitchen_
    
*[...]
    You're sooooo helpful. #friend
    Do you even understand the insanity of this? #friend
    I know you're still watching, so you better start helping! #friend
    ... #friend
    I'm gonna check the kitchen I guess. #friend 
    -> SearchForDoll.Kitchen_
    
= Kitchen_
~ SearchedIn += (Kitchen)
~ PlacesLooked += 1
Do you see anything? #friend #background:kitchen
*[in the pantry]
	Do you think? #friend #background:cabinet_closed
	Is it even strong enough to… #friend 
	Oh shit! #friend #background:cabinet_open #item:doll
	-> FoundDollFirst
*[...]
    ....#friend
    So helpful. #friend
    Only searching around for a HAUNTED DOLL. #friend
    NO BIGGIE.  #friend
    -> SearchForDoll.LivingRoom

= LivingRoom
~ SearchedIn += (Livingroom)
~ PlacesLooked += 1
Not many places it could be. #friend background:livingroom
I'm going to stick my phone under the couch, tell me if you see anything alright? #friend #background:undercouch
See anything? #friend
*[nope]
    Hmm... #friend
*[...]
    I'll take your silence as a no.... #friend

//this is a lie
*[Yeah it's there]
    ~  LiedAbout += (UnderCouch)
    Really?! #friend
    I found you~ #friend
    Lemme just.... #friend
    What the- #friend
    This is a cat toy. #friend
    Haha, ya got me. #friend

- Where else do you think? #friend #background:livingroom
*[Behind TV?]
    Mmmm... #friend
    Don't see it. #friend
    Kitchen maybe? #friend
    -> SearchForDoll.Kitchen_
*[...]
*[no, it's really under the couch]
    It wasn't funny the first time, but thanks for your input. #friend
    I don't think it's here, nothing looks disturbed. #friend
    I'm gonna check the kitchen. #friend
    -> SearchForDoll.Kitchen_
    
*[let's look somewhere else]
    
    
- Yeah... Gonna check the kitchen, I think. 
-> SearchForDoll.Kitchen_

=== FoundDollFirst ===
{
- readEnding:
	So I have to stab it, right? #friend
	*[that's what the instructions say…]
        -> FoundDollFirst.ifcase
    *[guess so]
        -> FoundDollFirst.ifcase
	*[...]
	     -> FoundDollFirst.ifcase
 - else:
    Uhh what do we do? #friend
    *[read the rules dumbass]
    -> FoundDollFirst.elsecase
    *[idk]
    -> FoundDollFirst.elsecase
    *[...]
        -> FoundDollFirst.elsecase


}
= ifcase
		Okay… #friend
		God, this is so fucked… #friend
		I found you! #friend #item:doll_stabbed
		-> Hide1
= elsecase
Oh right, the rules. #friend
It says, It says "Declare out loud that you found the doll, then stab it. You then have 30 seconds to hide." #friend
"The game ends if either the doll finds you OR you manage to stay hidden long enough for the spirit to get bored." #friend
Okay… #friend
God, this is so fucked… #friend
I found you! #friend #item:doll_stabbed
-> Hide1


=== Hide1 ===
You found me! You found me! #other #SFX:whispering #item:doll
You hide, you hide! #other #SFX:whispering
30, 29, 28, 27.. #other #SFX:whispering
Okay okay okay okay.  #friend
Where should I hide? #friend
*[under bed]
-> Hide1.Hide_bath
*[in your closet]
	Mmm, I'll trust you this time. #friend
-> Hide1.Hide_Closet
*[...]
-> Hide1.Hide_bath

= Hide_bath
~ hideFirst = "underbed"
... #friend #background: underbed
*[really?]
*[nice hiding spot]
*[...]

- What? there's so much stuff under her. #friend
Probably won't be able to see me with all the junk. #friend
How long do you think I have to hide for? #friend
Do you- #friend #SFX:heavy_footsteps
… #friend #SFX:doorslam

Come out, come outttt #other
Shit, shit. #friend
It's here. Can you see? #friend #background:bedroom #anim:doll_walk
*[it's just walking]
*[it checked the closet]
	Maybe I should move under there after it leaves? #friend
*[...]
	I hate you. #friend

… #friend #background: closet #SFX:door_slam
Is it gone? #friend
…  #friend
I think it's gone. #friend
Should I move to the closet? #friend
It already checked there so… #friend
*[yes]
	Check to make sure the coast is clear, for me.  #friend #background:bedroom
*[no]
	Mmm… okay… #friend
	-> Hide1.StayCloset

- Is it clear? #friend
*[yes]
    Okay, I'm gonna... #friend #SFX:light_footsteps
*[no]
    Mmm… okay… #friend
	-> Hide1.StayCloset
	
- Now it really shouldn't find me. #friens #background:closet
-> Hide1.StayCloset

= Hide_Closet
~ hideFirst = "closet"
How long do you think I have to hide for? #friend #background:closet
Should we change hiding spots at some point? #friend
*[no]
*[isn't that like against hide and seek?]
*[if you want to]
*[...]

- Yeah probably shouldn't…#friend #SFX:heavy_footsteps
… #friend #SFX: doorslam
Come out, come outttt #other
Shit, shit. #friend
It's here. Can you see? #friend #background:bedroom #anim:doll_walk
*[it's just walking]
*[it checked under the bed]
	Maybe I should move under there after it leaves? #friend
*[...]
	I hate you. #friend

… #friend #background: closet #SFX:door_slam
Is it gone? #friend
…  #friend
I think it's gone. #friend
Should I move to under the bed? #friend
It already checked there so… #friend
*[yes]
	Check to make sure the coast is clear, for me.  #friend #background:bedroom
*[no]
	Mmm… okay… #friend
	-> Hide1.StayCloset

- Is it clear? #friend
*[yes]
    Okay, I'm gonna... #friend #SFX:light_footsteps
*[no]
    Mmm… okay… #friend
	-> Hide1.StayCloset
	
- Now it really shouldn't find me. #friens #background:underbed
-> Hide1.StayCloset


= StayCloset
AGH! #other #SFX:slam_door
Where are you, where are you? #other
Not here. Not there. #other
Where, where, where, WHERE?! #other
Is it... angry..? #friend
*[shut up]
*[sounds like it]
*[...]

- UGH UGH UGH! #other
Fine fine fine FINNNNEEEE #other
You win! #other 
Come out come out come out COME OUT! #other
Should I...? Do yo think this is a trick? #friend
*[I think that's against the rules....]
*[what do the rules say]
*[let's not piss it off more, ash]
*[...]

- Okay... #friend
You couldn't find me, so I win! #friend 
I'm here! #friend #background:bedroom #item:doll
Cheater cheater cheater CHEATER! #other
*[lmao it's so pressed]
*[...]

- N-no, I'm just good at hiding. #friend
again aGain AGAIN! #other
No, the rules say- #friend
Start counting. NOW now now! #other
But that's against- #friend
Start. Counting. #other
*[don't just do what it says, ash]
*[one more round can't hurt?]
*[it's like a child...]
*[...]

- I... #friend
Fine. #friend
But if I find you, that's IT. #friend
Count. #other
30. 29. 28. 27... #friend
NO. #other
COVER THAT. #other
My eyes are closed. #friend
NO. THEM. #other
The stream? Why, they're not- #friend
Cheater. Cheater. Cheater. CheaterCheaterCheaterCheaterCheaterChe-#other
Fine! #friend #background:black
There happy? #friend
30. 29. 28. 27... #friend #SFX:footsteps

->Seek2


->END
=== Seek2
~ SearchedIn -= (Kitchen)
~ SearchedIn -= (Livingroom)
~ PlacesLooked = 0
Where do you think this time? The first time was pretty easy. #friend #background:bedroom
*[why did you say yes???]
    I panicked. #friend 
    It was like a kid. #friend 
    Like you would have been able to tell it no. #friend 
    Let's jus go check the livingroom. #friend 
    -> Seek2.LivingRoom
*[bathroom?]
    I really don't think so. #friend
    But.... #friend
    Oh what the hell... #friend
    -> Seek2.Bathroom_
*[same place as last time?]
    Mmmmaybe. #friend
    We can check. #friend 
    -> Seek2.Kitchen_
*[somewhere in bedroom?]
    ~ SearchedIn += (Bedroom_)
    You think it just slipped under the bed or something?#friend 
    Might as well check while we're here, right? #friend 
    ~ PlacesLooked += 1
    Not here... #friend #background:underbed
    The closet maybe...? #friend #background:closet
    Nope. #friend 
    ~ PlacesLooked += 1
    Living room maybe? #friend
    -> Seek2.LivingRoom

->END
= Kitchen_
~ SearchedIn += (Kitchen)
Let's see... #friend #background:kitchen
A swing and a miss.
~ PlacesLooked += 1
 
 {
    - PlacesLooked > 3:
    -> FoundDoll2
 }
 
Where to next?
{ 
- SearchedIn !? (Livingroom):
    *[living room]
        -> Seek2.LivingRoom
}

{ 
- SearchedIn !? (Bedroom_):
    *[check the bedroom]
        -> Seek2.Bedroom
}

{ 
- SearchedIn !? (Bathroom):
    *[bath room. bath room]
        Ugh, fine. #friend
        -> Seek2.Bathroom_
}




*[...]
    
 
->END

= LivingRoom
~ SearchedIn += (Livingroom)
~ PlacesLooked += 1
Under the couch this time maybe? #friend #background:livingroom
It's probably small enough. #friend
I'm going to stick my phone under there again okay? #friend
... #friend #background:undercouch #item:doll
*[oh shit! yep it's there]
    Really? #friend #background:livingroom
    Lemme grab it! #friend
    -> FoundDoll2
*[nope]
*[...]

- ... #friend
It's litterally right there, why are you like this? #friend 
-> FoundDoll2


= Bathroom_
Could only really be in the tub, right? #friend #background:bathroom
Annnnd nothing. #friend  #SFX:curtain
~ SearchedIn += (Bathroom)
~ PlacesLooked += 1

 {
    - PlacesLooked > 3:
    -> FoundDoll2
 }

{ 
- SearchedIn !? (Livingroom):
    *[living room]
        -> Seek2.LivingRoom
}

{ 
- SearchedIn !? (Bedroom_):
    *[check the bedroom]
        -> Seek2.Bedroom
}

{ 
- SearchedIn !? (Kitchen):
    *[kitchen]
        Again, you think. #friend
        -> Seek2.Kitchen_
}


= Bedroom
~ SearchedIn += (Bedroom_)
    You think it just slipped under the bed or something?#friend 
    Might as well check while we're here, right? #friend 
    ~ PlacesLooked += 1
    
    {
    - PlacesLooked > 3:
    -> FoundDoll2
    }
    
    Not here... #friend #background:underbed
    The closet maybe...? #friend #background:closet
    Nope. #friend 
    ~ PlacesLooked += 1
    
    
     {
    - PlacesLooked > 3:
    -> FoundDoll2
    }
 
    Living room maybe? #friend
    -> Seek2.LivingRoom

=== FoundDoll2 ===
{
- PlacesLooked < 3:
    I found you! #friend #item:doll_stabbed
    AGHAGHAGJUHGVFDS #other
    Stop stop STOP STOP. #other
    Why am I not winning??? #other
    UGH #other
    I will find you find you FIND YOU. #other
    I need to return the favour. #other
    I need need need to win. #other
    302928272625- #other
    Shit, shit, shit #friend
		-> Hide2
 - else:
    Hahahahahahahaa! #other
    You lose, you lose! #other
    I will find you find you FIND YOU now. #other
    I need to return the favour. #other
    I need need need to win. #other
    302928272625- #other
    Shit, shit, shit #friend
		-> Hide2
}

=== Hide2
Where do I hide? #friend
It's counting so fast, shit. #friend
*[under teh bed!]
    The bedroom again? #friend 
    Won't it think to look there again? #friend 
    Fuck. #friend 
    -> Hide2.UnderBed
*[bathroom???? Probably can't open teh door????]
*[...]

- Fuck. Okay. #friend

->Hide2.Bathroom_
= Bathroom_
It's really fucking mad. #friend #background:curtains
Should I have like pretended to not find it? #friend
*[idk if that would have been better]
*[maybe]
*[...]

- Well.. #friend
Let's just hope it doesn't find me. #friend
*[i thought the tub was a bad hiding spot?]
    Shut up. 
*[...]

- I locked the door, so hopefully we should be okay? #friend
*[hope so]
*[...]

- WHERE #other
That sounded like it was from the bedroom. #friend
Hopefully the spooky ghost doesn't think to look in the bathroom? #friend
Hahaha... #friend
*[ash hush]
*[at least when you piss yourself in fear, you're in teh right place]
    Gross. #friend
    I'm not- #friend
    No that's a lie. I'm terrified. #friend
*[...]

- What do yuo think it meant by "return the favour"? #friend
*[probably gonna stab ya]
*[idk]

*[...]

- Oh god. #friend
I'm not gonna die, am I? #friend
That's a bit too much. I- #friend
OH GOD. #friend
*[...]
*[stay QUIET]

- Right, right. Sorry. #friend
I'm just freaking out a bit. #friend
Possibly murderous doll and all... #friend
WHat if- #friend #SFX:doorBanging
... #friend #SFX:doorBanging
Knock Knock Knock Knock #other 
I know you're there. #other
Open up open up #other #SFX:doorBanging
oh fuck... #friend
I FOUND YOU! #other #SFX:doorslam
... #other
... #friend
Here? #other #SFX:shuffling 
UGH WHERE? #other
Come out COME OUT #other
*[maybe it'll just leave..?]
*[piss yourself yet?]
*[...]

- I will find you... #other #SFX:footsteps #SFX:doorslam
... #friend
do you think it's gone...? #friend
*[just stay put]
*[poke the phone out]
    Okay, okay. #friend
    See anything? #friend #background:batheroom #item:doll
    ->Hide2.Died
*[...]

- Yeah, right. #friend
Staying put... #friend
...#friend
AGH #other #foosteps_heavy #SFX:doorslam
WHERE?! #other
... #friend
It tried to lay a trap..? #friend
*[good thing you didn't move]
*[...]

- Yeah... #friend
Hopefully this means, I'll live. #friend
Hahaha... #friend
*[morbid much?]
    You'd call me crazy if I was anything else. #friend
*[i'll give a nice speech at your funeral :-)]
    Dude, what the fuck? #friend
*[...]

- But okay. #friend
Just wai it out. #friend
It'll probably- #friend #SFX: Footsteps_heavy
Fine fineineineineinein #other
FINE #other
You WIN #other
Come out come out come out #other
I give UP #other
Wish me luck... #friend 
You couldn't find me, so I win! #friend #SFX:curtain #background:bathroom #item:doll
S-so now you have to leave. #friend
That was- was the deal. #friend
Count. #other
Wha- No! #friend
Count. #other
I don't want to play anymore. The game is over! I- #friend
You are not the game master anymoreeeeee #other
Count or I will be forced to punish the sore looserrrr #other
Looser? But- #friend
COUNT #other
*[just do it]
*[what the hell, game?]
->looser
*[...]
{~...->looser|...}

- If I win, can this be over? #friend
We'll see, we'll seeee #other
Now. COUNT. #other
-> Seek3

= UnderBed
It's really fucking mad. #friend #background:underbed
Should I have like pretended to not find it? #friend
*[idk if that would have been better]
*[maybe]
*[...]

- Well.. #friend
Let's just hope it doesn't find me. #friend #SFX:heavy_footsetps
... #friend
I know you're here, I know where you areeee #other
Right here, right hereeee #other #SFX:doorslam
No NO NO. #other #SFX:doorslam
... #friend
Should I switch again? Do you think it's gone?#friend
*[stay]
*[ash be QUIET]
*[...]

- I'm sticking my phone out, okay? #friend #background:bedroom #item:doll
*[fuck]
->Hide2.Died
*[...]
->Hide2.Died
*[uhhhh ash...?]
->Hide2.Died

= Closet
... #friend
*[Really?]
*[ash....]
*[...]

- I may have panicked, okay? #friend
It's really mad. #friend
Should I have like pretended to not find it? #friend
*[idk if that would have been better]
*[maybe]
*[...]

- Well.. #friend
Let's just hope it doesn't find me. #friend #SFX:heavy_footsetps
... #friend
->Hide2.Died


= Died
I know you're here, I know where you areeee #other
Right here, right hereeee #other #item:doll
I. #other
Found. #other
You. #other #SFX:laughing
->END


=== looser
I just... #friend
How much longer do I have to play? #friend
Until. #other
I. #other
Say. #other 
So. #other #SFX:laughing
I don't wanna play anymore. #friend
Toooooooo BAD. #other
Now COUNT #other
*[sucks to suck....]
*[...]
*[guess this is your life now?]

- No. No, no, no, no, no, NO! #friend
Olly olly oxenfree. #friend
Game over. #friend
I'm done. #friend
No more! #friend
Please... #friend
I warned youuuu #other #SFX:laughing
->END

//it is in bedroom
=== Seek3
~ PlacesLooked = 0
~ SearchedIn -= (Bedroom_)
~ SearchedIn -= (Kitchen)
~ SearchedIn -= (Livingroom)
~ SearchedIn -= (Bathroom)
30. 29. 28. 27. 26. 25... #friend #background:black #SFX:footsetps
Where to, do ya think?
*[...]
    To the kitchen I suppose. #friend
    -> Seek3.Kitchen_
*[Bedroom]
    Why not? #friend
    -> Seek3.Bedroom
*[kitchen]
    Why not? #friend
    -> Seek3.Kitchen_
*[livingroom]
    Why not? #friend
    -> Seek3.livingroom

= Kitchen_
~ PlacesLooked += 1
Not here. 

{
    - PlacesLooked > 2:
    -> Found3
}

*[...]
    To the living room I suppose. #friend
    -> Seek3.livingroom
*[Bedroom]
    Why not? #friend
    -> Seek3.Bedroom

*[livingroom]
    Why not? #friend
    -> Seek3.livingroom

= Bedroom
... #friend #bedroom #item:doll
*[did it even try?]
*[????]
*[...]

- I... found you? #friend #item:doll_stabbed
-> Found3

= livingroom
~ PlacesLooked += 1
Not here. 

{
    - PlacesLooked > 2:
    -> Found3
}

*[...]
    To the bedroom I suppose. #friend
    -> Seek3.Bedroom
*[Bedroom]
    Why not? #friend
    -> Seek3.Bedroom
*[kitchen]
    Why not? #friend
    -> Seek3.Kitchen_


=== Found3
{
- PlacesLooked > 2:
    LOOSER LOOSER! #other  #item:doll
    Get READY #other
}


302928272625- #other
Fuck. #friend
*[Bedroom]
*[bathroom again??]
*[try to leave]
    Fuck fuck fuck. #friend
    Why did I not try that before?? #friend #SFX:heavy_footsteps #SFX:doorbanging
    -> TryToLeave
*[...]

- Fuck fuck fuck. #friend #background:underbed
*[it's gonna find you]
*[you need to get out of here]
*[...]

- I know, I KNOW! #friend
Think, Ash! Think think think! #friend
If it comes in here I'm gonna make a run for the front door. #friend
I still have the knife. #friend
I'll stab it, then run. #friend
*[that's not gonan work]
*[do you want red  or white flowers at your funeral?]
*[i'll say a prayer. good luck]
*[...]

- Thanks for the words of encouragement. #friend #sfx:whispering
I know you're hereeee #other
... #friend
Now or never... #friend
Ahhhh! #friend #background: bedroom #item:doll_stabbed
Hahahaa #other #laughing #whispering
Run, little rabbit, run. #other #background:frontdoor
-> TryToLeave

->END

===TryToLeave
What the- #friend
It won't open?! #friend #SFX:doorbanging
HELP! HELP! #friend
SHIT! #friend
SOMEONE! #friend
Found youuuu #other #Item: doll
I thought I told you? #other
You leave, when I #other
Say #other
So #other #SFX:laughing
Get ready to countttt #other
->END

