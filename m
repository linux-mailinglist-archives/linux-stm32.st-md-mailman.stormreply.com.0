Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BE85F2369
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Oct 2022 15:42:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFA5DC640F5;
	Sun,  2 Oct 2022 13:42:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 067A6C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Oct 2022 13:42:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E233260EB4;
 Sun,  2 Oct 2022 13:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B55AC433D6;
 Sun,  2 Oct 2022 13:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664718119;
 bh=UJTWF29awJ/Xbq5Xg+xQ+UmGCzbSkpY9nIUrY+MBJE8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=afQm++9Avlzt4cpTxwgUzj6QY2j1GTSmg80hJdg2ct/n8vztAps59qeTrxl4Mvs0C
 fdmjY1EuaCdAdaRtuk51TI3Rwbv+9ulblX1PStbojk+pJ4CPJcGxHE3Cs8x/JhlEjK
 pv73v7ERxRHlr8kiF5uMENkGk4Zr3Od7imm4nMA8xaZnTs2IDHREMD6oCI/ZLGY9Q5
 UYsH21f/WztQ1+9erKEqrHbtOU4RkeDdcGkXzDCy5RK9BUIzj2If3MUYT+2EEfjFGs
 LNKl1OJT/21GAD+0aU1p/1DigqgttdhNA2Dvk/0gtX9m5HCONiiS+gN9yAnr4KkUM6
 dRxdKm6Gg8g3g==
Date: Sun, 2 Oct 2022 14:42:13 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20221002144213.4d6d4363@jic23-huawei>
In-Reply-To: <20220928164114.48339-4-olivier.moysan@foss.st.com>
References: <20220928164114.48339-1-olivier.moysan@foss.st.com>
 <20220928164114.48339-4-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, Wan Jiabing <wanjiabing@vivo.com>,
 linux-kernel@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, nuno.sa@analog.com,
 Paul Cercueil <paul@crapouillou.net>, linux-iio@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/8] iio: adc: stm32-adc: add stm32mp13
	support
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

On Wed, 28 Sep 2022 18:41:09 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> Add STM32 ADC support for STM32MP13x SOCs family.
> 
> On STM32MP13x, each ADC peripheral has a single ADC block.

Wrap this a bit nearer 80 chars. Personally I go with 75, but anywhere around
that is fine.

> These ADC peripherals, ADC1 and ADC2, are fully independent.
> This introduces changes in common registers handling.
> 
> Some features such as boost mode, channel preselection and
> linear calibration are not supported by the STM32MP13x ADC.
> Add diversity management for these features.
> 
> The STM32MP13x ADC introduces registers and bitfield variants
> on existing features such as calibration factors and internal
> channels. Add register diversity management.
> 
> Add also support of new internal channels VDDCPU and VDDQ_DDR.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Hi Oliver

A few really trivial things inline,

Jonathan

> ---
>  drivers/iio/adc/stm32-adc-core.c |  21 +++
>  drivers/iio/adc/stm32-adc-core.h |  32 +++++
>  drivers/iio/adc/stm32-adc.c      | 212 +++++++++++++++++++++++++++----
>  3 files changed, 237 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> index 81d5db91c67b..6564aa61b595 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -322,6 +322,16 @@ static const struct stm32_adc_common_regs stm32h7_adc_common_regs = {
>  	.eocie_msk = STM32H7_EOCIE,
>  };
>  
> +/* STM32MP13 common registers definitions */
> +static const struct stm32_adc_common_regs stm32mp13_adc_common_regs = {
> +	.csr = STM32H7_ADC_CSR,
> +	.ccr = STM32H7_ADC_CCR,
> +	.eoc_msk = { STM32H7_EOC_MST},

space before },
ouch. I see this odd balance is common in this driver.  Don't carry it on and
if you fancy adding the missing spaces to the rest of the driver that would be
great!

> +	.ovr_msk = { STM32H7_OVR_MST},
> +	.ier = STM32H7_ADC_IER,
> +	.eocie_msk = STM32H7_EOCIE,
> +};
> +
>  static const unsigned int stm32_adc_offset[STM32_ADC_MAX_ADCS] = {
>  	0, STM32_ADC_OFFSET, STM32_ADC_OFFSET * 2,
>  };
> @@ -868,6 +878,14 @@ static const struct stm32_adc_priv_cfg stm32mp1_adc_priv_cfg = {
>  	.num_irqs = 2,
>  };
>  
> +static const struct stm32_adc_priv_cfg stm32mp13_adc_priv_cfg = {
> +	.regs = &stm32mp13_adc_common_regs,
> +	.clk_sel = stm32h7_adc_clk_sel,
> +	.max_clk_rate_hz = 75000000,
> +	.ipid = STM32MP13_IPIDR_NUMBER,
> +	.num_irqs = 1,
> +};
> +
>  static const struct of_device_id stm32_adc_of_match[] = {
>  	{
>  		.compatible = "st,stm32f4-adc-core",
> @@ -878,6 +896,9 @@ static const struct of_device_id stm32_adc_of_match[] = {
>  	}, {
>  		.compatible = "st,stm32mp1-adc-core",
>  		.data = (void *)&stm32mp1_adc_priv_cfg
> +	}, {
> +		.compatible = "st,stm32mp13-adc-core",
> +		.data = (void *)&stm32mp13_adc_priv_cfg
>  	}, {
>  	},
>  };
> diff --git a/drivers/iio/adc/stm32-adc-core.h b/drivers/iio/adc/stm32-adc-core.h
> index 2118ef63843d..658fef4308ac 100644
> --- a/drivers/iio/adc/stm32-adc-core.h
> +++ b/drivers/iio/adc/stm32-adc-core.h
> @@ -112,6 +112,11 @@
>  #define STM32MP1_ADC_IPDR		0x3F8
>  #define STM32MP1_ADC_SIDR		0x3FC
>  
> +/* STM32MP13 - Registers for each ADC instance */
> +#define STM32MP13_ADC_DIFSEL		0xB0
> +#define STM32MP13_ADC_CALFACT		0xB4
> +#define STM32MP13_ADC2_OR		0xC8
> +
>  /* STM32H7 - common registers for all ADC instances */
>  #define STM32H7_ADC_CSR			(STM32_ADCX_COMN_OFFSET + 0x00)
>  #define STM32H7_ADC_CCR			(STM32_ADCX_COMN_OFFSET + 0x08)
> @@ -161,6 +166,10 @@ enum stm32h7_adc_dmngt {
>  	STM32H7_DMNGT_DMA_CIRC,		/* DMA circular mode */
>  };
>  
> +/* STM32H7_ADC_DIFSEL - bit fields */
> +#define STM32H7_DIFSEL_SHIFT		0

This shift is both unnecessary, as encoded in the mask, and unused
so you can definitely get rid of it.
Might be nice to clean the rest of these out as well in favour of
just using the masks and FIELD_PREP() etc for any places where the mask
is a compile time constant.

Please check the others are actually useful.


> +#define STM32H7_DIFSEL_MASK		GENMASK(19, 0)
> +
>  /* STM32H7_ADC_CALFACT - bit fields */
>  #define STM32H7_CALFACT_D_SHIFT		16
>  #define STM32H7_CALFACT_D_MASK		GENMASK(26, 16)
> @@ -210,7 +219,30 @@ enum stm32h7_adc_dmngt {
>  /* STM32MP1_ADC_SIDR - bit fields */
>  #define STM32MP1_SIDR_MASK		GENMASK(31, 0)
...

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
