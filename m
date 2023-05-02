Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6406F4235
	for <lists+linux-stm32@lfdr.de>; Tue,  2 May 2023 13:02:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13B6EC6A609;
	Tue,  2 May 2023 11:02:45 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23141C6A5EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 May 2023 11:02:44 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=igor.pengutronix.de) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <s.trumtrar@pengutronix.de>)
 id 1ptnmN-0000tr-DN; Tue, 02 May 2023 13:02:43 +0200
References: <20230411083045.2850138-1-s.trumtrar@pengutronix.de>
User-agent: mu4e 1.8.14; emacs 30.0.50
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Tue, 02 May 2023 13:02:16 +0200
In-reply-to: <20230411083045.2850138-1-s.trumtrar@pengutronix.de>
Message-ID: <87v8hbuhbi.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v8 00/10] ARM: stm32: add support for
 Phycore	STM32MP1
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


On 2023-04-11 at 10:30 +02, Steffen Trumtrar <s.trumtrar@pengutronix.de> wrote:

> Hi,
>
> this is the eighth installement of my series for adding support for the
> Phytec STM32MP1-based SoM and board.
>
> Phytec itself calls the board "Phycore STM32MP1-3" and has other
> endnumbers. I only have access to the "-3" and that's what this series
> adds.
>
>     Changes since v7:
>       - remove unused gpu_reservde memory range
>       - get rid of duplicate ethernet clock assignments
>       - remove secure-status for sdmmc
>
>     Changes since v6:
>       - rename mdio0->mdio
>
>     Changes since v5:
>       - add reviewed/acked-by
>       - cleanup dt_bindings_check warnings
>
>     Changes since v4:
>       - cleanup usage of "status = okay|disabled"
>       - fix remaining non-generic node names
>       - rework sai nodes to not duplicate the existing settings in stm32mp151.dtsi
>
>     Changes since v3:
>       - cleanup board-compatible
>       - cleanup aliases
>       - rename nodes according to schema
>       - use interrupt flag
>
> Steffen Trumtrar (10):
>   ARM: dts: stm32: Add alternate pinmux for ethernet
>   ARM: dts: stm32: Add alternate pinmux for sai2b
>   ARM: dts: stm32: Add new pinmux for sdmmc1_b4
>   ARM: dts: stm32: Add new pinmux for sdmmc2_d47
>   ARM: dts: stm32: Add pinmux for USART1 pins
>   ARM: dts: stm32: Add idle/sleep pinmux for USART3
>   ARM: dts: stm32: Add sleep pinmux for SPI1 pins_a
>   dt-bindings: arm: stm32: Add Phytec STM32MP1 board
>   ARM: dts: stm32: add STM32MP1-based Phytec SoM
>   ARM: dts: stm32: add STM32MP1-based Phytec board
>
>  .../devicetree/bindings/arm/stm32/stm32.yaml  |   6 +
>  arch/arm/boot/dts/Makefile                    |   3 +-
>  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi      | 231 +++++++
>  .../dts/stm32mp157c-phycore-stm32mp1-3.dts    |  60 ++
>  .../stm32mp157c-phycore-stm32mp15-som.dtsi    | 577 ++++++++++++++++++
>  5 files changed, 876 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts
>  create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi

Gentle ping. Anything I need to fix?

Best regards,
Steffen

--
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
