Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6149704FF
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jul 2019 18:06:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0962FCD6211;
	Mon, 22 Jul 2019 16:06:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A6E4C064F7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 16:06:33 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6MG64sW016167; Mon, 22 Jul 2019 18:06:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=lMBXVdaWkpNK3eb/f1Th8IHqOU36gvkUYQ/xuGtXNQw=;
 b=LYkqkqea4BV4nkzQeT228vwRbHjFV7f7OhZhrHLXcGZtjQBUSO1GhqJWLzIVq9deWRh6
 e6b/FOCAu+HXpEBNsu4fU/Uxm8vmHwOSbqqlVY9WxcmOYaOAAIr/cNrkbi5c4iXL56UG
 gggeeJO4mxPS+kLnuKhJHiw6RpHtUyUvfasNUSZXTUf0K10bE5M5iIck+TGekRyZkWrK
 dJ3ACuS/2RfXP53EgcretzJ+9/PWgoGBkVkhCzDUpXOmgxnVD6CNbZvOUJyquRAYF7tp
 hcKTeBYuA6L3tWPpISLXPDiQvONw7p3zICdlD1/uqUsNvkPKMF8D4fOVmE/Uq8icBd6D iA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ture1chdv-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 22 Jul 2019 18:06:06 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F053831;
 Mon, 22 Jul 2019 16:06:05 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D3D6F52BB;
 Mon, 22 Jul 2019 16:06:05 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 22 Jul
 2019 18:06:05 +0200
Received: from localhost (10.201.23.16) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 22 Jul 2019 18:06:05
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
Date: Mon, 22 Jul 2019 18:06:00 +0200
Message-ID: <1563811560-29589-4-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563811560-29589-1-git-send-email-olivier.moysan@st.com>
References: <1563811560-29589-1-git-send-email-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-22_12:, , signatures=0
Subject: [Linux-stm32] [PATCH v2 3/3] drm/bridge: sii902x: make audio mclk
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

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Reviewed-by: Jyri Sarha <jsarha@ti.com>
Acked-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 962931c20efe..a323815aa9b6 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -568,13 +568,14 @@ static int sii902x_audio_hw_params(struct device *dev, void *data,
 		return ret;
 	}
 
-	mclk_rate = clk_get_rate(sii902x->audio.mclk);
-
-	ret = sii902x_select_mclk_div(&i2s_config_reg, params->sample_rate,
-				      mclk_rate);
-	if (mclk_rate != ret * params->sample_rate)
-		dev_dbg(dev, "Inaccurate reference clock (%ld/%d != %u)\n",
-			mclk_rate, ret, params->sample_rate);
+	if (sii902x->audio.mclk) {
+		mclk_rate = clk_get_rate(sii902x->audio.mclk);
+		ret = sii902x_select_mclk_div(&i2s_config_reg,
+					      params->sample_rate, mclk_rate);
+		if (mclk_rate != ret * params->sample_rate)
+			dev_dbg(dev, "Inaccurate reference clock (%ld/%d != %u)\n",
+				mclk_rate, ret, params->sample_rate);
+	}
 
 	mutex_lock(&sii902x->mutex);
 
@@ -751,11 +752,11 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
 		sii902x->audio.i2s_fifo_sequence[i] |= audio_fifo_id[i] |
 			i2s_lane_id[lanes[i]] |	SII902X_TPI_I2S_FIFO_ENABLE;
 
-	sii902x->audio.mclk = devm_clk_get(dev, "mclk");
+	sii902x->audio.mclk = devm_clk_get_optional(dev, "mclk");
 	if (IS_ERR(sii902x->audio.mclk)) {
 		dev_err(dev, "%s: No clock (audio mclk) found: %ld\n",
 			__func__, PTR_ERR(sii902x->audio.mclk));
-		return 0;
+		return PTR_ERR(sii902x->audio.mclk);
 	}
 
 	sii902x->audio.pdev = platform_device_register_data(
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
