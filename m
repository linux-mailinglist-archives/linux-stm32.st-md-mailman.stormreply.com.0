Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3902F3BD5
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Jan 2021 22:30:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4EDAC424C0;
	Tue, 12 Jan 2021 21:30:14 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 845AFC32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jan 2021 21:30:11 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kzREw-0003VY-K8; Tue, 12 Jan 2021 22:30:10 +0100
To: Jules Maselbas <jmaselbas@kalray.eu>, linux-usb@vger.kernel.org
References: <6cd01e79-fdc0-3bd4-32b5-a85142533f8a@pengutronix.de>
 <20210112170124.14148-1-jmaselbas@kalray.eu>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20c8617b-069c-e9a5-f394-4e5a8e67deb4@pengutronix.de>
Date: Tue, 12 Jan 2021 22:30:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20210112170124.14148-1-jmaselbas@kalray.eu>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Minas Harutyunyan <hminas@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [Linux-stm32] [PATCH] usb: dwc2: Change ordering of phy_init
	and phy_power_on
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

Hello Jules,

+ linux-stm32 and Amelie, who upstreamed dwc2 glue for the stm32mp1.

[ some context: https://lore.kernel.org/lkml/6cd01e79-fdc0-3bd4-32b5-a85142533f8a@pengutronix.de/ ]

On 12.01.21 18:01, Jules Maselbas wrote:
> Call phy_init before phy_power_on as this is the intended way of using
> the generic phy api.

Even if the PHY driver code itself doesn't show an apparent dependency
between the power on and init operation, the hardware may expect things to
happen in a defined order. This is at least the case for the stm32-usbphyc
and would be violated if we just swap the order in the controller.

Instead, why not take it slow:

 - Document that phy_init -> phy_power_on is the correct order
 - Throw a warning when the order is violated
 - Ask for this patch to marinate a while in linux-next, so people
   have a chance to sort out incompatibilities with their PHY drivers

Cheers,
Ahmad

> 
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Cc: Minas Harutyunyan <hminas@synopsys.com>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> 
> ---
> 
> I have quickly looked at usb-phy if this change could break something or
> not. The following cmd list the compatible strings for usb-phy used by dwc2:
> 
> git grep 'snps,dwc2' -- arch/ | sed 's/:.*$//' | { while read file; do \
>         phyname=$(git grep -A10 'snps,dwc2' -- "$file" | \
>                 sed -n '/phys/{s/.*<&\([^ >]*\).*/\1/p}'); \
>         [ "$phyname" ] && { \
> 	        git grep -A10 "${phyname}: " -- "$file" | \
>                 grep -m1 'compatible'; \
>         }; done };
> 
> From this output I took a look at:
>  - brcm,kona-usb2-phy
>  - samsung,exynos3250-usb2-phy
>  - rockchip,rk3288-usb
>  - amlogic,meson-gxbb-usb2-phy
>  - amlogic,meson-gxl-usb2-phy
>  - img,pistachio-usb-phy
> 
> Most of these phys only defines .power_on and .power_off;
> brcm,kona-usb2-phy also defines .init; and amlogic,meson-gxl-usb2-phy defines
> .init .exit and .reset
> 
> From what I've seen it seems to be OK for these two phy to call
> init/exit first and then power_on/power_off.
> ---
>  drivers/usb/dwc2/platform.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index b58ce996add7..a07dff088a26 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -142,9 +142,9 @@ static int __dwc2_lowlevel_hw_enable(struct dwc2_hsotg *hsotg)
>  	} else if (hsotg->plat && hsotg->plat->phy_init) {
>  		ret = hsotg->plat->phy_init(pdev, hsotg->plat->phy_type);
>  	} else {
> -		ret = phy_power_on(hsotg->phy);
> +		ret = phy_init(hsotg->phy);
>  		if (ret == 0)
> -			ret = phy_init(hsotg->phy);
> +			ret = phy_power_on(hsotg->phy);
>  	}
>  
>  	return ret;
> @@ -176,9 +176,9 @@ static int __dwc2_lowlevel_hw_disable(struct dwc2_hsotg *hsotg)
>  	} else if (hsotg->plat && hsotg->plat->phy_exit) {
>  		ret = hsotg->plat->phy_exit(pdev, hsotg->plat->phy_type);
>  	} else {
> -		ret = phy_exit(hsotg->phy);
> +		ret = phy_power_off(hsotg->phy);
>  		if (ret == 0)
> -			ret = phy_power_off(hsotg->phy);
> +			ret = phy_exit(hsotg->phy);
>  	}
>  	if (ret)
>  		return ret;
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
