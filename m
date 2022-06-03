Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E20F653CCF7
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Jun 2022 18:11:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F6E9C03FD3;
	Fri,  3 Jun 2022 16:11:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89F9EC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jun 2022 16:11:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 253FxgaG013164;
 Fri, 3 Jun 2022 18:11:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=swZKnhLeniKaudWCODTm1DOOGpfcmwbajnD5DQY1Gpw=;
 b=NJCPBz2qUO4N3RvJlueXl5bM02lfKdpvfkcOTuCnnoBLcW6Odh/1WhevCOGFDZQa4Ti7
 lbLlsEtNCsYySx98t7NTY8AHjHRw+YF/xKSHn+7PDHygpfjaLhesxEl0MUEPTT8fSv5I
 3gLR6YFXxE+6aQoMWt31FUDshug8J8lGuQAw0PZFAYAEn+q0ogKyxedjG6fCuk5cRBax
 MPkzzOgDPqhA+t9Kyc71ZpODj2fZcn3p0SoO4VgOot3EcwSruXuD/aqUIqoK2hENJRPj
 smZiAgBn4PVHi6sUHu+3+NFNLMYJLr9igv32kYlLGfwZv1a5pKmMaoDucy9jJfAUT6Sd 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gespq8tbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jun 2022 18:11:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2C0FD1000F3;
 Fri,  3 Jun 2022 15:45:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 084F92278AB;
 Fri,  3 Jun 2022 15:45:05 +0200 (CEST)
Received: from localhost (10.75.127.51) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 3 Jun
 2022 15:45:04 +0200
From: Yannick Fertre <yannick.fertre@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 3 Jun 2022 15:44:59 +0200
Message-ID: <20220603134459.593379-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-03_05,2022-06-03_01,2022-02-23_01
Subject: [Linux-stm32] [PATCH] drm/stm: ltdc: add support of the dynamic
	z-order
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

Zpos property is immutable for all hardware versions except the last
version (0x40100) which support the blending order feature
(dynamic z-order).

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 drivers/gpu/drm/stm/drv.c  |  1 +
 drivers/gpu/drm/stm/ltdc.c | 23 ++++++++++++++++++++---
 drivers/gpu/drm/stm/ltdc.h |  1 +
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index 0da7cce2a1a2..c63945dc2260 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -95,6 +95,7 @@ static int drv_load(struct drm_device *ddev)
 	ddev->mode_config.max_width = STM_MAX_FB_WIDTH;
 	ddev->mode_config.max_height = STM_MAX_FB_HEIGHT;
 	ddev->mode_config.funcs = &drv_mode_config_funcs;
+	ddev->mode_config.normalize_zpos = true;
 
 	ret = ltdc_load(ddev);
 	if (ret)
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 6a9f613839b5..00a6bc1b1d7c 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -194,6 +194,7 @@
 
 #define LXBFCR_BF2	GENMASK(2, 0)	/* Blending Factor 2 */
 #define LXBFCR_BF1	GENMASK(10, 8)	/* Blending Factor 1 */
+#define LXBFCR_BOR	GENMASK(18, 16) /* Blending ORder */
 
 #define LXCFBLR_CFBLL	GENMASK(12, 0)	/* Color Frame Buffer Line Length */
 #define LXCFBLR_CFBP	GENMASK(28, 16)	/* Color Frame Buffer Pitch in bytes */
@@ -1309,7 +1310,14 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 	    plane->type != DRM_PLANE_TYPE_PRIMARY)
 		val = BF1_PAXCA | BF2_1PAXCA;
 
-	regmap_write_bits(ldev->regmap, LTDC_L1BFCR + lofs, LXBFCR_BF2 | LXBFCR_BF1, val);
+	if (ldev->caps.dynamic_zorder) {
+		val |= (newstate->normalized_zpos << 16);
+		regmap_write_bits(ldev->regmap, LTDC_L1BFCR + lofs,
+				  LXBFCR_BF2 | LXBFCR_BF1 | LXBFCR_BOR, val);
+	} else {
+		regmap_write_bits(ldev->regmap, LTDC_L1BFCR + lofs,
+				  LXBFCR_BF2 | LXBFCR_BF1, val);
+	}
 
 	/* Configures the frame buffer line number */
 	line_number = y1 - y0 + 1;
@@ -1578,7 +1586,10 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
 		return -EINVAL;
 	}
 
-	drm_plane_create_zpos_immutable_property(primary, 0);
+	if (ldev->caps.dynamic_zorder)
+		drm_plane_create_zpos_property(primary, 0, 0, ldev->caps.nb_layers - 1);
+	else
+		drm_plane_create_zpos_immutable_property(primary, 0);
 
 	/* Init CRTC according to its hardware features */
 	if (ldev->caps.crc)
@@ -1607,7 +1618,10 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
 			DRM_ERROR("Can not create overlay plane %d\n", i);
 			goto cleanup;
 		}
-		drm_plane_create_zpos_immutable_property(overlay, i);
+		if (ldev->caps.dynamic_zorder)
+			drm_plane_create_zpos_property(overlay, i, 0, ldev->caps.nb_layers - 1);
+		else
+			drm_plane_create_zpos_immutable_property(overlay, i);
 	}
 
 	return 0;
@@ -1737,6 +1751,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
 		ldev->caps.ycbcr_output = false;
 		ldev->caps.plane_reg_shadow = false;
 		ldev->caps.crc = false;
+		ldev->caps.dynamic_zorder = false;
 		break;
 	case HWVER_20101:
 		ldev->caps.layer_ofs = LAY_OFS_0;
@@ -1752,6 +1767,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
 		ldev->caps.ycbcr_output = false;
 		ldev->caps.plane_reg_shadow = false;
 		ldev->caps.crc = false;
+		ldev->caps.dynamic_zorder = false;
 		break;
 	case HWVER_40100:
 		ldev->caps.layer_ofs = LAY_OFS_1;
@@ -1767,6 +1783,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
 		ldev->caps.ycbcr_output = true;
 		ldev->caps.plane_reg_shadow = true;
 		ldev->caps.crc = true;
+		ldev->caps.dynamic_zorder = true;
 		break;
 	default:
 		return -ENODEV;
diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
index 59fc5d1bbbab..4855898bd4c0 100644
--- a/drivers/gpu/drm/stm/ltdc.h
+++ b/drivers/gpu/drm/stm/ltdc.h
@@ -28,6 +28,7 @@ struct ltdc_caps {
 	bool ycbcr_output;	/* ycbcr output converter supported */
 	bool plane_reg_shadow;	/* plane shadow registers ability */
 	bool crc;		/* cyclic redundancy check supported */
+	bool dynamic_zorder;	/* dynamic z-order */
 };
 
 #define LTDC_MAX_LAYER	4
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
