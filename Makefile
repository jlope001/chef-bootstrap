setup:
	\curl -sSL https://get.rvm.io | bash -s stable --ruby

install:
	rm -rf ./berks-cookbooks
	berks vendor
	rvmsudo_secure_path=1 rvmsudo chef-solo -c solo.rb