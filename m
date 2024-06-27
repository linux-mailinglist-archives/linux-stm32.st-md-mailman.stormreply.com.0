Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E8C91A157
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 10:24:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B9B3C71282;
	Thu, 27 Jun 2024 08:24:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2C89C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 08:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719476678; x=1751012678;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nrcED+kfNOJnZI80OvRQZgPNWlUT47kK8X+bKOmviCM=;
 b=ag8/gGuT829roPOmqYb0w1Gy1gnZYPhPLco7+11juvQEE9rXEnvXn7/2
 IcmwYG96CpnwRqu6FQS1DZAEJx2TubEYXgWaxfL4Oc6m8kTwhs9elv4yf
 M3OvUEG/HklrDJkW/Qr3NTTAZaOKuDztfeMtaxyr0lUBtBSAbpefbU5t2
 eNNhA3HRfOZt9pgIHJa4hu87TRtbaob7795svOIlfE6IfuwtBNixGANPH
 pE7X424hYuijkQYDdxknijt6DAjKxbIl7HVG86vmbOM0mhgxwMoRgSEjo
 c5tzfOzqrHbs1EyuuCHSY3Mx7HNiGvMADlhZdq6mY+RJiKWvfqCltIyDl w==;
X-CSE-ConnectionGUID: N7Dk3Ky7Rk2RtZ+yQnlunA==
X-CSE-MsgGUID: boBwps6FTtCHI6D2NqsW8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16732456"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="16732456"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 01:24:36 -0700
X-CSE-ConnectionGUID: glugGBpTT1yyzfQ3hLwEGA==
X-CSE-MsgGUID: T9QHmxmfQZW2EwUhcgfaTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="44944816"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 27 Jun 2024 01:24:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sMkQf-000G3N-1Q;
 Thu, 27 Jun 2024 08:24:29 +0000
Date: Thu, 27 Jun 2024 16:23:56 +0800
From: kernel test robot <lkp@intel.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Message-ID: <202406271638.0fz7OuJT-lkp@intel.com>
References: <20240625-thermal-v2-3-bf8354ed51ee@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240625-thermal-v2-3-bf8354ed51ee@gmail.com>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/3] ARM: dts: sti: add thermal-zones
 support on stih418
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

Hi Raphael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0fc4bfab2cd45f9acb86c4f04b5191e114e901ed]

url:    https://github.com/intel-lab-lkp/linux/commits/Raphael-Gallais-Pou/thermal-st-switch-from-CONFIG_PM_SLEEP-guards-to-pm_sleep_ptr/20240626-090203
base:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
patch link:    https://lore.kernel.org/r/20240625-thermal-v2-3-bf8354ed51ee%40gmail.com
patch subject: [PATCH v2 3/3] ARM: dts: sti: add thermal-zones support on stih418
config: arm-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240627/202406271638.0fz7OuJT-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271638.0fz7OuJT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271638.0fz7OuJT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/st/stih418.dtsi:51.28-79.5: Warning (thermal_sensors_property): /thermal-zones/cpu-thermal: Missing property '#thermal-sensor-cells' in node /soc/thermal@91a0000 or bad phandle (referred from thermal-sensors[0])
   arch/arm/boot/dts/st/stih418-b2199.dtb: /clocks: failed to match any schema with compatible: ['st,stih418-clk', 'simple-bus']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /clocks/clockgen-a9@92b0000: failed to match any schema with compatible: ['st,clkgen-c32']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /clocks/clockgen-a9@92b0000/clockgen-a9-pll: failed to match any schema with compatible: ['st,stih418-clkgen-plla9']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /clocks/clockgen-a9@92b0000/clk-m-a9: failed to match any schema with compatible: ['st,stih407-clkgen-a9-mux', 'st,clkgen-mux']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /clocks/clockgen-a9@92b0000/clk-m-a9: failed to match any schema with compatible: ['st,stih407-clkgen-a9-mux', 'st,clkgen-mux']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /clocks/clockgen-a@90ff000: failed to match any schema with compatible: ['st,clkgen-c32']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /clocks/clockgen-a@90ff000/clk-s-a0-pll: failed to match any schema with compatible: ['st,clkgen-pll0-a0']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /clocks/clockgen-a@90ff000/clk-s-a0-flexgen: failed to match any schema with compatible: ['st,flexgen', 'st,flexgen-stih410-a0']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /clocks/clockgen-a@90ff000/clk-s-a0-flexgen: failed to match any schema with compatible: ['st,flexgen', 'st,flexgen-stih410-a0']
   arch/arm/boot/dts/st/stih418-b2199.dtb: /clocks/clockgen-c@9103000: failed to match any schema with compatible: ['st,clkgen-c32']
--
>> arch/arm/boot/dts/st/stih418.dtsi:51.28-79.5: Warning (thermal_sensors_property): /thermal-zones/cpu-thermal: Missing property '#thermal-sensor-cells' in node /soc/thermal@91a0000 or bad phandle (referred from thermal-sensors[0])
   arch/arm/boot/dts/st/stih418-b2264.dtb: /clocks: failed to match any schema with compatible: ['st,stih418-clk', 'simple-bus']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /clocks/clockgen-a9@92b0000: failed to match any schema with compatible: ['st,clkgen-c32']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /clocks/clockgen-a9@92b0000/clockgen-a9-pll: failed to match any schema with compatible: ['st,stih418-clkgen-plla9']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /clocks/clockgen-a9@92b0000/clk-m-a9: failed to match any schema with compatible: ['st,stih407-clkgen-a9-mux', 'st,clkgen-mux']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /clocks/clockgen-a9@92b0000/clk-m-a9: failed to match any schema with compatible: ['st,stih407-clkgen-a9-mux', 'st,clkgen-mux']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /clocks/clockgen-a@90ff000: failed to match any schema with compatible: ['st,clkgen-c32']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /clocks/clockgen-a@90ff000/clk-s-a0-pll: failed to match any schema with compatible: ['st,clkgen-pll0-a0']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /clocks/clockgen-a@90ff000/clk-s-a0-flexgen: failed to match any schema with compatible: ['st,flexgen', 'st,flexgen-stih410-a0']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /clocks/clockgen-a@90ff000/clk-s-a0-flexgen: failed to match any schema with compatible: ['st,flexgen', 'st,flexgen-stih410-a0']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /clocks/clockgen-c@9103000: failed to match any schema with compatible: ['st,clkgen-c32']

vim +51 arch/arm/boot/dts/st/stih418.dtsi

  > 51			cpu_thermal: cpu-thermal {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
