namespace QuantumRNG {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    
    @EntryPoint()
    operation GenerateRandomBit() : Result {
        // Allocate a quibit.
        use q = Qubit();

        // Put the qubit to superposition.
        H(q);

        // Measure the qubit.
        return M(q);
    }
}