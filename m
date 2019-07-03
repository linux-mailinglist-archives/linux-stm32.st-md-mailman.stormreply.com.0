Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AF35DF44
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2019 10:04:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBE82C995D0
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2019 08:04:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C300DC995CE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2019 08:04:40 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x637rQ6P011005; Wed, 3 Jul 2019 10:04:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Me2aIVtHkOwy84/SxLI2Xnts7qdQwbxVRhp1y4JNm4U=;
 b=xszA75fYJmgBnFtufF/fyMNT8ZY1A4LbSlEKstxr/xjye2iA6Hm+/HSoVN5izM6WFILS
 Fl690awtgTlr3w7LOAlH0Nt6/VDHHIZhyJQ3ICqlhhRjhnttP0dRV+OxNYmu+1avUHRY
 yHxolqUTOGod5kvDpxoYE6qrMnTwGYnk1jnypkgP1bFOiJqW8gxZADRSwSRBNStFteup
 QQPNg0N9J7J1DmGe4sITKKibHagNPzfX0n/E7y9c/iyPLMQNiogQ1QEhS24XPidLgE/X
 b7wPl7nKOj2vjB0g3kKUXOURArS5DX4OXQMu5xQTulab/e6J76r+MElhnp6rbKagEQTW nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tdw4a28d7-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 03 Jul 2019 10:04:19 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0858641;
 Wed,  3 Jul 2019 08:04:15 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AA7E0169F;
 Wed,  3 Jul 2019 08:04:15 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 3 Jul 2019
 10:04:15 +0200
Received: from localhost (10.201.23.16) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 3 Jul 2019 10:04:14
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@siol.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@st.com>, <alexandre.torgue@st.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <olivier.moysan@st.com>,
 <jsarha@ti.com>
Date: Wed, 3 Jul 2019 10:04:12 +0200
Message-ID: <1562141052-26221-1-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-03_02:, , signatures=0
Subject: [Linux-stm32] [PATCH] drm/bridge: sii902x: add audio graph card
	support
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

Implement get_dai_id callback of audio HDMI codec
to support ASoC audio graph card.
HDMI audio output has to be connected to sii902x port 3.
get_dai_id callback maps this port to ASoC DAI index 0.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index dd7aa466b280..daf9ef3cd817 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -158,6 +158,8 @@
 
 #define SII902X_I2C_BUS_ACQUISITION_TIMEOUT_MS	500
 
+#define SII902X_AUDIO_PORT_INDEX		3
+
 struct sii902x {
 	struct i2c_client *i2c;
 	struct regmap *regmap;
@@ -690,11 +692,32 @@ static int sii902x_audio_get_eld(struct device *dev, void *data,
 	return 0;
 }
 
+static int sii902x_audio_get_dai_id(struct snd_soc_component *component,
+				    struct device_node *endpoint)
+{
+	struct of_endpoint of_ep;
+	int ret;
+
+	ret = of_graph_parse_endpoint(endpoint, &of_ep);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * HDMI sound should be located at reg = <3>
+	 * Return expected DAI index 0.
+	 */
+	if (of_ep.port == SII902X_AUDIO_PORT_INDEX)
+		return 0;
+
+	return -EINVAL;
+}
+
 static const struct hdmi_codec_ops sii902x_audio_codec_ops = {
 	.hw_params = sii902x_audio_hw_params,
 	.audio_shutdown = sii902x_audio_shutdown,
 	.digital_mute = sii902x_audio_digital_mute,
 	.get_eld = sii902x_audio_get_eld,
+	.get_dai_id = sii902x_audio_get_dai_id,
 };
 
 static int sii902x_audio_codec_init(struct sii902x *sii902x,
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
