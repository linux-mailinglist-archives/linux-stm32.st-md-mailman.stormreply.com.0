Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C204D547651
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Jun 2022 18:05:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BAD9C0D2BB;
	Sat, 11 Jun 2022 16:05:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA4E2C03FFF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Jun 2022 16:05:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C47766111E;
 Sat, 11 Jun 2022 16:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B78C3411B;
 Sat, 11 Jun 2022 16:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654963546;
 bh=uQGH4sFj2WRe9mI9K7xL+Xi4+jrmG0wytJBcXdI8uRQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uQoZcgbrqa+VUdd4CByAP1V/QOoNk0uKWLK6fHizwKfaUQ56FQatX5hiMZm9pHt3a
 zxSc8cJVdPP80qAwZa+ug43Itb1GWDrMfYsf9KfTLKivwfxPmZOefIx2HzCmvNW2Rh
 QFDcBXII0MAhRJkzG22OYte/6H1W5ve+FSE9JU1PRJT56E33YQTQVmBRdiSJ9ESbSr
 IEQGVVcccWgQyB4lF1J0WfC3rySNci+YJezeOtoEkyAnoHQ+zni/wvhhVw8MEMi6jB
 UC1uDSvYCTYI5f+wUglCBy2szRNC820DdyUHmHoeEhnug41SangzcLktq82wpJBlfT
 YF23YnlJ3+rKA==
Date: Sat, 11 Jun 2022 17:14:55 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20220611171455.13798411@jic23-huawei>
In-Reply-To: <20220609095234.375925-1-olivier.moysan@foss.st.com>
References: <20220609095234.375925-1-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32: fix maximum clock rate
	for stm32mp15x
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

On Thu, 9 Jun 2022 11:52:34 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> Change maximum STM32 ADC input clock rate to 36MHz, as specified
> in STM32MP15x datasheets.
> 
> Fixes: d58c67d1d851 ("iio: adc: stm32-adc: add support for STM32MP1")
No gap here as per the other patch. Fixed up whilst applying and marked
for stable.

Thanks,

Jonathan

> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  drivers/iio/adc/stm32-adc-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> index 142656232157..ce1a63a82034 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -805,7 +805,7 @@ static const struct stm32_adc_priv_cfg stm32h7_adc_priv_cfg = {
>  static const struct stm32_adc_priv_cfg stm32mp1_adc_priv_cfg = {
>  	.regs = &stm32h7_adc_common_regs,
>  	.clk_sel = stm32h7_adc_clk_sel,
> -	.max_clk_rate_hz = 40000000,
> +	.max_clk_rate_hz = 36000000,
>  	.has_syscfg = HAS_VBOOSTER | HAS_ANASWVDD,
>  	.num_irqs = 2,
>  };

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
