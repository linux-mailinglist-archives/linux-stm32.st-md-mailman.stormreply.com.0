Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8ACB157D7
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 05:37:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C8ABC32EA8;
	Wed, 30 Jul 2025 03:37:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A4F7C36B2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 03:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753846648; x=1785382648;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ymk96y7FUWnE0zbfR0VLJRsckN/JMqE00GtgLPj0qRo=;
 b=Gw/JDC8RaTXfnUH4Ezun4dimH7LP+CS4G9GiU0/fagOpJzblHHvwcEtt
 wd8QbiztDNBeb8VHF0dCrx9qbEKPzTKVwMAH/5a3ArOT+281KOHssqa2v
 Se+vvBBicPl08ZDj8GTqFIii6SKvmwnGvnYvU0t2w8FNajPzXHRYq3Mvv
 HWPJlwIcEjPHLCLs/KzcSlIWL5X1LG+sOOVYcz51tmWz/CGzTDTLTWtvn
 4xfHyo4wO1Zh4cc8cjT7VjmwpMjJV25S3kK+2IglMqKAw4gA8ChfIJW3N
 PfK0p3PAadMJRnIHTphuDj0KVBdvvv35a9jTojwkKCw24ZupPu8lwVNbg A==;
X-CSE-ConnectionGUID: 5C5cXaSwR7S/kKHJVYyfgg==
X-CSE-MsgGUID: RtaJCd27RW2TVmsVdpcfRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="81578763"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="81578763"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 20:37:26 -0700
X-CSE-ConnectionGUID: ar/G3DOGS8uedznncdnXVw==
X-CSE-MsgGUID: H23rFKPZQJqYSvne5Xy7JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="167077052"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 29 Jul 2025 20:37:22 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ugxd1-0001y2-21;
 Wed, 30 Jul 2025 03:37:19 +0000
Date: Wed, 30 Jul 2025 11:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Message-ID: <202507301148.TVzOecMo-lkp@intel.com>
References: <20250729-relative_flex_pps-v2-1-3e5f03525c45@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250729-relative_flex_pps-v2-1-3e5f03525c45@foss.st.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/2] drivers: net: stmmac:
 handle start time set in the past for flexible PPS
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

Hi Gatien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fa582ca7e187a15e772e6a72fe035f649b387a60]

url:    https://github.com/intel-lab-lkp/linux/commits/Gatien-Chevallier/drivers-net-stmmac-handle-start-time-set-in-the-past-for-flexible-PPS/20250729-225635
base:   fa582ca7e187a15e772e6a72fe035f649b387a60
patch link:    https://lore.kernel.org/r/20250729-relative_flex_pps-v2-1-3e5f03525c45%40foss.st.com
patch subject: [PATCH net-next v2 1/2] drivers: net: stmmac: handle start time set in the past for flexible PPS
config: x86_64-buildonly-randconfig-002-20250730 (https://download.01.org/0day-ci/archive/20250730/202507301148.TVzOecMo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507301148.TVzOecMo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507301148.TVzOecMo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c:177:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     177 |                 struct timespec64 curr_time;
         |                 ^
   1 warning generated.


vim +177 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c

   163	
   164	static int stmmac_enable(struct ptp_clock_info *ptp,
   165				 struct ptp_clock_request *rq, int on)
   166	{
   167		struct stmmac_priv *priv =
   168		    container_of(ptp, struct stmmac_priv, ptp_clock_ops);
   169		void __iomem *ptpaddr = priv->ptpaddr;
   170		struct stmmac_pps_cfg *cfg;
   171		int ret = -EOPNOTSUPP;
   172		unsigned long flags;
   173		u32 acr_value;
   174	
   175		switch (rq->type) {
   176		case PTP_CLK_REQ_PEROUT:
 > 177			struct timespec64 curr_time;
   178			u64 target_ns = 0;
   179			u64 ns = 0;
   180	
   181			/* Reject requests with unsupported flags */
   182			if (rq->perout.flags)
   183				return -EOPNOTSUPP;
   184	
   185			cfg = &priv->pps[rq->perout.index];
   186	
   187			cfg->start.tv_sec = rq->perout.start.sec;
   188			cfg->start.tv_nsec = rq->perout.start.nsec;
   189	
   190			/* A time set in the past won't trigger the start of the flexible PPS generation for
   191			 * the GMAC5. For some reason it does for the GMAC4 but setting a time in the past
   192			 * should be addressed anyway. Therefore, any value set it the past is considered as
   193			 * an offset compared to the current MAC system time.
   194			 * Be aware that an offset too low may not trigger flexible PPS generation
   195			 * if time spent in this configuration makes the targeted time already outdated.
   196			 * To address this, add a safe time offset.
   197			 */
   198			if (!cfg->start.tv_sec && cfg->start.tv_nsec < PTP_SAFE_TIME_OFFSET_NS)
   199				cfg->start.tv_nsec += PTP_SAFE_TIME_OFFSET_NS;
   200	
   201			target_ns = cfg->start.tv_nsec + ((u64)cfg->start.tv_sec * NSEC_PER_SEC);
   202	
   203			stmmac_get_systime(priv, priv->ptpaddr, &ns);
   204			if (ns > TIME64_MAX - PTP_SAFE_TIME_OFFSET_NS)
   205				return -EINVAL;
   206	
   207			curr_time = ns_to_timespec64(ns);
   208			if (target_ns < ns + PTP_SAFE_TIME_OFFSET_NS) {
   209				cfg->start = timespec64_add_safe(cfg->start, curr_time);
   210				if (cfg->start.tv_sec == TIME64_MAX)
   211					return -EINVAL;
   212			}
   213	
   214			cfg->period.tv_sec = rq->perout.period.sec;
   215			cfg->period.tv_nsec = rq->perout.period.nsec;
   216	
   217			write_lock_irqsave(&priv->ptp_lock, flags);
   218			ret = stmmac_flex_pps_config(priv, priv->ioaddr,
   219						     rq->perout.index, cfg, on,
   220						     priv->sub_second_inc,
   221						     priv->systime_flags);
   222			write_unlock_irqrestore(&priv->ptp_lock, flags);
   223			break;
   224		case PTP_CLK_REQ_EXTTS: {
   225			u8 channel;
   226	
   227			mutex_lock(&priv->aux_ts_lock);
   228			acr_value = readl(ptpaddr + PTP_ACR);
   229			channel = ilog2(FIELD_GET(PTP_ACR_MASK, acr_value));
   230			acr_value &= ~PTP_ACR_MASK;
   231	
   232			if (on) {
   233				if (FIELD_GET(PTP_ACR_MASK, acr_value)) {
   234					netdev_err(priv->dev,
   235						   "Cannot enable auxiliary snapshot %d as auxiliary snapshot %d is already enabled",
   236						rq->extts.index, channel);
   237					mutex_unlock(&priv->aux_ts_lock);
   238					return -EBUSY;
   239				}
   240	
   241				priv->plat->flags |= STMMAC_FLAG_EXT_SNAPSHOT_EN;
   242	
   243				/* Enable External snapshot trigger */
   244				acr_value |= PTP_ACR_ATSEN(rq->extts.index);
   245				acr_value |= PTP_ACR_ATSFC;
   246			} else {
   247				priv->plat->flags &= ~STMMAC_FLAG_EXT_SNAPSHOT_EN;
   248			}
   249			netdev_dbg(priv->dev, "Auxiliary Snapshot %d %s.\n",
   250				   rq->extts.index, on ? "enabled" : "disabled");
   251			writel(acr_value, ptpaddr + PTP_ACR);
   252			mutex_unlock(&priv->aux_ts_lock);
   253			/* wait for auxts fifo clear to finish */
   254			ret = readl_poll_timeout(ptpaddr + PTP_ACR, acr_value,
   255						 !(acr_value & PTP_ACR_ATSFC),
   256						 10, 10000);
   257			break;
   258		}
   259	
   260		default:
   261			break;
   262		}
   263	
   264		return ret;
   265	}
   266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
