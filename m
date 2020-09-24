Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5EE276884
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Sep 2020 07:45:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B254BC3FAD8;
	Thu, 24 Sep 2020 05:45:15 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CCFFC3FAD4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Sep 2020 05:45:14 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kLK49-00052U-RW; Thu, 24 Sep 2020 07:45:13 +0200
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>, Rob Herring
 <robh@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>
References: <20200827072101.26588-1-arnaud.pouliquen@st.com>
 <20200827072101.26588-4-arnaud.pouliquen@st.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <be888a4b-b931-521b-42c7-fd4e60afd945@pengutronix.de>
Date: Thu, 24 Sep 2020 07:45:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200827072101.26588-4-arnaud.pouliquen@st.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/3] ARM: dts: stm32: update stm32mp151
 for remote proc synchronisation support
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

Hello Arnaud,

On 8/27/20 9:21 AM, Arnaud Pouliquen wrote:
> Two backup registers are used to store the Cortex-M4 state and the resource
> table address.
> Declare the tamp node and add associated properties in m4_rproc node
> to allow Linux to attach to a firmware loaded by the first boot stages.
> 
> Associated driver implementation is available in commit 9276536f455b3
> ("remoteproc: stm32: Parse syscon that will manage M4 synchronisation").
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  arch/arm/boot/dts/stm32mp151.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index bfe29023fbd5..842ecffae73a 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1541,6 +1541,11 @@
>  			status = "disabled";
>  		};
>  
> +		tamp: tamp@5c00a000 {
> +			compatible = "st,stm32-tamp", "syscon";
> +			reg = <0x5c00a000 0x400>;
> +		};
> +

Just saw this now. I have a pending patch adding this node as well:
https://lore.kernel.org/patchwork/patch/1306971/

For my use case, I need a "simple-mfd" compatible to allow child
nodes to be probed.

Could you CC me when you send out your v2, so I can rebase?
(Or if you don't mind, just add the "simple-mfd" into the compatible
list yourself :-)

Cheers
Ahmad

>  		/*
>  		 * Break node order to solve dependency probe issue between
>  		 * pinctrl and exti.
> @@ -1717,6 +1722,8 @@
>  			st,syscfg-holdboot = <&rcc 0x10C 0x1>;
>  			st,syscfg-tz = <&rcc 0x000 0x1>;
>  			st,syscfg-pdds = <&pwr_mcu 0x0 0x1>;
> +			st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
> +			st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
>  			status = "disabled";
>  		};
>  	};
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
