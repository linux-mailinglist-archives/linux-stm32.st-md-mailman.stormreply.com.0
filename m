Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AC44D6582
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Mar 2022 16:59:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52900C628AC;
	Fri, 11 Mar 2022 15:59:08 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 127F6C628A4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Mar 2022 14:09:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F1B061F0F;
 Fri, 11 Mar 2022 14:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11959C34111;
 Fri, 11 Mar 2022 14:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647007778;
 bh=YDr+LkSJ9LsOY8UPhtMHd6OG6zfQyitjAjU4i6/8mwY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rstGkDpQYmG/gWcfzx7m3ztE18p618LViwjGLvAVyQrUhaOYOjdu6p1RneC4x5i8p
 NDnSl8BxCLxxSS+v+E5fd05wK+pYVt2ubPR92zmOdfU3jczzIEJmYZ4C68LPDG0imz
 CrhQHSJf0QXkCYlVKkaedfInLJNEHXoHPR9PZ7ey2n33sq6qOk4N0v6kX7aE3kFa6W
 XxX5UU0SL5+ofGfhXJF306xCPBkWtqaQgetS3Aaz7xZr4sxO6Q20sbcvojDsmFl0ky
 2OZ2N7X1lPyXuety6phZ0A5kAa2x31fGVusPf/Ay43+AMUgm0q/G5to/Gk2PeYw2Ap
 s3cmdK66UwNJQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nSfxX-000lI5-R3; Fri, 11 Mar 2022 15:09:35 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Date: Fri, 11 Mar 2022 15:07:40 +0100
Message-Id: <b51a1c723370e000ef658dc8a17b8d3d34102dee.1647006877.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647006877.git.mchehab@kernel.org>
References: <cover.1647006877.git.mchehab@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 11 Mar 2022 15:59:07 +0000
Cc: linux-arm-kernel@lists.infradead.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Ming Qian <ming.qian@nxp.com>,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 27/38] media: platform: stm32: move config
	to its own file
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
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/38] at: https://lore.kernel.org/all/cover.1647006877.git.mchehab@kernel.org/

 drivers/media/platform/Kconfig       | 29 +-------------------------
 drivers/media/platform/stm32/Kconfig | 31 ++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 28 deletions(-)
 create mode 100644 drivers/media/platform/stm32/Kconfig

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 7e2b120a2057..460ad793b89b 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -69,6 +69,7 @@ source "drivers/media/platform/rockchip/rga/Kconfig"
 source "drivers/media/platform/s3c-camif/Kconfig"
 source "drivers/media/platform/s5p-g2d/Kconfig"
 source "drivers/media/platform/sti/hva/Kconfig"
+source "drivers/media/platform/stm32/Kconfig"
 
 config VIDEO_MUX
 	tristate "Video Multiplexer"
@@ -84,21 +85,6 @@ config VIDEO_MUX
 
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
@@ -233,19 +219,6 @@ config VIDEO_STI_DELTA_DRIVER
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
index 000000000000..f4726010ca14
--- /dev/null
+++ b/drivers/media/platform/stm32/Kconfig
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0
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
