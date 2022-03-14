Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CF94D7C49
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Mar 2022 08:56:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96FF9C628AB;
	Mon, 14 Mar 2022 07:56:07 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F70BC5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 07:56:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0DFD6611F9;
 Mon, 14 Mar 2022 07:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A7CC341C5;
 Mon, 14 Mar 2022 07:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647244561;
 bh=XwnuOMWav2wW/mQwSdrIlV80W2cHb8kKIf2vvbnpLzI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I5Taxlo+xgcPzJLl100gM8UdADsNRnBhb2WuH0paD1ngi3Kb440eMM4K//WBzoMVM
 ecOKhojeQxuT/AYzVGulO8H8qPuaGd9nyXb3lmqeIgif0wR+/pVv24vDrQUhta7krQ
 d2gKB8TlzItHuC94BuyeOngpatFI0RQJUl/jYIs1YZMFY7AwLNwcJTc6LzKuZ1tLey
 y51qxYQsP2kfhXlXZDEUNaT5Xpa8oidLFlSkKT7ruMvKInW5JyQMNG6G9ubuMh6a0g
 f2IQURv8iQIMhg4E9f8SIEaL9zb8HtXSdB9HkhOB+Z3JtNUO6eXzGBSs151Jr9u+dy
 gFwkG/gyqbZPg==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTfYd-001kVv-E1; Mon, 14 Mar 2022 08:55:59 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Date: Mon, 14 Mar 2022 08:55:19 +0100
Message-Id: <bd59a9480b5bc4f257957f0883db7af024ae5fc8.1647242579.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647242578.git.mchehab@kernel.org>
References: <cover.1647242578.git.mchehab@kernel.org>
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Ming Qian <ming.qian@nxp.com>,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 27/64] media: platform: stm32: move config to
	its own file
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

In order to better organize the platform/Kconfig, place
stm32-specific config stuff on a separate Kconfig file.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/64] at: https://lore.kernel.org/all/cover.1647242578.git.mchehab@kernel.org/

 drivers/media/platform/Kconfig       | 29 +-------------------------
 drivers/media/platform/stm32/Kconfig | 31 ++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 28 deletions(-)
 create mode 100644 drivers/media/platform/stm32/Kconfig

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 9408096a365e..b14a0fc78f41 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -62,6 +62,7 @@ source "drivers/media/platform/rockchip/rga/Kconfig"
 source "drivers/media/platform/s3c-camif/Kconfig"
 source "drivers/media/platform/s5p-g2d/Kconfig"
 source "drivers/media/platform/sti/hva/Kconfig"
+source "drivers/media/platform/stm32/Kconfig"
 
 config VIDEO_MUX
 	tristate "Video Multiplexer"
@@ -77,21 +78,6 @@ config VIDEO_MUX
 
 source "drivers/media/platform/intel/Kconfig"
 
-config VIDEO_STM32_DCMI
-	tristate "STM32 Digital Camera Memory Interface (DCMI) support"
-	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2 && OF
-	depends on ARCH_STM32 || COMPILE_TEST
-	select VIDEOBUF2_DMA_CONTIG
-	select MEDIA_CONTROLLER
-	select V4L2_FWNODE
-	help
-	  This module makes the STM32 Digital Camera Memory Interface (DCMI)
-	  available as a v4l2 device.
-
-	  To compile this driver as a module, choose M here: the module
-	  will be called stm32-dcmi.
-
 config VIDEO_ROCKCHIP_ISP1
 	tristate "Rockchip Image Signal Processing v1 Unit driver"
 	depends on V4L_PLATFORM_DRIVERS
@@ -223,19 +209,6 @@ config VIDEO_STI_DELTA_DRIVER
 	select V4L2_MEM2MEM_DEV
 	select RPMSG
 
-config VIDEO_STM32_DMA2D
-	tristate "STM32 Chrom-Art Accelerator (DMA2D)"
-	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
-	depends on ARCH_STM32 || COMPILE_TEST
-	select VIDEOBUF2_DMA_CONTIG
-	select V4L2_MEM2MEM_DEV
-	help
-	  Enables DMA2D hardware support on stm32.
-
-	  The STM32 DMA2D is a memory-to-memory engine for pixel conversion
-	  and specialized DMA dedicated to image manipulation.
-
 config VIDEO_TI_VPE
 	tristate "TI VPE (Video Processing Engine) driver"
 	depends on V4L_MEM2MEM_DRIVERS
diff --git a/drivers/media/platform/stm32/Kconfig b/drivers/media/platform/stm32/Kconfig
new file mode 100644
index 000000000000..60b87e403c7c
--- /dev/null
+++ b/drivers/media/platform/stm32/Kconfig
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+# V4L drivers
+config VIDEO_STM32_DCMI
+	tristate "STM32 Digital Camera Memory Interface (DCMI) support"
+	depends on V4L_PLATFORM_DRIVERS
+	depends on VIDEO_V4L2 && OF
+	depends on ARCH_STM32 || COMPILE_TEST
+	select VIDEOBUF2_DMA_CONTIG
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	help
+	  This module makes the STM32 Digital Camera Memory Interface (DCMI)
+	  available as a v4l2 device.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called stm32-dcmi.
+
+# Mem2mem drivers
+config VIDEO_STM32_DMA2D
+	tristate "STM32 Chrom-Art Accelerator (DMA2D)"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on ARCH_STM32 || COMPILE_TEST
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
+	help
+	  Enables DMA2D hardware support on stm32.
+
+	  The STM32 DMA2D is a memory-to-memory engine for pixel conversion
+	  and specialized DMA dedicated to image manipulation.
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
