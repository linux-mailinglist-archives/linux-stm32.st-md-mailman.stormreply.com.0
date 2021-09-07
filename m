Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD99402B74
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Sep 2021 17:13:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28C6BC59783;
	Tue,  7 Sep 2021 15:13:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF4BCC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Sep 2021 15:13:53 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1879PNEU017303;
 Tue, 7 Sep 2021 17:13:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=Iv5+A1gZyiPtQS8RJZjeMkNlMruLTCcjaPLS4K+dK1g=;
 b=xGjXVuFyIb2TwP9zPdq4r/UuB9gQ4uUkKgRKgnDEyNd7IaYBgz1MiuY2IP6b3oPTSShS
 je3ZUNB0hEvMVACiPowzUKhNbNDN2+Kfe8bNSPqWKWCXxxJytRLP/1M90rgSGe4tY7Lb
 fi2Ga2+EUnnW2teV9w2OCurTJ3M4JYXNKGPQt3WC6bnGyk4wWf9BilHsJlXgFFizxKqu
 f1zdL9CtO1Q+5HXLLFazrV/uQtm8v9PPQ6v+9blVY0LtAoeD7cKhyx15kByCUeYjUPjr
 mnTDy2DAcl/hyYiDlJpTOqmsaLP0yqFlVKMHgTtOozqwydZr2PglOVzDOXLobr3emsrl vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3awyx2ukqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 17:13:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EB04A10002A;
 Tue,  7 Sep 2021 17:13:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF39B22A6C6;
 Tue,  7 Sep 2021 17:13:41 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG1NODE3.st.com (10.75.127.3)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 7 Sep 2021 17:13:41
 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>
Date: Tue, 7 Sep 2021 17:13:23 +0200
Message-ID: <20210907151323.5850-1-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
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
Subject: [Linux-stm32] [PATCH v2] drm/stm: ltdc: attach immutable zpos
	property to planes
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

Defines plane ordering by hard-coding an immutable Z position from the
first plane, used as primary layer, to the next ones as overlay in order
of instantiation.

This zpos is only an information as it is not possible to modify it,
blending operations are still applied from the top to the bottom layer.

This patch helps to remove a warning message from the Android
Hardware Composer.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>
Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 195de30eb90c..bd603ef5e935 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1024,6 +1024,8 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
 		return -EINVAL;
 	}
 
+	drm_plane_create_zpos_immutable_property(primary, 0);
+
 	ret = drm_crtc_init_with_planes(ddev, crtc, primary, NULL,
 					&ltdc_crtc_funcs, NULL);
 	if (ret) {
@@ -1046,6 +1048,7 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
 			DRM_ERROR("Can not create overlay plane %d\n", i);
 			goto cleanup;
 		}
+		drm_plane_create_zpos_immutable_property(overlay, i);
 	}
 
 	return 0;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
