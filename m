Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54158529D07
	for <lists+linux-stm32@lfdr.de>; Tue, 17 May 2022 10:56:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0727BC03FDB;
	Tue, 17 May 2022 08:56:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0FD5C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 May 2022 08:56:43 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24H5DVRE001600;
 Tue, 17 May 2022 10:56:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=s2qEOZlKr9MsuU1i2OUrgyJrLsdjR7f4BRplr0JaGKE=;
 b=XcGqhU3zHJ2vGX7bKwHNLw0WCyn2WeA+XqrtnnVkSqb66SawTiBCsfF+cGcRDIrhhESO
 oP4Z2x+/mehBwZdNGkWW4YM2GFGHG49nhviHf8Bd2u5PYfVx0p3WhprMZbrMih9rQ53L
 J9rFQHli1OU2JQUGXo7bVvy9rTFZNRDDqjYhrzgCdR+jeG47T9vaEdza3JzXReVpdLzY
 9Vq0MFP+tsbD+2ea62L5p2x0JGp56IIAV+EdhKxwZzJ0nmn4ROdGiwG2RlrV/kwdvli2
 6ppjcuYgt2AsL9ZJluWgc+o2FWr4iqu1kqjJvIzMx1ghlSQp0HskgPQn4n/5LXkx8fXn 4g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23ahgnqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 May 2022 10:56:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6557610002A;
 Tue, 17 May 2022 10:56:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 52128214D27;
 Tue, 17 May 2022 10:56:08 +0200 (CEST)
Received: from [10.48.1.102] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 17 May
 2022 10:56:07 +0200
Message-ID: <2330a9a6-877f-2f67-78ac-42aa3cde99dc@foss.st.com>
Date: Tue, 17 May 2022 10:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Yannick Brosseau <yannick.brosseau@gmail.com>, <jic23@kernel.org>,
 <lars@metafoo.de>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <olivier.moysan@foss.st.com>
References: <20220516203939.3498673-1-yannick.brosseau@gmail.com>
 <20220516203939.3498673-2-yannick.brosseau@gmail.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20220516203939.3498673-2-yannick.brosseau@gmail.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-17_01,2022-05-16_02,2022-02-23_01
Cc: paul@crapouillou.net, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] iio: adc: stm32: Fix ADCs
	iteration in irq handler
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

On 5/16/22 22:39, Yannick Brosseau wrote:
> The irq handler was only checking the mask for the first ADCs in the case of the
> F4 and H7 generation, since it was iterating up to the num_irq value. This patch add
> the maximum number of ADC in the common register, which map to the number of entries of
> eoc_msk and ovr_msk in stm32_adc_common_regs. This allow the handler to check all ADCs in
> that module.
> 
> Tested on a STM32F429NIH6.
> 
> Fixes: 695e2f5c289b ("iio: adc: stm32-adc: fix a regression when using dma and irq")
> Signed-off-by: Yannick Brosseau <yannick.brosseau@gmail.com>

Hi Yannick,

Feel free to add my:

Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks,
Fabrice

> ---
>  drivers/iio/adc/stm32-adc-core.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> index 142656232157..bb04deeb7992 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -64,6 +64,7 @@ struct stm32_adc_priv;
>   * @max_clk_rate_hz: maximum analog clock rate (Hz, from datasheet)
>   * @has_syscfg: SYSCFG capability flags
>   * @num_irqs:	number of interrupt lines
> + * @num_adcs:   maximum number of ADC instances in the common registers
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
