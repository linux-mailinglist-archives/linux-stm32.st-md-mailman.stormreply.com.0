Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A83CAC6CF2
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 17:36:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FA15C36B38;
	Wed, 28 May 2025 15:36:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EC3EC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 15:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748446585; x=1779982585;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NyxJjdO0uqLgRbXeG3fMSXDtDw3lT9wwstsorauv94E=;
 b=OCeUZ5ZyAPJ7zEuTg/L9QQRXzC/vkNOKcqZSTMi1/x1h9uiXmNnznN04
 wg9m9B584/ma/smNrHC4Aq/4yopUgaXIx4uBa6U9G+JbpC78tadDDhBaz
 /KOxfpB97czzCocbS71u0CsOIJaSLbuKofxPUonFbNfmpfyaK+K4uwVi1
 FypwzTQeghBU3Ml1j851k9NaDDrjLAbIRANhQVnzSLUhnnKWnkVGCEW7J
 5Nsjmv4VT3dDm9rb0siLYF81iwFmP3V2qJkkkMe0G7qJ7hP0bU4GBSwL8
 vhK3lAAhAUW+kXlonr7GRZi+BmOQFbAKCsE284cVySTQs5MzRr1nPGGos g==;
X-CSE-ConnectionGUID: 967VzAhaT4KNnGMGc6GrFg==
X-CSE-MsgGUID: SVYjKdyXRIiz/rpJ3kLc0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67894307"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="67894307"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 08:36:22 -0700
X-CSE-ConnectionGUID: ZOSc//TGTDiNqLFdZkNVow==
X-CSE-MsgGUID: 4kneYjTAQt+FRNP8RxgZhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="147154189"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 28 May 2025 08:36:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uKIpE-000VnY-2r;
 Wed, 28 May 2025 15:36:16 +0000
Date: Wed, 28 May 2025 23:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <202505282333.T9mzfGT8-lkp@intel.com>
References: <20250528-hdp-upstream-v4-4-7e9b3ad2036d@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250528-hdp-upstream-v4-4-7e9b3ad2036d@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32]
 =?iso-8859-1?q?=5BPATCH_v4_4/9=5D_MAINTAINERS=3A_ad?=
 =?iso-8859-1?q?d_Cl=E9ment_Le_Goffic_as_STM32_HDP_maintainer?=
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Cl=E9ment,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a08b2b34239e63bd839078de98911d3653cdab83]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-Le-Goffic/gp=
io-mmio-add-BGPIOF_NO_INPUT-flag-for-GPO-gpiochip/20250528-213620
base:   a08b2b34239e63bd839078de98911d3653cdab83
patch link:    https://lore.kernel.org/r/20250528-hdp-upstream-v4-4-7e9b3ad=
2036d%40foss.st.com
patch subject: [PATCH v4 4/9] MAINTAINERS: add Cl=E9ment Le Goffic as STM32=
 HDP maintainer
reproduce: (https://download.01.org/0day-ci/archive/20250528/202505282333.T=
9mzfGT8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505282333.T9mzfGT8-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst r=
eferences a file that doesn't exist: Documentation/translations/ja_JP/Submi=
tChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst referen=
ces a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging=
.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kern=
el-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst referen=
ces a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging=
.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kern=
el-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation=
/devicetree/bindings/pinctrl/st,stm32-pinctrl-hdp.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation=
/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre=
-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1799: htmldocs] Error 2
   make: *** [Makefile:248: __sub-make] Error 2

-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
