# shell script to automate publishing website and commiting changes to git
# 


# check that we are in the right place
cd /Users/PEAI002/Desktop/PhD\ admin/learning_code/academic-kickstart
# generate the site
hugo 
# what happens if commit message is empty? will it crash?
echo please enter your commit message for the project files
read COMMITMESSAGE
git commit -a -m "$COMMITMESSAGE"
git push
 
cd public
# this is a total hack: i don't know what is generating these in the html!!
sed -i '' 's/Information/information/g' index.html
sed -i '' 's/Education/education/g' index.html

# i don't think that the commit message for the site needs to be different, 
# but as an extension, could have an optional different message 
# pressing enter should defaults to previous COMMITMESSAGE
git commit -a -m "$COMMITMESSAGE"
git push

# this will return us to root folder: could push/pop initial location?
cd ..

