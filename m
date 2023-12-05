Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B051F80497E
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 06:53:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62D25C6C855;
	Tue,  5 Dec 2023 05:53:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06D87C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 05:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701755621; x=1733291621;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bFFeeF8hJ3DxE50au0V2o4iCp73fC+lbzXYWg5k/A/o=;
 b=NzmkW8xpYqff/DO6Kex8pLthqk2wjymraa86rF3EtDpJ0jkxcthxZjji
 CzWFhQk7YdUfP8ApeLIwA3L0Rr52V4s3jf8grTCglyXjQRWNKXJFxqE76
 FaJ49JUZxzp2q0T3foSg424A7NJ826n+0qVNOXwZD7/trCTCzqO/PDnwg
 DsV6a5zB65pvzqTlyHddi0m5cWmcvj0JNRWnWCuuV10nsInwUESLMPu67
 nXM35G95lCevA/Xqj7Xx148rzjWlKM1J8atkWRGjhBwVQFnWnz5T3WYNL
 aKvgFDTLF2hTrGF+6m6ThvuPVXMSgLAcFSSroM3SFCm6USxsJhcKXEW9U Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="425008179"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="425008179"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 21:53:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="841329822"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="841329822"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 04 Dec 2023 21:53:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rAONA-0008PG-1l;
 Tue, 05 Dec 2023 05:53:32 +0000
Date: Tue, 5 Dec 2023 13:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sneh Shah <quic_snehshah@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <202312051347.L3L2pNLv-lkp@intel.com>
References: <20231204084854.31543-1-quic_snehshah@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231204084854.31543-1-quic_snehshah@quicinc.com>
Cc: netdev@vger.kernel.org, Sneh Shah <quic_snehshah@quicinc.com>,
 Andrew Halaney <ahalaney@redhat.com>, kernel@quicinc.com,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: qcom-ethqos: Add
 sysfs nodes for qcom ethqos
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

Hi Sneh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sneh-Shah/net-stmmac-qcom-ethqos-Add-sysfs-nodes-for-qcom-ethqos/20231204-165232
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231204084854.31543-1-quic_snehshah%40quicinc.com
patch subject: [PATCH net-next] net: stmmac: qcom-ethqos: Add sysfs nodes for qcom ethqos
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231205/202312051347.L3L2pNLv-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051347.L3L2pNLv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051347.L3L2pNLv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c: In function 'gvm_queue_mapping_store':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c:770:13: warning: variable 'prio' set but not used [-Wunused-but-set-variable]
     770 |         u32 prio;
         |             ^~~~


vim +/prio +770 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c

   762	
   763	static ssize_t gvm_queue_mapping_store(struct device *dev,
   764					       struct device_attribute *attr,
   765					       const char *user_buf, size_t size)
   766	{
   767		struct net_device *netdev = to_net_dev(dev);
   768		struct stmmac_priv *priv;
   769		struct qcom_ethqos *ethqos;
 > 770		u32 prio;
   771		s8 input = 0;
   772	
   773		if (!netdev) {
   774			pr_err("netdev is NULL\n");
   775			return -EINVAL;
   776		}
   777	
   778		priv = netdev_priv(netdev);
   779		if (!priv) {
   780			pr_err("priv is NULL\n");
   781			return -EINVAL;
   782		}
   783	
   784		ethqos = priv->plat->bsp_priv;
   785		if (!ethqos) {
   786			pr_err("ethqos is NULL\n");
   787			return -EINVAL;
   788		}
   789	
   790		if (kstrtos8(user_buf, 0, &input)) {
   791			pr_err("Error in reading option from user\n");
   792			return -EINVAL;
   793		}
   794	
   795		if (input == ethqos->gvm_queue)
   796			pr_err("No effect as duplicate input\n");
   797	
   798		ethqos->gvm_queue = input;
   799		prio  = 1 << input;
   800	
   801		return size;
   802	}
   803	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
