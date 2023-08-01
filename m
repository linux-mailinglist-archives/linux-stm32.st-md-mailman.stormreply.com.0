Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5180476B669
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Aug 2023 15:55:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFE23C6A5E6;
	Tue,  1 Aug 2023 13:55:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E536C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Aug 2023 13:55:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3719k4VI008191; Tue, 1 Aug 2023 15:55:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=MLBE3FzrM2b0nVsbnwYAb0B63uPqrpp4S1Mc+KvXP80=; b=Sg
 dEd91Zu30DuWa7GryPAwP1LXYKLL2tpmI8no5QnvkkOsFgg/+ekkRKfHR87XnvV1
 XW9gPHgDUY1zxJLMRnxX0zZr9kycIB1PBgkdDaNVq0yZUvFrSfSBdCjxRakKLy5i
 0iCrSaGslEvwfGAHO+ZoBN8yejkMLsfd3BKG8eTfzIvZt1/whpmGNyiR0IbvU14h
 X25yQfvk75roCaR+lLM45joaRH5VtQsgCFfkVIvJXd1LMM3FGpNM6Y03EhJRK2dl
 L/Bmn3Yl3gl2nzE4JH+F0BzO/RCSgEgapR+Sfub18jwqK2NVprphpZA4RlzvLiJc
 hw/ptO6cPsz0VNtXBDuw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s6yq6sfbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Aug 2023 15:55:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C10B9100080;
 Tue,  1 Aug 2023 15:55:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9440A22A6EC;
 Tue,  1 Aug 2023 15:55:08 +0200 (CEST)
Received: from [10.201.20.168] (10.201.20.168) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 1 Aug
 2023 15:55:07 +0200
Message-ID: <a7a373b7-1f3e-3b17-e323-cb636816fb99@foss.st.com>
Date: Tue, 1 Aug 2023 15:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
References: <20230801105932.3738430-1-arnd@kernel.org>
From: Valentin CARON <valentin.caron@foss.st.com>
In-Reply-To: <20230801105932.3738430-1-arnd@kernel.org>
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_09,2023-08-01_01,2023-05-22_02
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Christophe Guibout <christophe.guibout@foss.st.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] rtc: stm32: remove incorrect #ifdef check
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Arnd,

Thanks for your patch !

On 8/1/23 12:59, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> After a previous commit changed the driver over to
> SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(), the suspend/resume
> functions must no longer be hidden behind an #ifdef:
>
> In file included from include/linux/clk.h:13,
>                   from drivers/rtc/rtc-stm32.c:8:
> drivers/rtc/rtc-stm32.c:927:39: error: 'stm32_rtc_suspend' undeclared here (not in a function); did you mean 'stm32_rtc_probe'?
>    927 |         SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(stm32_rtc_suspend, stm32_rtc_resume)
>        |                                       ^~~~~~~~~~~~~~~~~
> include/linux/kernel.h:58:44: note: in definition of macro 'PTR_IF'
>     58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
>        |                                            ^~~
> include/linux/pm.h:329:26: note: in expansion of macro 'pm_sleep_ptr'
>    329 |         .suspend_noirq = pm_sleep_ptr(suspend_fn), \
>        |                          ^~~~~~~~~~~~
>
> Fixes: fb9a7e5360dc8 ("rtc: stm32: change PM callbacks to "_noirq()"")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Valentin Caron <valentin.caron@foss.st.com>
> ---
>   drivers/rtc/rtc-stm32.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
> index 85689192fa7ae..c296e7af0700c 100644
> --- a/drivers/rtc/rtc-stm32.c
> +++ b/drivers/rtc/rtc-stm32.c
> @@ -890,7 +890,6 @@ static void stm32_rtc_remove(struct platform_device *pdev)
>   	device_init_wakeup(&pdev->dev, false);
>   }
>   
> -#ifdef CONFIG_PM_SLEEP
>   static int stm32_rtc_suspend(struct device *dev)
>   {
>   	struct stm32_rtc *rtc = dev_get_drvdata(dev);
> @@ -921,7 +920,6 @@ static int stm32_rtc_resume(struct device *dev)
>   
>   	return ret;
>   }
> -#endif
>   
>   static const struct dev_pm_ops stm32_rtc_pm_ops = {
>   	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(stm32_rtc_suspend, stm32_rtc_resume)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
