Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04639AE4E42
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 22:43:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A110BC36B13;
	Mon, 23 Jun 2025 20:43:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A1B6C36B0F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 20:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750711403; x=1782247403;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZF8iOADmf8w+7qUTaik1sR5sLxxucpt9xz9r6IIBx8E=;
 b=m2Gx2QLTZX6LD6wfW9YGJYjKfWRA80CSfKOfJnB52pSiGwkz9RVWJ6e7
 huf0zrvy9qARIg/+r5ADLgbO88F21X6fDnc+OqFwnDSUhKdWrAdKYAwOY
 Sza5OOpRcNmnctxER1H3Gw8nccRvcgUx/JPTfhPjsgWi4g/UlvHR2Vm3q
 ctyeVMMd8SawFwqb3VFbW07X7tbFmCcF6/TBYcscpgRoe5df9G7sPAzfl
 MMdhk86qoW9YeqHcZlGM5zUGdgjTlLxZLxIoPRCb3RCny2BjrkKCKb8Dw
 U770yz+Rake+Aah2ckDj4N7rCutamWbAR9Oz3HBvTfAZI3TKoYKI2kfXn Q==;
X-CSE-ConnectionGUID: mVMLLG/wQLGmKCsdEeQkww==
X-CSE-MsgGUID: tfm9cIXaR1W9SemjoZZF8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="40547181"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="40547181"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 13:43:21 -0700
X-CSE-ConnectionGUID: vhpMNoOJRVyHoigd9p+7Iw==
X-CSE-MsgGUID: sLayHnBySu6O9o+QgzInsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="151185395"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 23 Jun 2025 13:43:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uTo0W-000PJq-2Z;
 Mon, 23 Jun 2025 20:43:12 +0000
Date: Tue, 24 Jun 2025 04:43:02 +0800
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
Message-ID: <202506240401.zlRG1qiO-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 86731a2a651e58953fc949573895f2fa6d456841]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-Le-Goffic/bu=
s-firewall-move-stm32_firewall-header-file-in-include-folder/20250623-173554
base:   86731a2a651e58953fc949573895f2fa6d456841
patch link:    https://lore.kernel.org/r/20250623-ddrperfm-upstream-v1-6-7d=
ffff168090%40foss.st.com
patch subject: [PATCH 06/13] perf: stm32: introduce DDRPERFM driver
config: i386-buildonly-randconfig-002-20250624 (https://download.01.org/0da=
y-ci/archive/20250624/202506240401.zlRG1qiO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250624/202506240401.zlRG1qiO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240401.zlRG1qiO-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   drivers/perf/stm32_ddr_pmu.c: In function 'stm32_ddr_start_counters':
>> drivers/perf/stm32_ddr_pmu.c:205:9: error: implicit declaration of funct=
ion 'writel_relaxed' [-Werror=3Dimplicit-function-declaration]
     205 |         writel_relaxed(r->start.mask, pmu->membase + r->start.re=
g);
         |         ^~~~~~~~~~~~~~
   drivers/perf/stm32_ddr_pmu.c: In function 'stm32_ddr_clear_counter':
>> drivers/perf/stm32_ddr_pmu.c:232:22: error: implicit declaration of func=
tion 'readl_relaxed' [-Werror=3Dimplicit-function-declaration]
     232 |         u32 status =3D readl_relaxed(pmu->membase + r->status.re=
g);
         |                      ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/writel_relaxed +205 drivers/perf/stm32_ddr_pmu.c

   200	=

   201	static void stm32_ddr_start_counters(struct stm32_ddr_pmu *pmu)
   202	{
   203		const struct stm32_ddr_pmu_regspec *r =3D pmu->cfg->regs;
   204	=

 > 205		writel_relaxed(r->start.mask, pmu->membase + r->start.reg);
   206	}
   207	=

   208	static void stm32_ddr_stop_counters(struct stm32_ddr_pmu *pmu)
   209	{
   210		const struct stm32_ddr_pmu_regspec *r =3D pmu->cfg->regs;
   211	=

   212		writel_relaxed(r->stop.mask, pmu->membase + r->stop.reg);
   213	}
   214	=

   215	static void stm32_ddr_clear_time_counter(struct stm32_ddr_pmu *pmu)
   216	{
   217		const struct stm32_ddr_pmu_regspec *r =3D pmu->cfg->regs;
   218	=

   219		writel_relaxed(r->clear_time.mask, pmu->membase + r->clear_time.reg=
);
   220	}
   221	=

   222	static void stm32_ddr_clear_event_counter(struct stm32_ddr_pmu *pmu,=
 struct stm32_ddr_cnt *counter)
   223	{
   224		const struct stm32_ddr_pmu_regspec *r =3D pmu->cfg->regs;
   225	=

   226		writel_relaxed(r->clear_cnt.mask & BIT(counter->idx), pmu->membase =
+ r->clear_cnt.reg);
   227	}
   228	=

   229	static void stm32_ddr_clear_counter(struct stm32_ddr_pmu *pmu, struc=
t stm32_ddr_cnt *counter)
   230	{
   231		const struct stm32_ddr_pmu_regspec *r =3D pmu->cfg->regs;
 > 232		u32 status =3D readl_relaxed(pmu->membase + r->status.reg);
   233	=

   234		if (counter->idx =3D=3D pmu->cfg->time_cnt_idx)
   235			stm32_ddr_clear_time_counter(pmu);
   236		else
   237			stm32_ddr_clear_event_counter(pmu, counter);
   238	=

   239		if (status & r->status.mask)
   240			dev_err(pmu->dev, "Failed to clear counter %i because the PMU is b=
usy\n",
   241				counter->idx);
   242	}
   243	=


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
