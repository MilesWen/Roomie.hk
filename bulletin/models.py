from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator

# Create your models here.
class User(models.Model):
    # primary key, i.e., id is automatically added
    # user profile
    # facebook id
    fbid = models.CharField(default='', max_length=200)
    # facebook username as the name
    name = models.CharField(default='',max_length=200)
    # facebook age as the age
    age = models.PositiveIntegerField(default=5, validators=[MinValueValidator(5), MaxValueValidator(100)])
    # gender is string with default value 'F' meaning female, while 'M' means male
    gender = models.CharField(default='F', max_length=1)
    # occupation is string with two values 'student' and 'work', where 'student' is default
    occupation = models.CharField(default='student', max_length=200)
    # has pet or not
    hasPet = models.BooleanField(default=False)
    # smoker or not
    smoker = models.BooleanField(default=False)
    # quiet or not
    quiet = models.BooleanField(default=False)
    # facebook profile photo URL
    fbProfilePhotoURL = models.URLField(default='google.com')
    
    # roomie preferences
    gender_mate = models.CharField(default='F', max_length=1)
    occupation_mate = models.CharField(default='student', max_length=200)
    hasPet_mate = models.BooleanField(default=False)
    smoker_mate = models.BooleanField(default=False)
    quiet_mate = models.BooleanField(default=False)
    
    # room preferences
    district = models.CharField(default='central', max_length=200)
    isPrivate = models.BooleanField(default=False)
    #price preference
    price = models.PositiveIntegerField(default=5000)
    moveInDate = models.DateField()
    # stay period of months with default 12 months
    stayPeriod = models.PositiveIntegerField(default=12)    
    
    def __str__(self): # __str__ for Python 3, __unicode__ for Python 2
        return self.name
    
class Room(models.Model):
    # primary key, i.e., id is added automatically
    # user identity is foreign key in User model
    user = models.ForeignKey(User)
    address = models.CharField(default='', max_length=200)
    district = models.CharField(default='central', max_length=200)
    # GPS of central Lan Kwai Fong by default
    latitude = models.FloatField(default=22.280812, validators=[MinValueValidator(-90), MaxValueValidator(90)])
    longitude = models.FloatField(default=114.155676, validators=[MinValueValidator(-180), MaxValueValidator(180)])
    isPrivate = models.BooleanField(default=False)
    price = models.PositiveIntegerField(default=5000)
    # ATTENTION: set data default???
    moveInDate = models.DateField()
    stayPeriod = models.PositiveIntegerField(default=12)    
    # square foot
    size = models.PositiveIntegerField(default=100)
    numExistingMates = models.PositiveIntegerField(default=1)
    pictureURL = models.URLField(default='google.com')
    
    def __str__(self): # __str__ for Python 3, __unicode__ for Python 2
        return "room id:" + str(self.id) + ", owner:" + self.user.__str__()
    
class Bookmark(models.Model):
    user = models.ForeignKey(User)
    room = models.ForeignKey(Room)
    # the combinnation of user and room should be unique
    class Meta:
        unique_together = (("user", "room"),)
    
    def __str__(self):
        return str("user:" + self.user.__str__() + " bookmark room:" + str(self.room.id))
    
class Friend(models.Model):
    user1 = models.ForeignKey(User, related_name='u1')
    user2 = models.ForeignKey(User)
    
    def __str__(self):
        return str("user:" + self.user1.__str__() + " friend with:" + self.user2.__str__())
    