Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01221831031
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jan 2024 00:50:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2140C6DD73;
	Wed, 17 Jan 2024 23:50:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8380BC6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jan 2024 23:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705535428; x=1737071428;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vA/lVruIhcqs1iF8s5CGZ0Yh0/2pqLuM2zH9Xl5+LMk=;
 b=XWwqo57Zfy6tIK36cddPJ7CKdKYVt7xd9fvdBLjaky+CTrCGFFh2bERC
 Tg+LJQinz1558pu9W/Xzq5CTpF+ix1lN3/RGtzrfvI7/gKRX3qeBUkgoa
 5+Q5lJh+R0YURmbnpuGVomC+bh/rvLKswiNmad7ofs+IFOPQ2jwiom/6+
 Mcn0E1PvY3uFmrL3Lc0PkaKIaeP9bpa2HiRJJkmm+6QIPaGmCSP/tPzjp
 0uGvpUza4r/MSgchC8MS9XL/0FPfUkvdSOaFzEPcYlaoRkap6bKOn4YVx
 kwDe5bT2DI43eJArw59snMGqLM5T70L8simkObs1Yw9iN8ogf7T0/BU2Y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7014417"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7014417"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 15:50:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="26612682"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 17 Jan 2024 15:50:22 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rQFfn-0002RC-2J;
 Wed, 17 Jan 2024 23:50:19 +0000
Date: Thu, 18 Jan 2024 07:49:37 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Message-ID: <202401180740.1ud9PJYn-lkp@intel.com>
References: <20240115135249.296822-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240115135249.296822-5-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/4] remoteproc: stm32: Add support of an
 OP-TEE TA to load the firmware
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

Hi Arnaud,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on robh/for-next linus/master v6.7 next-20240117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Pouliquen/remoteproc-Add-TEE-support/20240115-215613
base:   git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20240115135249.296822-5-arnaud.pouliquen%40foss.st.com
patch subject: [PATCH 4/4] remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
config: mips-randconfig-r112-20240117 (https://download.01.org/0day-ci/archive/20240118/202401180740.1ud9PJYn-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce: (https://download.01.org/0day-ci/archive/20240118/202401180740.1ud9PJYn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180740.1ud9PJYn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/remoteproc/tee_remoteproc.c:82:26: sparse: sparse: symbol 'tee_rproc_ctx' was not declared. Should it be static?
   drivers/remoteproc/tee_remoteproc.c:166:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *rsc_va @@     got void [noderef] __iomem * @@
   drivers/remoteproc/tee_remoteproc.c:166:24: sparse:     expected void *rsc_va
   drivers/remoteproc/tee_remoteproc.c:166:24: sparse:     got void [noderef] __iomem *
>> drivers/remoteproc/tee_remoteproc.c:233:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *rsc_va @@
   drivers/remoteproc/tee_remoteproc.c:233:31: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/remoteproc/tee_remoteproc.c:233:31: sparse:     got void *rsc_va
   drivers/remoteproc/tee_remoteproc.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +233 drivers/remoteproc/tee_remoteproc.c

6805d1065198e1 Arnaud Pouliquen 2024-01-15  215  
6805d1065198e1 Arnaud Pouliquen 2024-01-15  216  int tee_rproc_stop(struct tee_rproc *trproc)
6805d1065198e1 Arnaud Pouliquen 2024-01-15  217  {
6805d1065198e1 Arnaud Pouliquen 2024-01-15  218  	struct tee_ioctl_invoke_arg arg;
6805d1065198e1 Arnaud Pouliquen 2024-01-15  219  	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMBER];
6805d1065198e1 Arnaud Pouliquen 2024-01-15  220  	int ret;
6805d1065198e1 Arnaud Pouliquen 2024-01-15  221  
6805d1065198e1 Arnaud Pouliquen 2024-01-15  222  	prepare_args(trproc, TA_RPROC_FW_CMD_STOP_FW, &arg, param, 0);
6805d1065198e1 Arnaud Pouliquen 2024-01-15  223  
6805d1065198e1 Arnaud Pouliquen 2024-01-15  224  	ret = tee_client_invoke_func(tee_rproc_ctx->tee_ctx, &arg, param);
6805d1065198e1 Arnaud Pouliquen 2024-01-15  225  	if (ret < 0 || arg.ret != 0) {
6805d1065198e1 Arnaud Pouliquen 2024-01-15  226  		dev_err(tee_rproc_ctx->dev,
6805d1065198e1 Arnaud Pouliquen 2024-01-15  227  			"TA_RPROC_FW_CMD_STOP_FW invoke failed TEE err: %x, ret:%x\n",
6805d1065198e1 Arnaud Pouliquen 2024-01-15  228  			arg.ret, ret);
6805d1065198e1 Arnaud Pouliquen 2024-01-15  229  		if (!ret)
6805d1065198e1 Arnaud Pouliquen 2024-01-15  230  			ret = -EIO;
6805d1065198e1 Arnaud Pouliquen 2024-01-15  231  	}
6805d1065198e1 Arnaud Pouliquen 2024-01-15  232  	if (trproc->rsc_va)
6805d1065198e1 Arnaud Pouliquen 2024-01-15 @233  		iounmap(trproc->rsc_va);
6805d1065198e1 Arnaud Pouliquen 2024-01-15  234  	trproc->rsc_va = NULL;
6805d1065198e1 Arnaud Pouliquen 2024-01-15  235  
6805d1065198e1 Arnaud Pouliquen 2024-01-15  236  	return ret;
6805d1065198e1 Arnaud Pouliquen 2024-01-15  237  }
6805d1065198e1 Arnaud Pouliquen 2024-01-15  238  EXPORT_SYMBOL_GPL(tee_rproc_stop);
6805d1065198e1 Arnaud Pouliquen 2024-01-15  239  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
