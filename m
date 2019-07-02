Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D1F5D353
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jul 2019 17:48:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AAFAC6FAD1
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jul 2019 15:48:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D39F0C6FAC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jul 2019 15:48:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x62Fl4xI003868; Tue, 2 Jul 2019 17:47:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=QNrE+/1IDPSo8HmO50ipNpLfEJf8OZLuIag97CDeCZo=;
 b=DbtBWM33Xxy7Hydeg0QFgBwYitsXMTubI8ucCw89x9WjLZKbnFZ7mbxtsOSgVyluo704
 iAvWpy9uq+IUaOofmgMPubkhXIr5hsx2Gfg+X5DEVnVwYksp+gMSDZ2thmY8kEt8KKi9
 B80z/cp3KOnEq+aZojPcI08t4Lv6LaPS+XLPCN1cB9iAlUryEiG/YiLURp5Fu9vV2Mia
 Rm0cndJf6JKuSaWreaFHHR3Tk4pNhE4N0kHG4X4UjGIP9/06qjHnahTv35+yCf93rkdV
 iQZtQzqMiBOALxeSSAymLgHI2mTm5b5vB4wyIZdaY6sd2Sgf3VF6EsN1uWQcwzLP7wg0 Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tdw49wfwm-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 02 Jul 2019 17:47:42 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3F9C331;
 Tue,  2 Jul 2019 15:47:41 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0A148487E;
 Tue,  2 Jul 2019 15:47:41 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 2 Jul 2019
 17:47:41 +0200
Received: from localhost (10.201.23.16) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 2 Jul 2019 17:47:40
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@siol.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@st.com>, <alexandre.torgue@st.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <olivier.moysan@st.com>,
 <jsarha@ti.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>
Date: Tue, 2 Jul 2019 17:47:06 +0200
Message-ID: <1562082426-14876-4-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
References: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-02_08:, , signatures=0
Subject: [Linux-stm32] [PATCH 3/3] drm/bridge: sii902x: make audio mclk
	optional
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

The master clock on i2s bus is not mandatory,
as sii902X internal PLL can be used instead.
Make use of mclk optional.

Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 36acc256e67e..a08bd9fdc046 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -562,19 +562,21 @@ static int sii902x_audio_hw_params(struct device *dev, void *data,
 		}
 	}
 
-	ret = clk_prepare_enable(sii902x->audio.mclk);
-	if (ret) {
-		dev_err(dev, "Enabling mclk failed: %d\n", ret);
-		return ret;
-	}
+	if (sii902x->audio.mclk) {
+		ret = clk_prepare_enable(sii902x->audio.mclk);
+		if (ret) {
+			dev_err(dev, "Enabling mclk failed: %d\n", ret);
+			return ret;
+		}
 
-	mclk_rate = clk_get_rate(sii902x->audio.mclk);
+		mclk_rate = clk_get_rate(sii902x->audio.mclk);
 
-	ret = sii902x_select_mclk_div(&i2s_config_reg, params->sample_rate,
-				      mclk_rate);
-	if (mclk_rate != ret * params->sample_rate)
-		dev_dbg(dev, "Inaccurate reference clock (%ld/%d != %u)\n",
-			mclk_rate, ret, params->sample_rate);
+		ret = sii902x_select_mclk_div(&i2s_config_reg,
+					      params->sample_rate, mclk_rate);
+		if (mclk_rate != ret * params->sample_rate)
+			dev_dbg(dev, "Inaccurate reference clock (%ld/%d != %u)\n",
+				mclk_rate, ret, params->sample_rate);
+	}
 
 	mutex_lock(&sii902x->mutex);
 
@@ -640,7 +642,8 @@ static int sii902x_audio_hw_params(struct device *dev, void *data,
 	mutex_unlock(&sii902x->mutex);
 
 	if (ret) {
-		clk_disable_unprepare(sii902x->audio.mclk);
+		if (sii902x->audio.mclk)
+			clk_disable_unprepare(sii902x->audio.mclk);
 		dev_err(dev, "%s: hdmi audio enable failed: %d\n", __func__,
 			ret);
 	}
@@ -659,7 +662,8 @@ static void sii902x_audio_shutdown(struct device *dev, void *data)
 
 	mutex_unlock(&sii902x->mutex);
 
-	clk_disable_unprepare(sii902x->audio.mclk);
+	if (sii902x->audio.mclk)
+		clk_disable_unprepare(sii902x->audio.mclk);
 }
 
 int sii902x_audio_digital_mute(struct device *dev, void *data, bool enable)
@@ -752,9 +756,12 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
 
 	sii902x->audio.mclk = devm_clk_get(dev, "mclk");
 	if (IS_ERR(sii902x->audio.mclk)) {
-		dev_err(dev, "%s: No clock (audio mclk) found: %ld\n",
-			__func__, PTR_ERR(sii902x->audio.mclk));
-		return 0;
+		if (PTR_ERR(sii902x->audio.mclk) != -ENOENT) {
+			dev_err(dev, "%s: No clock (audio mclk) found: %ld\n",
+				__func__, PTR_ERR(sii902x->audio.mclk));
+			return PTR_ERR(sii902x->audio.mclk);
+		}
+		sii902x->audio.mclk = NULL;
 	}
 
 	sii902x->audio.pdev = platform_device_register_data(
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
