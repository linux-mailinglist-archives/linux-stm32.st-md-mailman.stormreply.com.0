Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C7C919B08
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 01:08:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE407C6DD9F;
	Wed, 26 Jun 2024 23:08:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4059CC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 23:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719443281; x=1750979281;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bGsS6QAH1iQGXflkC3m0fScbHj4wlKNAw4ntnVc0CEY=;
 b=OYX49KiW9fSzXo9FadQdh+Xgm3OO7fXTnUpjdw3HuE1UGuKyCeYnbXZX
 rCPht2BwQx4O8avidFn5sqekI53oXTZBJvuJWVK9zY8dlAU9YqH/pGZtB
 ByhO1UfCBbKmfyIjGI65UeCBKgoIBk+1BrgC1gcfiNaRXXI6cdeKn2QuG
 eXCBXODeppDiwYyZPLp2Vn7v31/gGBGjLtXfeWsSmP1yJqctP3HoDNdft
 LQFgwRNjUywWTvQ2QkPupTtcw624sbt8s06EJK9Zhd208XQVb/fR3VugT
 Ic8FNlkM3RrsWrZhoaOXw3b5xvnCngwPA87rZDMOEN4IO/6T/TbgDI+6L g==;
X-CSE-ConnectionGUID: HBsAksaAT/Wpd6oaMeWXZw==
X-CSE-MsgGUID: Wb/1WZ0dSU6U7q7kH5FAwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="34078214"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="34078214"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 16:07:53 -0700
X-CSE-ConnectionGUID: V9jZL/3xQI6a9qnQu9Z9UQ==
X-CSE-MsgGUID: LAfmfYIOQZ2TdpOB7fLhaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="67390811"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 26 Jun 2024 16:07:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sMbjv-000Fe6-1J;
 Wed, 26 Jun 2024 23:07:47 +0000
Date: Thu, 27 Jun 2024 07:06:56 +0800
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
Message-ID: <202406270605.qodaWd4n-lkp@intel.com>
References: <20240625-thermal-v2-2-bf8354ed51ee@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240625-thermal-v2-2-bf8354ed51ee@gmail.com>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/3] thermal: sti: depend on THERMAL_OF
	subsystem
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
patch link:    https://lore.kernel.org/r/20240625-thermal-v2-2-bf8354ed51ee%40gmail.com
patch subject: [PATCH v2 2/3] thermal: sti: depend on THERMAL_OF subsystem
config: arm64-kismet-CONFIG_ST_THERMAL-CONFIG_ST_THERMAL_MEMMAP-0-0 (https://download.01.org/0day-ci/archive/20240627/202406270605.qodaWd4n-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240627/202406270605.qodaWd4n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406270605.qodaWd4n-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ST_THERMAL when selected by ST_THERMAL_MEMMAP
   WARNING: unmet direct dependencies detected for ST_THERMAL
     Depends on [n]: THERMAL [=y] && (ARCH_STI || ARCH_STM32 [=y]) && OF [=y] && THERMAL_OF [=n]
     Selected by [y]:
     - ST_THERMAL_MEMMAP [=y] && THERMAL [=y] && (ARCH_STI || ARCH_STM32 [=y]) && OF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
