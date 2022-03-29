Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6FC4EA546
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 04:36:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 942EDC5E2CC;
	Tue, 29 Mar 2022 02:36:52 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 946A1C5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 02:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648521410; x=1680057410;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LNHgqLDR8PycGfDeEiYuRN193gJyruOeIO57tRrWPxs=;
 b=hQrsbAE2kZLOROlO/kvSXZomhFswE1UDMhkMALHHdDuQ+oSnNBtudZef
 WwouyZfym/wKUlZM8bzPe4A/yrDolGg1aKn39masfUA6VXqUdWu+oO9Me
 KWele7YevatkOvCf6x/HgvqCDBekwfw6ai+PSfXgRuPB5jR5zYs2ABQf9
 jFWAB+cGDExY8B4DO3tZhyOvlcUhYdkLbkQYKOM55tBw/qw01ArKXUlDR
 OB0Ie9U2/67BkevLPeztnUcGY8yOfUVW8I7nCbtPfnXV4tqiuPdAbRcTz
 J6TGuuhKe0MIZUfUfn0llWXTkjIbElozeZ6gMNXBxD/FhaCM9t6Upooys Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="259332250"
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="259332250"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 19:36:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="518615068"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 28 Mar 2022 19:36:43 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nZ1is-0002Xv-FZ; Tue, 29 Mar 2022 02:36:42 +0000
Date: Tue, 29 Mar 2022 10:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>, corbet@lwn.net,
 viro@zeniv.linux.org.uk, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, kpsingh@kernel.org, shuah@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 zohar@linux.ibm.com
Message-ID: <202203291042.8dll5BFm-lkp@intel.com>
References: <20220328175033.2437312-15-roberto.sassu@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220328175033.2437312-15-roberto.sassu@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kbuild-all@lists.01.org, linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 Roberto Sassu <roberto.sassu@huawei.com>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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
[also build test ERROR on linus/master next-20220328]
[cannot apply to bpf/master v5.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Roberto-Sassu/bpf-Secure-and-authenticated-preloading-of-eBPF-programs/20220329-015829
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220329/202203291042.8dll5BFm-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/2e0e81b0296abc384efb2a73520ce03c2a5344ea
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Roberto-Sassu/bpf-Secure-and-authenticated-preloading-of-eBPF-programs/20220329-015829
        git checkout 2e0e81b0296abc384efb2a73520ce03c2a5344ea
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/bpf/inode.c:25:37: error: 'CONFIG_BPF_PRELOAD_LIST' undeclared here (not in a function)
      25 | static char *bpf_preload_list_str = CONFIG_BPF_PRELOAD_LIST;
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~


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
