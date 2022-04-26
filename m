Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB9250F29F
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Apr 2022 09:35:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55E4DC6047D;
	Tue, 26 Apr 2022 07:35:28 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C3C7C5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Apr 2022 07:35:27 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1njFjB-00056p-0H; Tue, 26 Apr 2022 09:35:17 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ore@pengutronix.de>)
 id 1njFj8-005InS-Eo; Tue, 26 Apr 2022 09:35:13 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ore@pengutronix.de>)
 id 1njFj5-004roY-Sb; Tue, 26 Apr 2022 09:35:11 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>
Date: Tue, 26 Apr 2022 09:35:07 +0200
Message-Id: <20220426073511.1160119-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 0/4] mainline Protonic PRTT1x boards
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

changes v4:
- reorder prtt1X compatible again
- remove spaces in stm32mp151a-prtt1c.dts

changes v3:
- add silabs,wfx compatible
- move spi pin configuration to stm32mp15-pinctrl.dtsi
- move prtt1X compatible in alphabetical order
- add watchdog and thermal nodes

changes v2:
- cleanup mmc nodes
- disabled dma for uart4 (this is console interface and it should work
  as simple as possible)

Oleksij Rempel (4):
  dt-bindings: arm: stm32: Add compatible strings for Protonic T1L
    boards
  dt-bindings: net: silabs,wfx: add prt,prtt1c-wfm200 antenna variant
  ARM: dts: stm32: stm32mp15-pinctrl: add spi1-1 pinmux group
  ARM: dts: stm32: add support for Protonic PRTT1x boards

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   8 +
 .../staging/net/wireless/silabs,wfx.yaml      |   1 +
 arch/arm/boot/dts/Makefile                    |   3 +
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi      |  15 +
 arch/arm/boot/dts/stm32mp151a-prtt1a.dts      |  52 +++
 arch/arm/boot/dts/stm32mp151a-prtt1c.dts      | 304 ++++++++++++++++++
 arch/arm/boot/dts/stm32mp151a-prtt1l.dtsi     | 229 +++++++++++++
 arch/arm/boot/dts/stm32mp151a-prtt1s.dts      |  63 ++++
 8 files changed, 675 insertions(+)
 create mode 100644 arch/arm/boot/dts/stm32mp151a-prtt1a.dts
 create mode 100644 arch/arm/boot/dts/stm32mp151a-prtt1c.dts
 create mode 100644 arch/arm/boot/dts/stm32mp151a-prtt1l.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp151a-prtt1s.dts

-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
