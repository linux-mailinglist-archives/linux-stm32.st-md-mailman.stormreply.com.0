Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 662A3C1E72F
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Oct 2025 06:41:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE6FBC62D85;
	Thu, 30 Oct 2025 05:41:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C4B1C62D83
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 05:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761802915; x=1793338915;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nU18lsAq/OyPRT69o4sqp39RtOZX0AOAyhYhm0ktUQg=;
 b=FhNTmkAVx4A+xlFQcdbQ7EcILgvHpHQncZDQDTOavyWWPIa0phkKp+eG
 pVePfM3Y+xkjtGzS3U8mx4gEbAK6r6pg2GmIi3D6gg5OLsaBSOoEUCKVG
 CVaR1qFbCC49CanOmT59lALNDqMje2DRSsQDUZXjj7Afj6lk1wCDCVE3F
 adoVtpijvLeygfltRBTOHu0J+I+lOrMWTQc4LQPT7ZFEHYwT9rQ/wv1UA
 +CN+iNQoWbloT0mzgqTXrBNdLCH6U1ytjoJRv2Cx7zy2sp4hxcuRhq8F4
 DPhhRoizGvtWinO21wBelHGJM6dVgv01QwYzIUmbedXchAlNV83GNu4eZ A==;
X-CSE-ConnectionGUID: RvCg1YD4QQO3HUOTJGQQbA==
X-CSE-MsgGUID: 1zTc6PR8SBC9wDeACaca9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="62958509"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="62958509"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 22:41:53 -0700
X-CSE-ConnectionGUID: gBwJdAhDSdSXnuXl5d1Qjg==
X-CSE-MsgGUID: C4N+2GgQRb6xQS3KdzVsmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="189934326"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa003.jf.intel.com with ESMTP; 29 Oct 2025 22:41:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vELPu-000LVA-0J;
 Thu, 30 Oct 2025 05:41:46 +0000
Date: Thu, 30 Oct 2025 13:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Message-ID: <202510301322.f0J41mwI-lkp@intel.com>
References: <20251029-agilex5_ext-v1-4-1931132d77d6@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251029-agilex5_ext-v1-4-1931132d77d6@altera.com>
Cc: netdev@vger.kernel.org, llvm@lists.linux.dev,
 Rohan G Thomas <rohan.g.thomas@altera.com>, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 4/4] net: stmmac: socfpga: Add
 hardware supported cross-timestamp
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

Hi Rohan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a8abe8e210c175b1d5a7e53df069e107b65c13cb]

url:    https://github.com/intel-lab-lkp/linux/commits/Rohan-G-Thomas-via-B4-Relay/net-stmmac-socfpga-Agilex5-EMAC-platform-configuration/20251029-162502
base:   a8abe8e210c175b1d5a7e53df069e107b65c13cb
patch link:    https://lore.kernel.org/r/20251029-agilex5_ext-v1-4-1931132d77d6%40altera.com
patch subject: [PATCH net-next 4/4] net: stmmac: socfpga: Add hardware supported cross-timestamp
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251030/202510301322.f0J41mwI-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301322.f0J41mwI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301322.f0J41mwI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:390:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     390 |         return ret;
         |                ^~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:312:12: note: initialize the variable 'ret' to silence this warning
     312 |         int i, ret;
         |                   ^
         |                    = 0
   1 warning generated.


vim +/ret +390 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c

   301	
   302	static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
   303				    void *ctx)
   304	{
   305		struct stmmac_priv *priv = (struct stmmac_priv *)ctx;
   306		u32 num_snapshot, gpio_value, acr_value;
   307		void __iomem *ptpaddr = priv->ptpaddr;
   308		void __iomem *ioaddr = priv->hw->pcsr;
   309		unsigned long flags;
   310		u64 smtg_time = 0;
   311		u64 ptp_time = 0;
   312		int i, ret;
   313	
   314		/* Both internal crosstimestamping and external triggered event
   315		 * timestamping cannot be run concurrently.
   316		 */
   317		if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
   318			return -EBUSY;
   319	
   320		mutex_lock(&priv->aux_ts_lock);
   321		/* Enable Internal snapshot trigger */
   322		acr_value = readl(ptpaddr + PTP_ACR);
   323		acr_value &= ~PTP_ACR_MASK;
   324		switch (priv->plat->int_snapshot_num) {
   325		case AUX_SNAPSHOT0:
   326			acr_value |= PTP_ACR_ATSEN0;
   327			break;
   328		case AUX_SNAPSHOT1:
   329			acr_value |= PTP_ACR_ATSEN1;
   330			break;
   331		case AUX_SNAPSHOT2:
   332			acr_value |= PTP_ACR_ATSEN2;
   333			break;
   334		case AUX_SNAPSHOT3:
   335			acr_value |= PTP_ACR_ATSEN3;
   336			break;
   337		default:
   338			mutex_unlock(&priv->aux_ts_lock);
   339			return -EINVAL;
   340		}
   341		writel(acr_value, ptpaddr + PTP_ACR);
   342	
   343		/* Clear FIFO */
   344		acr_value = readl(ptpaddr + PTP_ACR);
   345		acr_value |= PTP_ACR_ATSFC;
   346		writel(acr_value, ptpaddr + PTP_ACR);
   347		/* Release the mutex */
   348		mutex_unlock(&priv->aux_ts_lock);
   349	
   350		/* Trigger Internal snapshot signal. Create a rising edge by just toggle
   351		 * the GPO0 to low and back to high.
   352		 */
   353		gpio_value = readl(ioaddr + XGMAC_GPIO_STATUS);
   354		gpio_value &= ~XGMAC_GPIO_GPO0;
   355		writel(gpio_value, ioaddr + XGMAC_GPIO_STATUS);
   356		gpio_value |= XGMAC_GPIO_GPO0;
   357		writel(gpio_value, ioaddr + XGMAC_GPIO_STATUS);
   358	
   359		/* Time sync done Indication - Interrupt method */
   360		if (!wait_event_interruptible_timeout(priv->tstamp_busy_wait,
   361						      dwxgmac_cross_ts_isr(priv),
   362						      HZ / 100)) {
   363			priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
   364			return -ETIMEDOUT;
   365		}
   366	
   367		*system = (struct system_counterval_t) {
   368			.cycles = 0,
   369			.cs_id = CSID_ARM_ARCH_COUNTER,
   370			.use_nsecs = true,
   371		};
   372	
   373		num_snapshot = (readl(ioaddr + XGMAC_TIMESTAMP_STATUS) &
   374				XGMAC_TIMESTAMP_ATSNS_MASK) >>
   375				XGMAC_TIMESTAMP_ATSNS_SHIFT;
   376	
   377		/* Repeat until the timestamps are from the FIFO last segment */
   378		for (i = 0; i < num_snapshot; i++) {
   379			read_lock_irqsave(&priv->ptp_lock, flags);
   380			stmmac_get_ptptime(priv, ptpaddr, &ptp_time);
   381			*device = ns_to_ktime(ptp_time);
   382			read_unlock_irqrestore(&priv->ptp_lock, flags);
   383		}
   384	
   385		get_smtgtime(priv->mii, SMTG_MDIO_ADDR, &smtg_time);
   386		system->cycles = smtg_time;
   387	
   388		priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
   389	
 > 390		return ret;
   391	}
   392	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
