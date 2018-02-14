require File.expand_path '../spec_helper.rb', __FILE__

RSpec.describe "GET /" do

  before do
    # sample format of a  proc/cpuinfo file on linux
    allow_any_instance_of(CpuInfo).to receive(:cpuinfo) {
      "processor\t: 0\nvendor_id\t: GenuineIntel\ncpu family\t: 6\nmodel\t\t: 69\nmodel name\t: Intel(R) Core(TM) i5-4258U CPU @ 2.40GHz\nstepping\t: 1\ncpu MHz\t\t: 2399.998\ncache size\t: 3072 KB\nphysical id\t: 0\nsiblings\t: 1\ncore id\t\t: 0\ncpu cores\t: 1\napicid\t\t: 0\ninitial apicid\t: 0\nfpu\t\t: yes\nfpu_exception\t: yes\ncpuid level\t: 13\nwp\t\t: yes\nflags\t\t: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx rdtscp lm constant_tsc rep_good nopl xtopology nonstop_tsc pni pclmulqdq monitor ssse3 cx16 sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx rdrand hypervisor lahf_lm abm avx2\nbogomips\t: 4799.99\nclflush size\t: 64\ncache_alignment\t: 64\naddress sizes\t: 39 bits physical, 48 bits virtual\npower management:\n\n"
    }
  end

  it "returns formatted cpu info" do
    get ""
    expect(format_response).to eq({
      "address sizes" => "39 bits physical, 48 bits virtual",
      "apicid" => "0",
      "bogomips" => "4799.99",
      "cache size" => "3072 KB",
      "cache_alignment" => "64",
      "clflush size" => "64",
      "core id" => "0",
      "cpu MHz" => "2399.998",
      "cpu cores" => "1",
      "cpu family" => "6",
      "cpuid level" => "13",
      "flags" => ["fpu", "vme", "de", "pse", "tsc", "msr", "pae", "mce", "cx8", "apic", "sep", "mtrr", "pge", "mca", "cmov", "pat", "pse36", "clflush", "mmx", "fxsr", "sse", "sse2", "syscall", "nx", "rdtscp", "lm", "constant_tsc", "rep_good", "nopl", "xtopology", "nonstop_tsc", "pni", "pclmulqdq", "monitor", "ssse3", "cx16", "sse4_1", "sse4_2", "x2apic", "movbe", "popcnt", "aes", "xsave", "avx", "rdrand", "hypervisor", "lahf_lm", "abm", "avx2"],
      "fpu" => "yes",
      "fpu_exception" => "yes",
      "initial apicid" => "0",
      "model name" => "Intel(R) Core(TM) i5-4258U CPU @ 2.40GHz",
      "model" => "69",
      "physical id" => "0",
      "power management:" => nil,
      "processor" => "0",
      "siblings" => "1",
      "stepping" => "1",
      "vendor_id" => "GenuineIntel",
      "wp" => "yes",
    })
  end
end