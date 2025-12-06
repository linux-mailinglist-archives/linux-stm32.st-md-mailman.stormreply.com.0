Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6357ECAA147
	for <lists+linux-stm32@lfdr.de>; Sat, 06 Dec 2025 06:20:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9200EC5F1D9;
	Sat,  6 Dec 2025 05:20:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E96FBC2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Dec 2025 05:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764998445; x=1796534445;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZFjNsLDmNldfG/5D2Bo1Qfl2RpXTUFrxrN62ffaxeME=;
 b=ZW9LvnRgQkOT65B1ynLxX8po0aJMZOkhRRIGvx92NPWMN19nLhdqSXE6
 lV5aECNkdD6jUG1d/ATnQ7FkSwzMXcPBnCQ+gTK32wZyvmJ2xj8rpkEmq
 7sYVDE6y1P2EiFRVO4XkMlqF1Mn1pJY0lvfN475SQFtffu848qpOKuBeg
 IC6r1f4TbAnPTvdHW85AD2xn8Ef5bbG8fXapMU0u9g8hX7ScEWYVi1Rlv
 hinBeuAz/8Jp0twMkmPQ6i6wd0ncKhZ0wHFKFQ8YQnDaqPmCyLsPxWM+A
 n8ieENbK6R8dKuwsbqbGoGcH1Oojou1iB2cfH5J1q+Z/Z0oQzKeld7LM9 Q==;
X-CSE-ConnectionGUID: 6rwV27N5RTOFyMl2+1Lv+g==
X-CSE-MsgGUID: CFOtf3fTSG2solF70vDRNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="89684194"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; d="scan'208";a="89684194"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 21:20:43 -0800
X-CSE-ConnectionGUID: M8sn2e1iS7WipgYPGUEVrg==
X-CSE-MsgGUID: FnNPjzW+SuyCFsShyfMMBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; d="scan'208";a="200605245"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 05 Dec 2025 21:20:40 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vRkij-00000000Fsj-1Jo7;
 Sat, 06 Dec 2025 05:20:37 +0000
Date: Sat, 6 Dec 2025 13:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <202512061327.9CDC4SNs-lkp@intel.com>
References: <20251205-upstream_qspi_ospi_updates-v1-3-7e6c8b9f5141@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251205-upstream_qspi_ospi_updates-v1-3-7e6c8b9f5141@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/8] spi: stm32-ospi: Remove CR_TCIE and
	CR_TEIE irq usage
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

Hi Patrice,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7d0a66e4bb9081d75c82ec4957c50034cb0ea449]

url:    https://github.com/intel-lab-lkp/linux/commits/Patrice-Chotard/spi-stm32-ospi-Set-DMA-maxburst-dynamically/20251205-174931
base:   7d0a66e4bb9081d75c82ec4957c50034cb0ea449
patch link:    https://lore.kernel.org/r/20251205-upstream_qspi_ospi_updates-v1-3-7e6c8b9f5141%40foss.st.com
patch subject: [PATCH 3/8] spi: stm32-ospi: Remove CR_TCIE and CR_TEIE irq usage
config: sparc64-randconfig-002-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061327.9CDC4SNs-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061327.9CDC4SNs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061327.9CDC4SNs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/spi/spi-stm32-ospi.c:16:
   drivers/spi/spi-stm32-ospi.c: In function 'stm32_ospi_wait_cmd':
>> drivers/spi/spi-stm32-ospi.c:246:48: error: 'struct stm32_ospi' has no member named 'io_base'; did you mean 'mm_base'?
     err = readl_relaxed_poll_timeout_atomic(ospi->io_base + OSPI_SR, sr,
                                                   ^~~~~~~
   include/linux/iopoll.h:102:3: note: in definition of macro 'poll_timeout_us_atomic'
      op; \
      ^~
   include/linux/iopoll.h:213:2: note: in expansion of macro 'read_poll_timeout_atomic'
     read_poll_timeout_atomic(op, val, cond, delay_us, timeout_us, false, addr)
     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:255:2: note: in expansion of macro 'readx_poll_timeout_atomic'
     readx_poll_timeout_atomic(readl_relaxed, addr, val, cond, delay_us, timeout_us)
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-stm32-ospi.c:246:8: note: in expansion of macro 'readl_relaxed_poll_timeout_atomic'
     err = readl_relaxed_poll_timeout_atomic(ospi->io_base + OSPI_SR, sr,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +246 drivers/spi/spi-stm32-ospi.c

   236	
   237	static int stm32_ospi_wait_cmd(struct stm32_ospi *ospi)
   238	{
   239		void __iomem *regs_base = ospi->regs_base;
   240		u32 sr;
   241		int err = 0;
   242	
   243		if (ospi->fmode == CR_FMODE_APM)
   244			goto out;
   245	
 > 246		err = readl_relaxed_poll_timeout_atomic(ospi->io_base + OSPI_SR, sr,
   247							(sr & (SR_TEF | SR_TCF)), 1,
   248							STM32_WAIT_CMD_TIMEOUT_US);
   249	
   250		if (sr & SR_TCF)
   251			/* avoid false timeout */
   252			err = 0;
   253		if (sr & SR_TEF)
   254			err = -EIO;
   255	
   256	out:
   257		/* clear flags */
   258		writel_relaxed(FCR_CTCF | FCR_CTEF, regs_base + OSPI_FCR);
   259	
   260		if (!err)
   261			err = stm32_ospi_wait_nobusy(ospi);
   262	
   263		return err;
   264	}
   265	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
