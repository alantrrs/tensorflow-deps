
pip_rasterio () {
    cd /home/
    virtualenv env
    source env/bin/activate

    pip install --upgrade pip wheel
    pip install google -U
    pip install numpy -U
    pip install tensorflow -U

    deactivate
}


gather_pack () {
    # packing
    cd /home/
    source env/bin/activate

    rm -r lambdapack
    mkdir lambdapack
    cd lambdapack

    cp -R $VIRTUAL_ENV/lib/python2.7/site-packages/* .
    cp -R $VIRTUAL_ENV/lib64/python2.7/site-packages/* .
    echo "original size $(du -sh /home/lambdapack | cut -f1)"

    # cleaning libs
    find . -type d -name "tests" -exec rm -rf {} +

    # cleaning
    find -name "*.so" | xargs strip
    find -name "*.so.*" | xargs strip
    # find . -name tests -type d -print0|xargs -0 rm -r --
    # find . -name test -type d -print0|xargs -0 rm -r --    
    rm -r pip*
    rm -r wheel*
    rm easy_install.py
    find . -name \*.pyc -delete
    find . -name \*.txt -delete
    find . -name \*.md -delete
    find . -name \*.zip -delete
    echo "stripped size $(du -sh /home/lambdapack | cut -f1)"
}

main () {
    echo "Install & Package"

    pip_rasterio

    gather_pack
}

main
