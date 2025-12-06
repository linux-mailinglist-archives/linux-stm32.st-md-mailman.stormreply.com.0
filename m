Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAABCAA257
	for <lists+linux-stm32@lfdr.de>; Sat, 06 Dec 2025 08:19:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BED73C5F1D9;
	Sat,  6 Dec 2025 07:18:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A541C2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Dec 2025 07:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765005532; x=1796541532;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oQCyKfe48rYH5RAg2kQmpAmcDXxICCIuye7g2EDqWtw=;
 b=ZP8483vVjOXw0g8lvuZeHs6L5gDCKtF5JjYsS6YhTQvutqKgYmNcFgwI
 xxpRwmCa6Y/S1gk/vplUVhcLB5rzRXNIq6fz7Pvtdm6lRn7B9vttaqV33
 WspjuZntUNU6gS3kwzGYtmF2baYogI1sk42VPu1l/7OjGcBB8HHDVIowb
 bGrz3udm3L4gF+W8j9xwjiWxdAvcp1k90nYcB3nqyu8SDGRMZJonlTR9p
 2E0CMrGqfRA7gun51DbLGDjbzD2s2RThQWy8ffI8fQXBq7nvJzhj0o52g
 QkRKXWhwG23EMBYmPp6eZ/gZTcioeEYGyAu+myHlcwQxUwT8CthomMtDl A==;
X-CSE-ConnectionGUID: 9FfLCyCsSuqN04qOyPfZIA==
X-CSE-MsgGUID: s1SGGfoxTAGCaFe9gF+9ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84636828"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; d="scan'208";a="84636828"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 23:18:50 -0800
X-CSE-ConnectionGUID: jeOhal7kQjOEIQ4xIheCkw==
X-CSE-MsgGUID: 2BcrPTSDTMyAGkOdxvTlyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; d="scan'208";a="194778838"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 05 Dec 2025 23:18:47 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vRmZ3-00000000Fyf-0Vbv;
 Sat, 06 Dec 2025 07:18:45 +0000
Date: Sat, 6 Dec 2025 15:18:20 +0800
From: kernel test robot <lkp@intel.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <202512061458.1wp2IbOG-lkp@intel.com>
References: <20251205-upstream_qspi_ospi_updates-v1-3-7e6c8b9f5141@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251205-upstream_qspi_ospi_updates-v1-3-7e6c8b9f5141@foss.st.com>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
config: riscv-randconfig-002-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061458.1wp2IbOG-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061458.1wp2IbOG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061458.1wp2IbOG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-stm32-ospi.c:246:48: error: no member named 'io_base' in 'struct stm32_ospi'; did you mean 'mm_base'?
     246 |         err = readl_relaxed_poll_timeout_atomic(ospi->io_base + OSPI_SR, sr,
         |                                                       ^~~~~~~
         |                                                       mm_base
   include/linux/iopoll.h:255:43: note: expanded from macro 'readl_relaxed_poll_timeout_atomic'
     255 |         readx_poll_timeout_atomic(readl_relaxed, addr, val, cond, delay_us, timeout_us)
         |                                                  ^
   include/linux/iopoll.h:213:71: note: expanded from macro 'readx_poll_timeout_atomic'
     213 |         read_poll_timeout_atomic(op, val, cond, delay_us, timeout_us, false, addr)
         |                                                                              ^
   include/linux/iopoll.h:172:36: note: expanded from macro 'read_poll_timeout_atomic'
     172 |         poll_timeout_us_atomic((val) = op(args), cond, sleep_us, timeout_us, sleep_before_read)
         |                                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/riscv/include/asm/mmio.h:90:76: note: expanded from macro 'readl_cpu'
      90 | #define readl_cpu(c)            ({ u32 __r = le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
         |                                                                                      ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   include/linux/iopoll.h:102:3: note: expanded from macro 'poll_timeout_us_atomic'
     102 |                 op; \
         |                 ^
   drivers/spi/spi-stm32-ospi.c:124:16: note: 'mm_base' declared here
     124 |         void __iomem *mm_base;
         |                       ^
   1 error generated.


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
