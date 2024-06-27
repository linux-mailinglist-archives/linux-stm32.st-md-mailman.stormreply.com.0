Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4580D919DBA
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 05:10:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5E99C6B460;
	Thu, 27 Jun 2024 03:10:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5287C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 03:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719457852; x=1750993852;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Iv0TX8+ql2MOey4aAWUSVCb5ilQa09SBI4ZV3oNClBY=;
 b=IOm4QFyUdzu6VZ7gecDHKG+fsOJu581KX+3xx6CnOqmEzUkuPwdhHE3W
 oSOHsM+E8y2rxBtInPraEGbO7jSjizcLkKn+5pnnKVPt3zEQALtbt6lmW
 hXEARoXCmxUDXoYFNVI7fySA7K1PsR8T/F9zi68CAuErcilgO5K8mzp6O
 LRwbCeUPcWW9MTtay96g1f+zis6aOTsMOidyzYSQJkKvCGMMGwnFMDz8j
 keo4YG9dZwsavab2IQ6Xx6qTZURjBoC7ShLD2GROacPR7XAapAe4G7vWd
 rA/IXi/Y4zplLhFxV6GhWyxK5ig3W+51gYSSzuCgiorgBWVSoyx8eh5Tp Q==;
X-CSE-ConnectionGUID: Slgr8r0zSRanQrduVwOeRw==
X-CSE-MsgGUID: 6Jm2kGmNT3Wr950lngaQoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16307514"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="16307514"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 20:10:39 -0700
X-CSE-ConnectionGUID: m3UuDaYvRimU1gdCXbFVrA==
X-CSE-MsgGUID: iErufESYQA2i2oCOOH8X2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="44288214"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 26 Jun 2024 20:10:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sMfWs-000Fp4-1y;
 Thu, 27 Jun 2024 03:10:34 +0000
Date: Thu, 27 Jun 2024 11:09:36 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
Message-ID: <202406271050.ws9ieZOd-lkp@intel.com>
References: <20240623195233.81550-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240623195233.81550-1-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add ethernet support for
 DH STM32MP13xx DHCOR DHSBC board
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

Hi Marek,

kernel test robot noticed the following build errors:

[auto build test ERROR on atorgue-stm32/stm32-next]
[also build test ERROR on next-20240626]
[cannot apply to arm/for-next arm/fixes arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next shawnguo/for-next soc/for-next linus/master v6.10-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/ARM-dts-stm32-Add-ethernet-support-for-DH-STM32MP13xx-DHCOR-DHSBC-board/20240625-233637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20240623195233.81550-1-marex%40denx.de
patch subject: [PATCH] ARM: dts: stm32: Add ethernet support for DH STM32MP13xx DHCOR DHSBC board
config: arm-randconfig-051-20240626 (https://download.01.org/0day-ci/archive/20240627/202406271050.ws9ieZOd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271050.ws9ieZOd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271050.ws9ieZOd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts:77.1-11 Label or path ethernet1 not found
>> Error: arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts:104.1-11 Label or path ethernet2 not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
