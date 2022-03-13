Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA1E4D7471
	for <lists+linux-stm32@lfdr.de>; Sun, 13 Mar 2022 11:52:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9C08C5F1EE;
	Sun, 13 Mar 2022 10:52:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 937B8C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Mar 2022 10:52:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4A21161030;
 Sun, 13 Mar 2022 10:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9090C36AEA;
 Sun, 13 Mar 2022 10:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647168729;
 bh=SXIXVsi92d7TTgQSfMh1FbNBtB+/BjvkX1VTtXotizw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZMNpfwTaqQk9Zq25A29N/K6B8c5COAid1ZPnABf0MEvyq9YSYOekuONniA9p6B41a
 +8qooFFUo5mrQKln1KIwS0+icW5E/CiEOMr51zUwXyetlhGChSQE7/Y3PkxjBxUDbA
 lcPtztIfTIdJx5LP7n7RnvR/U0YhH0CFzP6jHEyKuUt5rKa61TKG1Ybdl6u6kcvyzC
 GsI9QwpDNrhWTMFpvotSUSMHZp9GYYINqLh4JWJmkX20OY6D8KmO+ODYsyF5DGiHMb
 1HKsWPPjoGxX6C07OqxDAF9O0bjphmPXnYWx+FTmxedokGkJWOCnJ27elMn2zLSld7
 Dqk7uva2OAn+Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTLpX-001I2K-IY; Sun, 13 Mar 2022 11:52:07 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Date: Sun, 13 Mar 2022 11:51:58 +0100
Message-Id: <dc5be62a56ac19c6f49f4c8432558fd7b0efe7e6.1647167750.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647167750.git.mchehab@kernel.org>
References: <cover.1647167750.git.mchehab@kernel.org>
MIME-Version: 1.0
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexey Khoroshilov <khoroshilov@ispras.ru>, Leon Romanovsky <leon@kernel.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, Dmitriy Ulitin <ulitin@ispras.ru>,
 Alain Volmat <alain.volmat@foss.st.com>, linux-media@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dillon Min <dillon.minfei@gmail.com>, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Eugen Hristev <eugen.hristev@microchip.com>, Ming Qian <ming.qian@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [Linux-stm32] [PATCH 17/24] media: platform: rename stm32/ to
	sti/stm32/
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

As the end goal is to have platform drivers split by vendor,
rename stm32/ to sti/stm32/.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/24] at: https://lore.kernel.org/all/cover.1647167750.git.mchehab@kernel.org/

 MAINTAINERS                                               | 2 +-
 drivers/media/platform/Kconfig                            | 2 +-
 drivers/media/platform/Makefile                           | 2 +-
 drivers/media/platform/{ => sti}/stm32/Kconfig            | 0
 drivers/media/platform/{ => sti}/stm32/Makefile           | 0
 drivers/media/platform/{ => sti}/stm32/dma2d/dma2d-hw.c   | 0
 drivers/media/platform/{ => sti}/stm32/dma2d/dma2d-regs.h | 0
 drivers/media/platform/{ => sti}/stm32/dma2d/dma2d.c      | 0
 drivers/media/platform/{ => sti}/stm32/dma2d/dma2d.h      | 0
 drivers/media/platform/{ => sti}/stm32/stm32-dcmi.c       | 0
 10 files changed, 3 insertions(+), 3 deletions(-)
 rename drivers/media/platform/{ => sti}/stm32/Kconfig (100%)
 rename drivers/media/platform/{ => sti}/stm32/Makefile (100%)
 rename drivers/media/platform/{ => sti}/stm32/dma2d/dma2d-hw.c (100%)
 rename drivers/media/platform/{ => sti}/stm32/dma2d/dma2d-regs.h (100%)
 rename drivers/media/platform/{ => sti}/stm32/dma2d/dma2d.c (100%)
 rename drivers/media/platform/{ => sti}/stm32/dma2d/dma2d.h (100%)
 rename drivers/media/platform/{ => sti}/stm32/stm32-dcmi.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7711a5ea125e..620705e0f043 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12046,7 +12046,7 @@ L:	linux-media@vger.kernel.org
 S:	Supported
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
-F:	drivers/media/platform/stm32/stm32-dcmi.c
+F:	drivers/media/platform/sti/stm32/stm32-dcmi.c
 
 MEDIA INPUT INFRASTRUCTURE (V4L/DVB)
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index c3594807f8d7..cf373bfbca1b 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -95,7 +95,7 @@ source "drivers/media/platform/samsung/s5p-g2d/Kconfig"
 source "drivers/media/platform/samsung/s5p-jpeg/Kconfig"
 source "drivers/media/platform/samsung/s5p-mfc/Kconfig"
 source "drivers/media/platform/sti/Kconfig"
-source "drivers/media/platform/stm32/Kconfig"
+source "drivers/media/platform/sti/stm32/Kconfig"
 source "drivers/media/platform/ti-vpe/Kconfig"
 source "drivers/media/platform/via/Kconfig"
 source "drivers/media/platform/xilinx/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 6a766acfbe37..e3dd2331003a 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -40,7 +40,7 @@ obj-y += sti/bdisp/
 obj-y += sti/c8sectpfe/
 obj-y += sti/delta/
 obj-y += sti/hva/
-obj-y += stm32/
+obj-y += sti/stm32/
 obj-y += ti-vpe/
 obj-y += via/
 obj-y += xilinx/
diff --git a/drivers/media/platform/stm32/Kconfig b/drivers/media/platform/sti/stm32/Kconfig
similarity index 100%
rename from drivers/media/platform/stm32/Kconfig
rename to drivers/media/platform/sti/stm32/Kconfig
diff --git a/drivers/media/platform/stm32/Makefile b/drivers/media/platform/sti/stm32/Makefile
similarity index 100%
rename from drivers/media/platform/stm32/Makefile
rename to drivers/media/platform/sti/stm32/Makefile
diff --git a/drivers/media/platform/stm32/dma2d/dma2d-hw.c b/drivers/media/platform/sti/stm32/dma2d/dma2d-hw.c
similarity index 100%
rename from drivers/media/platform/stm32/dma2d/dma2d-hw.c
rename to drivers/media/platform/sti/stm32/dma2d/dma2d-hw.c
diff --git a/drivers/media/platform/stm32/dma2d/dma2d-regs.h b/drivers/media/platform/sti/stm32/dma2d/dma2d-regs.h
similarity index 100%
rename from drivers/media/platform/stm32/dma2d/dma2d-regs.h
rename to drivers/media/platform/sti/stm32/dma2d/dma2d-regs.h
diff --git a/drivers/media/platform/stm32/dma2d/dma2d.c b/drivers/media/platform/sti/stm32/dma2d/dma2d.c
similarity index 100%
rename from drivers/media/platform/stm32/dma2d/dma2d.c
rename to drivers/media/platform/sti/stm32/dma2d/dma2d.c
diff --git a/drivers/media/platform/stm32/dma2d/dma2d.h b/drivers/media/platform/sti/stm32/dma2d/dma2d.h
similarity index 100%
rename from drivers/media/platform/stm32/dma2d/dma2d.h
rename to drivers/media/platform/sti/stm32/dma2d/dma2d.h
diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/sti/stm32/stm32-dcmi.c
similarity index 100%
rename from drivers/media/platform/stm32/stm32-dcmi.c
rename to drivers/media/platform/sti/stm32/stm32-dcmi.c
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
