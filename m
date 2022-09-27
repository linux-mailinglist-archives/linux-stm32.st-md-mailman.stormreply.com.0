Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FD85EC1B4
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 13:42:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2ED3DC63326;
	Tue, 27 Sep 2022 11:42:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 495E5C03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 11:42:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28RAmGKA018243;
 Tue, 27 Sep 2022 13:42:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qM9BvEOkGGUoy3w55y3w7QUBXL8GafqVVms0iRqWss0=;
 b=1qlHSaAMrbmapL3s12k5+7GrxvXwTW6KQ+9k5s+b7UP+26VbGYXxhDzf/sIUKqx/MKQ2
 IsXYPKiBa+xYsEXoulPSOKEbcAkOvxBOVwnwcZp124q1NjwqfcfKuJoDPKQkl8OGf2cz
 tDkmB856Mtlq65J7/W4QdlvO84x7AjWUop+er2JLFU1dkjdJuk0ErrQtqZz4S1XqW2CY
 ZLbCLfkW8xktfCXFcy4M3N2OQIF1UzMEXNhzuEplzzPLdYWZ2VymiJDNFZDaCzvfkKQF
 xY8czZmd6US/Lls0/OKPhEd/2j4Qhnnjd9XTmg+loOc+w0vv4vPrUNQk/oo+ubCSaeA/ LQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsrsjj09n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 13:42:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB56310002A;
 Tue, 27 Sep 2022 13:42:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1860121F0B7;
 Tue, 27 Sep 2022 13:42:24 +0200 (CEST)
Received: from [10.201.20.178] (10.75.127.117) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 13:42:23 +0200
Message-ID: <0e8d3e9a-97cb-3ce1-4778-600eda54ee9e@foss.st.com>
Date: Tue, 27 Sep 2022 13:42:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Zhang Qilong <zhangqilong3@huawei.com>, <arnaud.pouliquen@foss.st.com>
References: <20220926141132.124245-1-zhangqilong3@huawei.com>
 <20220926141132.124245-3-zhangqilong3@huawei.com>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20220926141132.124245-3-zhangqilong3@huawei.com>
X-Originating-IP: [10.75.127.117]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_03,2022-09-27_01,2022-06-22_01
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH -next 2/2] ASoC: stm32: spdifrx: Fix PM
 disable depth imbalance in stm32_spdifrx_probe
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
> pm_runtime_enable to the endding of stm32_spdifrx_probe.
> 
> Fixes:ac5e3efd55868 ("ASoC: stm32: spdifrx: add pm_runtime support")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>   sound/soc/stm/stm32_spdifrx.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
> index 0f7146756717..d399c906bb92 100644
> --- a/sound/soc/stm/stm32_spdifrx.c
> +++ b/sound/soc/stm/stm32_spdifrx.c
> @@ -1002,8 +1002,6 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
>   	udelay(2);
>   	reset_control_deassert(rst);
>   
> -	pm_runtime_enable(&pdev->dev);
> -
>   	pcm_config = &stm32_spdifrx_pcm_config;
>   	ret = snd_dmaengine_pcm_register(&pdev->dev, pcm_config, 0);
>   	if (ret)
> @@ -1036,6 +1034,8 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
>   			FIELD_GET(SPDIFRX_VERR_MIN_MASK, ver));
>   	}
>   
> +	pm_runtime_enable(&pdev->dev);
> +
>   	return ret;
>   
>   error:
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
