Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 383159B16C7
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Oct 2024 12:01:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD302C78018;
	Sat, 26 Oct 2024 10:01:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37087C6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Oct 2024 10:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729936868; x=1761472868;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mIO9fjYoPv61naCUwAwP4LP9ukzdvV7EzEpcI1LlGIo=;
 b=fTt5RJM6G7VmZo0msPs8nyo6VhlA3rsN5Zv41K/tnK181NNkAk+bmOxd
 YWeYC9f0rt32M//SdlsHQ+nhicpdHkZMp5mu2LFhgIcXsdIAZyoTfgqzc
 Ifrk0lIuKQVGkT0qQDAwLaHQsctf8CN/kgC4umWoOWfCk4UvHvu6spjJv
 pXusgMdhdt5up6ncSoKLZ9ckZ3jCHMH0b6+K7BLH300+++LpTrZjb+swu
 wzywp31YPU3pKzBf0+La53ur6Mg9WqxdmiYbkAcvjZeno0MQ9hhWWjvWT
 FAmM7VhwpbjI4+hgP3k6yjnEGjJ/QzvFpbAdhMvh6ixee+EDCkRU1K8Fn w==;
X-CSE-ConnectionGUID: V1oUAw4lSsW+IjlBRVe6BQ==
X-CSE-MsgGUID: AZZ0UP2oRYyAJdiGI51yOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40703402"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40703402"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2024 03:00:59 -0700
X-CSE-ConnectionGUID: k7HnwS/mTAC6GDASBmoYfA==
X-CSE-MsgGUID: /3zSxkewT5SxS9d0jIDcxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; d="scan'208";a="81314648"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 26 Oct 2024 03:00:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t4dbJ-000ZUa-2l;
 Sat, 26 Oct 2024 10:00:53 +0000
Date: Sat, 26 Oct 2024 18:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Message-ID: <202410261701.jz99xF8B-lkp@intel.com>
References: <20241025205924.2087768-8-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241025205924.2087768-8-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v12 7/7] remoteproc: stm32: Add support of
 an OP-TEE TA to load the firmware
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

[auto build test ERROR on 42f7652d3eb527d03665b09edac47f85fb600924]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Pouliquen/remoteproc-core-Introduce-rproc_pa_to_va-helper/20241026-050443
base:   42f7652d3eb527d03665b09edac47f85fb600924
patch link:    https://lore.kernel.org/r/20241025205924.2087768-8-arnaud.pouliquen%40foss.st.com
patch subject: [PATCH v12 7/7] remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20241026/202410261701.jz99xF8B-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410261701.jz99xF8B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261701.jz99xF8B-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_probe':
>> drivers/remoteproc/stm32_rproc.c:904:21: error: assignment to 'int' from 'struct rproc_tee *' makes integer from pointer without a cast [-Wint-conversion]
     904 |                 ret = rproc_tee_register(dev, rproc, proc_id);
         |                     ^
>> drivers/remoteproc/stm32_rproc.c:963:30: error: passing argument 1 of 'rproc_tee_unregister' from incompatible pointer type [-Wincompatible-pointer-types]
     963 |         rproc_tee_unregister(rproc);
         |                              ^~~~~
         |                              |
         |                              struct rproc *
   In file included from drivers/remoteproc/stm32_rproc.c:21:
   include/linux/remoteproc_tee.h:59:58: note: expected 'struct rproc_tee *' but argument is of type 'struct rproc *'
      59 | static inline int rproc_tee_unregister(struct rproc_tee *trproc)
         |                                        ~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_remove':
   drivers/remoteproc/stm32_rproc.c:986:30: error: passing argument 1 of 'rproc_tee_unregister' from incompatible pointer type [-Wincompatible-pointer-types]
     986 |         rproc_tee_unregister(rproc);
         |                              ^~~~~
         |                              |
         |                              struct rproc *
   include/linux/remoteproc_tee.h:59:58: note: expected 'struct rproc_tee *' but argument is of type 'struct rproc *'
      59 | static inline int rproc_tee_unregister(struct rproc_tee *trproc)
         |                                        ~~~~~~~~~~~~~~~~~~^~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +904 drivers/remoteproc/stm32_rproc.c

   874	
   875	static int stm32_rproc_probe(struct platform_device *pdev)
   876	{
   877		struct device *dev = &pdev->dev;
   878		struct stm32_rproc *ddata;
   879		struct device_node *np = dev->of_node;
   880		struct rproc *rproc;
   881		unsigned int state;
   882		u32 proc_id;
   883		int ret;
   884	
   885		ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
   886		if (ret)
   887			return ret;
   888	
   889		if (of_device_is_compatible(np, "st,stm32mp1-m4-tee")) {
   890			/*
   891			 * Delegate the firmware management to the secure context.
   892			 * The firmware loaded has to be signed.
   893			 */
   894			ret = of_property_read_u32(np, "st,proc-id", &proc_id);
   895			if (ret) {
   896				dev_err(dev, "failed to read st,rproc-id property\n");
   897				return ret;
   898			}
   899	
   900			rproc = devm_rproc_alloc(dev, np->name, &st_rproc_tee_ops, NULL, sizeof(*ddata));
   901			if (!rproc)
   902				return -ENOMEM;
   903	
 > 904			ret = rproc_tee_register(dev, rproc, proc_id);
   905			if (ret)
   906				return dev_err_probe(dev, ret,  "signed firmware not supported by TEE\n");
   907		} else {
   908			rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
   909			if (!rproc)
   910				return -ENOMEM;
   911		}
   912	
   913		ddata = rproc->priv;
   914	
   915		rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
   916	
   917		ret = stm32_rproc_parse_dt(pdev, ddata, &rproc->auto_boot);
   918		if (ret)
   919			goto free_rproc;
   920	
   921		ret = stm32_rproc_of_memory_translations(pdev, ddata);
   922		if (ret)
   923			goto free_rproc;
   924	
   925		ret = stm32_rproc_get_m4_status(ddata, &state);
   926		if (ret)
   927			goto free_rproc;
   928	
   929		if (state == M4_STATE_CRUN)
   930			rproc->state = RPROC_DETACHED;
   931	
   932		rproc->has_iommu = false;
   933		ddata->workqueue = create_workqueue(dev_name(dev));
   934		if (!ddata->workqueue) {
   935			dev_err(dev, "cannot create workqueue\n");
   936			ret = -ENOMEM;
   937			goto free_resources;
   938		}
   939	
   940		platform_set_drvdata(pdev, rproc);
   941	
   942		ret = stm32_rproc_request_mbox(rproc);
   943		if (ret)
   944			goto free_wkq;
   945	
   946		ret = rproc_add(rproc);
   947		if (ret)
   948			goto free_mb;
   949	
   950		return 0;
   951	
   952	free_mb:
   953		stm32_rproc_free_mbox(rproc);
   954	free_wkq:
   955		destroy_workqueue(ddata->workqueue);
   956	free_resources:
   957		rproc_resource_cleanup(rproc);
   958	free_rproc:
   959		if (device_may_wakeup(dev)) {
   960			dev_pm_clear_wake_irq(dev);
   961			device_init_wakeup(dev, false);
   962		}
 > 963		rproc_tee_unregister(rproc);
   964	
   965		return ret;
   966	}
   967	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
