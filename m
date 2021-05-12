Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE48037BC33
	for <lists+linux-stm32@lfdr.de>; Wed, 12 May 2021 14:03:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFBE6C57B74;
	Wed, 12 May 2021 12:03:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64239C57B5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 May 2021 12:03:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14CBvo5o012498; Wed, 12 May 2021 14:03:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=3h4SZOKWINWrqofFVWPe+plSxjkAE9CcDog/F00FKbc=;
 b=AtvewbwZb4KneRv1Jft8aVkGZc71iqHfypKlafqu5ju1kPJgkd/bmL1Ns9eYwx8L3zTn
 04MVlN1tj2gtSt2UWJ3FKQaTcfyrDSZb6+vvy7J/dYiEb70xacdS32AW2ONJCjCTYiqw
 AT9O8yb8Sj0gN82g2/VwaVDOUUMhMsBJ0MPRXZMV0FSefx5GvZDYLaQuzRakfafw6opp
 vtDQfXvmAmwvgNFQjB6X3DYjVbMkGM4QjiO+v/QuIOx+MzJllW11tdMARZA7TpPh9UxJ
 GLHxre+4ob8qabdDbNnAKYFhd3RSonIcOX66OT26wy4n+EhOW7x/9zz7cXUGulCyBIeg oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38fq9tq8mk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 May 2021 14:03:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BDF4510002A;
 Wed, 12 May 2021 14:03:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AEE3C221763;
 Wed, 12 May 2021 14:03:16 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 12 May
 2021 14:03:15 +0200
To: Zhen Lei <thunder.leizhen@huawei.com>, Thomas Gleixner
 <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, linux-stm32
 <linux-stm32@st-md-mailman.stormreply.com>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
References: <20210511100409.5103-1-thunder.leizhen@huawei.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <b5882b7b-69df-5107-2786-1eb1ed2a5a9d@foss.st.com>
Date: Wed, 12 May 2021 14:03:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210511100409.5103-1-thunder.leizhen@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-12_06:2021-05-12,
 2021-05-12 signatures=0
Subject: Re: [Linux-stm32] [PATCH 1/1] irqchip/stm32-exti: Remove redundant
 error printing in stm32_exti_probe()
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

On 5/11/21 12:04 PM, Zhen Lei wrote:
> When devm_ioremap_resource() fails, a clear enough error message will be
> printed by its subfunction __devm_ioremap_resource(). The error
> information contains the device name, failure cause, and possibly resource
> information.
> 
> Therefore, remove the error printing here to simplify code and reduce the
> binary size.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>   drivers/irqchip/irq-stm32-exti.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
> index b9db90c4aa566f1..4704f2ee5797a1d 100644
> --- a/drivers/irqchip/irq-stm32-exti.c
> +++ b/drivers/irqchip/irq-stm32-exti.c
> @@ -892,10 +892,8 @@ static int stm32_exti_probe(struct platform_device *pdev)
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	host_data->base = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(host_data->base)) {
> -		dev_err(dev, "Unable to map registers\n");
> +	if (IS_ERR(host_data->base))
>   		return PTR_ERR(host_data->base);
> -	}
>   
>   	for (i = 0; i < drv_data->bank_nr; i++)
>   		stm32_exti_chip_init(host_data, i, np);
> 

Acked-by: Alexandre TORGUE <alexandre.torgue@foss.st.com>

thanks
alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
