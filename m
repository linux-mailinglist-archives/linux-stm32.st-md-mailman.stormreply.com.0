Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6376B5EC1B0
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 13:41:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 196B4C63326;
	Tue, 27 Sep 2022 11:41:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66993C03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 11:41:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28RAmHOi018359
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 27 Sep 2022 13:41:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=YAyMfPNwBAUPJtosDX78dKoVrqN/KrbuzycZib6rBLQ=;
 b=cmEm+RNP5xFBl7XLRemm4LpE4wqI7oiwQzHIjHEgC5pm1Z88ItywGSl2anxCeYe3WFFW
 V23x0gf2FVbZILg5JvGnSN0EsYDrNeLQojXHs3vXhRBjqCuGd9EZ7VltQ+OWBO1vaWwr
 lJr+6J1013Nna2F/wty3IEwkahvEPh7o6ymj51xpidIsVwrsrHvPUHvb4cS3mNmHqrvb
 F9oWRO+MvRw05w5SBGThEKQu2aGUH6s2svLYJXC7jLhNTxGt8R4vRvJbzbn8kT81zA/E
 QwuehcD8vI3PDRZ4aXG5nm21JFWAJw1u2LVpce92rlFv07/36oPIvA3arABoXfXqF0uz 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsrsjj05e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 27 Sep 2022 13:41:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 589A9100034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 13:41:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D0A321F0B8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 13:41:41 +0200 (CEST)
Received: from [10.201.20.178] (10.75.127.116) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 13:41:40 +0200
Message-ID: <f5d63cb5-c19d-5c3e-9ca2-6d853cec8e09@foss.st.com>
Date: Tue, 27 Sep 2022 13:41:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: <linux-stm32@st-md-mailman.stormreply.com>
References: <20220926141132.124245-1-zhangqilong3@huawei.com>
 <20220926141132.124245-2-zhangqilong3@huawei.com>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20220926141132.124245-2-zhangqilong3@huawei.com>
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_03,2022-09-27_01,2022-06-22_01
Subject: Re: [Linux-stm32] [PATCH -next 1/2] ASoC: stm32: dfsdm: Fix PM
 disable depth imbalance in stm32_adfsdm_probe
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

Hi Zhang,

Thanks.You can add my:
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

BRs

On 9/26/22 16:11, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by moving
> pm_runtime_enable to the endding of stm32_adfsdm_probe.
> 
> Fixes:98e500a12f934 ("ASoC: stm32: dfsdm: add pm_runtime support for audio")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>   sound/soc/stm/stm32_adfsdm.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
> index 04f2912e1418..643fc8a17018 100644
> --- a/sound/soc/stm/stm32_adfsdm.c
> +++ b/sound/soc/stm/stm32_adfsdm.c
> @@ -335,8 +335,6 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
>   
>   	dev_set_drvdata(&pdev->dev, priv);
>   
> -	pm_runtime_enable(&pdev->dev);
> -
>   	ret = devm_snd_soc_register_component(&pdev->dev,
>   					      &stm32_adfsdm_dai_component,
>   					      &priv->dai_drv, 1);
> @@ -366,9 +364,13 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
>   #endif
>   
>   	ret = snd_soc_add_component(component, NULL, 0);
> -	if (ret < 0)
> +	if (ret < 0) {
>   		dev_err(&pdev->dev, "%s: Failed to register PCM platform\n",
>   			__func__);
> +		return ret;
> +	}
> +
> +	pm_runtime_enable(&pdev->dev);
>   
>   	return ret;
>   }
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
