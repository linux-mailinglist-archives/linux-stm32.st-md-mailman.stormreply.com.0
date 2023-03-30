Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8F16CFA73
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Mar 2023 07:04:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 118D7C6A5E7;
	Thu, 30 Mar 2023 05:04:22 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5383C65E6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Mar 2023 05:04:19 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=pengutronix.de)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <s.trumtrar@pengutronix.de>)
 id 1phkSR-0005ZJ-0r; Thu, 30 Mar 2023 07:04:19 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 30 Mar 2023 07:03:58 +0200
Message-Id: <20230330050408.3806093-1-s.trumtrar@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [Linux-stm32] [PATCH v7 00/10] ARM: stm32: add support for Phycore
	STM32MP1
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

Hi,

this is the seventh installement of my series for adding support for the
Phytec STM32MP1-based SoM and board.

Phytec itself calls the board "Phycore STM32MP1-3" and has other
endnumbers. I only have access to the "-3" and that's what this series
adds.

    Changes since v6:
      - rename mdio0->mdio

    Changes since v5:
      - add reviewed/acked-by
      - cleanup dt_bindings_check warnings

    Changes since v4:
      - cleanup usage of "status = okay|disabled"
      - fix remaining non-generic node names
      - rework sai nodes to not duplicate the existing settings in stm32mp151.dtsi

    Changes since v3:
      - cleanup board-compatible
      - cleanup aliases
      - rename nodes according to schema
      - use interrupt flag

Steffen Trumtrar (10):
  ARM: dts: stm32: Add alternate pinmux for ethernet
  ARM: dts: stm32: Add alternate pinmux for sai2b
  ARM: dts: stm32: Add new pinmux for sdmmc1_b4
  ARM: dts: stm32: Add new pinmux for sdmmc2_d47
  ARM: dts: stm32: Add pinmux for USART1 pins
  ARM: dts: stm32: Add idle/sleep pinmux for USART3
  ARM: dts: stm32: Add sleep pinmux for SPI1 pins_a
  dt-bindings: arm: stm32: Add Phytec STM32MP1 board
  ARM: dts: stm32: add STM32MP1-based Phytec SoM
  ARM: dts: stm32: add STM32MP1-based Phytec board

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   6 +
 arch/arm/boot/dts/Makefile                    |   3 +-
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi      | 231 +++++++
 .../dts/stm32mp157c-phycore-stm32mp1-3.dts    |  65 ++
 .../stm32mp157c-phycore-stm32mp15-som.dtsi    | 594 ++++++++++++++++++
 5 files changed, 898 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts
 create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi

-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
