Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F786FE88
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jul 2019 13:10:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D8D9CCB322;
	Mon, 22 Jul 2019 11:10:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E023CCAE52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 10:26:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B0FD28;
 Mon, 22 Jul 2019 03:26:12 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D4AE3F71A;
 Mon, 22 Jul 2019 03:26:10 -0700 (PDT)
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20190719184606.GA4701@hari-Inspiron-1545>
From: Steven Price <steven.price@arm.com>
Message-ID: <1d9aa4be-4da2-b532-4787-c98869c0bd9d@arm.com>
Date: Mon, 22 Jul 2019 11:26:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190719184606.GA4701@hari-Inspiron-1545>
Content-Language: en-GB
X-Mailman-Approved-At: Mon, 22 Jul 2019 11:10:55 +0000
Subject: Re: [Linux-stm32] [PATCH] rqchip/stm32: Remove unneeded call to
	kfree
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

On 19/07/2019 19:46, Hariprasad Kelam wrote:
> Memory allocated by devm_ alloc will be freed upon device detachment. So
> we may not require free memory.
> 
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> ---
>  drivers/irqchip/irq-stm32-exti.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
> index e00f2fa..46ec0af 100644
> --- a/drivers/irqchip/irq-stm32-exti.c
> +++ b/drivers/irqchip/irq-stm32-exti.c
> @@ -779,8 +779,6 @@ static int __init stm32_exti_init(const struct stm32_exti_drv_data *drv_data,
>  	irq_domain_remove(domain);
>  out_unmap:
>  	iounmap(host_data->base);
> -	kfree(host_data->chips_data);
> -	kfree(host_data);

In the commit this is based on these variables are not allocated using a
devm_ alloc function:

$ git show e00f2fa | grep -A12 *stm32_exti_host_init
> stm32_exti_host_data *stm32_exti_host_init(const struct stm32_exti_drv_data *dd,
> 					   struct device_node *node)
> {
> 	struct stm32_exti_host_data *host_data;
> 
> 	host_data = kzalloc(sizeof(*host_data), GFP_KERNEL);
> 	if (!host_data)
> 		return NULL;
> 
> 	host_data->drv_data = dd;
> 	host_data->chips_data = kcalloc(dd->bank_nr,
> 					sizeof(struct stm32_exti_chip_data),
> 					GFP_KERNEL);
The function stm32_exti_probe *does* use devm_k?alloc, so perhaps you
were getting confused with that?

Steve

>  	return ret;
>  }
>  
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
