Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EC81B4072
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Apr 2020 12:46:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 082F3C36B0B;
	Wed, 22 Apr 2020 10:46:29 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58DC9C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 10:46:27 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 496cYZ14CXz1rs2p;
 Wed, 22 Apr 2020 12:46:26 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 496cYZ0DqVz1qr40;
 Wed, 22 Apr 2020 12:46:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id xHrGED9s0VHs; Wed, 22 Apr 2020 12:46:24 +0200 (CEST)
X-Auth-Info: cFfxoLoBMRF1bEt5ETGnA3TUOEsV3WUTXy1XFJvs6Rg=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 22 Apr 2020 12:46:24 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Wed, 22 Apr 2020 12:45:53 +0200
Message-Id: <20200422104613.96944-1-marex@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH V5 00/20] ARM: dts: stm32: Repair AV96 board
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

The AV96 board device tree is completely broken and does not match the
hardware. This series fixes it up.

Marek Vasut (20):
  ARM: dts: stm32: Repair PMIC configuration on AV96
  ARM: dts: stm32: Repair PMIC interrupt on AV96
  ARM: dts: stm32: Add alternate pinmux for ethernet RGMII
  ARM: dts: stm32: Repair ethernet operation on AV96
  ARM: dts: stm32: Add missing ethernet PHY reset on AV96
  ARM: dts: stm32: Add missing ethernet PHY skews on AV96
  ARM: dts: stm32: Add alternate pinmux for SDMMC pins
  ARM: dts: stm32: Repair SDMMC1 operation on AV96
  ARM: dts: stm32: Add eMMC attached to SDMMC2 on AV96
  ARM: dts: stm32: Add QSPI NOR on AV96
  ARM: dts: stm32: Add configuration EEPROM on AV96
  ARM: dts: stm32: Enable WiFi on AV96
  ARM: dts: stm32: Add alternate pinmux for USART2 pins
  ARM: dts: stm32: Enable Bluetooth on AV96
  ARM: dts: stm32: Add alternate pinmux for LTDC pins
  ARM: dts: stm32: Add bindings for HDMI video on AV96
  ARM: dts: stm32: Add alternate pinmux for SAI2 pins
  ARM: dts: stm32: Add bindings for audio on AV96
  ARM: dts: stm32: Add bindings for USB on AV96
  ARM: dts: stm32: Rename LEDs to match silkscreen on AV96

 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi    | 280 +++++++++++++++++
 arch/arm/boot/dts/stm32mp157a-avenger96.dts | 324 ++++++++++++++++++--
 2 files changed, 572 insertions(+), 32 deletions(-)

Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
