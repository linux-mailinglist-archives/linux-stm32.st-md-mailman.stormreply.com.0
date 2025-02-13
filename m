Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A70CA33A91
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 10:03:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5030AC78F6D;
	Thu, 13 Feb 2025 09:03:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E92D6C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 09:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739437394; x=1770973394;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wyVqmKW6qzEXY/2+wreWQuYQKHFVrSv5qadbTzVZLSY=;
 b=XxD0DwJDrAoMbIvH6fKOnORzXwcHQ5REgic44QAQtZeH8JduBlR5G0uF
 Mh5Yip2pkRlNsfmv4ULp1e5z5kgKzf2TF7a8F3n7BztBbKxmPvgHGwTjt
 p+TB7Qnr4cw2NjgSw4bIjrvN1rBuzovmF5rRdOog049wRITNNnqLajKSW
 ICpn4LwzFLtRBrgmwP7FVPtfxeB8BR7YkhA5WIuNGxOAdyxiT/A15m4bW
 2qaJpayHEZGOmm9HN/N1R12FvdPBDhSo6YdccdG/KiHOrlMPzDKilRb9R
 ffIyZtdm+VtaZk+Y1H3wX/rFmTYZlPXXnkA0IscWjCkFqxbwg2KJA+w7/ g==;
X-CSE-ConnectionGUID: UdFSRsFTQW29GawFlX2TZg==
X-CSE-MsgGUID: 0V3NTUAfTBCAUn8uS27U2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="42964610"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="42964610"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 01:03:11 -0800
X-CSE-ConnectionGUID: xLD9b4BYSA2msdlFhvPgzA==
X-CSE-MsgGUID: IVYzpRB/RkKRgnnvJ6SyEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="112851152"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 13 Feb 2025 01:03:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tiV7g-0016qp-1x;
 Thu, 13 Feb 2025 09:03:04 +0000
Date: Thu, 13 Feb 2025 17:02:38 +0800
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
Message-ID: <202502131623.bMnlG9wy-lkp@intel.com>
References: <20250212145831.101719-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250212145831.101719-2-phasta@kernel.org>
Cc: netdev@vger.kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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
[also build test ERROR on v6.14-rc2 next-20250213]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/stmmac-Replace-deprecated-PCI-functions/20250212-230254
base:   linus/master
patch link:    https://lore.kernel.org/r/20250212145831.101719-2-phasta%40kernel.org
patch subject: [PATCH] stmmac: Replace deprecated PCI functions
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250213/202502131623.bMnlG9wy-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131623.bMnlG9wy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131623.bMnlG9wy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c:13:
   In file included from include/linux/pci.h:37:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c:197:28: error: expected ';' after return statement
     197 |                         return PTR_ERR(res.addr)
         |                                                 ^
         |                                                 ;
   3 warnings and 1 error generated.


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
