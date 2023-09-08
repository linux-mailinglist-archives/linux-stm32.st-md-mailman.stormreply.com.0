Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A0B7991A5
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Sep 2023 23:49:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24DE9C6B458;
	Fri,  8 Sep 2023 21:49:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F03D4C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Sep 2023 21:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694209787; x=1725745787;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=A3kcjKku3nLjouI93HaJUhtFFWzExoWvWEwvfEaE5Ns=;
 b=NPnfuQNSpvTxxAif2uOGPYCuqqC+1ORQefgFT/KAFq9kCDzW6/uYHuUT
 w/bgBstY/xNu41xeDWrIZkVhV/ApxTa85u9Y/HnbTLrVcNMZLrOs8Latw
 6+/nG8dUdJ1ioa7LT3rPj4QxMl2bJbgfWK6Hujjh673tHwl9TQ6twur8w
 7dUydGKyi3d8ncyxx3bZvkMw6tW8BLqrh9mAI3Kg0Jr2GLk48fMksCNBa
 V5MSFwzGJaLqRZUCd+UOMGZlxGnxuu4avJZtZu7skopoHufw13bi2i2so
 NGkndp+Kei4eDYDw3qHWkVTa6n9tQPcENufPCTrNsXZsFLei8sCEGGyne Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="357219741"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; d="scan'208";a="357219741"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 14:49:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="885811726"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; d="scan'208";a="885811726"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 08 Sep 2023 14:49:14 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qejM1-0002dk-1J;
 Fri, 08 Sep 2023 21:49:29 +0000
Date: Sat, 9 Sep 2023 05:48:51 +0800
From: kernel test robot <lkp@intel.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <202309090508.CyBIfKeu-lkp@intel.com>
References: <20230908165120.730867-6-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230908165120.730867-6-gatien.chevallier@foss.st.com>
Cc: devicetree@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 05/10] hwrng: stm32 - rework error
 handling in stm32_rng_read()
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

Hi Gatien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on robh/for-next herbert-crypto-2.6/master herbert-cryptodev-2.6/master linus/master v6.5 next-20230908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gatien-Chevallier/dt-bindings-rng-introduce-new-compatible-for-STM32MP13x/20230909-005611
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20230908165120.730867-6-gatien.chevallier%40foss.st.com
patch subject: [PATCH 05/10] hwrng: stm32 - rework error handling in stm32_rng_read()
config: hexagon-randconfig-002-20230909 (https://download.01.org/0day-ci/archive/20230909/202309090508.CyBIfKeu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090508.CyBIfKeu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309090508.CyBIfKeu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/hw_random/stm32-rng.c:9:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/char/hw_random/stm32-rng.c:9:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/char/hw_random/stm32-rng.c:9:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/char/hw_random/stm32-rng.c:210:35: warning: left operand of comma operator has no effect [-Wunused-value]
     210 |                         if (WARN_ON(sr & RNG_SR_CEIS), "RNG clock too slow - %x\n", sr)
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:57: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                                         ^~~~~~~~~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
>> drivers/char/hw_random/stm32-rng.c:210:35: warning: left operand of comma operator has no effect [-Wunused-value]
     210 |                         if (WARN_ON(sr & RNG_SR_CEIS), "RNG clock too slow - %x\n", sr)
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:57: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                                         ^~~~~~~~~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                                      ^~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   8 warnings generated.


vim +210 drivers/char/hw_random/stm32-rng.c

   162	
   163	
   164	static int stm32_rng_read(struct hwrng *rng, void *data, size_t max, bool wait)
   165	{
   166		struct stm32_rng_private *priv = container_of(rng, struct stm32_rng_private, rng);
   167		unsigned int i = 0;
   168		int retval = 0, err = 0;
   169		u32 sr;
   170	
   171		pm_runtime_get_sync((struct device *) priv->rng.priv);
   172	
   173		if (readl_relaxed(priv->base + RNG_SR) & RNG_SR_SEIS)
   174			stm32_rng_conceal_seed_error(rng);
   175	
   176		while (max >= sizeof(u32)) {
   177			sr = readl_relaxed(priv->base + RNG_SR);
   178			/*
   179			 * Manage timeout which is based on timer and take
   180			 * care of initial delay time when enabling the RNG.
   181			 */
   182			if (!sr && wait) {
   183				err = readl_relaxed_poll_timeout_atomic(priv->base
   184									   + RNG_SR,
   185									   sr, sr,
   186									   10, 50000);
   187				if (err) {
   188					dev_err((struct device *)priv->rng.priv,
   189						"%s: timeout %x!\n", __func__, sr);
   190					break;
   191				}
   192			} else if (!sr) {
   193				/* The FIFO is being filled up */
   194				break;
   195			}
   196	
   197			if (sr != RNG_SR_DRDY) {
   198				if (sr & RNG_SR_SEIS) {
   199					err = stm32_rng_conceal_seed_error(rng);
   200					i++;
   201					if (err && i > RNG_NB_RECOVER_TRIES) {
   202						dev_err((struct device *)priv->rng.priv,
   203							"Couldn't recover from seed error\n");
   204						return -ENOTRECOVERABLE;
   205					}
   206	
   207					continue;
   208				}
   209	
 > 210				if (WARN_ON(sr & RNG_SR_CEIS), "RNG clock too slow - %x\n", sr)
   211					writel_relaxed(0, priv->base + RNG_SR);
   212			}
   213	
   214			/* Late seed error case: DR being 0 is an error status */
   215			*(u32 *)data = readl_relaxed(priv->base + RNG_DR);
   216			if (!*(u32 *)data) {
   217				err = stm32_rng_conceal_seed_error(rng);
   218				i++;
   219				if (err && i > RNG_NB_RECOVER_TRIES) {
   220					dev_err((struct device *)priv->rng.priv,
   221						"Couldn't recover from seed error");
   222					return -ENOTRECOVERABLE;
   223				}
   224	
   225				continue;
   226			}
   227	
   228			i = 0;
   229			retval += sizeof(u32);
   230			data += sizeof(u32);
   231			max -= sizeof(u32);
   232		}
   233	
   234		pm_runtime_mark_last_busy((struct device *) priv->rng.priv);
   235		pm_runtime_put_sync_autosuspend((struct device *) priv->rng.priv);
   236	
   237		return retval || !wait ? retval : -EIO;
   238	}
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
