Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46047585C5F
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Jul 2022 23:40:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06C4AC03FE0;
	Sat, 30 Jul 2022 21:40:58 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9324C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Jul 2022 21:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659217255; x=1690753255;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=V5fo+ZjN6qVh2ehdMQ8scHgdijFwALwamZEruMT0vWg=;
 b=cZTfbcggU7CLAA+roqFGSEJMFA2/S05aEChG4c7Iwn5poZqgOrsAi4AV
 wPA7dIAFwE/HdmVwqeTsr6eyGnciNVgZTLJI0vcGVNRjPSs2GgSq9/EJP
 J0V1axDc+HftGvElwF7WjvvEQe1hRmom8Ut6Ac7K5ON9n096CJy4QsFCK
 i7m/fNvHIm0PcmAvC9IPYvWGaaJLiO0jVDLl8vU99JtyYbZ1kixQ9ZG3+
 24Rn0jQyk0cK6X3DTGM3LJ23onHMo9jhgqH2WxQEEPpRGmPNEguqS1f3d
 jxOJ9GuEDt0EWtOiD3wJMCPQgMhi4qrK8LyHSIGyY8Aoy+QrSgMFIC1b0 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10424"; a="289719243"
X-IronPort-AV: E=Sophos;i="5.93,205,1654585200"; d="scan'208";a="289719243"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2022 14:40:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,205,1654585200"; d="scan'208";a="605278720"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 30 Jul 2022 14:40:49 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oHuCW-000DN9-0o;
 Sat, 30 Jul 2022 21:40:48 +0000
Date: Sun, 31 Jul 2022 05:40:05 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 andriy.shevchenko@linux.intel.com, vee.khee.wong@intel.com,
 weifeng.voon@intel.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Andrew Lunn <andrew@lunn.ch>
Message-ID: <202207310531.48IGPx8Z-lkp@intel.com>
References: <b5b44a0c025d0fdddd9b9d23153261363089a06a.1659204745.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5b44a0c025d0fdddd9b9d23153261363089a06a.1659204745.git.christophe.jaillet@wanadoo.fr>
Cc: kbuild-all@lists.01.org, netdev@vger.kernel.org, llvm@lists.linux.dev,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] stmmac: intel: Add a missing
 clk_disable_unprepare() call in intel_eth_pci_remove()
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

Hi Christophe,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.19-rc8 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-JAILLET/stmmac-intel-Add-a-missing-clk_disable_unprepare-call-in-intel_eth_pci_remove/20220731-022139
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 620725263f4222b3c94d4ee19846835feec0ad69
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20220731/202207310531.48IGPx8Z-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2d1d09034cc62ee19f799b92bb67640ba86ca557
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christophe-JAILLET/stmmac-intel-Add-a-missing-clk_disable_unprepare-call-in-intel_eth_pci_remove/20220731-022139
        git checkout 2d1d09034cc62ee19f799b92bb67640ba86ca557
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/ethernet/stmicro/stmmac/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c:1107:24: error: use of undeclared identifier 'plat'
           clk_disable_unprepare(plat->stmmac_clk);
                                 ^
   1 error generated.


vim +/plat +1107 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c

  1092	
  1093	/**
  1094	 * intel_eth_pci_remove
  1095	 *
  1096	 * @pdev: pci device pointer
  1097	 * Description: this function calls the main to free the net resources
  1098	 * and releases the PCI resources.
  1099	 */
  1100	static void intel_eth_pci_remove(struct pci_dev *pdev)
  1101	{
  1102		struct net_device *ndev = dev_get_drvdata(&pdev->dev);
  1103		struct stmmac_priv *priv = netdev_priv(ndev);
  1104	
  1105		stmmac_dvr_remove(&pdev->dev);
  1106	
> 1107		clk_disable_unprepare(plat->stmmac_clk);
  1108		clk_unregister_fixed_rate(priv->plat->stmmac_clk);
  1109	
  1110		pcim_iounmap_regions(pdev, BIT(0));
  1111	}
  1112	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
