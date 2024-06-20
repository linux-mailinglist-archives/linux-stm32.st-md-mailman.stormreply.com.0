Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95044911144
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 20:49:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3242EC7128D;
	Thu, 20 Jun 2024 18:49:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E24DC6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 18:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718909363; x=1750445363;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QJZpOt1LOMceNB+eu4dXjCRhvIJzEQIZT+qwmbq+i78=;
 b=GMRx5Lvln9h9MffB2YQwjm0rVx6qwVSrwtOztSY/E2n+v6uNbOwpqY5V
 MJzb6Ll91vC6IP8Lbjy/3x3aHmuc9DSLp+89IgIpvkxdYwEne3Ft3rV4r
 Os3teODMRT/OZrtQgrIzG0iIAvqQ/y084mq28S7Xk1td6d2NMoouvpRBW
 PxLvjWudVtwMH/m/c55oEc5kRthiR+4Sr5n1hXcApA2mSjkOfNUXNj3y7
 nts3pxPRJ7CSb5HJX9x/YTXg6ovv5TRbQikbRYfHhHvLHpSTZcW8ADaNY
 a4dAGa3surIC0MATnO4RxvaZm/B1nlA7Frq2XREbTOFFVY95cCysxG1z2 Q==;
X-CSE-ConnectionGUID: KTZECodbR4CV4Fs4epVRAA==
X-CSE-MsgGUID: 44nsLzG1SNOakxsb1TozCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15620471"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="15620471"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 11:49:20 -0700
X-CSE-ConnectionGUID: PKCHph8YRaCCUr9ccXCaPQ==
X-CSE-MsgGUID: fgMPy6ybS9GH7Oj6y/eFvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42197407"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 20 Jun 2024 11:49:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sKMqQ-0007qP-1Q;
 Thu, 20 Jun 2024 18:49:14 +0000
Date: Fri, 21 Jun 2024 02:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: Pascal Paillet <p.paillet@foss.st.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Message-ID: <202406210259.JQqO3vyI-lkp@intel.com>
References: <20240619083602.33007-5-p.paillet@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240619083602.33007-5-p.paillet@foss.st.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>, p.paillet@foss.st.com,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH 4/4] arm64: stm32: enable scmi regulator
	for stm32
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

Hi Pascal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on atorgue-stm32/stm32-next robh/for-next linus/master v6.10-rc4 next-20240620]
[cannot apply to arm-perf/for-next/perf]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pascal-Paillet/dt-bindings-add-STM32MP25-regulator-bindings/20240619-163908
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20240619083602.33007-5-p.paillet%40foss.st.com
patch subject: [PATCH 4/4] arm64: stm32: enable scmi regulator for stm32
config: arm64-kismet-CONFIG_REGULATOR_ARM_SCMI-CONFIG_ARCH_STM32-0-0 (https://download.01.org/0day-ci/archive/20240621/202406210259.JQqO3vyI-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240621/202406210259.JQqO3vyI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210259.JQqO3vyI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for REGULATOR_ARM_SCMI when selected by ARCH_STM32
   WARNING: unmet direct dependencies detected for REGULATOR_ARM_SCMI
     Depends on [n]: REGULATOR [=n] && ARM_SCMI_PROTOCOL [=y] && OF [=y]
     Selected by [y]:
     - ARCH_STM32 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
