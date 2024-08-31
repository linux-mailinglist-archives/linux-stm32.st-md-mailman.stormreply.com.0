Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2999672BB
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Aug 2024 18:44:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0361FC6DD9D;
	Sat, 31 Aug 2024 16:44:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66C1FC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Aug 2024 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725122665; x=1756658665;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YmIADE+iPJs58r7hopfHHRVRQ4cz6BqTPPb+fJDDqC4=;
 b=RElA4g4QpZUBkkl+Vj/lpz7MyI6XvXJqmF7GeIj7azECUYq6DfFXHn4D
 xGmR/2klJd8U7ln4/y35YlMcT2DE2qwFRy6K7ITxGtFZl6C0nLiSY6NQQ
 HlC6jnxvKGyNafxhCMPZXi3ngxbJhCLoH4R49REYFx85SJX8zqSx9JA/S
 sOSSGV1/v6QzPeOfGMVIzBRsX3n3GVUbgEVMwaEPoAMKlxdtwk0eq4G/A
 ygCobm8P2Jmi+ws2phUiISiLSbniWVXOe3jN8FJeSiIiRXsCz9hXFeoHl
 SjNCSBca40VMb/DraeHa6KUPFWqamA5ubKs/KhnINK6oOYotS+tkTDnwd w==;
X-CSE-ConnectionGUID: fICO8d9jSX6xUxq6DwxvNA==
X-CSE-MsgGUID: fZxdTWB7TjyJWewZdVt6tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23266281"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; d="scan'208";a="23266281"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2024 09:44:16 -0700
X-CSE-ConnectionGUID: NKiGrgHAS6eiFuXtuCCbIA==
X-CSE-MsgGUID: tyuEdc0PQwGkbWoJvl9aOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; d="scan'208";a="64537095"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 31 Aug 2024 09:44:13 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1skRCs-0002wK-2l;
 Sat, 31 Aug 2024 16:44:10 +0000
Date: Sun, 1 Sep 2024 00:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Message-ID: <202409010034.Tln3soEY-lkp@intel.com>
References: <20240830095147.3538047-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240830095147.3538047-5-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v9 4/7] remoteproc: core: Add TEE
 interface support for firmware release
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

[auto build test WARNING on 5be63fc19fcaa4c236b307420483578a56986a37]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Pouliquen/remoteproc-core-Introduce-rproc_pa_to_va-helper/20240830-175609
base:   5be63fc19fcaa4c236b307420483578a56986a37
patch link:    https://lore.kernel.org/r/20240830095147.3538047-5-arnaud.pouliquen%40foss.st.com
patch subject: [PATCH v9 4/7] remoteproc: core: Add TEE interface support for firmware release
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240901/202409010034.Tln3soEY-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010034.Tln3soEY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010034.Tln3soEY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/remoteproc/remoteproc_core.c:32:
>> include/linux/remoteproc_tee.h:52:12: warning: 'tee_rproc_parse_fw' defined but not used [-Wunused-function]
      52 | static int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
         |            ^~~~~~~~~~~~~~~~~~


vim +/tee_rproc_parse_fw +52 include/linux/remoteproc_tee.h

498143a453d14e Arnaud Pouliquen 2024-08-30  51  
498143a453d14e Arnaud Pouliquen 2024-08-30 @52  static int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
498143a453d14e Arnaud Pouliquen 2024-08-30  53  {
498143a453d14e Arnaud Pouliquen 2024-08-30  54  	/* This shouldn't be possible */
498143a453d14e Arnaud Pouliquen 2024-08-30  55  	WARN_ON(1);
498143a453d14e Arnaud Pouliquen 2024-08-30  56  
498143a453d14e Arnaud Pouliquen 2024-08-30  57  	return 0;
498143a453d14e Arnaud Pouliquen 2024-08-30  58  }
498143a453d14e Arnaud Pouliquen 2024-08-30  59  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
