Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C218A4EA5FE
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 05:27:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75815C5E2CC;
	Tue, 29 Mar 2022 03:27:53 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 227E9C5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 03:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648524471; x=1680060471;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SDWiiOQKn03Y32llGpgMdBJlnmtF9BNEmaXOUA7f4Q4=;
 b=hb4pAdlmosbcXCg5EetD9QucAF1fW+ux4KbLTkb24N6d3ir7BMyWNA1r
 DNW9rsCa3MI0Q6y4u4VOZplfVQr04AFhagZAnY1gObNfjOvxTPi6U+Pyl
 BuPF31L3aA87p1cd45pfZlJsZ2+l7ATjjJFGRW6hzz0kIxuJzC7krPCrV
 4Y5QUS/zL9rK//7XyevUksDDhNuAY1ZAJ73y+y8VG7Cqif5aApWj3Csdx
 Y/KyTRZNpOLkpNUIrkfg2FdG4Tf6RZzxw2S4hM3FtvypNEcK5DS3NWDsE
 DA3wt3ktoQlpMW2gLy1FX2jwFyiHKAtvDYbpWOET7LuWbAMnkba/L7Sy9 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="345587941"
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="345587941"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 20:27:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="554122579"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga007.fm.intel.com with ESMTP; 28 Mar 2022 20:27:44 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nZ2WF-0002aE-Ku; Tue, 29 Mar 2022 03:27:43 +0000
Date: Tue, 29 Mar 2022 11:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>, corbet@lwn.net,
 viro@zeniv.linux.org.uk, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, kpsingh@kernel.org, shuah@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 zohar@linux.ibm.com
Message-ID: <202203291125.8NpccWn1-lkp@intel.com>
References: <20220328175033.2437312-15-roberto.sassu@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220328175033.2437312-15-roberto.sassu@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kbuild-all@lists.01.org, linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 llvm@lists.linux.dev, Roberto Sassu <roberto.sassu@huawei.com>,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-integrity@vger.kernel.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 14/18] bpf-preload: Switch to new preload
 registration method
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

Hi Roberto,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on bpf-next/master]
[also build test ERROR on bpf/master linus/master next-20220328]
[cannot apply to v5.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Roberto-Sassu/bpf-Secure-and-authenticated-preloading-of-eBPF-programs/20220329-015829
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: arm64-randconfig-r026-20220328 (https://download.01.org/0day-ci/archive/20220329/202203291125.8NpccWn1-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/2e0e81b0296abc384efb2a73520ce03c2a5344ea
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Roberto-Sassu/bpf-Secure-and-authenticated-preloading-of-eBPF-programs/20220329-015829
        git checkout 2e0e81b0296abc384efb2a73520ce03c2a5344ea
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/bpf/inode.c:25:37: error: use of undeclared identifier 'CONFIG_BPF_PRELOAD_LIST'
   static char *bpf_preload_list_str = CONFIG_BPF_PRELOAD_LIST;
                                       ^
   1 error generated.


vim +/CONFIG_BPF_PRELOAD_LIST +25 kernel/bpf/inode.c

    24	
  > 25	static char *bpf_preload_list_str = CONFIG_BPF_PRELOAD_LIST;
    26	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
