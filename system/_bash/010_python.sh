PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages

if [ -d ${PYTHONPATH} ]; then
  export PYTHONPATH
fi
