Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE23EB39857
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Aug 2025 11:34:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57C3EC3F95D;
	Thu, 28 Aug 2025 09:34:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D53CC30883
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Aug 2025 09:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756373673; x=1787909673;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yuynSKYGfxPDARXbNkOVcirGGnm9MJdjYgpoYNnyvqk=;
 b=ehV/9kUqyLJJ1ta5HZu8VDDlLM+PqkQDiS3ZUk1Vswf8vwwNAHfXtpn0
 /C4PgZdJHt8hx3nJY1Q+wCdL6Gu+2sQQjH1Wz4/BFxE7AJjY55tgu/HKa
 v+zqAQq0wOJ0Z7oImEYt8kzeieh+jREk9jnTHjVnCc2fThmyz80RUa7Ib
 m2inOrbkLovkLaIzFIlAQie4lTkmgou2qAEIvzoXv9otKRxHYWr7gjYop
 e+xNAfF34XI4J76qUoIpKUCQo64sn8+imQNVjlKbasg8rrvUkdeLo1VwQ
 mR5hl9gdhDfkOq1Z5yfDh73HlSS9UZA/4jC9EEvHdxvLGD/CpZx/7G3at g==;
X-CSE-ConnectionGUID: zY94uG37QH2iwiZymyj5xQ==
X-CSE-MsgGUID: b+F2lZHYTnCbIQdrlyLogA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58787352"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58787352"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 02:34:31 -0700
X-CSE-ConnectionGUID: 3oW4vjZ0SqCDl3Ptz+McUg==
X-CSE-MsgGUID: M5KpuRq8SLWF14awLIFgLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170462631"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by fmviesa009.fm.intel.com with ESMTP; 28 Aug 2025 02:34:26 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1urZ0v-000Tbr-1n;
 Thu, 28 Aug 2025 09:33:57 +0000
Date: Thu, 28 Aug 2025 17:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Message-ID: <202508281615.ExryCwiA-lkp@intel.com>
References: <20250827-relative_flex_pps-v3-1-673e77978ba2@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250827-relative_flex_pps-v3-1-673e77978ba2@foss.st.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/2] drivers: net: stmmac:
 handle start time set in the past for flexible PPS
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 242041164339594ca019481d54b4f68a7aaff64e]

url:    https://github.com/intel-lab-lkp/linux/commits/Gatien-Chevallier/drivers-net-stmmac-handle-start-time-set-in-the-past-for-flexible-PPS/20250827-190905
base:   242041164339594ca019481d54b4f68a7aaff64e
patch link:    https://lore.kernel.org/r/20250827-relative_flex_pps-v3-1-673e77978ba2%40foss.st.com
patch subject: [PATCH net-next v3 1/2] drivers: net: stmmac: handle start time set in the past for flexible PPS
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250828/202508281615.ExryCwiA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508281615.ExryCwiA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508281615.ExryCwiA-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "timespec64_add_safe" [drivers/net/ethernet/stmicro/stmmac/stmmac.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
