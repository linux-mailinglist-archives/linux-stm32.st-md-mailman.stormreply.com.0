Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FB46CD70C
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Mar 2023 11:56:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4FEEC69069;
	Wed, 29 Mar 2023 09:56:15 +0000 (UTC)
Received: from smtp16.bhosted.nl (smtp16.bhosted.nl [94.124.121.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2ED2C65E6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Mar 2023 09:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonic.nl; s=202111;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=A7yjEgP+A6xQRL7HSj3Fivv9FpYOncdPGUSCTs1pGgQ=;
 b=D2r0rPk9EYmB211NId2iOgRHJPBys7KZ5o0g8MpYtu0Lknmpgjl0sfhbN4N3FJilbepTgd78alZ1F
 uusi34s+XlH5i1cIKEHnrAUqiAicnRU9s6/4weKPu80LLYiYpM28Bz6yNRPyxxcTCG5lH5skQSJjoW
 qawhs/aXLgcjCh/b5QAKpczKa6zLsamzlh3gX7XRW7D3Nhke1s2yVLYMiPrgkYBw4HVDEnYNB3X/8P
 u9Mtwb1FEFRoeWsZLIce0IZCLeXCIqoQnu843CicvIqyv8FXIJTAR5PgLfXNcCoYZNi2AATuBZs3oV
 hVn8Ybt0MrZK1nlT0QHZUegoqkBAY8A==
X-MSG-ID: efe3a89b-ce17-11ed-829c-0050569d2c73
From: Roan van Dijk <roan@protonic.nl>
To: corbet@lwn.net
Date: Wed, 29 Mar 2023 11:56:00 +0200
Message-Id: <20230329095600.1355049-1-roan@protonic.nl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Roan van Dijk <roan@protonic.nl>, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: stm32: add initial documentation for
	STM32MP151
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

This patch adds initial documentation of STM32MP151 microprocessor (MPU)
based on Arm Cortex-A7.

Signed-off-by: Roan van Dijk <roan@protonic.nl>
---
 .../arm/stm32/stm32mp151-overview.rst         | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/arm/stm32/stm32mp151-overview.rst

diff --git a/Documentation/arm/stm32/stm32mp151-overview.rst b/Documentation/arm/stm32/stm32mp151-overview.rst
new file mode 100644
index 000000000000..f42a2ac309c0
--- /dev/null
+++ b/Documentation/arm/stm32/stm32mp151-overview.rst
@@ -0,0 +1,36 @@
+===================
+STM32MP151 Overview
+===================
+
+Introduction
+------------
+
+The STM32MP151 is a Cortex-A MPU aimed at various applications.
+It features:
+
+- Single Cortex-A7 application core
+- Standard memories interface support
+- Standard connectivity, widely inherited from the STM32 MCU family
+- Comprehensive security support
+
+More details:
+
+- Cortex-A7 core running up to @800MHz
+- FMC controller to connect SDRAM, NOR and NAND memories
+- QSPI
+- SD/MMC/SDIO support
+- Ethernet controller
+- ADC/DAC
+- USB EHCI/OHCI controllers
+- USB OTG
+- I2C, SPI busses support
+- Several general purpose timers
+- Serial Audio interface
+- LCD-TFT controller
+- DCMIPP
+- SPDIFRX
+- DFSDM
+
+:Authors:
+
+- Roan van Dijk <roan@protonic.nl>
-- 
2.37.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
