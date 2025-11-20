Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E5AC722E3
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Nov 2025 05:26:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99FD0C1A97F;
	Thu, 20 Nov 2025 04:26:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAFE4C290A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Nov 2025 04:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763612785; x=1795148785;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AoBCatCcUTo8pQY7B3M+B7FHb9s+7p9nuNzOnOSP1Pg=;
 b=iv/FOVhRL/ndcIlC5/ezew4I0RMkf5Y2l5BayDqtC78jjX3deikmnv7b
 qwYe5QLtxtwcPor98K/fNcFqaSFlI+kpLTGEySBQ98FiBLWPR0med2Qj4
 BOGeMFgOSIuUUPQkdY+VFSKPNX5uNwh75JPCZkkkc+xP81ZapB1NBZ8W+
 6CxRrnKmZ9+6raJjD7UzSDq692dzWebYfi1kCEFw5+Zm2h2nIYjdrTw4A
 P9+BqoTyyt7KcTmUz2F2gjMrXboNsDJi8sbVYweTF1jQiUuHgjf5ZqeEI
 UaWAvjN7Uoa2hF/HQPE4qI3spZTrK8Vs2o4tqCdIDMI9guYshgCGWfyNZ g==;
X-CSE-ConnectionGUID: 7pFnfwOWRbeMeQIdWwxweA==
X-CSE-MsgGUID: cB9fkrciQziUH0vd2kP31w==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65758469"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="65758469"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 20:26:22 -0800
X-CSE-ConnectionGUID: Af/weTQ1RIqEzViG3Qz70w==
X-CSE-MsgGUID: 0Jb0A23gS9Gn7dgzvYydzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="191511784"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 19 Nov 2025 20:26:19 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vLwFN-0003bL-0O;
 Thu, 20 Nov 2025 04:26:17 +0000
Date: Thu, 20 Nov 2025 12:25:24 +0800
From: kernel test robot <lkp@intel.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <202511200853.efuVxuoM-lkp@intel.com>
References: <20251118161936.1085477-6-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251118161936.1085477-6-antonio.borneo@foss.st.com>
Cc: Pascal Paillet <p.paillet@foss.st.com>,
 =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH v2 05/15] pinctrl: stm32: add new package
 to stm32mp257 pinctrl support
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

Hi Antonio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 61cbe48d9d1ff277bc54051fbab8b733b2e64ccb]

url:    https://github.com/intel-lab-lkp/linux/commits/Antonio-Borneo/pinct=
rl-stm32-accept-string-value-for-property-st-package/20251119-011734
base:   61cbe48d9d1ff277bc54051fbab8b733b2e64ccb
patch link:    https://lore.kernel.org/r/20251118161936.1085477-6-antonio.b=
orneo%40foss.st.com
patch subject: [PATCH v2 05/15] pinctrl: stm32: add new package to stm32mp2=
57 pinctrl support
config: microblaze-randconfig-r111-20251120 (https://download.01.org/0day-c=
i/archive/20251120/202511200853.efuVxuoM-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20251120/202511200853.efuVxuoM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200853.efuVxuoM-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/stm32/pinctrl-stm32.c:143:10: sparse: sparse: Initialize=
r entry defined twice
   drivers/pinctrl/stm32/pinctrl-stm32.c:144:10: sparse:   also defined here

vim +143 drivers/pinctrl/stm32/pinctrl-stm32.c

f263343bb793fa Antonio Borneo    2025-11-18  130  =

f263343bb793fa Antonio Borneo    2025-11-18  131  static const char * const=
 stm32_pkgs[] =3D {
f263343bb793fa Antonio Borneo    2025-11-18  132  	/*
f263343bb793fa Antonio Borneo    2025-11-18  133  	 * Default dummy value, =
as match_string() doesn't accepts NULL.
f263343bb793fa Antonio Borneo    2025-11-18  134  	 * Also not an empty str=
ing because it will match the old numeric
f263343bb793fa Antonio Borneo    2025-11-18  135  	 * values <=3D 0x00fffff=
f.
f263343bb793fa Antonio Borneo    2025-11-18  136  	 */
f263343bb793fa Antonio Borneo    2025-11-18  137  	[0 ... (STM32_PKG_MAX - =
1)] =3D "x",
f263343bb793fa Antonio Borneo    2025-11-18  138  =

f263343bb793fa Antonio Borneo    2025-11-18  139  	[STM32_PKG_AA] =3D "AA",
f263343bb793fa Antonio Borneo    2025-11-18  140  	[STM32_PKG_AB] =3D "AB",
f263343bb793fa Antonio Borneo    2025-11-18  141  	[STM32_PKG_AC] =3D "AC",
f263343bb793fa Antonio Borneo    2025-11-18  142  	[STM32_PKG_AD] =3D "AD",
f263343bb793fa Antonio Borneo    2025-11-18 @143  	[STM32_PKG_AI] =3D "AI",
66cbedfcc7caae Cl=E9ment Le Goffic 2025-11-18  144  	[STM32_PKG_AI] =3D "AJ=
",
f263343bb793fa Antonio Borneo    2025-11-18  145  	[STM32_PKG_AK] =3D "AK",
f263343bb793fa Antonio Borneo    2025-11-18  146  	[STM32_PKG_AL] =3D "AL",
f263343bb793fa Antonio Borneo    2025-11-18  147  };
f263343bb793fa Antonio Borneo    2025-11-18  148  =


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
