Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1396694A482
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Aug 2024 11:38:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5684C71289;
	Wed,  7 Aug 2024 09:38:19 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0799EC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Aug 2024 09:38:13 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1sbd7K-000899-AN; Wed, 07 Aug 2024 11:38:02 +0200
Message-ID: <20dc2cd4-7684-4894-9db3-23c3f4abd661@pengutronix.de>
Date: Wed, 7 Aug 2024 11:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240806120517.406714-1-o.rempel@pengutronix.de>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20240806120517.406714-1-o.rempel@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] arm: dts: st: stm32mp151a-prtt1l: Fix
 QSPI configuration
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

Hello Oleksij,

On 06.08.24 14:05, Oleksij Rempel wrote:
> Rename 'pins1' to 'pins' in the qspi_bk1_pins_a node to correct the
> subnode name. The previous name caused the configuration to be
> applied to the wrong subnode, resulting in QSPI not working properly.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  arch/arm/boot/dts/st/stm32mp151a-prtt1l.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp151a-prtt1l.dtsi b/arch/arm/boot/dts/st/stm32mp151a-prtt1l.dtsi
> index 3938d357e198f..4db684478c320 100644
> --- a/arch/arm/boot/dts/st/stm32mp151a-prtt1l.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp151a-prtt1l.dtsi
> @@ -123,7 +123,7 @@ flash@0 {
>  };
>  
>  &qspi_bk1_pins_a {
> -	pins1 {
> +	pins {

As you have seen such device tree overriding is error prone and would
be entirely avoidable if specifying full board-specific pinctrl groups
was allowed for the stm32 platforms instead of override-and-pray.

Anyways, there's better syntax for such overriding now:

  &{qspi_blk1_pins_a/pins}

which would cause a compilation error if pins was renamed again.

>  		bias-pull-up;

There's bias-disable in stm32mp15-pinctrl.dtsi. You may want to add
a /delete-property/ for that to make sure, it's not up to the driver
which one has priority.

>  		drive-push-pull;
>  		slew-rate = <1>;

These are already in qspi_bk1_pins_a. If repeating those is ok, why
not go a step further and just duplicate the pinmux property and stay
clear of this issue altogether, provided Alex is amenable to changing
his mind regarding pinctrl groups in board device trees.


Cheers,
Ahmad

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
