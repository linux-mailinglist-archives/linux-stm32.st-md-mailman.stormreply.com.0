Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBD519891E
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 02:57:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00DCFC36B0B;
	Tue, 31 Mar 2020 00:57:32 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FE14C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 00:57:30 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48rrX96dvJz1qrGG;
 Tue, 31 Mar 2020 02:57:29 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48rrX9621kz1r0cK;
 Tue, 31 Mar 2020 02:57:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id HuYhLRn7TH_T; Tue, 31 Mar 2020 02:57:28 +0200 (CEST)
X-Auth-Info: lYd3tf1OByz0YyGRUq7xLhcKT5AG8G1a3ZIg9bFfoig=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 31 Mar 2020 02:57:28 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Tue, 31 Mar 2020 02:56:39 +0200
Message-Id: <20200331005701.283998-1-marex@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH V2 00/22] ARM: dts: stm32: Repair AV96 board
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

Marek Vasut (22):
  ARM: dts: stm32: Add alternate pinmux for ethernet RGMII
  ARM: dts: stm32: Repair ethernet operation on AV96
  ARM: dts: stm32: Add missing ethernet PHY reset on AV96
  ARM: dts: stm32: Add missing ethernet PHY skews on AV96
  ARM: dts: stm32: Add alternate pinmux for SDMMC1 direction pins
  ARM: dts: stm32: Repair SDMMC1 operation on AV96
  ARM: dts: stm32: Add alternate pinmux for SDMMC2 pins 4-7
  ARM: dts: stm32: Add eMMC attached to SDMMC2 on AV96
  ARM: dts: stm32: Repair PMIC configuration on AV96
  ARM: dts: stm32: Repair PMIC interrupt on AV96
  ARM: dts: stm32: Add QSPI NOR on AV96
  ARM: dts: stm32: Add configuration EEPROM on AV96
  ARM: dts: stm32: Enable GPU on AV96
  ARM: dts: stm32: Add alternate pinmux for SDMMC3 pins
  ARM: dts: stm32: Enable WiFi on AV96
  ARM: dts: stm32: Add alternate pinmux for USART2 pins
  ARM: dts: stm32: Enable Bluetooth on AV96
  ARM: dts: stm32: Add alternate pinmux for LTDC pins
  ARM: dts: stm32: Add bindings for HDMI video on AV96
  ARM: dts: stm32: Add bindings for audio on AV96
  ARM: dts: stm32: Add bindings for USB on AV96
  ARM: dts: stm32: Rename LEDs to match silkscreen on AV96

 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi    | 248 +++++++++++++++
 arch/arm/boot/dts/stm32mp157a-avenger96.dts | 328 ++++++++++++++++++--
 2 files changed, 543 insertions(+), 33 deletions(-)

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
