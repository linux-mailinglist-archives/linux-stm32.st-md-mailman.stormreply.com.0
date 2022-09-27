Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2425EC1CD
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 13:46:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71AC2C63326;
	Tue, 27 Sep 2022 11:46:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20BFDC03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 11:46:36 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28RAmFNK018528;
 Tue, 27 Sep 2022 13:46:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=p7nSaAy+cZg+KQL/F8o0vNcZWrBXnchWV1z54NpHiRs=;
 b=kqa4JbcqYBk1y8Jxh8DSdn60BBe9AZWRn+G6Dt698eW7nvSB3cJV/Rknpa+WCrZWpwWs
 RSaNSFnuHdnFtVBGHJJaNgD705V8hpZoapaKb1l4qVlUliNlTcF7IyrJrz384h3gecfL
 3Ololazctb0vYn+LiXPKVwIPCNRhFaOwgSPG6rBbc/BrlLy+4DBTNTdHfZ6xPldfWDDF
 2AQYqZgO7/QALgi/sv/huoIvEfwuFBW1AzZEswLCWN+sTGBlUE4aH5OYGJo4Discly61
 PozCc7hV3efjCtKHPXysUpmYeE2KGUJ21QrkoDAJX5dfBVzoWFe0HYyI/Zzy1RGqaQG8 kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jss8298k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 13:46:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 17DAB10002A;
 Tue, 27 Sep 2022 13:46:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 121E321B523;
 Tue, 27 Sep 2022 13:46:27 +0200 (CEST)
Received: from [10.201.20.178] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 13:46:26 +0200
Message-ID: <42001826-e4aa-7d6a-af1e-b2bf935f3d38@foss.st.com>
Date: Tue, 27 Sep 2022 13:46:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Zhang Qilong <zhangqilong3@huawei.com>, <arnaud.pouliquen@foss.st.com>
References: <20220926134155.121427-1-zhangqilong3@huawei.com>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20220926134155.121427-1-zhangqilong3@huawei.com>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_03,2022-09-27_01,2022-06-22_01
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 -next] ASoC: stm: Fix PM disable depth
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Zhang,

Thanks.You can add my:
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

BRs

On 9/26/22 15:41, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by moving
> pm_runtime_enable to the endding of stm32_i2s_probe.
> 
> Fixes:32a956a1fadf ("ASoC: stm32: i2s: add pm_runtime support")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
> v2:
> - Move pm_runtime_enable to the endding of stm32_i2s_probe
>    and correct fixes commit.
> ---
>   sound/soc/stm/stm32_i2s.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
> index 6aafe793eec4..ce7f6942308f 100644
> --- a/sound/soc/stm/stm32_i2s.c
> +++ b/sound/soc/stm/stm32_i2s.c
> @@ -1136,8 +1136,6 @@ static int stm32_i2s_probe(struct platform_device *pdev)
>   		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->regmap),
>   				     "Regmap init error\n");
>   
> -	pm_runtime_enable(&pdev->dev);
> -
>   	ret = snd_dmaengine_pcm_register(&pdev->dev, &stm32_i2s_pcm_config, 0);
>   	if (ret)
>   		return dev_err_probe(&pdev->dev, ret, "PCM DMA register error\n");
> @@ -1180,6 +1178,8 @@ static int stm32_i2s_probe(struct platform_device *pdev)
>   			FIELD_GET(I2S_VERR_MIN_MASK, val));
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
