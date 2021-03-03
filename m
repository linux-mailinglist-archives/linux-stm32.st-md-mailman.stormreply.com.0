Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDAF32B5E2
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 09:15:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 884DCC57B70;
	Wed,  3 Mar 2021 08:15:35 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81473C56634
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 08:15:34 +0000 (UTC)
IronPort-SDR: RrEpAzjZLLDFUQxqRPyTWel6ze8TfxpWHkY03MpxNqbNRFYvqWQkCIyzBxMYoZJcx+WDQ1lBST
 r6z4AKGKtAEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="248541548"
X-IronPort-AV: E=Sophos;i="5.81,219,1610438400"; d="scan'208";a="248541548"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 00:15:29 -0800
IronPort-SDR: Jl1gDOt18Yx3Wc3FOkcfIFLNuc3RejNsIXAn65v97ohTHqhTMI8M/7DjMCF88L5gQLcyzhIZ1W
 ZKMMVTPRr2mQ==
X-IronPort-AV: E=Sophos;i="5.81,219,1610438400"; d="scan'208";a="383900135"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 00:15:27 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lHMfD-009afi-Vm; Wed, 03 Mar 2021 10:15:23 +0200
Date: Wed, 3 Mar 2021 10:15:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Message-ID: <YD9Fm2qOf7ABYjZK@smile.fi.intel.com>
References: <20210302234710.74455-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210302234710.74455-1-rikard.falkeborn@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stmpe: Revert "Constify static
	struct resource"
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

On Wed, Mar 03, 2021 at 12:47:10AM +0100, Rikard Falkeborn wrote:
> Andy noted that constification of some static resource structs in

(If you wish, you may use Reported-by:, I'm fine with either way)

> intel_quark_i2c_gpio.c were incorrect. It turns out there is another
> change from the same series that is also incorrect in stmpe.c.
> These structures are modified at init and can not be made const.
> 
> This reverts commit 8d7b3a6dac4eae22c58b0853696cbd256966741b.

I recommend to add a comment in the code as I did so nobody (okay, who reads
the comments) will change that again.

Thanks!

> Fixes: 8d7b3a6dac4e ("mfd: stmpe: Constify static struct resource")
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---
> I went through the series and this was the only additional issue I
> found. Sorry about that.
> 
>  drivers/mfd/stmpe.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
> index 90f3292230c9..1aee3b3253fc 100644
> --- a/drivers/mfd/stmpe.c
> +++ b/drivers/mfd/stmpe.c
> @@ -312,7 +312,7 @@ EXPORT_SYMBOL_GPL(stmpe_set_altfunc);
>   * GPIO (all variants)
>   */
>  
> -static const struct resource stmpe_gpio_resources[] = {
> +static struct resource stmpe_gpio_resources[] = {
>  	/* Start and end filled dynamically */
>  	{
>  		.flags	= IORESOURCE_IRQ,
> @@ -336,7 +336,7 @@ static const struct mfd_cell stmpe_gpio_cell_noirq = {
>   * Keypad (1601, 2401, 2403)
>   */
>  
> -static const struct resource stmpe_keypad_resources[] = {
> +static struct resource stmpe_keypad_resources[] = {
>  	{
>  		.name	= "KEYPAD",
>  		.flags	= IORESOURCE_IRQ,
> @@ -357,7 +357,7 @@ static const struct mfd_cell stmpe_keypad_cell = {
>  /*
>   * PWM (1601, 2401, 2403)
>   */
> -static const struct resource stmpe_pwm_resources[] = {
> +static struct resource stmpe_pwm_resources[] = {
>  	{
>  		.name	= "PWM0",
>  		.flags	= IORESOURCE_IRQ,
> @@ -445,7 +445,7 @@ static struct stmpe_variant_info stmpe801_noirq = {
>   * Touchscreen (STMPE811 or STMPE610)
>   */
>  
> -static const struct resource stmpe_ts_resources[] = {
> +static struct resource stmpe_ts_resources[] = {
>  	{
>  		.name	= "TOUCH_DET",
>  		.flags	= IORESOURCE_IRQ,
> @@ -467,7 +467,7 @@ static const struct mfd_cell stmpe_ts_cell = {
>   * ADC (STMPE811)
>   */
>  
> -static const struct resource stmpe_adc_resources[] = {
> +static struct resource stmpe_adc_resources[] = {
>  	{
>  		.name	= "STMPE_TEMP_SENS",
>  		.flags	= IORESOURCE_IRQ,
> -- 
> 2.30.1
> 

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
