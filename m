Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0CB9FD919
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Dec 2024 06:44:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37576C78031;
	Sat, 28 Dec 2024 05:44:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EF42C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 05:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735364688; x=1766900688;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7+MJqD3C48EXjWCp0o71PXcfiXhqzoReRXFzpsHCzo0=;
 b=VL6QpJ9UOBW1+ftvz5JP+f2GQ5y+VAf5l620LLAtcHTLs7oIINmwaWQD
 0W0DZQUIxyjdhuX1I2SwuzBhOv0ebLzvHwtIfdHmL1iTpHJUus5cTRtDm
 e6zgk7odfIs6zNjABrO3ia/8ljB9Bdvz6GYa3E4cEMkXgNJQKnt97bERX
 nMYjQjwh3m/OU8CyHQDCFr3l6FXKz+fBREztkaCMtaOUTNMNVkuP9GhB6
 kH7482e/Ep5a/IZm7w67t9zTgO4pixygf6JL1QIM3Wia2xqOElhzeFwbA
 gujOc1rfWeh9E+gS0WcoKf4dDaxqYy/Vk58yfpkuLaJH9Sq+0W4J2ctQK Q==;
X-CSE-ConnectionGUID: 1FeH6Y/CQ0OV6nVYpJ6Skg==
X-CSE-MsgGUID: 2TY+jpSyT/+6cpUitz+SDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35864200"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; d="scan'208";a="35864200"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2024 21:44:40 -0800
X-CSE-ConnectionGUID: BbyMppGaSKywwZy7sbq9gg==
X-CSE-MsgGUID: XIGLvPlGQVWDxl/TReHwHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; d="scan'208";a="100492194"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 27 Dec 2024 21:44:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tRPcm-0003tE-25;
 Sat, 28 Dec 2024 05:44:32 +0000
Date: Sat, 28 Dec 2024 13:43:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>
Message-ID: <202412281302.N1Bd2W48-lkp@intel.com>
References: <20241228-wake_irq-v1-6-09cfca77cd47@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241228-wake_irq-v1-6-09cfca77cd47@nxp.com>
Cc: linux-rtc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 06/12] rtc: stm32: Use resource managed
 API to simplify code
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

Hi Peng,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/PM-sleep-wakeirq-Introduce-device-managed-variant-of-dev_pm_set_wake_irq/20241228-091859
base:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
patch link:    https://lore.kernel.org/r/20241228-wake_irq-v1-6-09cfca77cd47%40nxp.com
patch subject: [PATCH 06/12] rtc: stm32: Use resource managed API to simplify code
config: arm64-randconfig-003-20241228 (https://download.01.org/0day-ci/archive/20241228/202412281302.N1Bd2W48-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281302.N1Bd2W48-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281302.N1Bd2W48-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
ERROR: modpost: "devm_pm_set_wake_irq" [drivers/input/touchscreen/ti_am335x_tsc.ko] undefined!
>> ERROR: modpost: "devm_pm_set_wake_irq" [drivers/rtc/rtc-stm32.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
