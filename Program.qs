namespace QuantumRNG {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    
    operation GenerateRandomBit(): Result {
        // Allocate a quibit.
        use q = Qubit();

        // Put the qubit to superposition.
        H(q);

        // Measure the qubit.
        return M(q);
    }

    operation SampleRandomNumberInRange(min: Int, max: Int): Int {
        mutable output = 0;
        repeat {
            mutable bits = [];
            for idxBit in BitSizeI(min)..BitSizeI(max) {
                set bits += [GenerateRandomBit()];
            }
            set output = ResultArrayAsInt(bits);
        }
        until (output <= max);
        return output;
    }

    @EntryPoint()
    operation SampleRandomNumber(): Int {
        let max = 50;
        let min = 1;
        Message($"Sampling a randum number between {min} and {max}: ");
        return SampleRandomNumberInRange(min, max);
    }
}