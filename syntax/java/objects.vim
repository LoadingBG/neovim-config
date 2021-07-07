" Type Wrappers
syntax keyword javaCommonClass java.lang.Boolean       Boolean
syntax keyword javaCommonClass java.lang.Character     Character
syntax keyword javaCommonClass java.lang.Double        Double
syntax keyword javaCommonClass java.lang.Float         Float
syntax keyword javaCommonClass java.lang.Byte          Byte
syntax keyword javaCommonClass java.lang.Short         Short
syntax keyword javaCommonClass java.lang.Integer       Integer
syntax keyword javaCommonClass java.lang.Long          Long
syntax keyword javaCommonClass java.lang.Number        Number
syntax keyword javaCommonClass java.lang.Object        Object
" Char Sequences
syntax keyword javaCommonClass java.lang.String        String
syntax keyword javaCommonClass java.lang.StringBuffer  StringBuffer
syntax keyword javaCommonClass java.lang.StringBuilder StringBuilder
" Utility Classes
syntax keyword javaCommonClass java.lang.System        System
syntax keyword javaCommonClass java.util.Arrays        Arrays
syntax keyword javaCommonClass java.util.Random        Random
syntax keyword javaCommonClass java.util.Scanner       Scanner
" Interfaces
syntax keyword javaCommonClass java.io.Serializable    Serializable
syntax keyword javaCommonClass java.lang.AutoCloseable AutoCloseable
syntax keyword javaCommonClass java.lang.CharSequence  CharSequence
syntax keyword javaCommonClass java.lang.Cloneable     Cloneable
syntax keyword javaCommonClass java.lang.Closeable     Closeable

highlight def link javaCommonClass cSpecialCharacter


" Object Methods
syntax keyword objectMethod clone equals finalize getClass hashCode notify notifyAll toString wait

highlight def link objectMethod cSpecialCharacter

