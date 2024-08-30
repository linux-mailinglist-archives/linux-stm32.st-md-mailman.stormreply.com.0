Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96676966CD3
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Aug 2024 01:20:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4646DC6C841;
	Fri, 30 Aug 2024 23:20:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BBC4C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 23:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725060054; x=1756596054;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nPwrvEN9XYrbT3J+y8lcXmeIHnztMSIuwQQIDpKMEbw=;
 b=mY0pclmyTfk2MNYvib8uWjQlZ0alKqbSQzdEydnnB5zzE2Hr5X0+3Y7u
 tLzyh2uoT2S8J4DZPsjraVlMPGutRvkKzoVJAOtuiq3fMIqMvjXRX1QYA
 HKJytLFvOiTTdQcMtWuTFflisLBLvZhJljiISxhohho8uoTsFeh2nanCk
 I/BgRxcdS9B1BA+fSkGSkZwdLSkwCNntr1OsaHEEF1n9mCF+lX5Xs3imm
 P2L353ZGtX8YmuTnPMTRsaSbpOMveX7RwfZpkuQjmj0EngxaY81wYdqkk
 Fzx4tfTIgp0Ywa4e5ghMK9icQm36i7tQQu5YZe7ILjQDtf3VNofeqeQYr g==;
X-CSE-ConnectionGUID: PrgVbl0nRO2rDpPV6bQKDw==
X-CSE-MsgGUID: 1UI3imEBRZ6g9U0F/XFlhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="35127142"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="35127142"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 16:20:46 -0700
X-CSE-ConnectionGUID: MIvltLxURYi6utmjs8MKtg==
X-CSE-MsgGUID: X1M4ydP+RYiEybVXoNsE0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="63990529"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 30 Aug 2024 16:20:42 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1skAv1-0002Ck-1t;
 Fri, 30 Aug 2024 23:20:39 +0000
Date: Sat, 31 Aug 2024 07:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: ende.tan@starfivetech.com, netdev@vger.kernel.org
Message-ID: <202408310604.E3C4zDID-lkp@intel.com>
References: <20240829134043.323855-1-ende.tan@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829134043.323855-1-ende.tan@starfivetech.com>
Cc: Tan En De <ende.tan@starfivetech.com>, andrew@lunn.ch,
 leyfoon.tan@starfivetech.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 minda.chen@starfivetech.com, mcoquelin.stm32@gmail.com,
 oe-kbuild-all@lists.linux.dev, kuba@kernel.org, pabeni@redhat.com,
 endeneer@gmail.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next, v3,
 1/1] net: stmmac: Batch set RX OWN flag and other flags
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on horms-ipvs/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ende-tan-starfivetech-com/net-stmmac-Batch-set-RX-OWN-flag-and-other-flags/20240829-214324
base:   linus/master
patch link:    https://lore.kernel.org/r/20240829134043.323855-1-ende.tan%40starfivetech.com
patch subject: [net-next,v3,1/1] net: stmmac: Batch set RX OWN flag and other flags
config: x86_64-randconfig-r132-20240830 (https://download.01.org/0day-ci/archive/20240831/202408310604.E3C4zDID-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408310604.E3C4zDID-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408310604.E3C4zDID-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:59:21: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:59:21: sparse:     expected unsigned int [usertype] flags
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:59:21: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:62:24: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:62:24: sparse:    left side has type unsigned int
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:62:24: sparse:    right side has type restricted __le32
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:64:17: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:64:17: sparse:    left side has type restricted __le32
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:64:17: sparse:    right side has type unsigned int
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:110:23: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:110:50: sparse: sparse: restricted __le32 degrades to integer
--
>> drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:189:21: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:189:21: sparse:     expected unsigned int [usertype] flags
   drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:189:21: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:192:23: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:192:23: sparse:    left side has type unsigned int
   drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:192:23: sparse:    right side has type restricted __le32
   drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:194:17: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:194:17: sparse:    left side has type restricted __le32
   drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:194:17: sparse:    right side has type unsigned int

vim +59 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c

    56	
    57	static void dwxgmac2_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
    58	{
  > 59		u32 flags = cpu_to_le32(XGMAC_RDES3_OWN);
    60	
    61		if (!disable_rx_ic)
  > 62			 flags |= cpu_to_le32(XGMAC_RDES3_IOC);
    63	
    64		p->des3 |= flags;
    65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
