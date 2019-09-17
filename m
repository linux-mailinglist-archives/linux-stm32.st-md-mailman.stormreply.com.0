Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF01B4BA3
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Sep 2019 12:12:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A4D1C35E01;
	Tue, 17 Sep 2019 10:12:24 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA657C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Sep 2019 10:12:21 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4281380F730F3DD69CC1;
 Tue, 17 Sep 2019 18:12:18 +0800 (CST)
Received: from localhost (10.202.226.61) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Tue, 17 Sep 2019
 18:12:14 +0800
Date: Tue, 17 Sep 2019 11:11:59 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20190917111159.00001e9f@huawei.com>
In-Reply-To: <6c330b1f-ef95-d9bd-3c8b-ccda03148561@st.com>
References: <1568380890-313-1-git-send-email-fabrice.gasnier@st.com>
 <20190915110524.2ec1b41d@archlinux>
 <6c330b1f-ef95-d9bd-3c8b-ccda03148561@st.com>
Organization: Huawei
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.226.61]
X-CFilter-Loop: Reflected
Cc: mcoquelin.stm32@gmail.com, lars@metafoo.de, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 pmeerw@pmeerw.net, knaack.h@gmx.de, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-adc: fix a race when
 using several adcs with dma and irq
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

On Mon, 16 Sep 2019 13:47:34 +0200
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> On 9/15/19 12:05 PM, Jonathan Cameron wrote:
> > On Fri, 13 Sep 2019 15:21:30 +0200
> > Fabrice Gasnier <fabrice.gasnier@st.com> wrote:
> >   
> >> End of conversion may be handled by using IRQ or DMA. There may be a
> >> race when two conversions complete at the same time on several ADCs.
> >> EOC can be read as 'set' for several ADCs, with:
> >> - an ADC configured to use IRQs. EOCIE bit is set. The handler is normally
> >>   called in this case.
> >> - an ADC configured to use DMA. EOCIE bit isn't set. EOC triggers the DMA
> >>   request instead. It's then automatically cleared by DMA read. But the
> >>   handler gets called due to status bit is temporarily set (IRQ triggered
> >>   by the other ADC).
> >> So both EOC status bit in CSR and EOCIE control bit must be checked
> >> before invoking the interrupt handler (e.g. call ISR only for
> >> IRQ-enabled ADCs).
> >>
> >> Fixes: 2763ea0585c9 ("iio: adc: stm32: add optional dma support")
> >>
> >> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>  
> > Fix looks fine to me, but I'm not keen on splitting out individual bits from
> > register defines.  That's a long term readability nightmare.
> > 
> > See below,
> > 
> > Jonathan
> >   
> >> ---
> >>  drivers/iio/adc/stm32-adc-core.c | 43 +++++++++++++++++++++++++++++++++++++---
> >>  drivers/iio/adc/stm32-adc-core.h | 13 ++++++++++++
> >>  drivers/iio/adc/stm32-adc.c      |  6 ------
> >>  3 files changed, 53 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> >> index 9b85fef..7297396 100644
> >> --- a/drivers/iio/adc/stm32-adc-core.c
> >> +++ b/drivers/iio/adc/stm32-adc-core.c
> >> @@ -71,6 +71,8 @@
> >>   * @eoc1:	adc1 end of conversion flag in @csr
> >>   * @eoc2:	adc2 end of conversion flag in @csr
> >>   * @eoc3:	adc3 end of conversion flag in @csr
> >> + * @ier:	interrupt enable register offset for each adc
> >> + * @eocie_msk:	end of conversion interrupt enable mask in @ier
> >>   */
> >>  struct stm32_adc_common_regs {
> >>  	u32 csr;
> >> @@ -78,6 +80,8 @@ struct stm32_adc_common_regs {
> >>  	u32 eoc1_msk;
> >>  	u32 eoc2_msk;
> >>  	u32 eoc3_msk;
> >> +	u32 ier;
> >> +	u32 eocie_msk;
> >>  };
> >>  
> >>  struct stm32_adc_priv;
> >> @@ -303,6 +307,8 @@ static const struct stm32_adc_common_regs stm32f4_adc_common_regs = {
> >>  	.eoc1_msk = STM32F4_EOC1,
> >>  	.eoc2_msk = STM32F4_EOC2,
> >>  	.eoc3_msk = STM32F4_EOC3,
> >> +	.ier = STM32F4_ADC_CR1,
> >> +	.eocie_msk = STM32F4_EOCIE,
> >>  };
> >>  
> >>  /* STM32H7 common registers definitions */
> >> @@ -311,8 +317,24 @@ static const struct stm32_adc_common_regs stm32h7_adc_common_regs = {
> >>  	.ccr = STM32H7_ADC_CCR,
> >>  	.eoc1_msk = STM32H7_EOC_MST,
> >>  	.eoc2_msk = STM32H7_EOC_SLV,
> >> +	.ier = STM32H7_ADC_IER,
> >> +	.eocie_msk = STM32H7_EOCIE,
> >>  };
> >>  
> >> +static const unsigned int stm32_adc_offset[STM32_ADC_MAX_ADCS] = {
> >> +	0, STM32_ADC_OFFSET, STM32_ADC_OFFSET * 2,
> >> +};
> >> +
> >> +static unsigned int stm32_adc_eoc_enabled(struct stm32_adc_priv *priv,
> >> +					  unsigned int adc)
> >> +{
> >> +	u32 ier, offset = stm32_adc_offset[adc];
> >> +
> >> +	ier = readl_relaxed(priv->common.base + offset + priv->cfg->regs->ier);
> >> +
> >> +	return ier & priv->cfg->regs->eocie_msk;
> >> +}
> >> +
> >>  /* ADC common interrupt for all instances */
> >>  static void stm32_adc_irq_handler(struct irq_desc *desc)
> >>  {
> >> @@ -323,13 +345,28 @@ static void stm32_adc_irq_handler(struct irq_desc *desc)
> >>  	chained_irq_enter(chip, desc);
> >>  	status = readl_relaxed(priv->common.base + priv->cfg->regs->csr);
> >>  
> >> -	if (status & priv->cfg->regs->eoc1_msk)
> >> +	/*
> >> +	 * End of conversion may be handled by using IRQ or DMA. There may be a
> >> +	 * race here when two conversions complete at the same time on several
> >> +	 * ADCs. EOC may be read 'set' for several ADCs, with:
> >> +	 * - an ADC configured to use DMA (EOC triggers the DMA request, and
> >> +	 *   is then automatically cleared by DR read in hardware)
> >> +	 * - an ADC configured to use IRQs (EOCIE bit is set. The handler must
> >> +	 *   be called in this case)
> >> +	 * So both EOC status bit in CSR and EOCIE control bit must be checked
> >> +	 * before invoking the interrupt handler (e.g. call ISR only for
> >> +	 * IRQ-enabled ADCs).
> >> +	 */
> >> +	if (status & priv->cfg->regs->eoc1_msk &&
> >> +	    stm32_adc_eoc_enabled(priv, 0))
> >>  		generic_handle_irq(irq_find_mapping(priv->domain, 0));
> >>  
> >> -	if (status & priv->cfg->regs->eoc2_msk)
> >> +	if (status & priv->cfg->regs->eoc2_msk &&
> >> +	    stm32_adc_eoc_enabled(priv, 1))
> >>  		generic_handle_irq(irq_find_mapping(priv->domain, 1));
> >>  
> >> -	if (status & priv->cfg->regs->eoc3_msk)
> >> +	if (status & priv->cfg->regs->eoc3_msk &&
> >> +	    stm32_adc_eoc_enabled(priv, 2))
> >>  		generic_handle_irq(irq_find_mapping(priv->domain, 2));
> >>  
> >>  	chained_irq_exit(chip, desc);
> >> diff --git a/drivers/iio/adc/stm32-adc-core.h b/drivers/iio/adc/stm32-adc-core.h
> >> index 8af507b..8dc936b 100644
> >> --- a/drivers/iio/adc/stm32-adc-core.h
> >> +++ b/drivers/iio/adc/stm32-adc-core.h
> >> @@ -25,8 +25,21 @@
> >>   * --------------------------------------------------------
> >>   */
> >>  #define STM32_ADC_MAX_ADCS		3
> >> +#define STM32_ADC_OFFSET		0x100
> >>  #define STM32_ADCX_COMN_OFFSET		0x300
> >>  
> >> +/* STM32F4 - registers for each ADC instance */
> >> +#define STM32F4_ADC_CR1			0x04
> >> +
> >> +/* STM32F4_ADC_CR1 - bit fields */
> >> +#define STM32F4_EOCIE			BIT(5)
> >> +
> >> +/* STM32H7 - registers for each instance */
> >> +#define STM32H7_ADC_IER			0x04
> >> +
> >> +/* STM32H7_ADC_IER - bit fields */
> >> +#define STM32H7_EOCIE			BIT(2)
> >> +
> >>  /**
> >>   * struct stm32_adc_common - stm32 ADC driver common data (for all instances)
> >>   * @base:		control registers base cpu addr
> >> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> >> index 6a7dd08..3c9f456 100644
> >> --- a/drivers/iio/adc/stm32-adc.c
> >> +++ b/drivers/iio/adc/stm32-adc.c
> >> @@ -30,7 +30,6 @@
> >>  
> >>  /* STM32F4 - Registers for each ADC instance */
> >>  #define STM32F4_ADC_SR			0x00
> >> -#define STM32F4_ADC_CR1			0x04
> >>  #define STM32F4_ADC_CR2			0x08
> >>  #define STM32F4_ADC_SMPR1		0x0C
> >>  #define STM32F4_ADC_SMPR2		0x10
> >> @@ -54,7 +53,6 @@
> >>  #define STM32F4_RES_SHIFT		24
> >>  #define STM32F4_RES_MASK		GENMASK(25, 24)
> >>  #define STM32F4_SCAN			BIT(8)
> >> -#define STM32F4_EOCIE			BIT(5)  
> > Hmm. This is breaking up the definitions of bits in a single register.
> > That is rather nasty from a code readability point of view.  
> > 
> > I am as keen as the next person on only exposing definitions where
> > we need to, but in this case we either need to provide an access path
> > to it here, or we need to move the whole block to the header.  
> 
> Hi Jonathan,
> 
> I think I'll add a precursor patch in v2 to move the whole block to the
> header file. This way, the access path is easy (e.g. readl).
> I'm only wondering about the Fixes tag... this will probably not be
> straight forward to apply the fix on the maintenance releases ?
> Or do I need to add it to the precursor patch as well ?
The precursor is a simple move of definitions. Even if it's large, I don't
think it will be a problem applying it to stable.
Just make it clear in the patch description why it is needed for the fix.

Thanks,

Jonathan

> 
> Thanks for reviewing,
> Best regards,
> Fabrice
> 
> >   
> >>  
> >>  /* STM32F4_ADC_CR2 - bit fields */
> >>  #define STM32F4_SWSTART			BIT(30)
> >> @@ -69,7 +67,6 @@
> >>  
> >>  /* STM32H7 - Registers for each ADC instance */
> >>  #define STM32H7_ADC_ISR			0x00
> >> -#define STM32H7_ADC_IER			0x04
> >>  #define STM32H7_ADC_CR			0x08
> >>  #define STM32H7_ADC_CFGR		0x0C
> >>  #define STM32H7_ADC_SMPR1		0x14
> >> @@ -89,9 +86,6 @@
> >>  #define STM32H7_EOC			BIT(2)
> >>  #define STM32H7_ADRDY			BIT(0)
> >>  
> >> -/* STM32H7_ADC_IER - bit fields */
> >> -#define STM32H7_EOCIE			STM32H7_EOC
> >> -
> >>  /* STM32H7_ADC_CR - bit fields */
> >>  #define STM32H7_ADCAL			BIT(31)
> >>  #define STM32H7_ADCALDIF		BIT(30)  
> >   
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
