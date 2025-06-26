Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 467E5AEAAE8
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Jun 2025 01:53:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEDA7C36B3C;
	Thu, 26 Jun 2025 23:53:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71B87C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jun 2025 23:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750981998; x=1782517998;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SN/NGzVIJgralBcDDuVPGj29WH5pdAz4U3HXHsEVx8s=;
 b=UuxgUe+jRjhAGbc3PbQ0RjSKBaNHKHh9NrsOLXyybVqNL+bMF/oomr/N
 nedPCGlMh4u90ZBriF2NgF8gkEo2V5czYpdLusOE8vN6Eilv1KH3jnNb5
 9ahoXkEujLdoc/wcY0v4jhCqvSeoWe/bMhDQTu8HC0b1MaTJ3ObMWyAV5
 eXXNoizFiC19jGNfifblXHw0WsNLv9xk6Uka7jqKAG69bvQsM4iYI1T1h
 sEGwHC9EgDekosQhxoGm+tAiuXSS+L4kPqJt0jS5GQ65DM43l03C3XTuQ
 BHdjhie22vNIwoS+Y7Wk0wVn0H2fb7r1TfOsTuYvdioWvA/E/mfaRqI9R w==;
X-CSE-ConnectionGUID: xp3I5QNsTIudWxXvUM66Gg==
X-CSE-MsgGUID: OcJiro0yStW2ZXNQsI12sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53236096"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="53236096"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 16:53:16 -0700
X-CSE-ConnectionGUID: gp+S1qc3Qt+VQ3YEWjmHMQ==
X-CSE-MsgGUID: FWOuogMYQS6kHK1SwV6JTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="183554204"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 26 Jun 2025 16:53:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uUwOz-000VeA-2T;
 Thu, 26 Jun 2025 23:53:09 +0000
Date: Fri, 27 Jun 2025 07:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Message-ID: <202506270708.6w6phhmi-lkp@intel.com>
References: <20250623-ddrperfm-upstream-v1-6-7dffff168090@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250623-ddrperfm-upstream-v1-6-7dffff168090@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 06/13] perf: stm32: introduce DDRPERFM
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

[auto build test WARNING on 86731a2a651e58953fc949573895f2fa6d456841]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-Le-Goffic/bu=
s-firewall-move-stm32_firewall-header-file-in-include-folder/20250623-173554
base:   86731a2a651e58953fc949573895f2fa6d456841
patch link:    https://lore.kernel.org/r/20250623-ddrperfm-upstream-v1-6-7d=
ffff168090%40foss.st.com
patch subject: [PATCH 06/13] perf: stm32: introduce DDRPERFM driver
config: i386-buildonly-randconfig-004-20250627 (https://download.01.org/0da=
y-ci/archive/20250627/202506270708.6w6phhmi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250627/202506270708.6w6phhmi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506270708.6w6phhmi-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/perf/stm32_ddr_pmu.c: In function 'stm32_ddr_start_counters':
   drivers/perf/stm32_ddr_pmu.c:205:9: error: implicit declaration of funct=
ion 'writel_relaxed' [-Werror=3Dimplicit-function-declaration]
     205 |         writel_relaxed(r->start.mask, pmu->membase + r->start.re=
g);
         |         ^~~~~~~~~~~~~~
   drivers/perf/stm32_ddr_pmu.c: In function 'stm32_ddr_clear_counter':
   drivers/perf/stm32_ddr_pmu.c:232:22: error: implicit declaration of func=
tion 'readl_relaxed' [-Werror=3Dimplicit-function-declaration]
     232 |         u32 status =3D readl_relaxed(pmu->membase + r->status.re=
g);
         |                      ^~~~~~~~~~~~~
   drivers/perf/stm32_ddr_pmu.c: At top level:
>> drivers/perf/stm32_ddr_pmu.c:862:34: warning: 'stm32_ddr_pmu_of_match' d=
efined but not used [-Wunused-const-variable=3D]
     862 | static const struct of_device_id stm32_ddr_pmu_of_match[] =3D {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/stm32_ddr_pmu_of_match +862 drivers/perf/stm32_ddr_pmu.c

   861	=

 > 862	static const struct of_device_id stm32_ddr_pmu_of_match[] =3D {
   863		{
   864			.compatible =3D "st,stm32mp131-ddr-pmu",
   865			.data =3D &stm32_ddr_pmu_cfg_mp1
   866		},
   867		{
   868			.compatible =3D "st,stm32mp151-ddr-pmu",
   869			.data =3D &stm32_ddr_pmu_cfg_mp1
   870		},
   871		{
   872			.compatible =3D "st,stm32mp251-ddr-pmu",
   873			.data =3D &stm32_ddr_pmu_cfg_mp2
   874		},
   875		{ },
   876	};
   877	MODULE_DEVICE_TABLE(of, stm32_ddr_pmu_of_match);
   878	=


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
