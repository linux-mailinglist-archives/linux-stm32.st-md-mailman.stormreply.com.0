Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 914731236C
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2019 22:35:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3ECAFC71295
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2019 20:35:30 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4BCEC71294
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2019 20:35:28 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id w20so1564851plq.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 May 2019 13:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZQPjFKIck0BYkQ9DfkaYVVMVn0vzKw2Cwt47ufchXuY=;
 b=XxA/kwRCa6NMKmrjalaj3Qu16NsuxzlkYgVanY/qsovNrjDjX9i6wbF6lKL87vEXSc
 HP1j1U8xKwwXPLqdd2RPnauezNK/CzVwkW0t30G0Mwkgfpl6ANwUwr/x09DNeG7EaLVe
 BElcJiUasAOPOGHeiBvP/kfWXUV/Ra/fdxF7GBDeMz9vKfn6TdbkuGtSQzcCilTYkPNI
 tVWVdjC8VHhCyXkHpcgWYYBvRkGutT6QD+xpMN9jHoy7tug51j09miGtAfaNDF8BktFx
 Bpye5q8mzvVM5bnHqIT0iFxNL9LAA46z3jnceUKZCjQp5DRQ0yCeDSPjqDa7XoYgTCky
 yzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZQPjFKIck0BYkQ9DfkaYVVMVn0vzKw2Cwt47ufchXuY=;
 b=eeWPN7usCy0alcHwhjWsQnlk9BNOFny85jbAUBec+TgT9RV+dU4Lf/vIuhHvu/Fg3y
 uBmsTfUUw9cEZFBWMrVQteVbWQnuuHvlU4WgaXJSdxCfhz43srVVPR2sC5PliJSTIX8A
 tJtY82EVn1jProx7D0wAvDZazOb/VDlwNy4ZPg/v2Awx8HtvWbSnB8AjYvk+xNVoCwKf
 zx3aV9qvNgdFF+vzJcNf+cfzTMuffCfwlyCkz0aAeD4LLNf4lE8A1IptIf22YMRzo/oP
 Mu+9wrYNJqx98EOLHbz/u6O31J+8N+4i+Lb2cL1Rc06LUyojXt1HyjlfNKVTsBNiF1wT
 NdGQ==
X-Gm-Message-State: APjAAAUEjEx5PqKFfEw8minFKBOkbAPFKBJvQ/eQ+pr1Sbq9jCitmjHQ
 tim7IeXb4dB7KPKaJLfBHDU=
X-Google-Smtp-Source: APXvYqyrAVkUvRKQ/yYhDRbHgv2bWV/pjIA4jFdHf7sRYwX5385rscwSZ+FhENNgpWMIrTjBglcSlg==
X-Received: by 2002:a17:902:9a95:: with SMTP id
 w21mr5955597plp.74.1556829327360; 
 Thu, 02 May 2019 13:35:27 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id c17sm24687pfn.173.2019.05.02.13.35.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 13:35:26 -0700 (PDT)
Date: Thu, 2 May 2019 13:35:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ludovic Barre <ludovic.Barre@st.com>
Message-ID: <20190502203525.GA29063@roeck-us.net>
References: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
 <1556806126-15890-4-git-send-email-ludovic.Barre@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556806126-15890-4-git-send-email-ludovic.Barre@st.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 3/3] watchdog: stm32: add dynamic
	prescaler support
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

On Thu, May 02, 2019 at 04:08:46PM +0200, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> This patch allows to define the max prescaler by compatible.
> To set a large range of timeout, the prescaler should be set
> dynamically (from the timeout request) to improve the resolution
> in order to have a timeout close to the expected value.
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  drivers/watchdog/stm32_iwdg.c | 76 ++++++++++++++++++++++++-------------------
>  1 file changed, 42 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index f19a6d4..0c765d4 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -34,18 +34,12 @@
>  #define KR_KEY_EWA	0x5555 /* write access enable */
>  #define KR_KEY_DWA	0x0000 /* write access disable */
>  
> -/* IWDG_PR register bit values */
> -#define PR_4		0x00 /* prescaler set to 4 */
> -#define PR_8		0x01 /* prescaler set to 8 */
> -#define PR_16		0x02 /* prescaler set to 16 */
> -#define PR_32		0x03 /* prescaler set to 32 */
> -#define PR_64		0x04 /* prescaler set to 64 */
> -#define PR_128		0x05 /* prescaler set to 128 */
> -#define PR_256		0x06 /* prescaler set to 256 */
> +#define PR_SHIFT	2
> +#define PR_MIN		BIT(PR_SHIFT)
>  
>  /* IWDG_RLR register values */
> -#define RLR_MIN		0x07C /* min value supported by reload register */
> -#define RLR_MAX		0xFFF /* max value supported by reload register */
> +#define RLR_MIN		0x2		/* min value recommended */
> +#define RLR_MAX		GENMASK(11, 0)	/* max value of reload register */
>  
>  /* IWDG_SR register bit mask */
>  #define FLAG_PVU	BIT(0) /* Watchdog prescaler value update */
> @@ -55,15 +49,28 @@
>  #define TIMEOUT_US	100000
>  #define SLEEP_US	1000
>  
> -#define HAS_PCLK	true
> +struct stm32_iwdg_data {
> +	bool has_pclk;
> +	u32 max_prescaler;
> +};
> +
> +static const struct stm32_iwdg_data stm32_iwdg_data = {
> +	.has_pclk = false,
> +	.max_prescaler = 256,
> +};
> +
> +static const struct stm32_iwdg_data stm32mp1_iwdg_data = {
> +	.has_pclk = true,
> +	.max_prescaler = 1024,
> +};
>  
>  struct stm32_iwdg {
>  	struct watchdog_device	wdd;
> +	const struct stm32_iwdg_data *data;
>  	void __iomem		*regs;
>  	struct clk		*clk_lsi;
>  	struct clk		*clk_pclk;
>  	unsigned int		rate;
> -	bool			has_pclk;
>  };
>  
>  static inline u32 reg_read(void __iomem *base, u32 reg)
> @@ -79,26 +86,28 @@ static inline void reg_write(void __iomem *base, u32 reg, u32 val)
>  static int stm32_iwdg_start(struct watchdog_device *wdd)
>  {
>  	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
> -	u32 val = FLAG_PVU | FLAG_RVU;
> -	u32 reload;
> +	u32 presc, iwdg_rlr, iwdg_pr, iwdg_sr;
>  
>  	dev_dbg(wdd->parent, "%s\n", __func__);
>  
> -	/* prescaler fixed to 256 */
> -	reload = clamp_t(unsigned int, ((wdd->timeout * wdt->rate) / 256) - 1,
> -			 RLR_MIN, RLR_MAX);
> +	presc = DIV_ROUND_UP(wdd->timeout * wdt->rate, RLR_MAX + 1);
> +
> +	/* The prescaler is align on power of 2 and start at 2 ^ PR_SHIFT. */
> +	presc = roundup_pow_of_two(presc);
> +	iwdg_pr = presc <= 1 << PR_SHIFT ? 0 : ilog2(presc) - PR_SHIFT;
> +	iwdg_rlr = ((wdd->timeout * wdt->rate) / presc) - 1;
>  
> +	/* enable watchdog */
> +	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
>  	/* enable write access */
>  	reg_write(wdt->regs, IWDG_KR, KR_KEY_EWA);
> -
>  	/* set prescaler & reload registers */
> -	reg_write(wdt->regs, IWDG_PR, PR_256); /* prescaler fix to 256 */
> -	reg_write(wdt->regs, IWDG_RLR, reload);
> -	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
> +	reg_write(wdt->regs, IWDG_PR, iwdg_pr);
> +	reg_write(wdt->regs, IWDG_RLR, iwdg_rlr);
>  
>  	/* wait for the registers to be updated (max 100ms) */
> -	if (readl_relaxed_poll_timeout(wdt->regs + IWDG_SR, val,
> -				       !(val & (FLAG_PVU | FLAG_RVU)),
> +	if (readl_relaxed_poll_timeout(wdt->regs + IWDG_SR, iwdg_sr,
> +				       !(iwdg_sr & (FLAG_PVU | FLAG_RVU)),
>  				       SLEEP_US, TIMEOUT_US)) {
>  		dev_err(wdd->parent, "Fail to set prescaler, reload regs\n");
>  		return -EIO;

As mentioned in the other patch, pelase return the error returned from
readl_relaxed_poll_timeout(). If that returns a timeout, we want to know
about it and not just hide it behind -EIO.

> @@ -155,7 +164,7 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
>  	}
>  
>  	/* optional peripheral clock */
> -	if (wdt->has_pclk) {
> +	if (wdt->data->has_pclk) {
>  		wdt->clk_pclk = devm_clk_get(&pdev->dev, "pclk");
>  		if (IS_ERR(wdt->clk_pclk)) {
>  			dev_err(&pdev->dev, "Unable to get pclk clock\n");
> @@ -196,8 +205,8 @@ static const struct watchdog_ops stm32_iwdg_ops = {
>  };
>  
>  static const struct of_device_id stm32_iwdg_of_match[] = {
> -	{ .compatible = "st,stm32-iwdg", .data = (void *)!HAS_PCLK },
> -	{ .compatible = "st,stm32mp1-iwdg", .data = (void *)HAS_PCLK },
> +	{ .compatible = "st,stm32-iwdg", .data = &stm32_iwdg_data },
> +	{ .compatible = "st,stm32mp1-iwdg", .data = &stm32mp1_iwdg_data },
>  	{ /* end node */ }
>  };
>  MODULE_DEVICE_TABLE(of, stm32_iwdg_of_match);
> @@ -205,20 +214,17 @@ MODULE_DEVICE_TABLE(of, stm32_iwdg_of_match);
>  static int stm32_iwdg_probe(struct platform_device *pdev)
>  {
>  	struct watchdog_device *wdd;
> -	const struct of_device_id *match;
>  	struct stm32_iwdg *wdt;
>  	struct resource *res;
>  	int ret;
>  
> -	match = of_match_device(stm32_iwdg_of_match, &pdev->dev);
> -	if (!match)
> -		return -ENODEV;
> -
>  	wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
>  	if (!wdt)
>  		return -ENOMEM;
>  
> -	wdt->has_pclk = match->data;
> +	wdt->data = of_device_get_match_data(&pdev->dev);
> +	if (!wdt->data)
> +		return -ENODEV;
>  
>  	/* This is the timer base. */
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> @@ -236,8 +242,10 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
>  	wdd = &wdt->wdd;
>  	wdd->info = &stm32_iwdg_info;
>  	wdd->ops = &stm32_iwdg_ops;
> -	wdd->min_timeout = ((RLR_MIN + 1) * 256) / wdt->rate;
> -	wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * 256 * 1000) / wdt->rate;
> +	wdd->min_timeout = max_t(unsigned int, 1,
> +				 (((RLR_MIN + 1) * PR_MIN) / wdt->rate));

Is that any different to DIV_ROUND_UP() ?

> +	wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * wdt->data->max_prescaler *
> +				    1000) / wdt->rate;
>  	wdd->parent = &pdev->dev;
>  
>  	watchdog_set_drvdata(wdd, wdt);
> -- 
> 2.7.4
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
