Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 882972A9342
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 10:48:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51387C3FAD4;
	Fri,  6 Nov 2020 09:48:04 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22F0FC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 09:48:02 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kayLi-00080s-1R; Fri, 06 Nov 2020 10:48:02 +0100
To: Christophe Roullier <christophe.roullier@st.com>, wim@linux-watchdog.org, 
 linux@roeck-us.net, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
References: <20201106094627.21132-1-christophe.roullier@st.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <ed817cfc-a338-0e41-b4d5-56da42677d26@pengutronix.de>
Date: Fri, 6 Nov 2020 10:47:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201106094627.21132-1-christophe.roullier@st.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Etienne Carriere <etienne.carriere@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/1] watchdog: stm32_iwdg: don't print an
 error on probe deferral
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

Hello Christophe,

On 11/6/20 10:46 AM, Christophe Roullier wrote:
> From: Etienne Carriere <etienne.carriere@st.com>
> 
> Do not print an error trace when deferring probe for clock resources.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>  drivers/watchdog/stm32_iwdg.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index 25188d6bbe15..1b71c205cee0 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -163,7 +163,8 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
>  
>  	wdt->clk_lsi = devm_clk_get(dev, "lsi");
>  	if (IS_ERR(wdt->clk_lsi)) {
> -		dev_err(dev, "Unable to get lsi clock\n");
> +		if (PTR_ERR(wdt->clk_lsi) != -EPROBE_DEFER)
> +			dev_err(dev, "Unable to get lsi clock\n");

Can you use dev_err_probe instead?

Cheers,
Ahmad

>  		return PTR_ERR(wdt->clk_lsi);
>  	}
>  
> @@ -171,7 +172,8 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
>  	if (wdt->data->has_pclk) {
>  		wdt->clk_pclk = devm_clk_get(dev, "pclk");
>  		if (IS_ERR(wdt->clk_pclk)) {
> -			dev_err(dev, "Unable to get pclk clock\n");
> +			if (PTR_ERR(wdt->clk_pclk) != -EPROBE_DEFER)
> +				dev_err(dev, "Unable to get pclk clock\n");
>  			return PTR_ERR(wdt->clk_pclk);
>  		}
>  
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
