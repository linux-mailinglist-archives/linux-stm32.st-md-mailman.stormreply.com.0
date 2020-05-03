Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 274EE1C2BEE
	for <lists+linux-stm32@lfdr.de>; Sun,  3 May 2020 13:48:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB331C36B10;
	Sun,  3 May 2020 11:48:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 173B6C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 May 2020 11:48:17 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AABF22071C;
 Sun,  3 May 2020 11:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588506496;
 bh=MjIriiKXwBhuy3vRVQshwzttKeQfN8gHwz12BeKmiyQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YTJEQ3/OjiyY9cpQSweNqt7J1FtAJdP0BBQjtgz2enfFFunpuoUqiE1KIGeYipLku
 gKjQ6tjRBCgT02PERAu+p5HLfeBNobOvP8PivfyKYhZjwmlSvHLFXpjqJHZPFw4L/q
 uA2HBRbJjFtwoo9sxXF09GsbykqLUcFYRgPMSgP4=
Date: Sun, 3 May 2020 12:48:11 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20200503124811.0abf7655@archlinux>
In-Reply-To: <1588163348-31640-1-git-send-email-fabrice.gasnier@st.com>
References: <1588163348-31640-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-adc: fix runtime
 autosuspend delay when slow polling
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

On Wed, 29 Apr 2020 14:29:08 +0200
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> When the ADC is runtime suspended and starting a conversion, the stm32-adc
> driver calls pm_runtime_get_sync() that gets cascaded to the parent
> (e.g. runtime resume of stm32-adc-core driver). This also kicks the
> autosuspend delay (e.g. 2s) of the parent.
> Once the ADC is active, calling pm_runtime_get_sync() again (upon a new
> capture) won't kick the autosuspend delay for the parent (stm32-adc-core
> driver) as already active.
> 
> Currently, this makes the stm32-adc-core driver go in suspend state
> every 2s when doing slow polling. As an example, doing a capture, e.g.
> cat in_voltageY_raw at a 0.2s rate, the auto suspend delay for the parent
> isn't refreshed. Once it expires, the parent immediately falls into
> runtime suspended state, in between two captures, as soon as the child
> driver falls into runtime suspend state:
> - e.g. after 2s, + child calls pm_runtime_put_autosuspend() + 100ms
>   autosuspend delay of the child.
> - stm32-adc-core switches off regulators, clocks and so on.
> - They get switched on back again 100ms later in this example (at 2.2s).
> 
> So, use runtime_idle() callback in stm32-adc-core driver to call
> pm_runtime_mark_last_busy() for the parent driver (stm32-adc-core),
> to avoid this.
> 
> Fixes: 9bdbb1139ca1 ("iio: adc: stm32-adc: add power management support")
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Whilst this seems 'sensible' to me, I really don't have a good enough grasp
of runtime pm to be sure. 

I see something similar looking in the greybus driver, but not sure on the
reason it is there.

Hence, ideally looking for an ack from Rafael on this one!

Thanks,

Jonathan

> ---
> Changes in v2:
> - Use runtime_idle callback in stm32-adc-core driver, instead of refreshing
>   last_busy from the child (for the parent) at many place. Initial patch v1
>   looked like "somewhat adhoc solution" as commented by Jonathan.
> ---
>  drivers/iio/adc/stm32-adc-core.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> index 2df88d2..ebe5dbc 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -803,6 +803,13 @@ static int stm32_adc_core_runtime_resume(struct device *dev)
>  {
>  	return stm32_adc_core_hw_start(dev);
>  }
> +
> +static int stm32_adc_core_runtime_idle(struct device *dev)
> +{
> +	pm_runtime_mark_last_busy(dev);
> +
> +	return 0;
> +}
>  #endif
>  
>  static const struct dev_pm_ops stm32_adc_core_pm_ops = {
> @@ -810,7 +817,7 @@ static const struct dev_pm_ops stm32_adc_core_pm_ops = {
>  				pm_runtime_force_resume)
>  	SET_RUNTIME_PM_OPS(stm32_adc_core_runtime_suspend,
>  			   stm32_adc_core_runtime_resume,
> -			   NULL)
> +			   stm32_adc_core_runtime_idle)
>  };
>  
>  static const struct stm32_adc_priv_cfg stm32f4_adc_priv_cfg = {

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
