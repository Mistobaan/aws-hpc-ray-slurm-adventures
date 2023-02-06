#[pyfn(m)]
#[pyo3(name = "read_f64")]
fn read_f64_py(
    filename: &str,
    iid_count: usize,
    sid_count: usize,
    count_a1: bool,
    iid_index: &PyArray1<usize>,
    sid_index: &PyArray1<usize>,
    val: &PyArray2<f64>,
    num_threads: usize,
) -> Result<(), PyErr> {
    // translate Python NumPy 1-D arrays into Rust slices, the standard Rust 1-D data structure, via:
    let iid_index = iid_index.readonly();
    let sid_index = sid_index.readonly();
    // translates Python NumPy 2-D arrays into 2-D Rust ndarray objects, via:
    let mut val = unsafe { val.as_array_mut() };
    let ii = &iid_index.as_slice()?;
    let si = &sid_index.as_slice()?;
    /*
    Doing the core work in a Rust function defined on standard Rust types lets us use Rust best practices for testing, generics, errors, etc. It also gives us a pathway to later offering a Rust version of our package.
    */
    create_pool(num_threads)?.install(|| {
        read_no_alloc(
            filename,
            iid_count,
            sid_count,
            count_a1,
            ii,
            si,
            f64::NAN,
            &mut val,
       )
    })?;
   Ok(())
}
