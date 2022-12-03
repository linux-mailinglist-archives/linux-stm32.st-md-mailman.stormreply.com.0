Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF523641810
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Dec 2022 18:23:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D38CC65E4C;
	Sat,  3 Dec 2022 17:23:49 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BFD9C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Dec 2022 17:23:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8D80AB8070E;
 Sat,  3 Dec 2022 17:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218F0C433C1;
 Sat,  3 Dec 2022 17:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670088226;
 bh=iTtdW6gDpKHLLzKCX31xhKgEEH+3KoFhhXGmXIO5ZP8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u+BEgHWXH5ITAwz3jXgk74FH9/Gb25v/9qpiVZjuhkSjkKCCxC0WqKDHhfSoEehp0
 OZR+rOagvJcew3j4vmZSM4+bXjb44hWLLYp5W9SgnLMUea/u2PVqKFbuJ1WbqjyD9v
 8YHVekiyvg5oxz6p5rgsajsL1shvgSj9ilzlnJFuQIRbY0bIRbnN8JjkknRMP7NaoI
 fhYr3xyvOh55rHcRYWzoDVHeRmKhy6s2bRAK+Z2Uju2lXLMYZAB63RdZ9isq36WIge
 IVwx0U+Uwaz/b7vRn57R4wyFtsKEa42bvqhHfIPNKklNf1Hvrzyza9XEAW23Fv8JYE
 RjDy6sNGMXfgg==
Date: Sat, 3 Dec 2022 17:36:30 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20221203173630.4b4de6c7@jic23-huawei>
In-Reply-To: <20221202152848.45585-1-olivier.moysan@foss.st.com>
References: <20221202152848.45585-1-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-dfsdm: fill module
	aliases
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

On Fri, 2 Dec 2022 16:28:48 +0100
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> When STM32 DFSDM driver is built as module, no modalias information
> is available. This prevents module to be loaded by udev.
> Add MODULE_DEVICE_TABLE() to fill module aliases.
> 
> Fixes: e2e6771c6462 ("IIO: ADC: add STM32 DFSDM sigma delta ADC support")
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Applied to the fixes-togreg branch of iio.git.

Note this will probably go upstream just after the merge window closes
now.

Thanks,

Jonathan

> ---
> Changes in v2: Add Fixes tag
> ---
>  drivers/iio/adc/stm32-dfsdm-adc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> index 6d21ea84fa82..a428bdb567d5 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -1520,6 +1520,7 @@ static const struct of_device_id stm32_dfsdm_adc_match[] = {
>  	},
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, stm32_dfsdm_adc_match);
>  
>  static int stm32_dfsdm_adc_probe(struct platform_device *pdev)
>  {

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
