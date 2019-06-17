Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 443854846C
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2019 15:48:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00BB8C63A9F
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2019 13:48:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5CEDC030CE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2019 13:48:18 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5HDl7pi016304; Mon, 17 Jun 2019 15:48:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=eDS3m1/m7cQMnSvZloZA/F19hsKM8dODl3Z92+tcBNk=;
 b=d0CLqQV4e+zGqNoZ8KalFebH//QzXeAT7umMxlcHAhMXcQ2Xq4RazbqjcLQDFzQJmC2i
 ohL8wqImBXqQmwg0p2HRNR/dRR3GA92v5G8a21VmdS7wKOB1Ony3r1dDOH33nnZg50w2
 ZRY1NbOMI7MfLZbxH0b13Iv5ZqpzI8uLsY6sWibDbc4/puUHkmj5QDABmG3hYa+ntfQQ
 lCgjHD/NfP1KjJkdwyea21tbsPn/QnzR/vbB6NH59Vip4mcDniWUcXE19S1HzpD0Emjc
 0JM7bV3Ig7dqAWUY2XEChqcrK2cVEi7XjruNPJdKZlLNNK+g/K86D2C0KXb7OFcWgjv+ tQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t68n3h00v-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 17 Jun 2019 15:48:12 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 826D531;
 Mon, 17 Jun 2019 13:48:11 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1829A2B47;
 Mon, 17 Jun 2019 13:48:11 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Jun
 2019 15:48:10 +0200
Received: from localhost (10.201.23.19) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Jun 2019 15:48:10
 +0200
From: Hugues Fruchet <hugues.fruchet@st.com>
To: Steve Longerbeam <slongerbeam@gmail.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
Date: Mon, 17 Jun 2019 15:47:57 +0200
Message-ID: <1560779277-32465-1-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.19]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_06:, , signatures=0
Cc: Jacopo Mondi <jacopo@jmondi.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Hugues Fruchet <hugues.fruchet@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH] media: ov5640: add support of
	V4L2_CID_LINK_FREQ
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

Add support of V4L2_CID_LINK_FREQ, this is needed
by some CSI-2 receivers.

384MHz is exposed for the time being, corresponding
to 96MHz pixel clock with 2 bytes per pixel on 2 data lanes.

This setup has been tested successfully with ST MIPID02
CSI-2 to parallel bridge.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 drivers/media/i2c/ov5640.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 82d4ce9..79f8383 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -218,6 +218,7 @@ struct ov5640_ctrls {
 	struct v4l2_ctrl *test_pattern;
 	struct v4l2_ctrl *hflip;
 	struct v4l2_ctrl *vflip;
+	struct v4l2_ctrl *link_freq;
 };
 
 struct ov5640_dev {
@@ -2198,6 +2199,10 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static const s64 link_freq_menu_items[] = {
+	384000000,
+};
+
 static int ov5640_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_pad_config *cfg,
 			  struct v4l2_subdev_format *format)
@@ -2703,6 +2708,11 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 				       V4L2_CID_POWER_LINE_FREQUENCY_AUTO, 0,
 				       V4L2_CID_POWER_LINE_FREQUENCY_50HZ);
 
+	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
+						  0, 0, link_freq_menu_items);
+	if (ctrls->link_freq)
+		ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	if (hdl->error) {
 		ret = hdl->error;
 		goto free_ctrls;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
