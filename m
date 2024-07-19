Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 522E6937498
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Jul 2024 09:55:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1F50C7801A;
	Fri, 19 Jul 2024 07:55:11 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E366C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2024 07:55:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id ACE2ECE1AF2;
 Fri, 19 Jul 2024 07:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A34C32782;
 Fri, 19 Jul 2024 07:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721375701;
 bh=W8wSaMuFu+gkCLCSzJa/gXpVw17QnJMqwKbE6WN4SoY=;
 h=From:To:Cc:Subject:Date:From;
 b=cuAaoJgcFF7G7yMkmbxqhagURXqIBNBcHzGWT66VKHJQWmeQ3vMSX8E1vKcT0DhTf
 DiIQb7Kxf75yxPi7oU3rbtqiBD5OIORapwQYl8X+VxT7NyglWrUhTMGpNG/ljvKBKg
 ztlt80iaOjIoo1pAgnT0PhMKF1riF34/gmkZ6gAEcnX97K4gHpvOYPk/GMFgY5vhMP
 mAXUWpi6k9AAqfPFVjG3CjGO69OMA7+Pad3m/P8KS1MbllsDijmyxWItjC/BI8aj3V
 TtHWcwxVQWyTnGw3nb2CTjo4/IlosQSv2nTYmpfAL1DVrOpLIEHZ2FmsU8N3e1d3Bj
 NxOys413qGOeQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>
Date: Fri, 19 Jul 2024 09:54:41 +0200
Message-Id: <20240719075454.3595358-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [Linux-stm32] [PATCH] drm/stm: add COMMON_CLK dependency
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

From: Arnd Bergmann <arnd@arndb.de>

The added lvds driver and a change in the dsi driver resulted in failed
builds when COMMON_CLK is disabled:

x86_64-linux-ld: drivers/gpu/drm/stm/dw_mipi_dsi-stm.o: in function `dw_mipi_dsi_stm_remove':
dw_mipi_dsi-stm.c:(.text+0x51e): undefined reference to `clk_hw_unregister'

x86_64-linux-ld: drivers/gpu/drm/stm/lvds.o: in function `lvds_remove':
lvds.c:(.text+0xe3): undefined reference to `of_clk_del_provider'
x86_64-linux-ld: lvds.c:(.text+0xec): undefined reference to `clk_hw_unregister'
x86_64-linux-ld: drivers/gpu/drm/stm/lvds.o: in function `lvds_pll_config':
lvds.c:(.text+0xb5d): undefined reference to `clk_hw_get_rate'
x86_64-linux-ld: drivers/gpu/drm/stm/lvds.o: in function `lvds_probe':
lvds.c:(.text+0x1476): undefined reference to `clk_hw_register'
x86_64-linux-ld: lvds.c:(.text+0x148b): undefined reference to `of_clk_hw_simple_get'
x86_64-linux-ld: lvds.c:(.text+0x1493): undefined reference to `of_clk_add_hw_provider'
x86_64-linux-ld: lvds.c:(.text+0x1535): undefined reference to `clk_hw_unregister'

Add this as a dependency for the stm driver itself, since it will be
required in practice anyway.

Fixes: 185f99b61442 ("drm/stm: dsi: expose DSI PHY internal clock")
Fixes: aca1cbc1c986 ("drm/stm: lvds: add new STM32 LVDS Display Interface Transmitter driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/stm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/stm/Kconfig b/drivers/gpu/drm/stm/Kconfig
index 1cc6b6cbdfa9..d7f41a87808e 100644
--- a/drivers/gpu/drm/stm/Kconfig
+++ b/drivers/gpu/drm/stm/Kconfig
@@ -2,6 +2,7 @@
 config DRM_STM
 	tristate "DRM Support for STMicroelectronics SoC Series"
 	depends on DRM && (ARCH_STM32 || COMPILE_TEST)
+	depends on COMMON_CLK
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_PANEL_BRIDGE
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
