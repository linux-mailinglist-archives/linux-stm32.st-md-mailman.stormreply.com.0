Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F3AABFEFB
	for <lists+linux-stm32@lfdr.de>; Wed, 21 May 2025 23:35:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB7DFC78F6A;
	Wed, 21 May 2025 21:35:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE749C78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 May 2025 21:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747863326; x=1779399326;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JY3+EDGgRxvxsrUQbrwFOjb3pPNzoNfUgnXnt2viI8E=;
 b=E9IlQbyP5rNKGwM4xIbCh751kd3O/fuhbN2zmdLziawpmviKR2QcDfYC
 W1Rm3+nQkOvKNo3EtUFojWQMhiS6SM/H4/8tbqW3XVgz4lBXaAcsCJTsl
 IZgoDiYrVXobpg6jpNL9weOdH2SVtJ4xkDToc7+lDhsQO4l77Rx05tREt
 J+TR0xt4LLR/q2w+U2RNEPyx5zAfhHsn5j3VCMskIjPacaXHCL9ZbU337
 sFLenPNL4UUFDpwi1hwQv1/8MDoNx1z4C2bQWI6Cu9Y+Jk+myDM2ZPclh
 xLdAq7sjkF+qCmEnA2cE3EURbS1VtR+O1nAvZKrpnHa9YSgPpMLZTykW+ g==;
X-CSE-ConnectionGUID: sKnsj3PtQRWkOku0mPTFXQ==
X-CSE-MsgGUID: wRKYYU9MQleSojB8aUVUEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61208556"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="61208556"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 14:35:21 -0700
X-CSE-ConnectionGUID: 3aiUfBnrQaSQSzx9A/Y0FQ==
X-CSE-MsgGUID: yUBaWO8+THO92MV2mqshbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="145393226"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 21 May 2025 14:35:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uHr5n-000Oee-2g;
 Wed, 21 May 2025 21:35:15 +0000
Date: Thu, 22 May 2025 05:34:52 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <202505220509.cwmpJvcz-lkp@intel.com>
References: <20250520-hdp-upstream-v2-2-53f6b8b5ffc8@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250520-hdp-upstream-v2-2-53f6b8b5ffc8@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/8] pinctrl: stm32: Introduce HDP
	driver
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

[auto build test WARNING on 09fac5c576bbff764dddf2baca0038b359376fd8]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-Le-Goffic/dt=
-bindings-pinctrl-stm32-Introduce-HDP/20250520-230751
base:   09fac5c576bbff764dddf2baca0038b359376fd8
patch link:    https://lore.kernel.org/r/20250520-hdp-upstream-v2-2-53f6b8b=
5ffc8%40foss.st.com
patch subject: [PATCH v2 2/8] pinctrl: stm32: Introduce HDP driver
config: arc-randconfig-r121-20250522 (https://download.01.org/0day-ci/archi=
ve/20250522/202505220509.cwmpJvcz-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250522/202505220509.c=
wmpJvcz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220509.cwmpJvcz-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/stm32/pinctrl-stm32-hdp.c:720:1: sparse: sparse: symbol =
'stm32_hdp_pm_ops' was not declared. Should it be static?

vim +/stm32_hdp_pm_ops +720 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c

   719	=

 > 720	DEFINE_SIMPLE_DEV_PM_OPS(stm32_hdp_pm_ops, stm32_hdp_suspend, stm32_=
hdp_resume);
   721	=


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
