Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D218759DF4
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jul 2023 20:55:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 399EDC6B442;
	Wed, 19 Jul 2023 18:55:39 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FA08C6A5E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jul 2023 18:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689792937; x=1721328937;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VgOUC4K9fx66jXJxsabJ6cjLbIddps+gucTz9RAEk7M=;
 b=kA7HT8znGu7m9v+t+ozrCK5XjUOHyDYsH4k0XMXivONBcKZQW7wbBvnM
 qHa5lBHQ3FdCSvir/sdIBmTrxOlrPVP7ZnVd8yRGzk+BCasxqkcALnFh4
 0keR5xovsymivphHs3A+iRAJWqL8gv6wYGctzPNggHAKJ3mCaaL7cbNd/
 Y6s0+xJmg33yZiZdrZAvrCYG/rp4kHtX7i1PdkXl2fSFc0uQ4Yqon9m5X
 4b+NtfbXM7TxnXfTOv4JhjuaD6j8B0YQGAFfxd+jj2wZD49VCoToAD169
 yT9o204/+Kcq/g6HIFNoVyjunmtpgNXd+UpxyhCz3BnvQ7RR5o6mx6B7X w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="366586878"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="366586878"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 11:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="848148918"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="848148918"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 19 Jul 2023 11:55:29 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qMCKf-0005OE-0T;
 Wed, 19 Jul 2023 18:55:29 +0000
Date: Thu, 20 Jul 2023 02:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Zink <j.zink@pengutronix.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Message-ID: <202307200225.B8rmKQPN-lkp@intel.com>
References: <20230719-stmmac_correct_mac_delay-v1-1-768aa4d09334@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230719-stmmac_correct_mac_delay-v1-1-768aa4d09334@pengutronix.de>
Cc: Johannes Zink <j.zink@pengutronix.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: correct MAC propagation delay
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

Hi Johannes,

kernel test robot noticed the following build errors:

[auto build test ERROR on 36395b2efe905650cd179d67411ffee3b770268b]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Zink/net-stmmac-correct-MAC-propagation-delay/20230719-221258
base:   36395b2efe905650cd179d67411ffee3b770268b
patch link:    https://lore.kernel.org/r/20230719-stmmac_correct_mac_delay-v1-1-768aa4d09334%40pengutronix.de
patch subject: [PATCH] net: stmmac: correct MAC propagation delay
config: i386-randconfig-i002-20230720 (https://download.01.org/0day-ci/archive/20230720/202307200225.B8rmKQPN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200225.B8rmKQPN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200225.B8rmKQPN-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.o: in function `correct_latency':
>> drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c:83: undefined reference to `__udivdi3'


vim +83 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c

    62	
    63	static void correct_latency(struct stmmac_priv *priv)
    64	{
    65		void __iomem *ioaddr = priv->ptpaddr;
    66		u32 reg_tsic, reg_tsicsns;
    67		u32 reg_tsec, reg_tsecsns;
    68		u64 scaled_ns;
    69		u32 val;
    70	
    71		/* MAC-internal ingress latency */
    72		scaled_ns = readl(ioaddr + PTP_TS_INGR_LAT);
    73	
    74		/* See section 11.7.2.5.3.1 "Ingress Correction" on page 4001 of
    75		 * i.MX8MP Applications Processor Reference Manual Rev. 1, 06/2021
    76		 */
    77		val = readl(ioaddr + PTP_TCR);
    78		if (val & PTP_TCR_TSCTRLSSR)
    79			/* nanoseconds field is in decimal format with granularity of 1ns/bit */
    80			scaled_ns = (NSEC_PER_SEC << 16) - scaled_ns;
    81		else
    82			/* nanoseconds field is in binary format with granularity of ~0.466ns/bit */
  > 83			scaled_ns = ((1ULL << 31) << 16) - scaled_ns * PSEC_PER_NSEC / 466;
    84	
    85		reg_tsic = scaled_ns >> 16;
    86		reg_tsicsns = scaled_ns & 0xff00;
    87	
    88		/* set bit 31 for 2's compliment */
    89		reg_tsic |= BIT(31);
    90	
    91		writel(reg_tsic, ioaddr + PTP_TS_INGR_CORR_NS);
    92		writel(reg_tsicsns, ioaddr + PTP_TS_INGR_CORR_SNS);
    93	
    94		/* MAC-internal egress latency */
    95		scaled_ns = readl(ioaddr + PTP_TS_EGR_LAT);
    96	
    97		reg_tsec = scaled_ns >> 16;
    98		reg_tsecsns = scaled_ns & 0xff00;
    99	
   100		writel(reg_tsec, ioaddr + PTP_TS_EGR_CORR_NS);
   101		writel(reg_tsecsns, ioaddr + PTP_TS_EGR_CORR_SNS);
   102	}
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
