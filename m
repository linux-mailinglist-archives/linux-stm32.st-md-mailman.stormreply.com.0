Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E615A337EC
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 07:27:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F19C2C78039;
	Thu, 13 Feb 2025 06:27:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C7EDC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 06:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739428019; x=1770964019;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mQm/3JCmAFSW/VKjAt7raIjpfolCLORdQ9Y3kbWdC00=;
 b=fsKk5c9S6IaQndcJRGZTuifE+qwQgYL9po3OqQni9zWq+G8zvgtsNNE+
 VA2DWFmsO6t+lWUPS9Ck+bP1B2JKKS7lnbDrAIoMOBVATsHcrSfIR0Txv
 eTKcvhSjZVe/H0RfOMC6kbLZesn+jqw7UWCFE4lDuZ3ys5EWRXwAOBXnJ
 iV1RROnRWKFr0d5A1S5wbs/MDWINE0DmZqX0xCPfJZ5WK3ScnEr8xWw5Q
 6voAf/9/LYF4UC2yQDcYuo6tRE5xKFGlxjtxM9t6s7UdnB1jKxVl61noF
 lQqp9cAPCiXqTad3mY0Osb1TIsbTc8zFkIIff51b/YbeQQVHDFDd1lgeQ w==;
X-CSE-ConnectionGUID: G5egUgrbS8CKe/cABhrdKQ==
X-CSE-MsgGUID: vcK+g46vR3C2CtqkkA4oKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="62581491"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="62581491"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 22:26:52 -0800
X-CSE-ConnectionGUID: K+jPRXdLSNGIt2MHy6vbiQ==
X-CSE-MsgGUID: 2TpqkmqkQaetEU8VWMJi0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="143992863"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 12 Feb 2025 22:26:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tiSgN-0016dj-0c;
 Thu, 13 Feb 2025 06:26:43 +0000
Date: Thu, 13 Feb 2025 14:26:11 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <phasta@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Serge Semin <fancer.lancer@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Yinggang Gu <guyinggang@loongson.cn>, Yanteng Si <si.yanteng@linux.dev>,
 Philipp Stanner <pstanner@redhat.com>
Message-ID: <202502131415.1kfrLXGp-lkp@intel.com>
References: <20250212145831.101719-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250212145831.101719-2-phasta@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH] stmmac: Replace deprecated PCI functions
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

Hi Philipp,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.14-rc2 next-20250212]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/stmmac-Replace-deprecated-PCI-functions/20250212-230254
base:   linus/master
patch link:    https://lore.kernel.org/r/20250212145831.101719-2-phasta%40kernel.org
patch subject: [PATCH] stmmac: Replace deprecated PCI functions
config: sparc64-randconfig-001-20250213 (https://download.01.org/0day-ci/archive/20250213/202502131415.1kfrLXGp-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131415.1kfrLXGp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131415.1kfrLXGp-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c: In function 'stmmac_pci_probe':
>> drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c:197:49: error: expected ';' before 'break'
     197 |                         return PTR_ERR(res.addr)
         |                                                 ^
         |                                                 ;
     198 |                 break;
         |                 ~~~~~                            


vim +197 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c

   140	
   141	/**
   142	 * stmmac_pci_probe
   143	 *
   144	 * @pdev: pci device pointer
   145	 * @id: pointer to table of device id/id's.
   146	 *
   147	 * Description: This probing function gets called for all PCI devices which
   148	 * match the ID table and are not "owned" by other driver yet. This function
   149	 * gets passed a "struct pci_dev *" for each device whose entry in the ID table
   150	 * matches the device. The probe functions returns zero when the driver choose
   151	 * to take "ownership" of the device or an error code(-ve no) otherwise.
   152	 */
   153	static int stmmac_pci_probe(struct pci_dev *pdev,
   154				    const struct pci_device_id *id)
   155	{
   156		struct stmmac_pci_info *info = (struct stmmac_pci_info *)id->driver_data;
   157		struct plat_stmmacenet_data *plat;
   158		struct stmmac_resources res = {};
   159		int i;
   160		int ret;
   161	
   162		plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
   163		if (!plat)
   164			return -ENOMEM;
   165	
   166		plat->mdio_bus_data = devm_kzalloc(&pdev->dev,
   167						   sizeof(*plat->mdio_bus_data),
   168						   GFP_KERNEL);
   169		if (!plat->mdio_bus_data)
   170			return -ENOMEM;
   171	
   172		plat->dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*plat->dma_cfg),
   173					     GFP_KERNEL);
   174		if (!plat->dma_cfg)
   175			return -ENOMEM;
   176	
   177		plat->safety_feat_cfg = devm_kzalloc(&pdev->dev,
   178						     sizeof(*plat->safety_feat_cfg),
   179						     GFP_KERNEL);
   180		if (!plat->safety_feat_cfg)
   181			return -ENOMEM;
   182	
   183		/* Enable pci device */
   184		ret = pcim_enable_device(pdev);
   185		if (ret) {
   186			dev_err(&pdev->dev, "%s: ERROR: failed to enable device\n",
   187				__func__);
   188			return ret;
   189		}
   190	
   191		/* The first BAR > 0 is the base IO addr of our device. */
   192		for (i = 0; i < PCI_STD_NUM_BARS; i++) {
   193			if (pci_resource_len(pdev, i) == 0)
   194				continue;
   195			res.addr = pcim_iomap_region(pdev, i, STMMAC_RESOURCE_NAME);
   196			if (IS_ERR(res.addr))
 > 197				return PTR_ERR(res.addr)
   198			break;
   199		}
   200	
   201		pci_set_master(pdev);
   202	
   203		ret = info->setup(pdev, plat);
   204		if (ret)
   205			return ret;
   206	
   207		res.wol_irq = pdev->irq;
   208		res.irq = pdev->irq;
   209	
   210		plat->safety_feat_cfg->tsoee = 1;
   211		plat->safety_feat_cfg->mrxpee = 1;
   212		plat->safety_feat_cfg->mestee = 1;
   213		plat->safety_feat_cfg->mrxee = 1;
   214		plat->safety_feat_cfg->mtxee = 1;
   215		plat->safety_feat_cfg->epsi = 1;
   216		plat->safety_feat_cfg->edpp = 1;
   217		plat->safety_feat_cfg->prtyen = 1;
   218		plat->safety_feat_cfg->tmouten = 1;
   219	
   220		return stmmac_dvr_probe(&pdev->dev, plat, &res);
   221	}
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
