Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 148F7B16301
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 16:43:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A99AC30883;
	Wed, 30 Jul 2025 14:43:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D475BC3087B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 14:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753886623; x=1785422623;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=idRnj5P4PrYGxexiNDf1IWPLr0mVthPDzs6oUfOLhrM=;
 b=k7+HGMIj2fJh4I80sSzLhN7vtJ63Vs4xfPZzGVtY+8CAKTYSiDzCI8i8
 4GNk7y73M0/AgaddFKqe6M3jZ+Dgd1LB8yY7ihsmDzcXTd30hjDhQOFvT
 RugsZKJM4gMXDQIdnB+yqgd/QdpHAiWkPgtqyfrSWxl4YHsXR4jUSbs5D
 cp568AvD3DOknEi8j7sk0u8r7cr1OxiYZdG6UG7040s4MayiyRGhDdzIz
 N7MB/uKtZfJs8q/Of7TXx3WteK7cqQY7PTEI6lvjo8Iijt0/efUV3pjHz
 I/ubcRFRhnLo4CmTVxupImtXpps/F1YDktJLwT7gSTP7Cl0Wi2vP9zTjA A==;
X-CSE-ConnectionGUID: FlOX4Hf1QgKnJaubkAN/zg==
X-CSE-MsgGUID: AIbKhAJISQOFt5V4Mem4CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="55890918"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55890918"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:43:40 -0700
X-CSE-ConnectionGUID: oTzVPsG9QR+19wHO6VXhaA==
X-CSE-MsgGUID: 8uYbk/j7SeWAaepWravi+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="193987297"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 30 Jul 2025 07:43:34 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uh81k-0002qG-0g;
 Wed, 30 Jul 2025 14:43:32 +0000
Date: Wed, 30 Jul 2025 22:43:04 +0800
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
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Le Goffic <legoffic.clement@gmail.com>,
 Julius Werner <jwerner@chromium.org>
Message-ID: <202507302237.gyVCBmXs-lkp@intel.com>
References: <20250728-ddrperfm-upstream-v5-13-03f1be8ad396@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250728-ddrperfm-upstream-v5-13-03f1be8ad396@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 13/20] perf: stm32: introduce DDRPERFM
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

[auto build test ERROR on 89be9a83ccf1f88522317ce02f854f30d6115c41]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-Le-Goffic/bu=
s-firewall-move-stm32_firewall-header-file-in-include-folder/20250728-234144
base:   89be9a83ccf1f88522317ce02f854f30d6115c41
patch link:    https://lore.kernel.org/r/20250728-ddrperfm-upstream-v5-13-0=
3f1be8ad396%40foss.st.com
patch subject: [PATCH v5 13/20] perf: stm32: introduce DDRPERFM driver
config: s390-randconfig-001-20250730 (https://download.01.org/0day-ci/archi=
ve/20250730/202507302237.gyVCBmXs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250730/202507302237.gyVCBmXs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507302237.gyVCBmXs-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> drivers/perf/stm32_ddr_pmu.c:213:2: error: call to undeclared function '=
writel_relaxed'; ISO C99 and later do not support implicit function declara=
tions [-Wimplicit-function-declaration]
     213 |         writel_relaxed(r->start.mask, pmu->membase + r->start.re=
g);
         |         ^
   drivers/perf/stm32_ddr_pmu.c:220:2: error: call to undeclared function '=
writel_relaxed'; ISO C99 and later do not support implicit function declara=
tions [-Wimplicit-function-declaration]
     220 |         writel_relaxed(r->stop.mask, pmu->membase + r->stop.reg);
         |         ^
   drivers/perf/stm32_ddr_pmu.c:227:2: error: call to undeclared function '=
writel_relaxed'; ISO C99 and later do not support implicit function declara=
tions [-Wimplicit-function-declaration]
     227 |         writel_relaxed(r->clear_time.mask, pmu->membase + r->cle=
ar_time.reg);
         |         ^
   drivers/perf/stm32_ddr_pmu.c:234:2: error: call to undeclared function '=
writel_relaxed'; ISO C99 and later do not support implicit function declara=
tions [-Wimplicit-function-declaration]
     234 |         writel_relaxed(r->clear_cnt.mask & BIT(counter->idx), pm=
u->membase + r->clear_cnt.reg);
         |         ^
>> drivers/perf/stm32_ddr_pmu.c:240:15: error: call to undeclared function =
'readl_relaxed'; ISO C99 and later do not support implicit function declara=
tions [-Wimplicit-function-declaration]
     240 |         u32 status =3D readl_relaxed(pmu->membase + r->status.re=
g);
         |                      ^
   drivers/perf/stm32_ddr_pmu.c:255:12: error: call to undeclared function =
'readl_relaxed'; ISO C99 and later do not support implicit function declara=
tions [-Wimplicit-function-declaration]
     255 |         u32 val =3D readl_relaxed(pmu->membase + r->enable.reg);
         |                   ^
   drivers/perf/stm32_ddr_pmu.c:258:2: error: call to undeclared function '=
writel_relaxed'; ISO C99 and later do not support implicit function declara=
tions [-Wimplicit-function-declaration]
     258 |         writel_relaxed(val, pmu->membase + r->enable.reg);
         |         ^
   drivers/perf/stm32_ddr_pmu.c:264:12: error: call to undeclared function =
'readl_relaxed'; ISO C99 and later do not support implicit function declara=
tions [-Wimplicit-function-declaration]
     264 |         u32 val =3D readl_relaxed(pmu->membase + r->enable.reg);
         |                   ^
   drivers/perf/stm32_ddr_pmu.c:267:2: error: call to undeclared function '=
writel_relaxed'; ISO C99 and later do not support implicit function declara=
tions [-Wimplicit-function-declaration]
     267 |         writel_relaxed(val, pmu->membase + r->enable.reg);
         |         ^
   drivers/perf/stm32_ddr_pmu.c:285:17: error: call to undeclared function =
'readl_relaxed'; ISO C99 and later do not support implicit function declara=
tions [-Wimplicit-function-declaration]
     285 |                 cnt_sel_val =3D readl_relaxed(pmu->membase + r->=
cfg.reg);
         |                               ^
   drivers/perf/stm32_ddr_pmu.c:288:3: error: call to undeclared function '=
writel_relaxed'; ISO C99 and later do not support implicit function declara=
tions [-Wimplicit-function-declaration]
     288 |                 writel_relaxed(cnt_sel_val, pmu->membase + r->cf=
g.reg);
         |                 ^
   drivers/perf/stm32_ddr_pmu.c:302:16: error: call to undeclared function =
'readl_relaxed'; ISO C99 and later do not support implicit function declara=
tions [-Wimplicit-function-declaration]
     302 |         cnt_sel_val =3D readl_relaxed(pmu->membase + cnt_sel_evt=
_reg);
         |                       ^
   drivers/perf/stm32_ddr_pmu.c:306:2: error: call to undeclared function '=
writel_relaxed'; ISO C99 and later do not support implicit function declara=
tions [-Wimplicit-function-declaration]
     306 |         writel_relaxed(cnt_sel_val, pmu->membase + cnt_sel_evt_r=
eg);
         |         ^
   drivers/perf/stm32_ddr_pmu.c:428:9: error: call to undeclared function '=
readl_relaxed'; ISO C99 and later do not support implicit function declarat=
ions [-Wimplicit-function-declaration]
     428 |                 val =3D readl_relaxed(pmu->membase + r->counter_=
evt[counter->idx].reg);
         |                       ^
   drivers/perf/stm32_ddr_pmu.c:778:3: error: call to undeclared function '=
writel_relaxed'; ISO C99 and later do not support implicit function declara=
tions [-Wimplicit-function-declaration]
     778 |                 writel_relaxed(pmu->dram_type, pmu->membase + pm=
u->cfg->regs->dram_inf.reg);
         |                 ^
   drivers/perf/stm32_ddr_pmu.c:803:2: error: call to undeclared function '=
writel_relaxed'; ISO C99 and later do not support implicit function declara=
tions [-Wimplicit-function-declaration]
     803 |         writel_relaxed(pmu->dram_type, pmu->membase + pmu->cfg->=
regs->dram_inf.reg);
         |         ^
   16 errors generated.


vim +/writel_relaxed +213 drivers/perf/stm32_ddr_pmu.c

   208	=

   209	static void stm32_ddr_start_counters(struct stm32_ddr_pmu *pmu)
   210	{
   211		const struct stm32_ddr_pmu_regspec *r =3D pmu->cfg->regs;
   212	=

 > 213		writel_relaxed(r->start.mask, pmu->membase + r->start.reg);
   214	}
   215	=

   216	static void stm32_ddr_stop_counters(struct stm32_ddr_pmu *pmu)
   217	{
   218		const struct stm32_ddr_pmu_regspec *r =3D pmu->cfg->regs;
   219	=

   220		writel_relaxed(r->stop.mask, pmu->membase + r->stop.reg);
   221	}
   222	=

   223	static void stm32_ddr_clear_time_counter(struct stm32_ddr_pmu *pmu)
   224	{
   225		const struct stm32_ddr_pmu_regspec *r =3D pmu->cfg->regs;
   226	=

   227		writel_relaxed(r->clear_time.mask, pmu->membase + r->clear_time.reg=
);
   228	}
   229	=

   230	static void stm32_ddr_clear_event_counter(struct stm32_ddr_pmu *pmu,=
 struct stm32_ddr_cnt *counter)
   231	{
   232		const struct stm32_ddr_pmu_regspec *r =3D pmu->cfg->regs;
   233	=

   234		writel_relaxed(r->clear_cnt.mask & BIT(counter->idx), pmu->membase =
+ r->clear_cnt.reg);
   235	}
   236	=

   237	static void stm32_ddr_clear_counter(struct stm32_ddr_pmu *pmu, struc=
t stm32_ddr_cnt *counter)
   238	{
   239		const struct stm32_ddr_pmu_regspec *r =3D pmu->cfg->regs;
 > 240		u32 status =3D readl_relaxed(pmu->membase + r->status.reg);
   241	=

   242		if (counter->idx =3D=3D pmu->cfg->time_cnt_idx)
   243			stm32_ddr_clear_time_counter(pmu);
   244		else
   245			stm32_ddr_clear_event_counter(pmu, counter);
   246	=

   247		if (status & r->status.mask)
   248			dev_err(pmu->dev, "Failed to clear counter %i because the PMU is b=
usy\n",
   249				counter->idx);
   250	}
   251	=


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
