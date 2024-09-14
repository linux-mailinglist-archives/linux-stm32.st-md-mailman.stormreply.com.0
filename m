Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B109790E5
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Sep 2024 15:27:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 733F0C6C841;
	Sat, 14 Sep 2024 13:27:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 368F7C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Sep 2024 13:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726320432; x=1757856432;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bfwqlZPrPDDj9RmAuDLGsQEpeaFuEXu2QbOhoqDsVLI=;
 b=nCV6gfzC53HLTaVO06j0sDPbM1rTbje0IlMo14gLDrQ0/lI3y2APQa9P
 OCWfvLtxvkLW8iHPKO7at5L+vIGFlbcIRavLoi7qQtgmDZVkH0s9MSKDF
 yPNe9me9dxgNepLgpdPNW8CaozIWZRbC7Ir13QB0d5y+gxf1Zk2hk1B79
 4tJ3V5B+FBTSjR699JnO8F5wy+8e0GZERTqfLt182PdLQw5n94G3AtnKH
 R8HNCW+z1eR558BRTHFFHllqs/gjDGpUgW8ULZ4m6ygi9IV8JCPEXyz/x
 T9rI4vP2pRQH9V+d6zxhQEV3njA1lG49PPCW7ORgW3LdQnfJMizPlC9cH g==;
X-CSE-ConnectionGUID: 3a0VHBBZQOGDr1nbzmA1+w==
X-CSE-MsgGUID: hH0u2DLsQIqHoaOZYHgKmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="24698600"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; d="scan'208";a="24698600"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2024 06:27:04 -0700
X-CSE-ConnectionGUID: mHzuBfSMQ6+R0oB732P08Q==
X-CSE-MsgGUID: 7TqGNRHXQwKIO3eJz7yGZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; d="scan'208";a="68268763"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 14 Sep 2024 06:27:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1spSnh-0007mK-2W;
 Sat, 14 Sep 2024 13:26:57 +0000
Date: Sat, 14 Sep 2024 21:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Bruel <christian.bruel@foss.st.com>, vkoul@kernel.org,
 kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, p.zabel@pengutronix.de
Message-ID: <202409142143.iJkSYPUK-lkp@intel.com>
References: <20240911104646.2980821-3-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240911104646.2980821-3-christian.bruel@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christian Bruel <christian.bruel@foss.st.com>, oe-kbuild-all@lists.linux.dev,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v8 2/5] phy: stm32: Add support for
	STM32MP25 COMBOPHY.
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

kernel test robot noticed the following build errors:

[auto build test ERROR on atorgue-stm32/stm32-next]
[also build test ERROR on robh/for-next linus/master v6.11-rc7 next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Bruel/dt-bindings-phy-Add-STM32MP25-COMBOPHY-bindings/20240911-185452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20240911104646.2980821-3-christian.bruel%40foss.st.com
patch subject: [PATCH v8 2/5] phy: stm32: Add support for STM32MP25 COMBOPHY.
config: um-randconfig-r132-20240914 (https://download.01.org/0day-ci/archive/20240914/202409142143.iJkSYPUK-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409142143.iJkSYPUK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409142143.iJkSYPUK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/phy/st/phy-stm32-combophy.c:12:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/phy/st/phy-stm32-combophy.c:12:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/phy/st/phy-stm32-combophy.c:12:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/phy/st/phy-stm32-combophy.c:140:8: error: implicit declaration of function 'FIELD_PREP' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                                      FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of));
                                      ^
>> drivers/phy/st/phy-stm32-combophy.c:143:12: error: implicit declaration of function 'FIELD_GET' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   imp_of = FIELD_GET(STM32MP25_PCIEPRG_IMPCTRL_OHM, val);
                            ^
   drivers/phy/st/phy-stm32-combophy.c:161:8: error: implicit declaration of function 'FIELD_PREP' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                                      FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of));
                                      ^
   drivers/phy/st/phy-stm32-combophy.c:530:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                   return ret;
                          ^~~
   drivers/phy/st/phy-stm32-combophy.c:515:9: note: initialize the variable 'ret' to silence this warning
           int ret, irq;
                  ^
                   = 0
   13 warnings and 3 errors generated.


vim +/FIELD_PREP +140 drivers/phy/st/phy-stm32-combophy.c

   113	
   114	static int stm32_impedance_tune(struct stm32_combophy *combophy)
   115	{
   116		u8 imp_size = ARRAY_SIZE(imp_lookup);
   117		u8 vswing_size = ARRAY_SIZE(imp_lookup[0].vswing);
   118		u8 imp_of, vswing_of;
   119		u32 max_imp = imp_lookup[0].microohm;
   120		u32 min_imp = imp_lookup[imp_size - 1].microohm;
   121		u32 max_vswing = imp_lookup[imp_size - 1].vswing[vswing_size - 1];
   122		u32 min_vswing = imp_lookup[0].vswing[0];
   123		u32 val;
   124	
   125		if (!of_property_read_u32(combophy->dev->of_node, "st,output-micro-ohms", &val)) {
   126			if (val < min_imp || val > max_imp) {
   127				dev_err(combophy->dev, "Invalid value %u for output ohm\n", val);
   128				return -EINVAL;
   129			}
   130	
   131			for (imp_of = 0; imp_of < ARRAY_SIZE(imp_lookup); imp_of++)
   132				if (imp_lookup[imp_of].microohm <= val)
   133					break;
   134	
   135			dev_dbg(combophy->dev, "Set %u micro-ohms output impedance\n",
   136				imp_lookup[imp_of].microohm);
   137	
   138			regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
   139					   STM32MP25_PCIEPRG_IMPCTRL_OHM,
 > 140					   FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of));
   141		} else {
   142			regmap_read(combophy->regmap, SYSCFG_PCIEPRGCR, &val);
 > 143			imp_of = FIELD_GET(STM32MP25_PCIEPRG_IMPCTRL_OHM, val);
   144		}
   145	
   146		if (!of_property_read_u32(combophy->dev->of_node, "st,output-vswing-microvolt", &val)) {
   147			if (val < min_vswing || val > max_vswing) {
   148				dev_err(combophy->dev, "Invalid value %u for output vswing\n", val);
   149				return -EINVAL;
   150			}
   151	
   152			for (vswing_of = 0; vswing_of < ARRAY_SIZE(imp_lookup[imp_of].vswing); vswing_of++)
   153				if (imp_lookup[imp_of].vswing[vswing_of] >= val)
   154					break;
   155	
   156			dev_dbg(combophy->dev, "Set %u microvolt swing\n",
   157				 imp_lookup[imp_of].vswing[vswing_of]);
   158	
   159			regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
   160					   STM32MP25_PCIEPRG_IMPCTRL_VSWING,
   161					   FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of));
   162		}
   163	
   164		return 0;
   165	}
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
