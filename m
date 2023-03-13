Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A75C36B7886
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 14:11:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57D60C6904C;
	Mon, 13 Mar 2023 13:11:26 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D4FDC65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 13:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678713084; x=1710249084;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5/v8hZeX3JHTuddiH+ohsP0faMUyO1GG9lvlYbgaG4s=;
 b=Z9FDokwYc1m+IdWQWOm6fvbXv4xeL4J6FbM2CpTI8vrJvXH71cVn/D4B
 W60/Roiq1UbuuWHzoUv3+FaKdI1Xnd6U+p0AklpKocYGlm6HHE2NYK4gr
 +0StmnUvQZ3v3jgbriuI1XFGhXn3Odgqf8bbLtg6jPWofzG6M+2RvlolA
 jhj1E1BtPVzUjez/5FBvzotxUz6oc/pLuP+x72l9KIMz4eHVH0Wn2UMbl
 8g+M961OQ/hEAXsclFgRLFIXKZ0sXNv0KtHNqIlTQfZ4rgRUHgL5vDGh5
 ZoDZGRTzmjz0R+Ho3qAMjPraitiReKAU4Hhw1liTay3QHsyXtpUjlKc7U g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="316788220"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="316788220"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 06:11:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="671890390"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="671890390"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 13 Mar 2023 06:11:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pbhxP-0005gb-03;
 Mon, 13 Mar 2023 13:11:19 +0000
Date: Mon, 13 Mar 2023 21:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <202303132013.6jB1U6Dg-lkp@intel.com>
References: <20230313075430.2730803-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230313075430.2730803-3-u.kleine-koenig@pengutronix.de>
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH 2/5] clocksource: timer-stm32-lp: Mark
 driver as non-removable
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

Hi Uwe,

I love your patch! Yet something to improve:

[auto build test ERROR on fe15c26ee26efa11741a7b632e9f23b01aca4cc6]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/clo=
cksource-sh_mtu2-Mark-driver-as-non-removable/20230313-155913
base:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
patch link:    https://lore.kernel.org/r/20230313075430.2730803-3-u.kleine-=
koenig%40pengutronix.de
patch subject: [PATCH 2/5] clocksource: timer-stm32-lp: Mark driver as non-=
removable
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230313=
/202303132013.6jB1U6Dg-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d4016ca907c0dd473c1=
f28ce43f4ef2495cf1dd5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Uwe-Kleine-K-nig/clocksource-sh_mt=
u2-Mark-driver-as-non-removable/20230313-155913
        git checkout d4016ca907c0dd473c1f28ce43f4ef2495cf1dd5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Dm68k olddefconfig
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Dm68k SHELL=3D/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303132013.6jB1U6Dg-lkp@int=
el.com/

All errors (new ones prefixed by >>):

>> drivers/clocksource/timer-stm32-lp.c:205:19: error: 'stm32_clkevent_lp_r=
emove' undeclared here (not in a function); did you mean 'stm32_clkevent_lp=
_probe'?
     205 |         .remove =3D stm32_clkevent_lp_remove,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
         |                   stm32_clkevent_lp_probe
   drivers/clocksource/timer-stm32-lp.c:142:12: warning: 'stm32_clkevent_lp=
_probe' defined but not used [-Wunused-function]
     142 | static int stm32_clkevent_lp_probe(struct platform_device *pdev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +205 drivers/clocksource/timer-stm32-lp.c

48b41c5e2de6c5 Benjamin Gaignard 2020-06-03  203  =

48b41c5e2de6c5 Benjamin Gaignard 2020-06-03  204  static struct platform_dr=
iver stm32_clkevent_lp_driver =3D {
48b41c5e2de6c5 Benjamin Gaignard 2020-06-03 @205  	.remove =3D stm32_clkeve=
nt_lp_remove,
48b41c5e2de6c5 Benjamin Gaignard 2020-06-03  206  	.driver	=3D {
48b41c5e2de6c5 Benjamin Gaignard 2020-06-03  207  		.name =3D "stm32-lptime=
r-timer",
48b41c5e2de6c5 Benjamin Gaignard 2020-06-03  208  		.of_match_table =3D of_=
match_ptr(stm32_clkevent_lp_of_match),
d4016ca907c0dd Uwe Kleine-K=F6nig  2023-03-13  209  		.suppress_bind_attrs =
=3D true,
48b41c5e2de6c5 Benjamin Gaignard 2020-06-03  210  	},
48b41c5e2de6c5 Benjamin Gaignard 2020-06-03  211  };
48b41c5e2de6c5 Benjamin Gaignard 2020-06-03  212  module_platform_driver(st=
m32_clkevent_lp_driver);
48b41c5e2de6c5 Benjamin Gaignard 2020-06-03  213  =


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
