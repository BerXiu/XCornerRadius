<h1 align="center">CornerRadius</h1>
<br>
	<p align="center">
		<img src="https://img.shields.io/badge/version-v1.0.0-blue.svg" />
		<img src="https://img.shields.io/badge/language-OC-red.svg" />
	</p>
	<p align="center">
		<img width=425 height=327 src="https://raw.githubusercontent.com/BerXiu/MyResource/master/XCornerRadius/SimulatorImage.png" />
	</p>
	<h5 align="center">Efficient rounded Settings, make your program fly</h5>
</br>

##CocoaPods
```
pod 'XCornerRadius', '~> 1.0.0'
```

##Usage

#####Create Rounding Image
```
	UIImageView *roundingImage = [[UIImageView alloc]initWithRoundingRectImageView];
	roundingImage.image = [UIImage imageNamed:@"testImage"];
	[roundingImage setFrame:CGRectMake(centerX - 120, centerY - 120, 100, 100)];
	[self.view addSubview:roundingImage];
```

#####set the coustom ConrnerRadius
```
    UIImageView *cornerRadius = [[UIImageView alloc]initCornerRadius:25 type: UIRectCornerTopLeft | UIRectCornerBottomRight];
    cornerRadius.image = [UIImage imageNamed:@"testImage"];
    [cornerRadius setFrame:CGRectMake(centerX - 120, centerY + 20, 100, 100)];
    [self.view addSubview:cornerRadius];
```

#####set the borderWidth and borderColor
```
	[roundingImage x_setBorderWidth:5 borderColor:[UIColor orangeColor]];
```
