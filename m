Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA55F2B3BF
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 13:58:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0326C5B650
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 11:58:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40365C5B64F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2019 11:58:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4RBqHta004118; Mon, 27 May 2019 13:58:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=CHNiLECO7COJeJykJENYiJJ3vrh3cyTCAguGAsVnNK8=;
 b=tg2zDJoONVSJEtDceghChtbL1O2vw81Tyd4NdODekOXiJzVpk2S/HtQ51BLR+lPFK8W8
 1yEOdH+MMu7kjaFpNVrBCOonUMEH6uS1ZeLgYr2keJZlGnKfR530U17kWDkTRAgkfw7t
 i0YsN4zStVhAbPiDFefzLknaw3G1DbBwxiS/OetzihCaIraCIpmMwlvrZ07HkrdhKn/N
 uU26gPuiccaXbcCRq/+xxq152uiZYl63BJtp7ShiUtErfPXC7SIQ2gtegYyxmUL4bg5R
 HmYYjXp06iCTa5NzTp0+1bnjZ9aJWEJLgkf+PodDjij2fyY0S5NnhR9Y8CVLmbsFaN+j 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sptu9k0sp-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 27 May 2019 13:58:37 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4E78138;
 Mon, 27 May 2019 11:58:35 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2CF622A01;
 Mon, 27 May 2019 11:58:35 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 27 May
 2019 13:58:34 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 27 May 2019 13:58:34
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <yannick.fertre@st.com>, <philippe.cornu@st.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <alexandre.torgue@st.com>
Date: Mon, 27 May 2019 13:58:30 +0200
Message-ID: <20190527115830.15836-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-27_07:, , signatures=0
Cc: linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] drm/stm: ltdc: restore calls to
	clk_{enable/disable}
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

From: Benjamin Gaignard <benjamin.gaignard@linaro.org>

Restore calls to clk_{enable/disable} deleted after applying the wrong
version of the patch

Fixes: fd6905fca4f0 ("drm/stm: ltdc: remove clk_round_rate comment")

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
---
 drivers/gpu/drm/stm/ltdc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index ae2aaf2a62ee..ac29890edeb6 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -507,10 +507,12 @@ static bool ltdc_crtc_mode_fixup(struct drm_crtc *crtc,
 	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
 	int rate = mode->clock * 1000;
 
+	clk_disable(ldev->pixel_clk);
 	if (clk_set_rate(ldev->pixel_clk, rate) < 0) {
 		DRM_ERROR("Cannot set rate (%dHz) for pixel clk\n", rate);
 		return false;
 	}
+	clk_enable(ldev->pixel_clk);
 
 	adjusted_mode->clock = clk_get_rate(ldev->pixel_clk) / 1000;
 
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
