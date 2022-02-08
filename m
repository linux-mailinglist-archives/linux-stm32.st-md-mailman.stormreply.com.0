Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 663A34AE54A
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Feb 2022 00:11:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C6FCC5E2CC;
	Tue,  8 Feb 2022 23:11:23 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19E60C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Feb 2022 23:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644361881; x=1675897881;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SX+Ukr/Axms+ZkUXzepwxZRP4Htag+UHnjtIv0GwVmA=;
 b=jekIysgGPSbmycifyDbwDv/okABMdn7+6FooVP8BxP9GVZIEpqRZ1i5d
 CAWj7tF1rEwblZBUTTqbSDcP9xnDbzxWLSrwJeodaoUgYE3XPIQoATP9j
 cDpSofLcx296tfegmvZ+EI2uT84IfZbSPCY15HHfa7153R+6wb9AFELbo
 LGX9hrY43RUOnhPAfJL06XHSHNL63qRU7nyN8ML0xn1OAT/04V9jJwVkr
 lQc3NORtPLxy+RbgwqR8FJgLBCoSJoJRjcneQBOweq2KVZNQyKbimBnqU
 4Zh/HWs8fdr83UtyrTPwzp123ilxtsPJ/ZK/o7IIppluAo0weNMsQhjX/ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="249020773"
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; d="scan'208";a="249020773"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 15:11:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; d="scan'208";a="771145853"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 08 Feb 2022 15:11:14 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nHZdh-0000uZ-QM; Tue, 08 Feb 2022 23:11:13 +0000
Date: Wed, 9 Feb 2022 07:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Carlos Bilbao <carlos.bilbao@amd.com>, john.stultz@linaro.org,
 tglx@linutronix.de, sboyd@kernel.org, alexandre.belloni@bootlin.com,
 gregkh@linuxfoundation.org
Message-ID: <202202090656.Bx5FpSa7-lkp@intel.com>
References: <20220208161049.865402-1-carlos.bilbao@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220208161049.865402-1-carlos.bilbao@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-rtc@vger.kernel.org, jgross@suse.com, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, Carlos Bilbao <carlos.bilbao@amd.com>,
 linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org, bilbao@vt.edu,
 boon.leong.ong@intel.com, linux-ia64@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, mhiramat@kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] include: linux: Reorganize timekeeping
 and ktime headers
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Carlos,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on geert-m68k/for-next]
[also build test ERROR on tip/timers/core tip/x86/core linus/master v5.17-rc3]
[cannot apply to next-20220208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Carlos-Bilbao/include-linux-Reorganize-timekeeping-and-ktime-headers/20220209-001309
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
config: alpha-randconfig-r001-20220208 (https://download.01.org/0day-ci/archive/20220209/202202090656.Bx5FpSa7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5ed7d76f2d6aabedc437bc0b99020dc655ab5719
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Carlos-Bilbao/include-linux-Reorganize-timekeeping-and-ktime-headers/20220209-001309
        git checkout 5ed7d76f2d6aabedc437bc0b99020dc655ab5719
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash arch/alpha/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/alpha/kernel/osf_sys.c: In function '__do_sys_osf_settimeofday':
>> arch/alpha/kernel/osf_sys.c:1013:16: error: implicit declaration of function 'do_sys_settimeofday64'; did you mean 'sys_settimeofday'? [-Werror=implicit-function-declaration]
    1013 |         return do_sys_settimeofday64(tv ? &kts : NULL, tz ? &ktz : NULL);
         |                ^~~~~~~~~~~~~~~~~~~~~
         |                sys_settimeofday
   cc1: some warnings being treated as errors


vim +1013 arch/alpha/kernel/osf_sys.c

^1da177e4c3f415 Linus Torvalds  2005-04-16   997  
e5d9a90c36e05dd Ivan Kokshaysky 2009-01-29   998  SYSCALL_DEFINE2(osf_settimeofday, struct timeval32 __user *, tv,
e5d9a90c36e05dd Ivan Kokshaysky 2009-01-29   999  		struct timezone __user *, tz)
^1da177e4c3f415 Linus Torvalds  2005-04-16  1000  {
ce4c253573ad184 Arnd Bergmann   2017-11-08  1001  	struct timespec64 kts;
^1da177e4c3f415 Linus Torvalds  2005-04-16  1002  	struct timezone ktz;
^1da177e4c3f415 Linus Torvalds  2005-04-16  1003  
^1da177e4c3f415 Linus Torvalds  2005-04-16  1004   	if (tv) {
ce4c253573ad184 Arnd Bergmann   2017-11-08  1005  		if (get_tv32(&kts, tv))
^1da177e4c3f415 Linus Torvalds  2005-04-16  1006  			return -EFAULT;
^1da177e4c3f415 Linus Torvalds  2005-04-16  1007  	}
^1da177e4c3f415 Linus Torvalds  2005-04-16  1008  	if (tz) {
^1da177e4c3f415 Linus Torvalds  2005-04-16  1009  		if (copy_from_user(&ktz, tz, sizeof(*tz)))
^1da177e4c3f415 Linus Torvalds  2005-04-16  1010  			return -EFAULT;
^1da177e4c3f415 Linus Torvalds  2005-04-16  1011  	}
^1da177e4c3f415 Linus Torvalds  2005-04-16  1012  
ce4c253573ad184 Arnd Bergmann   2017-11-08 @1013  	return do_sys_settimeofday64(tv ? &kts : NULL, tz ? &ktz : NULL);
^1da177e4c3f415 Linus Torvalds  2005-04-16  1014  }
^1da177e4c3f415 Linus Torvalds  2005-04-16  1015  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
