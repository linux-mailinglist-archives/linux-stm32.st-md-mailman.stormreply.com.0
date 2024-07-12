Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8462092FAF9
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jul 2024 15:15:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 472B3C6C820;
	Fri, 12 Jul 2024 13:15:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A74E1C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2024 13:15:27 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46C89Xgj002842;
 Fri, 12 Jul 2024 15:15:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=WYgtUxOsPJNb2E3kFeNTvk
 Q2/fdwenANgMvmftG8sr4=; b=tCUViSfIC3FTlXEd1FtbiE6kiTqjiRY/oXQOa9
 CTRy3hvlKrGjzzEUuvFyver4NXftPiuS0sbY7ldNeCGdvgEuLMYJgZoZByMpNE7e
 kSyYhe2FEmaPKFqIDj2w8R4pk9q6jWJg/GFx7hXl1VyEtB4T4yScyRr69ozXdr09
 6Ni7up/LEAceuYPumr3JcM3WDIsiAszlkm3KaOeFCmzJlp5EZPW/Wti6YLSoDtMS
 53srUzMCorn5nGopqHYOT0HThkH4hHal5JeltgSvIGQS/veY0TKnlfd6y99y+1rX
 CXSq3Dd2sCD/S+gunvlFx/xkYRL9eHwaliBSFyW6N+wmRhvA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 406whj2ejr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jul 2024 15:15:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 622FE4002D;
 Fri, 12 Jul 2024 15:15:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4759D20CB27;
 Fri, 12 Jul 2024 15:14:26 +0200 (CEST)
Received: from localhost (10.252.16.177) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 12 Jul
 2024 15:14:25 +0200
From: Yannick Fertre <yannick.fertre@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 12 Jul 2024 15:14:23 +0200
Message-ID: <20240712131423.98405-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.252.16.177]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_09,2024-07-11_01,2024-05-17_01
Subject: [Linux-stm32] [PATCH] drm/stm: ltdc: add mask for lxcr register
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

The purpose of this mask is to simplify writing to the lxcr
register and not to forget any fields.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index cb4f08673a64..3876346a1303 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -187,6 +187,7 @@
 #define LXCR_COLKEN	BIT(1)		/* Color Keying Enable */
 #define LXCR_CLUTEN	BIT(4)		/* Color Look-Up Table ENable */
 #define LXCR_HMEN	BIT(8)		/* Horizontal Mirroring ENable */
+#define LXCR_MASK (LXCR_LEN | LXCR_COLKEN | LXCR_CLUTEN | LXCR_HMEN)
 
 #define LXWHPCR_WHSTPOS	GENMASK(11, 0)	/* Window Horizontal StarT POSition */
 #define LXWHPCR_WHSPPOS	GENMASK(27, 16)	/* Window Horizontal StoP POSition */
@@ -806,8 +807,7 @@ static void ltdc_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	/* Disable all layers */
 	for (layer_index = 0; layer_index < ldev->caps.nb_layers; layer_index++)
-		regmap_write_bits(ldev->regmap, LTDC_L1CR + layer_index * LAY_OFS,
-				  LXCR_CLUTEN | LXCR_LEN, 0);
+		regmap_write_bits(ldev->regmap, LTDC_L1CR + layer_index * LAY_OFS, LXCR_MASK, 0);
 
 	/* disable IRQ */
 	regmap_clear_bits(ldev->regmap, LTDC_IER, IER_FUWIE | IER_FUEIE | IER_RRIE | IER_TERRIE);
@@ -1474,7 +1474,7 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 	if (newstate->rotation & DRM_MODE_REFLECT_X)
 		val |= LXCR_HMEN;
 
-	regmap_write_bits(ldev->regmap, LTDC_L1CR + lofs, LXCR_LEN | LXCR_CLUTEN | LXCR_HMEN, val);
+	regmap_write_bits(ldev->regmap, LTDC_L1CR + lofs, LXCR_MASK, val);
 
 	/* Commit shadow registers = update plane at next vblank */
 	if (ldev->caps.plane_reg_shadow)
@@ -1512,7 +1512,7 @@ static void ltdc_plane_atomic_disable(struct drm_plane *plane,
 	u32 lofs = plane->index * LAY_OFS;
 
 	/* Disable layer */
-	regmap_write_bits(ldev->regmap, LTDC_L1CR + lofs, LXCR_LEN | LXCR_CLUTEN |  LXCR_HMEN, 0);
+	regmap_write_bits(ldev->regmap, LTDC_L1CR + lofs, LXCR_MASK, 0);
 
 	/* Reset the layer transparency to hide any related background color */
 	regmap_write_bits(ldev->regmap, LTDC_L1CACR + lofs, LXCACR_CONSTA, 0x00);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
