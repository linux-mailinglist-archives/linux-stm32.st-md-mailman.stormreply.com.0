Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1BB968060
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2024 09:20:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD1D3C78010;
	Mon,  2 Sep 2024 07:20:49 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2ADB5C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2024 07:20:43 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4824snrq008347;
 Mon, 2 Sep 2024 09:20:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 sLn8YX8O3WDqoWEd6Wy0yt1v1YptlaDbfBdJJeo6sw0=; b=gLjKyA66m6ulkqnY
 9BvNbbR8zZoLSZ0gmKbPABqYi3hKbtGhMSnD1TT0+eHvXPGh3GgZTz0lFY2mjj6s
 77ZuiokvGtQknaIbGPcrPOuYt1G7q49VbODXkpqeLVFiEn7ZotFmHXAotDr2FfBC
 zoyd6A9J3Mrvs5Pq0IoGWcwTqrjCaO2v9AZxwbdVhTZz8KAoiwjzaFETpA7uRcVd
 +Bf9K7Rge/UcM1FALM/zfaPjjBqYaEgsF4Qf1sb78dwj+qEit+Xc17wZ18/Xz3BP
 93O+dtiiJyB1BHEJ9xpCCUbPNRoG0b0RJG9pFDfwYzcOh8qTTiW/LfPzkE9ZQxep
 q0b89w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41ce4j3eb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Sep 2024 09:20:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 47CF240058;
 Mon,  2 Sep 2024 09:19:57 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B84121D23A;
 Mon,  2 Sep 2024 09:18:58 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 2 Sep
 2024 09:18:57 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 2 Sep
 2024 09:18:57 +0200
Message-ID: <cfc164a7-9cf9-42d8-8b66-b4567d3971ae@foss.st.com>
Date: Mon, 2 Sep 2024 09:18:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: kernel test robot <lkp@intel.com>, Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Jens Wiklander
 <jens.wiklander@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20240830095147.3538047-5-arnaud.pouliquen@foss.st.com>
 <202409010034.Tln3soEY-lkp@intel.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <202409010034.Tln3soEY-lkp@intel.com>
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-09-01_06,2024-08-30_01,2024-05-17_01
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



On 8/31/24 18:43, kernel test robot wrote:
> Hi Arnaud,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 5be63fc19fcaa4c236b307420483578a56986a37]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Pouliquen/remoteproc-core-Introduce-rproc_pa_to_va-helper/20240830-175609
> base:   5be63fc19fcaa4c236b307420483578a56986a37
> patch link:    https://lore.kernel.org/r/20240830095147.3538047-5-arnaud.pouliquen%40foss.st.com
> patch subject: [PATCH v9 4/7] remoteproc: core: Add TEE interface support for firmware release
> config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240901/202409010034.Tln3soEY-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010034.Tln3soEY-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409010034.Tln3soEY-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/remoteproc/remoteproc_core.c:32:
>>> include/linux/remoteproc_tee.h:52:12: warning: 'tee_rproc_parse_fw' defined but not used [-Wunused-function]
>       52 | static int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>          |            ^~~~~~~~~~~~~~~~~~
> 
> 
> vim +/tee_rproc_parse_fw +52 include/linux/remoteproc_tee.h
> 
> 498143a453d14e Arnaud Pouliquen 2024-08-30  51  
> 498143a453d14e Arnaud Pouliquen 2024-08-30 @52  static int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> 498143a453d14e Arnaud Pouliquen 2024-08-30  53  {
> 498143a453d14e Arnaud Pouliquen 2024-08-30  54  	/* This shouldn't be possible */
> 498143a453d14e Arnaud Pouliquen 2024-08-30  55  	WARN_ON(1);
> 498143a453d14e Arnaud Pouliquen 2024-08-30  56  
> 498143a453d14e Arnaud Pouliquen 2024-08-30  57  	return 0;
> 498143a453d14e Arnaud Pouliquen 2024-08-30  58  }
> 498143a453d14e Arnaud Pouliquen 2024-08-30  59  
> 

The inline attribute is missing. As it is a minor fix, I'm waiting for more
reviews before fixing it in the next version.

Regards,
Arnaud
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
