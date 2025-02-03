Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C8BA25518
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2025 09:59:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC24CC78F7C;
	Mon,  3 Feb 2025 08:59:00 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32CC4C78F7D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2025 08:58:54 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1tesHf-0006KE-I4; Mon, 03 Feb 2025 09:58:23 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1tesHd-003GNl-2g;
 Mon, 03 Feb 2025 09:58:21 +0100
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1tesHd-002YYj-2Q;
 Mon, 03 Feb 2025 09:58:21 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Woojung Huh <woojung.huh@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>
Date: Mon,  3 Feb 2025 09:58:16 +0100
Message-Id: <20250203085820.609176-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 0/4] Add support for Priva E-Measuringbox
	board
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

This patch series introduces support for the Priva E-Measuringbox board
based on the ST STM32MP133 SoC. The set includes all the necessary
changes for device tree bindings, vendor prefixes, thermal support, and
board-specific devicetree to pass devicetree validation and checkpatch
tests.

changes v2:
- drop: dt-bindings: net: Add TI DP83TD510 10BaseT1L PHY

Oleksij Rempel (2):
  dt-bindings: vendor-prefixes: Add prefix for Priva
  dt-bindings: arm: stm32: Add Priva E-Measuringbox board

Roan van Dijk (2):
  arm: dts: stm32: Add thermal support for STM32MP131
  arm: dts: stm32: Add Priva E-Measuringbox devicetree

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/st/Makefile                 |   1 +
 arch/arm/boot/dts/st/stm32mp131.dtsi          |  35 ++
 arch/arm/boot/dts/st/stm32mp133c-prihmb.dts   | 496 ++++++++++++++++++
 5 files changed, 540 insertions(+)
 create mode 100644 arch/arm/boot/dts/st/stm32mp133c-prihmb.dts

--
2.39.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
