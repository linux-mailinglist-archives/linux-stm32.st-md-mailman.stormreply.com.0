Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C494E1C2D84
	for <lists+linux-stm32@lfdr.de>; Sun,  3 May 2020 17:42:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 325CCC36B19;
	Sun,  3 May 2020 15:42:32 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB726C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 May 2020 15:42:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [157.51.190.160])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7612220757;
 Sun,  3 May 2020 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588520548;
 bh=0CnMSeTOMkqPLyIXlkMMbKd1x1o/uhBytgUHSI2Q8IM=;
 h=From:To:Cc:Subject:Date:From;
 b=IULHFamipQH5bSodpv0GV3Nx9+FVZaxVXUfnbSU21fv2/JywgTGME+8mLNzI126jP
 oPCbHEba/noEgcFuYPnbljJjxzF/zy7wYT/X4EgfHUHzUMBE6IFUvzRPg1pcd2XoQk
 Z7E5fpcjD+GlJFhjRB92VRRgkAVutW4AZGCddY9M=
From: mani@kernel.org
To: robh+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@st.com
Date: Sun,  3 May 2020 21:12:09 +0530
Message-Id: <20200503154215.23654-1-mani@kernel.org>
X-Mailer: git-send-email 2.17.1
Cc: devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 0/6] Add Stinger96 and IoT Box board support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Manivannan Sadhasivam <mani@kernel.org>

Hello,

This series adds Stinger96 and IoT Box board support. These boards are
based on STM32MP157A SoC, designed and manufactured by Shiratech solutions.

The Stinger96 is a base board (96Boards IoT Extended edition) while IoT Box
adds one mezzanine on top of it and sold as a gateway device.

This series depends on below patchsets already submitted and gone through
reviews:

[PATCH v3 0/3] Add Reset and Wakeup support for CCS811
[PATCH v3 0/2] Add CTS/RTS gpio support to STM32 UART

More information about these boards can be found in below links:

https://www.shiratech-solutions.com/products/stinger96/
https://www.shiratech-solutions.com/products/iot-box/

Thanks,
Mani

Changes in v2:

* Used "stm32" prefix for all DT commits
* Dropped custom sdmmc2 pinctrl node since existing node itself has pullup
  enabled and works fine.

Manivannan Sadhasivam (6):
  dt-bindings: Add vendor prefix for Shiratech Solutions
  ARM: dts: stm32: Add missing pinctrl entries for STM32MP15
  dt-bindings: arm: stm32: Document Stinger96 compatible
  ARM: dts: stm32: Add Stinger96 board support
  dt-bindings: arm: stm32: Document IoT Box compatible
  ARM: dts: stm32: Add IoT Box board support

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi      |  64 ++++
 arch/arm/boot/dts/stm32mp157a-iot-box.dts     |  68 ++++
 arch/arm/boot/dts/stm32mp157a-stinger96.dts   |  12 +
 arch/arm/boot/dts/stm32mp157a-stinger96.dtsi  | 342 ++++++++++++++++++
 7 files changed, 492 insertions(+)
 create mode 100644 arch/arm/boot/dts/stm32mp157a-iot-box.dts
 create mode 100644 arch/arm/boot/dts/stm32mp157a-stinger96.dts
 create mode 100644 arch/arm/boot/dts/stm32mp157a-stinger96.dtsi

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
