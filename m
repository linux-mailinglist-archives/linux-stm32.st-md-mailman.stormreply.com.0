Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D3832E606
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Mar 2021 11:18:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15B42C57B7D;
	Fri,  5 Mar 2021 10:18:42 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EF83C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Mar 2021 10:18:39 +0000 (UTC)
IronPort-SDR: Y0hs8zLYcwhm571Jmo7nzs/GH/XU2XkGR06YxY4Uc66iuzCcMuCUumwylaUp7kgtZCgvywNCPu
 BAvtayemI+Lw==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="174733900"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; d="scan'208";a="174733900"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2021 02:18:36 -0800
IronPort-SDR: WWc9C3FxVSf9WalrZTEPUKZssB4unKhpo9fXKPA2/ab2PH4KOwIAqukM+KCAiTat61SUL21f7g
 WLK58LpPz8kQ==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; d="scan'208";a="507951556"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2021 02:18:34 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lI7XU-00A60q-40; Fri, 05 Mar 2021 12:18:32 +0200
Date: Fri, 5 Mar 2021 12:18:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Message-ID: <YEIFeJQvyyYRYm+W@smile.fi.intel.com>
References: <20210304230709.3217-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210304230709.3217-1-rikard.falkeborn@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] mfd: stmpe: Revert "Constify static
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

On Fri, Mar 05, 2021 at 12:07:09AM +0100, Rikard Falkeborn wrote:
> In stmpe_devices_init(), the start and end field of these structs are
> modified, so they can not be const. Add a comment to those structs that
> lacked it to reduce the risk that this happens again.
> 
> This reverts commit 8d7b3a6dac4eae22c58b0853696cbd256966741b.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Fixes: 8d7b3a6dac4e ("mfd: stmpe: Constify static struct resource")
> Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---
> Changes
> V1-V2: Add comments to the structs that they are dynamically modified
>        Rewrite commit message.
> 
> V1: https://lore.kernel.org/lkml/20210302234710.74455-1-rikard.falkeborn@gmail.com/
> 
>  drivers/mfd/stmpe.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
> index 90f3292230c9..1dd39483e7c1 100644
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
> @@ -336,7 +336,8 @@ static const struct mfd_cell stmpe_gpio_cell_noirq = {
>   * Keypad (1601, 2401, 2403)
>   */
>  
> -static const struct resource stmpe_keypad_resources[] = {
> +static struct resource stmpe_keypad_resources[] = {
> +	/* Start and end filled dynamically */
>  	{
>  		.name	= "KEYPAD",
>  		.flags	= IORESOURCE_IRQ,
> @@ -357,7 +358,8 @@ static const struct mfd_cell stmpe_keypad_cell = {
>  /*
>   * PWM (1601, 2401, 2403)
>   */
> -static const struct resource stmpe_pwm_resources[] = {
> +static struct resource stmpe_pwm_resources[] = {
> +	/* Start and end filled dynamically */
>  	{
>  		.name	= "PWM0",
>  		.flags	= IORESOURCE_IRQ,
> @@ -445,7 +447,8 @@ static struct stmpe_variant_info stmpe801_noirq = {
>   * Touchscreen (STMPE811 or STMPE610)
>   */
>  
> -static const struct resource stmpe_ts_resources[] = {
> +static struct resource stmpe_ts_resources[] = {
> +	/* Start and end filled dynamically */
>  	{
>  		.name	= "TOUCH_DET",
>  		.flags	= IORESOURCE_IRQ,
> @@ -467,7 +470,8 @@ static const struct mfd_cell stmpe_ts_cell = {
>   * ADC (STMPE811)
>   */
>  
> -static const struct resource stmpe_adc_resources[] = {
> +static struct resource stmpe_adc_resources[] = {
> +	/* Start and end filled dynamically */
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
