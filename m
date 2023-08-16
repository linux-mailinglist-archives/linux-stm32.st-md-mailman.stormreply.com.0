Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8735277E259
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Aug 2023 15:17:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B8B1C6B45F;
	Wed, 16 Aug 2023 13:17:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9B8BC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 13:17:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37G9HZ92006710; Wed, 16 Aug 2023 15:16:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=jsHo/ihgFYCOIGCHbTa9POhm1lQRQXAOCQAEy92C/gc=; b=nm
 l1ZymMVeYMLFF8iXGrVjIRUYzEERJsXsr/9dY6v2bZt5qJUt7xA4jhdwbAI3zRaQ
 TwwJVRay3dXZpjkSFhBmT1stu2/jmQh+FYoPC8h3YaPet69KjUEWHw782WXzi/Mx
 aax1SQqzibX5mRqeeqvngqX/kEU/qeHC1kbBlzfHTqVIvhIxZyUvBEIrCRmhglu1
 c9Isj47+pYrtOhO7a9py8ZpUuFR+s8Q4G9mmisCfwPv+fXIKUlgvLtV3WTDLT0FR
 HJMCZFKt+2rAsx7fI1tS2cwWyKTQXfqxADfaC0LLcMhFn18VQw/6IyfcR4uJbXLv
 6VG9j3eI7VsUC9f0ZPAA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sguptsbre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Aug 2023 15:16:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 92DA310005D;
 Wed, 16 Aug 2023 15:16:33 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B96C23D3F6;
 Wed, 16 Aug 2023 15:16:33 +0200 (CEST)
Received: from [10.201.22.206] (10.201.22.206) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 16 Aug
 2023 15:16:32 +0200
Message-ID: <f93fd404-2c66-cde0-ea9c-06390db015b8@foss.st.com>
Date: Wed, 16 Aug 2023 15:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230724195704.2432382-1-arnd@kernel.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20230724195704.2432382-1-arnd@kernel.org>
X-Originating-IP: [10.201.22.206]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_12,2023-08-15_02,2023-05-22_02
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>, Randy
 Dunlap <rdunlap@infradead.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, Dan
 Carpenter <dan.carpenter@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32: fix incorrect optional
	pointers
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

Hello Arnd,

On 7/24/23 21:56, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compile-testing without CONFIG_OF shows that the of_match_ptr() macro
> was used incorrectly here:
> 
> drivers/remoteproc/stm32_rproc.c:662:34: warning: unused variable 'stm32_rproc_match' [-Wunused-const-variable]
> 
> As in almost every driver, the solution is simply to remove the
> use of this macro. The same thing happened with the deprecated
> SIMPLE_DEV_PM_OPS(), but the corresponding warning was already shut
> up with __maybe_unused annotations, so fix those as well by using the
> correct DEFINE_SIMPLE_DEV_PM_OPS() macros and removing the extraneous
> __maybe_unused modifiers. For completeness, also add a pm_ptr() to let
> the PM ops be eliminated completely when CONFIG_PM is turned off.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307242300.ia82qBTp-lkp@intel.com
> Fixes: 03bd158e1535e ("remoteproc: stm32: use correct format strings on 64-bit")
> Fixes: 410119ee29b6c ("remoteproc: stm32: wakeup the system by wdg irq")
> Fixes: 13140de09cc2d ("remoteproc: stm32: add an ST stm32_rproc driver")

The checkpatch complains here as you put 13 char instead of 12 for the sha1.
I don't know if this can generate issue for scripts...

w or w/o the fix:

acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Thanks!
Arnaud

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/remoteproc/stm32_rproc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 98234b44f0389..9d9b13530f78a 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -921,7 +921,7 @@ static void stm32_rproc_remove(struct platform_device *pdev)
>  	rproc_free(rproc);
>  }
>  
> -static int __maybe_unused stm32_rproc_suspend(struct device *dev)
> +static int stm32_rproc_suspend(struct device *dev)
>  {
>  	struct rproc *rproc = dev_get_drvdata(dev);
>  	struct stm32_rproc *ddata = rproc->priv;
> @@ -932,7 +932,7 @@ static int __maybe_unused stm32_rproc_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused stm32_rproc_resume(struct device *dev)
> +static int stm32_rproc_resume(struct device *dev)
>  {
>  	struct rproc *rproc = dev_get_drvdata(dev);
>  	struct stm32_rproc *ddata = rproc->priv;
> @@ -943,16 +943,16 @@ static int __maybe_unused stm32_rproc_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(stm32_rproc_pm_ops,
> -			 stm32_rproc_suspend, stm32_rproc_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(stm32_rproc_pm_ops,
> +				stm32_rproc_suspend, stm32_rproc_resume);
>  
>  static struct platform_driver stm32_rproc_driver = {
>  	.probe = stm32_rproc_probe,
>  	.remove_new = stm32_rproc_remove,
>  	.driver = {
>  		.name = "stm32-rproc",
> -		.pm = &stm32_rproc_pm_ops,
> -		.of_match_table = of_match_ptr(stm32_rproc_match),
> +		.pm = pm_ptr(&stm32_rproc_pm_ops),
> +		.of_match_table = stm32_rproc_match,
>  	},
>  };
>  module_platform_driver(stm32_rproc_driver);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
