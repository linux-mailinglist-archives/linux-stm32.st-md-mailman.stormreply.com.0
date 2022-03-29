Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A946E4EA4FA
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 04:15:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D59EC5E2CC;
	Tue, 29 Mar 2022 02:15:51 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BEFBC57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 02:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648520150; x=1680056150;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cAAm64d/gf6El6yK8BRuZprVHc5ILVGkuEPyudyPfMc=;
 b=Vne5VHAUmQKUp8N+7joL0Mh0Bsb7PxXhhPK202H95PlcTAkHiYMTT5ir
 h/cfbdHhNKFjSsfG9DyIqPWti+RPFNJqRfiJcpLNXrcnDHpJc9hfqyZdn
 5LxGYnfeYjiMZikU9YHuMElb+C8eRh293ulhDLnAZKjTRyKfQAMUxncVt
 KnX7PM4WgGMTRxqXGfcikWJ5QAX9vcrSnofwSJenHnpIcyz3x0pg4y7Cm
 6tPevCdR1GmWDbWkZBJqf9k9CxfpowKr64V8cjw58hnP9pJAXqn+xSgr2
 9dQ7TGplvxsAaKjrlGVRwpLJcp30dzQs+mRHNx9brDwINLNPHPRdMMd6/ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="246632841"
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="246632841"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 19:15:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="585404916"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 28 Mar 2022 19:15:42 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nZ1OY-0002Wo-0U; Tue, 29 Mar 2022 02:15:42 +0000
Date: Tue, 29 Mar 2022 10:15:31 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>, corbet@lwn.net,
 viro@zeniv.linux.org.uk, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, kpsingh@kernel.org, shuah@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 zohar@linux.ibm.com
Message-ID: <202203291034.vCkMuZo5-lkp@intel.com>
References: <20220328175033.2437312-17-roberto.sassu@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220328175033.2437312-17-roberto.sassu@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kbuild-all@lists.01.org, linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 Roberto Sassu <roberto.sassu@huawei.com>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 16/18] bpf-preload: Do kernel mount to
 ensure that pinned objects don't disappear
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
[also build test ERROR on linus/master next-20220328]
[cannot apply to bpf/master v5.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Roberto-Sassu/bpf-Secure-and-authenticated-preloading-of-eBPF-programs/20220329-015829
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: riscv-randconfig-c004-20220327 (https://download.01.org/0day-ci/archive/20220329/202203291034.vCkMuZo5-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/eddbb1ec1e92ba00c4acc9f123769265e17e8e40
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Roberto-Sassu/bpf-Secure-and-authenticated-preloading-of-eBPF-programs/20220329-015829
        git checkout eddbb1ec1e92ba00c4acc9f123769265e17e8e40
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/bpf/inode.c:25:37: error: 'CONFIG_BPF_PRELOAD_LIST' undeclared here (not in a function)
      25 | static char *bpf_preload_list_str = CONFIG_BPF_PRELOAD_LIST;
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/inode.c:1026:13: error: redefinition of 'mount_bpffs'
    1026 | void __init mount_bpffs(void)
         |             ^~~~~~~~~~~
   In file included from include/linux/filter.h:9,
                    from kernel/bpf/inode.c:20:
   include/linux/bpf.h:1146:27: note: previous definition of 'mount_bpffs' with type 'void(void)'
    1146 | static inline void __init mount_bpffs(void)
         |                           ^~~~~~~~~~~


vim +/mount_bpffs +1026 kernel/bpf/inode.c

  1025	
> 1026	void __init mount_bpffs(void)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
