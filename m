Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC136CFF9B
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Mar 2023 11:16:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27EFFC6A5FB;
	Thu, 30 Mar 2023 09:16:19 +0000 (UTC)
Received: from smtp28.bhosted.nl (smtp28.bhosted.nl [94.124.121.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E53BC6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Mar 2023 09:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonic.nl; s=202111;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=PfPZKp62ZUfMvI3fqeh72mzhaSf7vvFEI18bulM/FrI=;
 b=gTE0TsMBwKVLxEbNOrzWrtH71pn1o+UlfqzsRG8/3UmX0iJ2rWvmntfY4g8DsNe7LPrmtWZCcxq2O
 zIS7wl5qQ852E6qOJRU+hcwEd//h4U6pjI7bLhG9Rj32t08tD1R0/AmRTA7wwKnQKCoz3UvPRTAoGb
 jj6f82uZnheU/dwxN4DGcqqghUd2M4haooD0aZYGv6yPx09z43PFAV4+kiOeNs/sHd8FHuk4auFjBc
 xcI7l29bBIq1Tml+ALIp2IxGDVGDX/59XLVquMFgrWvniwOmnXwQHeCQmtuczfWENIACeTeh/lxuGZ
 zIn9QB9TbMvPlxwRuFf6S08xUnNVOZw==
X-MSG-ID: 85abb958-cedb-11ed-a150-0050569d11ae
From: Roan van Dijk <roan@protonic.nl>
To: corbet@lwn.net
Date: Thu, 30 Mar 2023 11:16:13 +0200
Message-Id: <20230330091613.1445734-1-roan@protonic.nl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Roan van Dijk <roan@protonic.nl>, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] ARM: stm32: add initial documentation for
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

v2: 
 - Adds stm32mp151 to index.rst

 Documentation/arm/index.rst                   |  1 +
 .../arm/stm32/stm32mp151-overview.rst         | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 Documentation/arm/stm32/stm32mp151-overview.rst

diff --git a/Documentation/arm/index.rst b/Documentation/arm/index.rst
index ae42fe886f0d..056ac11372af 100644
--- a/Documentation/arm/index.rst
+++ b/Documentation/arm/index.rst
@@ -58,6 +58,7 @@ SoC-specific documents
    stm32/stm32f769-overview
    stm32/stm32f429-overview
    stm32/stm32mp13-overview
+   stm32/stm32mp151-overview
    stm32/stm32mp157-overview
    stm32/stm32-dma-mdma-chaining
 
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
