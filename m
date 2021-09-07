Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A14402B6D
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Sep 2021 17:12:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C781C59783;
	Tue,  7 Sep 2021 15:12:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AE2DC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Sep 2021 15:12:44 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1879S9ZU017290;
 Tue, 7 Sep 2021 17:12:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=FV8kEVLg/Vi+EHiXTOJ0oqLPW8UKHNrpUZpZ65FIOfY=;
 b=0tHECFJYPd2z/U55tPxW6Oyi1HCkMSOtM9ZzWDZyF7Xz1kki8wLnt4R6JZTDbo6lpaD/
 JpfPvLrbUMflQNG28MdTXxR4Gu80xxQ6UrmzLvosguTXXiH4kmf0WOdbl44HDM+QIMh8
 PaRhcYCMFzicRcN7zCnXwMQf/wLiv3+xtWGuhh6NKIc03Iyh3E6XsrlkGGEHD+q5nB9d
 YO3/Lrn071/VFmgdB2y3fvcsAfQaR7cMMYhKldEma0U7C3fwXnsdWY6XQcybQnQPVLDI
 rjLRCA0PnK/rIFKJM5rLbNcwit0IBFb6MwuxeByKJ3Q8Ro6ALkq1xiJ7WxYFlmwq8TAk Xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3awyx2ukhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 17:12:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 00E8910002A;
 Tue,  7 Sep 2021 17:12:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D8769229A9F;
 Tue,  7 Sep 2021 17:12:24 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG1NODE3.st.com (10.75.127.3)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 7 Sep 2021 17:12:24
 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>
Date: Tue, 7 Sep 2021 17:12:09 +0200
Message-ID: <20210907151209.5716-1-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_05,2021-09-07_01,2020-04-07_01
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Raphael Gallais-Pou <raphael.gallais-pou@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] drm/stm: ltdc: add layer alpha support
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

Android Hardware Composer supports alpha values applied to layers.
Enabling non-opaque layers for the STM CRTC could help offload GPU
resources for screen composition.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 195de30eb90c..e0fef8bacfa8 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -845,7 +845,7 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 			LXCFBLR_CFBLL | LXCFBLR_CFBP, val);
 
 	/* Specifies the constant alpha value */
-	val = CONSTA_MAX;
+	val = newstate->alpha >> 8;
 	reg_update_bits(ldev->regs, LTDC_L1CACR + lofs, LXCACR_CONSTA, val);
 
 	/* Specifies the blending factors */
@@ -997,6 +997,8 @@ static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
 
 	drm_plane_helper_add(plane, &ltdc_plane_helper_funcs);
 
+	drm_plane_create_alpha_property(plane);
+
 	DRM_DEBUG_DRIVER("plane:%d created\n", plane->base.id);
 
 	return plane;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
