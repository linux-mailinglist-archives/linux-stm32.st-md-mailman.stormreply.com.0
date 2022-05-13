Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC112526292
	for <lists+linux-stm32@lfdr.de>; Fri, 13 May 2022 15:06:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DE93C03FCC;
	Fri, 13 May 2022 13:06:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 407A2C03FCA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 May 2022 13:06:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24D9b4JG011535;
 Fri, 13 May 2022 15:05:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Pd2SgDujk/TY2OLUOJfQwv55lVNwIc4nqp1dIqPNY40=;
 b=tuno4bN6wUGHtxkzXIfEtw2do/pSfIq3wrJjUaVSelvG4VgJh/7GBzBTR33O8s5WRVRd
 Wph4iRvb/QF/gWvT1HmH3rwRPL7k8JLtr1cuulNQZ3LEyU6vGshqMDr8+pG/mlK3w6gm
 MdCUV+Il49ixqImne/aQek9Du2OJM1aCtZ1V/cGnTTpwfB6ttvmJZxNEff/vIC7WgRea
 ZF5QwsSXF2OgNIJ9gqSbY2GHVZOlrCQg19u1NboxvQr9gJZo7pxv8Xbvj9Bw2OUlq/+H
 O/QVvYLhZN7pjk85rudsoApxldwUteCk3ewFLqy8ASENo+0iDAx35KzYghszia+ZMdQl 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g1muyh82x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 15:05:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C82F310002A;
 Fri, 13 May 2022 15:05:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A26C621E69C;
 Fri, 13 May 2022 15:05:48 +0200 (CEST)
Received: from [10.252.23.200] (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 13 May
 2022 15:05:47 +0200
Message-ID: <955f3ed8-fad9-95fc-e036-8a8a6f99de50@foss.st.com>
Date: Fri, 13 May 2022 15:05:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Yannick Brosseau <yannick.brosseau@gmail.com>, <jic23@kernel.org>,
 <lars@metafoo.de>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <olivier.moysan@foss.st.com>
References: <20220506225617.1774604-1-yannick.brosseau@gmail.com>
 <20220506225617.1774604-2-yannick.brosseau@gmail.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20220506225617.1774604-2-yannick.brosseau@gmail.com>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-13_04,2022-05-13_01,2022-02-23_01
Cc: paul@crapouillou.net, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/2] iio: adc: stm32: Iterate through all
 ADCs in irq handler
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

On 5/7/22 00:56, Yannick Brosseau wrote:
> The irq handler was only checking the mask for the first ADCs in the case of the
> F4 and H7 generation, since it was using the num_irq value. This patch add
> the number of ADC in the common register, which map to the number of entries of
> eoc_msk and ovr_msk in stm32_adc_common_regs.
> 
> Tested on a STM32F429NIH6
> 
> Signed-off-by: Yannick Brosseau <yannick.brosseau@gmail.com>
> ---
>  drivers/iio/adc/stm32-adc-core.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 


Hi Yannick,

I confirm you've identified and analyzed here a regression. This is
something that I noticed also earlier (Olivier and I had some patches in
our downstream tree for that. Shame on me that I haven't sent them right
away).

So, I'm fine with your current patch. Please add a Fixes: tag as
suggested by Jonathan and Paul in the cover letter.
Fixes: 695e2f5c289b ("iio: adc: stm32-adc: fix a regression when using
dma and irq")

While you're at it, I suggest to also mention "fix" in the commit
tittle, to make it clear: e.g. it fixes a regression in irq handling on
stm32f4 and stm32h7.


> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> index 142656232157..11c08c56acb0 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -64,6 +64,7 @@ struct stm32_adc_priv;
>   * @max_clk_rate_hz: maximum analog clock rate (Hz, from datasheet)
>   * @has_syscfg: SYSCFG capability flags
>   * @num_irqs:	number of interrupt lines
> + * @num_adcs:   number of ADC instances in the common registers

Minor comment here, this rather is the 'maximum' number of ADC
instances. E.g. on stm32h7, there are two ADC blocks: ADC12 with 2 ADCs
and ADC3 with 1 ADC instantiated separately. So you could update the
comment and/or variable name.

Thanks & Best Regards,
Fabrice


>   */
>  struct stm32_adc_priv_cfg {
>  	const struct stm32_adc_common_regs *regs;
> @@ -71,6 +72,7 @@ struct stm32_adc_priv_cfg {
>  	u32 max_clk_rate_hz;
>  	unsigned int has_syscfg;
>  	unsigned int num_irqs;
> +	unsigned int num_adcs;
>  };
>  
>  /**
> @@ -352,7 +354,7 @@ static void stm32_adc_irq_handler(struct irq_desc *desc)
>  	 * before invoking the interrupt handler (e.g. call ISR only for
>  	 * IRQ-enabled ADCs).
>  	 */
> -	for (i = 0; i < priv->cfg->num_irqs; i++) {
> +	for (i = 0; i < priv->cfg->num_adcs; i++) {
>  		if ((status & priv->cfg->regs->eoc_msk[i] &&
>  		     stm32_adc_eoc_enabled(priv, i)) ||
>  		     (status & priv->cfg->regs->ovr_msk[i]))
> @@ -792,6 +794,7 @@ static const struct stm32_adc_priv_cfg stm32f4_adc_priv_cfg = {
>  	.clk_sel = stm32f4_adc_clk_sel,
>  	.max_clk_rate_hz = 36000000,
>  	.num_irqs = 1,
> +	.num_adcs = 3,
>  };
>  
>  static const struct stm32_adc_priv_cfg stm32h7_adc_priv_cfg = {
> @@ -800,6 +803,7 @@ static const struct stm32_adc_priv_cfg stm32h7_adc_priv_cfg = {
>  	.max_clk_rate_hz = 36000000,
>  	.has_syscfg = HAS_VBOOSTER,
>  	.num_irqs = 1,
> +	.num_adcs = 2,
>  };
>  
>  static const struct stm32_adc_priv_cfg stm32mp1_adc_priv_cfg = {
> @@ -808,6 +812,7 @@ static const struct stm32_adc_priv_cfg stm32mp1_adc_priv_cfg = {
>  	.max_clk_rate_hz = 40000000,
>  	.has_syscfg = HAS_VBOOSTER | HAS_ANASWVDD,
>  	.num_irqs = 2,
> +	.num_adcs = 2,
>  };
>  
>  static const struct of_device_id stm32_adc_of_match[] = {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
