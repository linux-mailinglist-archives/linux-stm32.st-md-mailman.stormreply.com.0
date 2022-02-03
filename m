Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 203054AC76F
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 18:30:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAF46C5EC43;
	Mon,  7 Feb 2022 17:30:35 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EF76C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 17:30:34 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1nFfrd-0002xF-6f; Thu, 03 Feb 2022 18:25:45 +0100
Message-ID: <cc7633c5-de5f-0abf-4ac8-64a74633dfcc@pengutronix.de>
Date: Thu, 3 Feb 2022 18:25:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Erwan Le Ray <erwan.leray@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20220203171114.10888-1-erwan.leray@foss.st.com>
Content-Language: en-US
In-Reply-To: <20220203171114.10888-1-erwan.leray@foss.st.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-kernel@vger.kernel.org,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/16] STM32 configure UART nodes for DMA
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

Hello Erwan,

On 03.02.22 18:10, Erwan Le Ray wrote:
> Add DMA configuration to UART nodes in stm32mp15x (SOC level) and
> remove it at board level to keep current PIO behavior when needed.
> For stm32-ed1 and stm32-dkx boards, UART4 (console) and UART7
> (no HW flow control pin available) are kept in PIO mode, while USART3
> is now configured in DMA mode.
> UART4 (console UART) has to be kept in irq mode, as DMA support for
> console has been removed from the driver by commit e359b4411c28 
> ("serial: stm32: fix threaded interrupt handling"). 

Do I understand correctly that your first patch breaks consoles of
most/all boards, because they will briefly use DMA, which is refused
by the stm32-usart driver and then you add a patch for each board
to fix that breakage?

Such intermittent breakage makes bisection a hassle. /delete-property/
is a no-op when the property doesn't exist, so you could move the first
patch to the very end to avoid intermittent breakage.

I also think that the driver's behavior is a bit harsh. I think it would
be better for the UART driver to print a warning and fall back to
PIO for console instead of outright refusing and rendering the system
silent. That's not mutually exclusive with your patch series here, of course.

Cheers,
Ahmad

> 
> For other stm32mp15x-based boards, current configuration is kept for
> all UART instances.
> 
> Erwan Le Ray (16):
>   ARM: dts: stm32: add DMA configuration to UART nodes on stm32mp151
>   ARM: dts: stm32: keep uart4 behavior on stm32mp157c-ed1
>   ARM: dts: stm32: keep uart4 and uart7 behavior on stm32mp15xx-dkx
>   ARM: dts: stm32: keep uart4 behavior on icore-stm32mp1-ctouch2
>   ARM: dts: stm32: keep uart4 behavior on icore-stm32mp1-edimm2.2
>   ARM: dts: stm32: keep uart4 behavior on stm32mp157a-iot-box
>   ARM: dts: stm32: keep uart nodes behavior on stm32mp1-microdev2.0-of7
>   ARM: dts: stm32: keep uart nodes behavior on stm32mp1-microdev2.0
>   ARM: dts: stm32: keep uart nodes behavior on stm32mp157a-stinger96
>   ARM: dts: stm32: keep uart4 behavior on stm32mp157c-lxa-mc1
>   ARM: dts: stm32: keep uart4 behavior on stm32mp157c-odyssey
>   ARM: dts: stm32: keep uart nodes behavior on stm32mp15xx-dhcom-drc02
>   ARM: dts: stm32: keep uart nodes behavior on stm32mp15xx-dhcom-pdk2
>   ARM: dts: stm32: keep uart nodes behavior on stm32mp15xx-dhcom-picoitx
>   ARM: dts: stm32: keep uart4 behavior on stm32mp15xx-dhcom-som
>   ARM: dts: stm32: keep uart nodes behavior on
>     stm32mp15xx-dhcor-avenger96
> 
>  arch/arm/boot/dts/stm32mp151.dtsi             | 21 +++++++++++++++++++
>  .../stm32mp157a-icore-stm32mp1-ctouch2.dts    |  2 ++
>  .../stm32mp157a-icore-stm32mp1-edimm2.2.dts   |  2 ++
>  arch/arm/boot/dts/stm32mp157a-iot-box.dts     |  2 ++
>  ...157a-microgea-stm32mp1-microdev2.0-of7.dts |  4 ++++
>  ...32mp157a-microgea-stm32mp1-microdev2.0.dts |  4 ++++
>  arch/arm/boot/dts/stm32mp157a-stinger96.dtsi  |  6 ++++++
>  arch/arm/boot/dts/stm32mp157c-ed1.dts         |  2 ++
>  arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts     |  2 ++
>  arch/arm/boot/dts/stm32mp157c-odyssey.dts     |  2 ++
>  .../arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi |  4 ++++
>  arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi |  4 ++++
>  .../boot/dts/stm32mp15xx-dhcom-picoitx.dtsi   |  4 ++++
>  arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi  |  2 ++
>  .../boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |  6 ++++++
>  arch/arm/boot/dts/stm32mp15xx-dkx.dtsi        |  4 ++++
>  16 files changed, 71 insertions(+)
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
