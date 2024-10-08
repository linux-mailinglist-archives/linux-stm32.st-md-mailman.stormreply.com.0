Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 048A1994628
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Oct 2024 13:08:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A450C6DD6B;
	Tue,  8 Oct 2024 11:08:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E47CC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Oct 2024 11:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728385702; x=1759921702;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0ctU/+14S8CDrzijH8uO02zNos9uf++LoeJ+64lPr9A=;
 b=em96ae0/pPVPwd3aMSin2dxZQBT8RKoABXP8jW/K9/nxoFQDuKtE7hkl
 c7ENuqtqNzB5kP7v7xmwvlurUmWG8QcVRJgFQI1klrxFNnxySLTuTHa5/
 g5KWCrKhj8yUq0/VUHHuoBVfnGYBWfi9O3UFkaYLwld+dTce6q3wk97YQ
 HcWrU6ICVkNezjIsw1WVNpJdphUqo2CeyXMdbXsovbMLdUInQxSvePk6V
 VqSO7lIXpUKwZCscYteL9V3vUsYXXb2B/w2Q0CoB/bTe6XizEB8fNtPiK
 3QM8rhu6jUkYLP+EUb/hBk9tz7SUenn09xZNSmx3FYE+wsqQlVRQnNMup A==;
X-CSE-ConnectionGUID: H94fxKSITQWXjNhSHTvD+w==
X-CSE-MsgGUID: E0mmhbhUSk+BKZDfRv84yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="45036653"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="45036653"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 04:07:55 -0700
X-CSE-ConnectionGUID: K5QEvV6/TSqPAEBrw6T91A==
X-CSE-MsgGUID: reBnuTEBQL+O6BgutpnMBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="76173153"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 08 Oct 2024 04:07:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sy84D-0006HV-0W;
 Tue, 08 Oct 2024 11:07:49 +0000
Date: Tue, 8 Oct 2024 19:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Message-ID: <202410081902.TwQcmWjk-lkp@intel.com>
References: <20241007131620.2090104-8-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241007131620.2090104-8-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v10 7/7] remoteproc: stm32: Add support of
 an OP-TEE TA to load the firmware
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

Hi Arnaud,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Pouliquen/remoteproc-core-Introduce-rproc_pa_to_va-helper/20241007-212358
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241007131620.2090104-8-arnaud.pouliquen%40foss.st.com
patch subject: [PATCH v10 7/7] remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
config: alpha-kismet-CONFIG_REMOTEPROC_TEE-CONFIG_STM32_RPROC-0-0 (https://download.01.org/0day-ci/archive/20241008/202410081902.TwQcmWjk-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241008/202410081902.TwQcmWjk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410081902.TwQcmWjk-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for REMOTEPROC_TEE when selected by STM32_RPROC
   WARNING: unmet direct dependencies detected for REMOTEPROC_TEE
     Depends on [n]: REMOTEPROC [=y] && OPTEE [=n]
     Selected by [y]:
     - STM32_RPROC [=y] && (ARCH_STM32 || COMPILE_TEST [=y]) && REMOTEPROC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
