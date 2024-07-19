Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1D0937D9B
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Jul 2024 00:00:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0D4CC7801A;
	Fri, 19 Jul 2024 21:59:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 510D5C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2024 21:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721426399; x=1752962399;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=042WQKRj4OmnLPX3zC90dFEG5O4KeJ7wH4dUKSkiFTk=;
 b=RGVjYG/XJsSviA95etghk0xUEWJj+oolkRASABzTbS6PKNJjvspsg60d
 xIBoYUydFbpSz8kweQsOPRmh6O3+O8KrbJu1YyUflynsf5evezyf7n04i
 i1NgXOKZp8pQ0swNYBtURgZbTv3VfaMqoRt3lINZUs9LO/bK9P52UB9O/
 aIlo2zQLm7dwp7Qj2YJ9uIfnAlh9RuIGPyNY2/94iIwVePSo/EU8sFW9B
 HgNuwgxybOWNKwz3s7zStQEiCFH8dNyaOmYh9dPa5E/ZbWGi2CZcoDtHE
 0tk5m/ly0Ufa4w35+5kfcLxD6XgfSl1sl2eq3Ya2dopFefTRp0n65gu8N Q==;
X-CSE-ConnectionGUID: hvD65toJQEqZIgq6uWXtDQ==
X-CSE-MsgGUID: dBOEF5MRRoG/ZAR6iU7K4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="19020350"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="19020350"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 14:59:51 -0700
X-CSE-ConnectionGUID: F/bzdlzZSkiTe4ND6zZ2ug==
X-CSE-MsgGUID: TQzoEX+vSLusdXlSLjtmOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="56091844"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 19 Jul 2024 14:59:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sUvdh-000icc-0k;
 Fri, 19 Jul 2024 21:59:45 +0000
Date: Sat, 20 Jul 2024 05:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Caron <valentin.caron@foss.st.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <202407200400.NnW2fJ0q-lkp@intel.com>
References: <20240717074835.2210411-3-valentin.caron@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240717074835.2210411-3-valentin.caron@foss.st.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/4] rtc: stm32: add pinctrl and pinmux
	interfaces
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

Hi Valentin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on atorgue-stm32/stm32-next robh/for-next linus/master v6.10 next-20240719]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentin-Caron/dt-bindings-rtc-stm32-describe-pinmux-nodes/20240717-193541
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20240717074835.2210411-3-valentin.caron%40foss.st.com
patch subject: [PATCH v2 2/4] rtc: stm32: add pinctrl and pinmux interfaces
config: alpha-kismet-CONFIG_GENERIC_PINCONF-CONFIG_RTC_DRV_STM32-0-0 (https://download.01.org/0day-ci/archive/20240720/202407200400.NnW2fJ0q-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240720/202407200400.NnW2fJ0q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407200400.NnW2fJ0q-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GENERIC_PINCONF when selected by RTC_DRV_STM32
   WARNING: unmet direct dependencies detected for GENERIC_PINCONF
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - RTC_DRV_STM32 [=y] && RTC_CLASS [=y] && (ARCH_STM32 || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for PINMUX
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - RTC_DRV_STM32 [=y] && RTC_CLASS [=y] && (ARCH_STM32 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
