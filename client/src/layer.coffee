layerInfo =
    Affine:
        input: 1
        output: 1
        params:
            n:
                description: "numebr of hidden units"
                type: 'integer'
                check: (x) ->
                    return "Affine layer must have positive number of units" if x < 0
    Conv:
        input: 1
        output: 1
        params:
            kernel:
                description: "kernel size"
                type: 'size'
            stride:
                description: "kernel stride"
                type: 'size'
    Pool:
        input: 1
        output: 1
        params:
            kernel:
                description: "kernel size"
                type: 'size'
            stride:
                description: "kernel stride"
                type: 'size'
            func:
                description: "aggregate function"
                type: 'enum: max, mean'
    Flat:
        input: 1
        output: 1
        params: {}
    Softmax:
        input: 1
        output: 1
        params: {}
    Input:
        input: 0
        output: 1
        params:
            index:
                description: "the index of the input"
                type: 'integer'
                check: (x) ->
                    return "input index must be positive" if x < 0
    Output:
        input: 1
        output: 0
        params: {}

getLayerList = -> k for k of layerInfo

getLayerInfo = (name) -> layerInfo[name] ? throw "no such a layer: #{name}"

getLayerParams = (name) -> layerInfo[name]?.params ? throw "no such a layer: #{name}"
