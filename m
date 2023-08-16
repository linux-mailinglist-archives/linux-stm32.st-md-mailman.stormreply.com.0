Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CCF77E1D8
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Aug 2023 14:47:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37D9DC6B45F;
	Wed, 16 Aug 2023 12:47:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4E91C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 12:47:05 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37G8qjtr002221; Wed, 16 Aug 2023 14:46:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=6IIIYqjWahj7HUzOMPEBtJ+VyAunz06AUZOLbTWwnEU=; b=TP
 EX7qATYUhi4HYq1GpcVtDfJu3ZTtdv/S42UgzOw2VwLhKWxzEq/WxVRIcfi3sWXS
 2c+dK4XixYxi5Qn/aRmPPgRnRco+YOLfubYKg0Q6yB/zQp3+CmwOBmynWF/HZr1U
 cIyV9rh61OEA3XU0DLAi0Rc5VM4V4DAQ1xKIiqlY8++x8QxpQe6AxPfCx5s52hDT
 qj48yKhWz/d+37psnkB9OcvU2MAIulWcdV5ktSKpTcc43iFXK5FOsVhXZ6gPkpsd
 MUcbMWbgy9wzb+UuIPKYpESmOlPFAZI/GHY3NdEOcDaT9VBdEL7alxmTHBvvm0RP
 dIeUonqwYPAzGoHOBZSA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sgth61r3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Aug 2023 14:46:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CBAED100061;
 Wed, 16 Aug 2023 14:46:34 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3B51237D9B;
 Wed, 16 Aug 2023 14:46:34 +0200 (CEST)
Received: from [10.201.22.206] (10.201.22.206) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 16 Aug
 2023 14:46:34 +0200
Message-ID: <15e381f6-aabd-8a3a-7911-4e64828b0fdc@foss.st.com>
Date: Wed, 16 Aug 2023 14:46:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Chen Jiahao <chenjiahao16@huawei.com>, <andersson@kernel.org>,
 <mathieu.poirier@linaro.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <linux-remoteproc@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20230802095128.995428-1-chenjiahao16@huawei.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20230802095128.995428-1-chenjiahao16@huawei.com>
X-Originating-IP: [10.201.22.206]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_12,2023-08-15_02,2023-05-22_02
Subject: Re: [Linux-stm32] [PATCH -next] remoteproc: stm32: Clean up
 redundant dev_err_probe()
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

Hi,

On 8/2/23 11:51, Chen Jiahao wrote:
> Referring to platform_get_irq()'s definition, the return value has
> already been checked if ret < 0, and printed via dev_err_probe().
> Calling dev_err_probe() one more time outside platform_get_irq()
> is obviously redundant.
> 
> Removing dev_err_probe() outside platform_get_irq() to clean up
> above problem.
> 
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 98234b44f038..a09eeb83ea5c 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -714,7 +714,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq == -EPROBE_DEFER)
> -		return dev_err_probe(dev, irq, "failed to get interrupt\n");
> +		return irq;

The IRQ is optional so using platform_get_irq_optional seems a better option to me.

-  	irq = platform_get_irq(pdev, 0);
+  	irq = platform_get_irq_optional(pdev, 0);
>  	if (irq == -EPROBE_DEFER)
>		return dev_err_probe(dev, irq, "failed to get interrupt\n");

Thanks,
Arnaud

>  
>  	if (irq > 0) {
>  		err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
