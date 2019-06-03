Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9A732CA4
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2019 11:20:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C4F3CA4C87
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2019 09:20:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 566B5CA4C85
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2019 09:20:08 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x539G8qF016966; Mon, 3 Jun 2019 11:20:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=KP1E2smY61q6p4hXM1Poa06ylj50nuS1wWa3VqF16Hw=;
 b=HFaqQm0fM+7F/PSlDShv3fAXd4tCEhioUJFUpktHYtv5ej4P2yund40IoGpbUy3RoFb7
 y0KYACDxLfOLieIn71YtUCyn3sg1J+h0P6BoP3KWybqkqDw6789aMJoyimNIyvCB5A6j
 cGgA1yvkQeL3kDgm8jljxHwkrMvpDMjBKH34jqNl/MKvcfF9efDOPUixbGVrf22WLZpD
 kdmPChZA45thqjZeUYsc6jP6rbJSEURQwiEmpV10l+ZifMbj+VGp4dSP4kBuHRjlMv1f
 3D6eEGaXbd6UugL8HuNQXoNLkh5oRWtpJdHV0ZnHtwcNhu7TTRYy5rhF4rb4nQetXSjj Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sunmc13fk-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 03 Jun 2019 11:20:03 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 939683F;
 Mon,  3 Jun 2019 09:20:02 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3B8BC2619;
 Mon,  3 Jun 2019 09:20:02 +0000 (GMT)
Received: from SFHDAG3NODE2.st.com (10.75.127.8) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 3 Jun
 2019 11:20:02 +0200
Received: from SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96]) by
 SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96%20]) with mapi id
 15.00.1347.000; Mon, 3 Jun 2019 11:20:01 +0200
From: Amelie DELAUNAY <amelie.delaunay@st.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Lee Jones <lee.jones@linaro.org>
Thread-Topic: [PATCH] mfd: stmfx: Uninitialized variable in stmfx_irq_handler()
Thread-Index: AQHVCwEO/u3xED8wwkiZua0lI4uaJqaJo4GA
Date: Mon, 3 Jun 2019 09:20:01 +0000
Message-ID: <ccefbd0b-3397-a26e-95e7-059fcced9154@st.com>
References: <20190515093141.GA3409@mwanda>
In-Reply-To: <20190515093141.GA3409@mwanda>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <DC5391FCB7987D46B2273D74DD2C441A@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-03_07:, , signatures=0
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] mfd: stmfx: Uninitialized variable in
	stmfx_irq_handler()
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

Hi Dan,

Thanks for your patch. One minor comment:

On 5/15/19 11:31 AM, Dan Carpenter wrote:
> The problem is that on 64bit systems then we don't clear the higher
> bits of the "pending" variable.  So when we do:
> 
> 	ack = pending & ~BIT(STMFX_REG_IRQ_SRC_EN_GPIO);
> 	if (ack) {
> 
> the if (ack) condition relies on uninitialized data.  The fix it that
> I've changed "pending" from an unsigned long to a u32.  I changed "n" as
> well, because that's a number in the 0-10 range and it fits easily
> inside an int.  We do need to add a cast to "pending" when we use it in
> the for_each_set_bit() loop, but that doesn't cause a proble, it's
> fine.
> 
> Fixes: 06252ade9156 ("mfd: Add ST Multi-Function eXpander (STMFX) core driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/mfd/stmfx.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
> index fe8efba2d45f..fee75b5d098e 100644
> --- a/drivers/mfd/stmfx.c
> +++ b/drivers/mfd/stmfx.c
> @@ -204,12 +204,12 @@ static struct irq_chip stmfx_irq_chip = {
>   static irqreturn_t stmfx_irq_handler(int irq, void *data)
>   {
>   	struct stmfx *stmfx = data;
> -	unsigned long n, pending;
> +	u32 pending;
>   	u32 ack;
> +	int n;
>   	int ret;

Could you group:

u32 pending, ack;
int n, ret;

>   
> -	ret = regmap_read(stmfx->map, STMFX_REG_IRQ_PENDING,
> -			  (u32 *)&pending);
> +	ret = regmap_read(stmfx->map, STMFX_REG_IRQ_PENDING, &pending);
>   	if (ret)
>   		return IRQ_NONE;
>   
> @@ -224,7 +224,7 @@ static irqreturn_t stmfx_irq_handler(int irq, void *data)
>   			return IRQ_NONE;
>   	}
>   
> -	for_each_set_bit(n, &pending, STMFX_REG_IRQ_SRC_MAX)
> +	for_each_set_bit(n, (unsigned long *)&pending, STMFX_REG_IRQ_SRC_MAX)
>   		handle_nested_irq(irq_find_mapping(stmfx->irq_domain, n));
>   
>   	return IRQ_HANDLED;
> 

I've tested it on stm32mp157c-ev1, so you can add my
Tested-by: Amelie Delaunay <amelie.delaunay@st.com>

Regards,
Amelie
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
