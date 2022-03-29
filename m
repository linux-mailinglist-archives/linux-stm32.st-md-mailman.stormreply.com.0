Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DFC4EA643
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 06:09:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEDB7C5E2CC;
	Tue, 29 Mar 2022 04:09:03 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FEF3C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 04:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648526941; x=1680062941;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=II+YlVdtYYb+Q/uCpREGOhsf8Od4153BKeY2Dz+3nsc=;
 b=gH3LPhuglLmNIZCZVmWqP5f7MgbI603/AahwD+qA+aC+sWlzQN/bxNPy
 xfpN7hJlyNhF9QR0WF+mZzyKyFxdcYvevcyP4c7Qfi/mVASGS+Azc/OwM
 nH/2phyYbVB8qBcdYas76u7p61UxIl17rusIN0/BAxjiCNhaF2zsmnmx0
 6G2BD/MVQUslymBsEBi2uLb9fzlWrsEbqyx/Jjx7LT7h6omMI+dtxR1vI
 BSYtvDeB16D4H3G7icRBVlBY7ajC6l3HmAD/RelErUxgD3tspHlDtOR3k
 seAcHdKqvucTUjlzdXcFm0gM6+N/rC8Sdyd4/cAwW6ENrqoo9pHFDeXne w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="322342778"
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="322342778"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 21:08:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="585427795"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 28 Mar 2022 21:08:54 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nZ3A6-0002d5-7k; Tue, 29 Mar 2022 04:08:54 +0000
Date: Tue, 29 Mar 2022 12:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>, corbet@lwn.net,
 viro@zeniv.linux.org.uk, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, kpsingh@kernel.org, shuah@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 zohar@linux.ibm.com
Message-ID: <202203291256.TUOyKEtD-lkp@intel.com>
References: <20220328175033.2437312-17-roberto.sassu@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220328175033.2437312-17-roberto.sassu@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kbuild-all@lists.01.org, linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 llvm@lists.linux.dev, Roberto Sassu <roberto.sassu@huawei.com>,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-integrity@vger.kernel.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
config: hexagon-randconfig-r041-20220328 (https://download.01.org/0day-ci/archive/20220329/202203291256.TUOyKEtD-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/eddbb1ec1e92ba00c4acc9f123769265e17e8e40
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Roberto-Sassu/bpf-Secure-and-authenticated-preloading-of-eBPF-programs/20220329-015829
        git checkout eddbb1ec1e92ba00c4acc9f123769265e17e8e40
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/bpf/inode.c:25:37: error: use of undeclared identifier 'CONFIG_BPF_PRELOAD_LIST'
   static char *bpf_preload_list_str = CONFIG_BPF_PRELOAD_LIST;
                                       ^
>> kernel/bpf/inode.c:1026:13: error: redefinition of 'mount_bpffs'
   void __init mount_bpffs(void)
               ^
   include/linux/bpf.h:1146:27: note: previous definition is here
   static inline void __init mount_bpffs(void)
                             ^
   2 errors generated.


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
