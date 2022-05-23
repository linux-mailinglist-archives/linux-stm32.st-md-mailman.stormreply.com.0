Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E44D531108
	for <lists+linux-stm32@lfdr.de>; Mon, 23 May 2022 15:29:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0950EC0C921;
	Mon, 23 May 2022 13:29:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53AB8C03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 May 2022 13:29:51 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24N9xdhD006609;
 Mon, 23 May 2022 15:28:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jJsyl0iPrPGingdrz7S9fW1LlrFUbRPrtfFvWpEpm4E=;
 b=vd3BSQY30vt99np/gBPbs4uDPCq/6vhh8m4VMA2aLZ08iX3Fmcik/DU4oMUnQBQJMjgd
 2Bg8YiH93N20NjkYNFXtgWU5+ctHBEIBde3dDBKq6OvlGS4zQ+7kN5OTKONYasyoBirr
 /gYSZIUj8GxDPrfCEwHbj/6OCLgumEzVDZpperV+M1/muEoOaq+low8Bjf4tdH0Cif6M
 2cIVivXYzuT3rCME4fQMhUB+0meGX57VkzbwVNrY5sAvHviNTyhGNUHzigQYdG+PjZTS
 q8N+Nc1xP62KxKUxzISyrYYAvrdr/rwjXbfLwrIi0q5ornCN1MtdDojEhH/btSwZC+jQ vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g6rv6hbnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 15:28:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 393AF10002A;
 Mon, 23 May 2022 15:28:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E22042248D9;
 Mon, 23 May 2022 15:28:50 +0200 (CEST)
Received: from [10.201.20.178] (10.75.127.44) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 23 May
 2022 15:28:49 +0200
Message-ID: <69d5cef3-57c0-9bc7-a83b-a85ef1c4cf29@foss.st.com>
Date: Mon, 23 May 2022 15:28:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Tang Bin <tangbin@cmss.chinamobile.com>, <arnaud.pouliquen@foss.st.com>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>
References: <20220519124235.21100-1-tangbin@cmss.chinamobile.com>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20220519124235.21100-1-tangbin@cmss.chinamobile.com>
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-23_06,2022-05-23_01,2022-02-23_01
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm32: sai: Use
 of_device_get_match_data() to simplify code
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

Hello Tang,

Thanks for the patch. Unfortunately this patch introduces a regression.

In the SAI driver of_device_id struct the data is a simple enum cast to 
void* pointer.
static const struct of_device_id stm32_sai_sub_ids[] = {
	  .data = (void *)STM_SAI_A_ID},

This data is an ID which can be set to 0x0.
Here we have no way to know to discriminate between an error returned by 
of_device_get_match_data() or a data id set to 0x0.

The current patch requires a change in the driver.
Either changing STM_SAI_x_ID enums, or replacing data by a struct.
For instance:
struct stm32_sai_comp_data {
	unsigned int id;
}
struct stm32_sai_comp_data stm32_sai_comp_data_a = {
	.id = STM_SAI_A_ID;
}
struct of_device_id stm32_sai_sub_ids[] = {
	.data = &stm32_sai_comp_data_a},
}

Regards
Olivier

On 5/19/22 14:42, Tang Bin wrote:
> Retrieve of match data, it's better and cleaner to use
> 'of_device_get_match_data' over 'of_match_device'.
> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>   sound/soc/stm/stm32_sai_sub.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
> index dd636af81..d300605a2 100644
> --- a/sound/soc/stm/stm32_sai_sub.c
> +++ b/sound/soc/stm/stm32_sai_sub.c
> @@ -1500,7 +1500,6 @@ static int stm32_sai_sub_parse_of(struct platform_device *pdev,
>   static int stm32_sai_sub_probe(struct platform_device *pdev)
>   {
>   	struct stm32_sai_sub_data *sai;
> -	const struct of_device_id *of_id;
>   	const struct snd_dmaengine_pcm_config *conf = &stm32_sai_pcm_config;
>   	int ret;
>   
> @@ -1508,10 +1507,9 @@ static int stm32_sai_sub_probe(struct platform_device *pdev)
>   	if (!sai)
>   		return -ENOMEM;
>   
> -	of_id = of_match_device(stm32_sai_sub_ids, &pdev->dev);
> -	if (!of_id)
> +	sai->id = (uintptr_t)of_device_get_match_data(&pdev->dev);
> +	if (!sai->id)
>   		return -EINVAL;
> -	sai->id = (uintptr_t)of_id->data;
>   
>   	sai->pdev = pdev;
>   	mutex_init(&sai->ctrl_lock);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
