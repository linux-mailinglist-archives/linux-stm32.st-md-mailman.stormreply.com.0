Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6128C577210
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Jul 2022 00:51:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00A7CC0C921;
	Sat, 16 Jul 2022 22:51:05 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D9B8C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jul 2022 22:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658011863; x=1689547863;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eMZB5HTy1IP+QRRyebpuxHhRvBKz1HhDrHDYvMYNKVk=;
 b=JKuMkW0ytNq7bVCiU96jD2npAGYkYLbig2tNw0rorB5FRnZu99szHP2A
 Zswp1wg5T3u22nfJkHLNIHtvSGLIvU84rcHFeHoRX2A3F/cPC2C2wz0M1
 c+4jQq27KB5yoqQkOzJzcD9pU1ymkkaj4DI8oQWV4uPczlToXg6x2zEFH
 SejGy1XW+jTb9YUHBClOFLFEeNcYEEjcoofzZnqCfXR8vhet7A1ukL4Dz
 gzgaQCel4jsa4Gs3i9jWaKqFgNdT+p8aRdEDKFLzppABHXbiuxEzEMt2x
 3SkwK5SBRqxQti/Uk58BrXNonE+PRSxBcWEku2mRPLKYR2H3NluKbFysG g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10410"; a="283575846"
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; d="scan'208";a="283575846"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2022 15:51:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; d="scan'208";a="842889559"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 16 Jul 2022 15:50:57 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1oCqcj-0002GK-AI;
 Sat, 16 Jul 2022 22:50:57 +0000
Date: Sun, 17 Jul 2022 06:50:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <202207170639.k8cXFREA-lkp@intel.com>
References: <20220716184533.2962-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220716184533.2962-4-ansuelsmth@gmail.com>
Cc: netdev@vger.kernel.org, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [Linux-stm32] [net-next PATCH v2 3/5] net: ethernet: stmicro:
 stmmac: move dma conf to dedicated struct
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

Hi Christian,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/Add-MTU-change-with-stmmac-interface-running/20220717-025128
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 2acd1022549e210edc4cfc9fc65b07b88751f0d9
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20220717/202207170639.k8cXFREA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 07022e6cf9b5b3baa642be53d0b3c3f1c403dbfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/acdac2fef543d7b7fc85c7a5627e5e833ee756d8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-Marangi/Add-MTU-change-with-stmmac-interface-running/20220717-025128
        git checkout acdac2fef543d7b7fc85c7a5627e5e833ee756d8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/ethernet/stmicro/stmmac/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c:1094:14: error: no member named 'tx_queue' in 'struct stmmac_priv'
           if (!(priv->tx_queue[qopt->queue].tbs & STMMAC_TBS_AVAIL))
                 ~~~~  ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c:1098:9: error: no member named 'tx_queue' in 'struct stmmac_priv'
                   priv->tx_queue[qopt->queue].tbs |= STMMAC_TBS_EN;
                   ~~~~  ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c:1100:9: error: no member named 'tx_queue' in 'struct stmmac_priv'
                   priv->tx_queue[qopt->queue].tbs &= ~STMMAC_TBS_EN;
                   ~~~~  ^
   3 errors generated.


vim +1094 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c

b60189e0392fa0 Jose Abreu 2019-12-18  1086  
430b383c737ca0 Jose Abreu 2020-01-13  1087  static int tc_setup_etf(struct stmmac_priv *priv,
430b383c737ca0 Jose Abreu 2020-01-13  1088  			struct tc_etf_qopt_offload *qopt)
430b383c737ca0 Jose Abreu 2020-01-13  1089  {
430b383c737ca0 Jose Abreu 2020-01-13  1090  	if (!priv->dma_cap.tbssel)
430b383c737ca0 Jose Abreu 2020-01-13  1091  		return -EOPNOTSUPP;
430b383c737ca0 Jose Abreu 2020-01-13  1092  	if (qopt->queue >= priv->plat->tx_queues_to_use)
430b383c737ca0 Jose Abreu 2020-01-13  1093  		return -EINVAL;
430b383c737ca0 Jose Abreu 2020-01-13 @1094  	if (!(priv->tx_queue[qopt->queue].tbs & STMMAC_TBS_AVAIL))
430b383c737ca0 Jose Abreu 2020-01-13  1095  		return -EINVAL;
430b383c737ca0 Jose Abreu 2020-01-13  1096  
430b383c737ca0 Jose Abreu 2020-01-13  1097  	if (qopt->enable)
430b383c737ca0 Jose Abreu 2020-01-13  1098  		priv->tx_queue[qopt->queue].tbs |= STMMAC_TBS_EN;
430b383c737ca0 Jose Abreu 2020-01-13  1099  	else
430b383c737ca0 Jose Abreu 2020-01-13  1100  		priv->tx_queue[qopt->queue].tbs &= ~STMMAC_TBS_EN;
430b383c737ca0 Jose Abreu 2020-01-13  1101  
430b383c737ca0 Jose Abreu 2020-01-13  1102  	netdev_info(priv->dev, "%s ETF for Queue %d\n",
430b383c737ca0 Jose Abreu 2020-01-13  1103  		    qopt->enable ? "enabled" : "disabled", qopt->queue);
430b383c737ca0 Jose Abreu 2020-01-13  1104  	return 0;
430b383c737ca0 Jose Abreu 2020-01-13  1105  }
430b383c737ca0 Jose Abreu 2020-01-13  1106  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
