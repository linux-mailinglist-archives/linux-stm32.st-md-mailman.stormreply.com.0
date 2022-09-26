Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1DC5EA68A
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Sep 2022 14:53:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50919C5F1D3;
	Mon, 26 Sep 2022 12:53:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98D11C035BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 12:53:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QAYwJe004276;
 Mon, 26 Sep 2022 14:52:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=O+IAOFImKzcJefc0+0q4nQ3kA464dZfhgjF2aT9XMP8=;
 b=4KNVEim7prR3colcv2mZHDRNkbyWAdeYvIUUPrDIxe+nvo+swDbV8f6KX8Fcps6U+LaW
 T1ElM3PId+1i8Z0vauBk9U7eJ0Od9tHj0h8QtpWnF5PqW0pscPOoJwlC1L5D0VY1cDAF
 LUh4gN+QpsNHtVwFlXXVgxVqfBMIZpkmR2LUG008jooGQT19LU09M0yOMdTDFkQY/m2J
 UmK6p06gghIDO93Tti74lcNxmJO9dec3SljeJVi2/atcaFxmYagtmIdZObQhPsuRjsN0
 Ga94JRXqFjR3OPWclqgP+liVBfxIek4qKHQN42MhQJFhEkH+87Fp/jAYN2PJcPDkVCPc vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsrsjbjkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 14:52:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4E36B10002A;
 Mon, 26 Sep 2022 14:52:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 099E422A6D5;
 Mon, 26 Sep 2022 14:52:40 +0200 (CEST)
Received: from [10.211.6.21] (10.75.127.49) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 14:52:36 +0200
Message-ID: <b1cd2763-8914-7bce-8f91-666bae219bf4@foss.st.com>
Date: Mon, 26 Sep 2022 14:52:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Zhang Qilong <zhangqilong3@huawei.com>, <olivier.moysan@foss.st.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>
References: <20220926091439.103839-1-zhangqilong3@huawei.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20220926091439.103839-1-zhangqilong3@huawei.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH -next] ASoC: stm: Fix PM disable depth
 imbalance in stm32_i2s_probe
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

Hello Zhang,

On 9/26/22 11:14, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context.
> 
> Fixes:efc162cbd480f ("ASoC: stm: Use dev_err_probe() helper")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  sound/soc/stm/stm32_i2s.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
> index 6aafe793eec4..5a717443b105 100644
> --- a/sound/soc/stm/stm32_i2s.c
> +++ b/sound/soc/stm/stm32_i2s.c
> @@ -1139,12 +1139,15 @@ static int stm32_i2s_probe(struct platform_device *pdev)
>  	pm_runtime_enable(&pdev->dev);
>  
>  	ret = snd_dmaengine_pcm_register(&pdev->dev, &stm32_i2s_pcm_config, 0);
> -	if (ret)
> +	if (ret) {
> +		pm_runtime_disable(&pdev->dev);
>  		return dev_err_probe(&pdev->dev, ret, "PCM DMA register error\n");
> +	}
>  
>  	ret = snd_soc_register_component(&pdev->dev, &stm32_i2s_component,
>  					 i2s->dai_drv, 1);
>  	if (ret) {
> +		pm_runtime_disable(&pdev->dev);
>  		snd_dmaengine_pcm_unregister(&pdev->dev);
>  		return ret;
>  	}

Seems that there the error has been introduced in this commit:
32a956a1fadf ("ASoC: stm32: i2s: add pm_runtime support")
The pm_runtime_enable should be at the end of the stm32_i2s_probe as done here:
https://github.com/STMicroelectronics/linux/blob/v5.15-stm32mp/sound/soc/stm/stm32_i2s.c#L1200

Please, could you update your patch in this way?
With also an update of the "Fixes:" reference in the commit message

Thanks,
Arnaud
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
