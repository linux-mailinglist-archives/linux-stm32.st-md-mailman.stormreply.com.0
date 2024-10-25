Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 350B49B0A90
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Oct 2024 19:11:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66C0EC78021;
	Fri, 25 Oct 2024 17:11:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 506C4C7801C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 17:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729876293; x=1761412293;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MYQYsh2ZM0F5hLiv9jWAnO8EjpYfnIqM2b9zMJRm42c=;
 b=SqWeQQJ7kPZZAmVqmFIrOueoTYb4wt12cmF24QWlF8m9RpNY7R7xgLk1
 Jd5m1+M/mlDL2oityBn4+oQkxjpbfHJyaw+zJKvngNTf16QFss1aWghFt
 hap5NshLqYbUQ394WJy5EYZmrX5P9SYYf7srFIJSi2Ol+49RmKWzX0dU3
 tTd9VTj32ac02pMPd01i+bQsb75AVBXWu3cEii0/kehWej5aHtgEp1qrj
 vCDshkve0uvRv3j9vHuB0GEV3q3UCnNK4V/4uifkUYLA0wxImMgpW+2Us
 ckcFP8RFLWtFzDNjFo+CQk+4oWxdWLCjWPDF6CfrrKbDek2LeXh9r/weB g==;
X-CSE-ConnectionGUID: 0QfDKiHkRwCjOwKMa4d6Ig==
X-CSE-MsgGUID: 35xQb+EBQ6Wm0cESujuW9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29497046"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29497046"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 10:11:24 -0700
X-CSE-ConnectionGUID: W8ffi6AWRIKUCKXfgRWWzw==
X-CSE-MsgGUID: jBgwIuxpQcCrOIKJrpn2Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="81267315"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 25 Oct 2024 10:11:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t4NqH-000Yeq-1K;
 Fri, 25 Oct 2024 17:11:17 +0000
Date: Sat, 26 Oct 2024 01:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <202410260025.sME33DwY-lkp@intel.com>
References: <cfc647f0d031517f9ec9095235a574aad9dc2c95.1729757625.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cfc647f0d031517f9ec9095235a574aad9dc2c95.1729757625.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Furong Xu <0x1207@gmail.com>, andrew+netdev@lunn.ch,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, oe-kbuild-all@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4 3/6] net: stmmac: Refactor FPE
 functions to generic version
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

Hi Furong,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Furong-Xu/net-stmmac-Introduce-separate-files-for-FPE-implementation/20241024-163526
base:   net-next/main
patch link:    https://lore.kernel.org/r/cfc647f0d031517f9ec9095235a574aad9dc2c95.1729757625.git.0x1207%40gmail.com
patch subject: [PATCH net-next v4 3/6] net: stmmac: Refactor FPE functions to generic version
config: arm-spear13xx_defconfig (https://download.01.org/0day-ci/archive/20241026/202410260025.sME33DwY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260025.sME33DwY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260025.sME33DwY-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.o: in function `stmmac_fpe_configure':
>> drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c:205:(.text+0x154): undefined reference to `__ffsdi2'


vim +205 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c

   191	
   192	void stmmac_fpe_configure(struct stmmac_priv *priv, u32 num_txq, u32 num_rxq,
   193				  bool tx_enable, bool pmac_enable)
   194	{
   195		struct stmmac_fpe_cfg *cfg = &priv->fpe_cfg;
   196		const struct stmmac_fpe_reg *reg = cfg->reg;
   197		void __iomem *ioaddr = priv->ioaddr;
   198		u32 value;
   199	
   200		if (tx_enable) {
   201			cfg->fpe_csr = STMMAC_MAC_FPE_CTRL_STS_EFPE;
   202			value = readl(ioaddr + reg->rxq_ctrl1_reg);
   203			value &= ~reg->fprq_mask;
   204			/* Keep this SHIFT, FIELD_PREP() expects a constant mask :-/ */
 > 205			value |= (num_rxq - 1) << __bf_shf(reg->fprq_mask);
   206			writel(value, ioaddr + reg->rxq_ctrl1_reg);
   207		} else {
   208			cfg->fpe_csr = 0;
   209		}
   210		writel(cfg->fpe_csr, ioaddr + reg->mac_fpe_reg);
   211	
   212		value = readl(ioaddr + reg->int_en_reg);
   213	
   214		if (pmac_enable) {
   215			if (!(value & reg->int_en_bit)) {
   216				/* Dummy read to clear any pending masked interrupts */
   217				readl(ioaddr + reg->mac_fpe_reg);
   218	
   219				value |= reg->int_en_bit;
   220			}
   221		} else {
   222			value &= ~reg->int_en_bit;
   223		}
   224	
   225		writel(value, ioaddr + reg->int_en_reg);
   226	}
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
