Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A18D6800815
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Dec 2023 11:20:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 556B3C6B479;
	Fri,  1 Dec 2023 10:20:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD667C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Dec 2023 10:20:38 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3B19RQ37024616; Fri, 1 Dec 2023 11:20:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=eH7QCL/HgO5fMZ7eXd5hJkyiBFa7hbWuKmQuQSf7qKI=; b=TE
 z1kNwKlDmzJP+OwK1OHW9tZaQ0/A8j84HNEgR3hFEhHgxnCYQ05z83TJvwgPygdD
 zxt0CU6ijgVu9qS2FGaDKs5tbu6NSyX6rzejYv+JyWB+tCsmXPuC14B55b1qOLMt
 MXUaz5t0UgKnb8y1Yfe9HQEYJAKawaeVUWrV7HzuYpLZVyf8ybRIqpxeFlQaMAav
 dm4W1NGngQJJ+SNCxneAXlssVU0MmbC34Do0ptkFARoQTP8VfoCj6NYANK1H3sIC
 my8PYYwLXAa9uOUqJwvzf5nJF/JmMAU+sGUiNttWQnCx53rNv+sgCuPR3WdkrvcF
 i/OykepDz6X3S74RhYfg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uk8pkakfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 11:20:17 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E33C100079;
 Fri,  1 Dec 2023 11:20:15 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7622E215152;
 Fri,  1 Dec 2023 11:20:15 +0100 (CET)
Received: from [10.201.20.32] (10.201.20.32) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Dec
 2023 11:20:14 +0100
Message-ID: <94981d84-52c4-4c9a-8042-c622d73d1e0e@foss.st.com>
Date: Fri, 1 Dec 2023 11:18:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yang Yingliang <yangyingliang@huaweicloud.com>,
 <linux-crypto@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20231201082048.1975940-1-yangyingliang@huaweicloud.com>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20231201082048.1975940-1-yangyingliang@huaweicloud.com>
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_08,2023-11-30_01,2023-05-22_02
Cc: yangyingliang@huawei.com, herbert@gondor.apana.org.au,
 mcoquelin.stm32@gmail.com
Subject: Re: [Linux-stm32] [PATCH] hwrng: stm32 - add missing
 clk_disable_unprepare() in stm32_rng_init()
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

Hi Yang,

Good spot, thank you.

Reviewed-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Best regards,
Gatien

On 12/1/23 09:20, Yang Yingliang wrote:
> From: Yang Yingliang <yangyingliang@huawei.com>
> 
> Add clk_disable_unprepare() in the error path in stm32_rng_init().
> 
> Fixes: 6b85a7e141cb ("hwrng: stm32 - implement STM32MP13x support")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/char/hw_random/stm32-rng.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
> index 41e1dbea5d2e..efd6edcd7066 100644
> --- a/drivers/char/hw_random/stm32-rng.c
> +++ b/drivers/char/hw_random/stm32-rng.c
> @@ -325,6 +325,7 @@ static int stm32_rng_init(struct hwrng *rng)
>   							(!(reg & RNG_CR_CONDRST)),
>   							10, 50000);
>   		if (err) {
> +			clk_disable_unprepare(priv->clk);
>   			dev_err((struct device *)priv->rng.priv,
>   				"%s: timeout %x!\n", __func__, reg);
>   			return -EINVAL;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
