# !/bin/bash
if [ ! -f .env ]; then
    echo "ERROR: .env file missing - please run:"
    echo "  ./kayak init"
    exit -1
fi

if [ ! -f Movefile ]; then
    echo "INFO: Movefile not fount. Ready to create one."
    read -p "Please write the relative path of where the Movefile should stay: " MOVEFILE_PATH

    if [ ! -d $MOVEFILE_PATH ]; then
        echo "ERROR: $MOVEFILE_PATH is not a valid directory."
        exit -1
    fi

    if [ ! -f "$MOVEFILE_PATH/Movefile" ]; then
        echo "INFO: Movefile not present in $MOVEFILE_PATH"
        echo "Generating a brand new Movefile..."
        cp Movefile.example "$MOVEFILE_PATH/Movefile" || exit -2
    fi

    ln -sf "$MOVEFILE_PATH/Movefile" ./Movefile || exit -3
fi

source .env

wordmove "$@"