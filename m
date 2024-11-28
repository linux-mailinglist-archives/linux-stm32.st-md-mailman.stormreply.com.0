Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CCE9DB2AB
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Nov 2024 06:59:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19764C7802D;
	Thu, 28 Nov 2024 05:59:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 615BBC78022
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Nov 2024 05:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732773580; x=1764309580;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c0KVSQsmu1rPPpFE3S5HnK03A6rk+5gg33/ro18oufE=;
 b=gqcq4y9J4fcKkUFEaH0K9fjsegzykykN4cBi3oi5mbH1tjKp50ixG9R5
 ANEQBjOXeeON4e2oS3xOSIMON1R8/SAY8jsF9b3oOixVmECMsrETu5hwZ
 Nxi0Qtb4B/L9OQd7unbrsCe2w7G3SRS4A2GJOEeS36gL15lKaB2Z0Vw+P
 SJDsVOfej3Vb259c/sWc8Ok7WcCYf18/4p+mkmqlw5gXoWoDFcNV3kOG8
 Y8m68728yNkdiVCvwxmE3OrTBGdg7ZGDyOuN90+gObLsWte7nmax/QdrU
 Wp8vtLwxb47WweIPfoYaIYqn02+daFOTziYKcSAtF/KKv1+3tl+dZ64Yt w==;
X-CSE-ConnectionGUID: mFlKycuiQlqNl+IvDQj77A==
X-CSE-MsgGUID: r0pjVyzdSoGla8Ua5WUezw==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="43662854"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; d="scan'208";a="43662854"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 21:59:32 -0800
X-CSE-ConnectionGUID: kPW4/6JXQPuGryDD7XfTRQ==
X-CSE-MsgGUID: lmzrxaPdSyinw+0AgZvGbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; d="scan'208";a="91751016"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 27 Nov 2024 21:59:27 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tGXYi-00097f-2U;
 Thu, 28 Nov 2024 05:59:24 +0000
Date: Thu, 28 Nov 2024 13:58:50 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <202411281332.Ra70nJAW-lkp@intel.com>
References: <20241126091042.918144-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241126091042.918144-5-arnaud.pouliquen@foss.st.com>
Cc: imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, oe-kbuild-all@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v14 4/8] remoteproc: Rename load()
 operation to load_segments() in rproc_ops struct
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

Hi Arnaud,

kernel test robot noticed the following build errors:

[auto build test ERROR on adc218676eef25575469234709c2d87185ca223a]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Pouliquen/remoteproc-core-Introduce-rproc_pa_to_va-helper/20241128-094434
base:   adc218676eef25575469234709c2d87185ca223a
patch link:    https://lore.kernel.org/r/20241126091042.918144-5-arnaud.pouliquen%40foss.st.com
patch subject: [PATCH v14 4/8] remoteproc: Rename load() operation to load_segments() in rproc_ops struct
config: i386-buildonly-randconfig-002-20241128 (https://download.01.org/0day-ci/archive/20241128/202411281332.Ra70nJAW-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281332.Ra70nJAW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281332.Ra70nJAW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/remoteproc/pru_rproc.c:24:
   In file included from include/linux/remoteproc.h:40:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/remoteproc/pru_rproc.c:1018:14: error: no member named 'load' in 'struct rproc_ops'
    1018 |         rproc->ops->load = pru_rproc_load_elf_segments;
         |         ~~~~~~~~~~  ^
   1 warning and 1 error generated.


vim +1018 drivers/remoteproc/pru_rproc.c

d4ce2de7e4af8b Suman Anna      2020-12-08   987  
d4ce2de7e4af8b Suman Anna      2020-12-08   988  static int pru_rproc_probe(struct platform_device *pdev)
d4ce2de7e4af8b Suman Anna      2020-12-08   989  {
d4ce2de7e4af8b Suman Anna      2020-12-08   990  	struct device *dev = &pdev->dev;
d4ce2de7e4af8b Suman Anna      2020-12-08   991  	struct device_node *np = dev->of_node;
d4ce2de7e4af8b Suman Anna      2020-12-08   992  	struct platform_device *ppdev = to_platform_device(dev->parent);
d4ce2de7e4af8b Suman Anna      2020-12-08   993  	struct pru_rproc *pru;
d4ce2de7e4af8b Suman Anna      2020-12-08   994  	const char *fw_name;
d4ce2de7e4af8b Suman Anna      2020-12-08   995  	struct rproc *rproc = NULL;
d4ce2de7e4af8b Suman Anna      2020-12-08   996  	struct resource *res;
d4ce2de7e4af8b Suman Anna      2020-12-08   997  	int i, ret;
1d39f4d199214f Suman Anna      2020-12-08   998  	const struct pru_private_data *data;
d4ce2de7e4af8b Suman Anna      2020-12-08   999  	const char *mem_names[PRU_IOMEM_MAX] = { "iram", "control", "debug" };
d4ce2de7e4af8b Suman Anna      2020-12-08  1000  
1d39f4d199214f Suman Anna      2020-12-08  1001  	data = of_device_get_match_data(&pdev->dev);
1d39f4d199214f Suman Anna      2020-12-08  1002  	if (!data)
1d39f4d199214f Suman Anna      2020-12-08  1003  		return -ENODEV;
1d39f4d199214f Suman Anna      2020-12-08  1004  
d4ce2de7e4af8b Suman Anna      2020-12-08  1005  	ret = of_property_read_string(np, "firmware-name", &fw_name);
d4ce2de7e4af8b Suman Anna      2020-12-08  1006  	if (ret) {
d4ce2de7e4af8b Suman Anna      2020-12-08  1007  		dev_err(dev, "unable to retrieve firmware-name %d\n", ret);
d4ce2de7e4af8b Suman Anna      2020-12-08  1008  		return ret;
d4ce2de7e4af8b Suman Anna      2020-12-08  1009  	}
d4ce2de7e4af8b Suman Anna      2020-12-08  1010  
d4ce2de7e4af8b Suman Anna      2020-12-08  1011  	rproc = devm_rproc_alloc(dev, pdev->name, &pru_rproc_ops, fw_name,
d4ce2de7e4af8b Suman Anna      2020-12-08  1012  				 sizeof(*pru));
d4ce2de7e4af8b Suman Anna      2020-12-08  1013  	if (!rproc) {
d4ce2de7e4af8b Suman Anna      2020-12-08  1014  		dev_err(dev, "rproc_alloc failed\n");
d4ce2de7e4af8b Suman Anna      2020-12-08  1015  		return -ENOMEM;
d4ce2de7e4af8b Suman Anna      2020-12-08  1016  	}
d4ce2de7e4af8b Suman Anna      2020-12-08  1017  	/* use a custom load function to deal with PRU-specific quirks */
d4ce2de7e4af8b Suman Anna      2020-12-08 @1018  	rproc->ops->load = pru_rproc_load_elf_segments;
d4ce2de7e4af8b Suman Anna      2020-12-08  1019  
d4ce2de7e4af8b Suman Anna      2020-12-08  1020  	/* use a custom parse function to deal with PRU-specific resources */
d4ce2de7e4af8b Suman Anna      2020-12-08  1021  	rproc->ops->parse_fw = pru_rproc_parse_fw;
d4ce2de7e4af8b Suman Anna      2020-12-08  1022  
d4ce2de7e4af8b Suman Anna      2020-12-08  1023  	/* error recovery is not supported for PRUs */
d4ce2de7e4af8b Suman Anna      2020-12-08  1024  	rproc->recovery_disabled = true;
d4ce2de7e4af8b Suman Anna      2020-12-08  1025  
d4ce2de7e4af8b Suman Anna      2020-12-08  1026  	/*
d4ce2de7e4af8b Suman Anna      2020-12-08  1027  	 * rproc_add will auto-boot the processor normally, but this is not
d4ce2de7e4af8b Suman Anna      2020-12-08  1028  	 * desired with PRU client driven boot-flow methodology. A PRU
d4ce2de7e4af8b Suman Anna      2020-12-08  1029  	 * application/client driver will boot the corresponding PRU
d4ce2de7e4af8b Suman Anna      2020-12-08  1030  	 * remote-processor as part of its state machine either through the
d4ce2de7e4af8b Suman Anna      2020-12-08  1031  	 * remoteproc sysfs interface or through the equivalent kernel API.
d4ce2de7e4af8b Suman Anna      2020-12-08  1032  	 */
d4ce2de7e4af8b Suman Anna      2020-12-08  1033  	rproc->auto_boot = false;
d4ce2de7e4af8b Suman Anna      2020-12-08  1034  
d4ce2de7e4af8b Suman Anna      2020-12-08  1035  	pru = rproc->priv;
d4ce2de7e4af8b Suman Anna      2020-12-08  1036  	pru->dev = dev;
1d39f4d199214f Suman Anna      2020-12-08  1037  	pru->data = data;
d4ce2de7e4af8b Suman Anna      2020-12-08  1038  	pru->pruss = platform_get_drvdata(ppdev);
d4ce2de7e4af8b Suman Anna      2020-12-08  1039  	pru->rproc = rproc;
d4ce2de7e4af8b Suman Anna      2020-12-08  1040  	pru->fw_name = fw_name;
919e8942548aa8 MD Danish Anwar 2023-01-06  1041  	pru->client_np = NULL;
102853400321ba Roger Quadros   2023-01-06  1042  	spin_lock_init(&pru->rmw_lock);
919e8942548aa8 MD Danish Anwar 2023-01-06  1043  	mutex_init(&pru->lock);
d4ce2de7e4af8b Suman Anna      2020-12-08  1044  
d4ce2de7e4af8b Suman Anna      2020-12-08  1045  	for (i = 0; i < ARRAY_SIZE(mem_names); i++) {
d4ce2de7e4af8b Suman Anna      2020-12-08  1046  		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
d4ce2de7e4af8b Suman Anna      2020-12-08  1047  						   mem_names[i]);
d4ce2de7e4af8b Suman Anna      2020-12-08  1048  		pru->mem_regions[i].va = devm_ioremap_resource(dev, res);
d4ce2de7e4af8b Suman Anna      2020-12-08  1049  		if (IS_ERR(pru->mem_regions[i].va)) {
d4ce2de7e4af8b Suman Anna      2020-12-08  1050  			dev_err(dev, "failed to parse and map memory resource %d %s\n",
d4ce2de7e4af8b Suman Anna      2020-12-08  1051  				i, mem_names[i]);
d4ce2de7e4af8b Suman Anna      2020-12-08  1052  			ret = PTR_ERR(pru->mem_regions[i].va);
d4ce2de7e4af8b Suman Anna      2020-12-08  1053  			return ret;
d4ce2de7e4af8b Suman Anna      2020-12-08  1054  		}
d4ce2de7e4af8b Suman Anna      2020-12-08  1055  		pru->mem_regions[i].pa = res->start;
d4ce2de7e4af8b Suman Anna      2020-12-08  1056  		pru->mem_regions[i].size = resource_size(res);
d4ce2de7e4af8b Suman Anna      2020-12-08  1057  
d4ce2de7e4af8b Suman Anna      2020-12-08  1058  		dev_dbg(dev, "memory %8s: pa %pa size 0x%zx va %pK\n",
d4ce2de7e4af8b Suman Anna      2020-12-08  1059  			mem_names[i], &pru->mem_regions[i].pa,
d4ce2de7e4af8b Suman Anna      2020-12-08  1060  			pru->mem_regions[i].size, pru->mem_regions[i].va);
d4ce2de7e4af8b Suman Anna      2020-12-08  1061  	}
d4ce2de7e4af8b Suman Anna      2020-12-08  1062  
d4ce2de7e4af8b Suman Anna      2020-12-08  1063  	ret = pru_rproc_set_id(pru);
d4ce2de7e4af8b Suman Anna      2020-12-08  1064  	if (ret < 0)
d4ce2de7e4af8b Suman Anna      2020-12-08  1065  		return ret;
d4ce2de7e4af8b Suman Anna      2020-12-08  1066  
d4ce2de7e4af8b Suman Anna      2020-12-08  1067  	platform_set_drvdata(pdev, rproc);
d4ce2de7e4af8b Suman Anna      2020-12-08  1068  
d4ce2de7e4af8b Suman Anna      2020-12-08  1069  	ret = devm_rproc_add(dev, pru->rproc);
d4ce2de7e4af8b Suman Anna      2020-12-08  1070  	if (ret) {
d4ce2de7e4af8b Suman Anna      2020-12-08  1071  		dev_err(dev, "rproc_add failed: %d\n", ret);
d4ce2de7e4af8b Suman Anna      2020-12-08  1072  		return ret;
d4ce2de7e4af8b Suman Anna      2020-12-08  1073  	}
d4ce2de7e4af8b Suman Anna      2020-12-08  1074  
20ad1de0f14fbd Suman Anna      2020-12-08  1075  	pru_rproc_create_debug_entries(rproc);
20ad1de0f14fbd Suman Anna      2020-12-08  1076  
d4ce2de7e4af8b Suman Anna      2020-12-08  1077  	dev_dbg(dev, "PRU rproc node %pOF probed successfully\n", np);
d4ce2de7e4af8b Suman Anna      2020-12-08  1078  
d4ce2de7e4af8b Suman Anna      2020-12-08  1079  	return 0;
d4ce2de7e4af8b Suman Anna      2020-12-08  1080  }
d4ce2de7e4af8b Suman Anna      2020-12-08  1081  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
