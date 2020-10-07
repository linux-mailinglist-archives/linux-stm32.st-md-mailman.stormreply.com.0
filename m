Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87471285DDB
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Oct 2020 13:10:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44288C32EA8;
	Wed,  7 Oct 2020 11:10:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17522C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 11:10:52 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097B2HHO022041; Wed, 7 Oct 2020 13:10:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=tCCh6QJ69c9mdC8PCEmk9ihoBbtQNtpxtgVQ37a6uNw=;
 b=ThIrPxwO2/vAfLbS7FqoKQvlnwH0E8Mo88K/wmYbu4tZSDAdW1KHs6R8YhILd4k6g93A
 sVvvd7bnnB1Uf2PPXy2oZYbEytVFr2XjAsNcO2CTZzrp4x9xgj7W4q87b5jE2GOVdMge
 FFR1Dx/GCDWxdDo46kbKeyAtbTlJ6O+QPYK30z/3lcgrupQXzGHHWe5bAumQ0Gj77rXp
 B8r3ws102UjrtkeQ20QFYT1R1jJqus9bO7SBDluEabzAZ5Co5pavI2W8MEyiOKAUiuLb
 +P88+mMhy5gmc0DehuY1Oe2zONoNuMvZ0IVrcr1c5dcLdYO8uekI3ERuaiNeR8mD80OP eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3402tjv4fk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 13:10:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9C28E10002A;
 Wed,  7 Oct 2020 13:10:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8832E21FEAB;
 Wed,  7 Oct 2020 13:10:42 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG1NODE1.st.com (10.75.127.1)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Oct 2020 13:10:42
 +0200
From: Hugues Fruchet <hugues.fruchet@st.com>
To: Steve Longerbeam <slongerbeam@gmail.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo@jmondi.org>, Hans
 Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Wed, 7 Oct 2020 13:09:59 +0200
Message-ID: <1602068999-32041-1-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG1NODE1.st.com
 (10.75.127.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_08:2020-10-06,
 2020-10-07 signatures=0
Cc: Alain Volmat <alain.volmat@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH] media: ov5640: add support of 160x120
	resolution
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

Add support of 160x120 resolution.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 drivers/media/i2c/ov5640.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 8d0254d..df348dc 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -98,7 +98,8 @@
 #define OV5640_REG_AVG_READOUT		0x56a1
 
 enum ov5640_mode_id {
-	OV5640_MODE_QCIF_176_144 = 0,
+	OV5640_MODE_QQVGA_160_120 = 0,
+	OV5640_MODE_QCIF_176_144,
 	OV5640_MODE_QVGA_320_240,
 	OV5640_MODE_VGA_640_480,
 	OV5640_MODE_NTSC_720_480,
@@ -416,6 +417,24 @@ static const struct reg_value ov5640_setting_QVGA_320_240[] = {
 	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
 };
 
+static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
+	{0x3c07, 0x08, 0, 0},
+	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
+	{0x3814, 0x31, 0, 0},
+	{0x3815, 0x31, 0, 0}, {0x3800, 0x00, 0, 0}, {0x3801, 0x00, 0, 0},
+	{0x3802, 0x00, 0, 0}, {0x3803, 0x04, 0, 0}, {0x3804, 0x0a, 0, 0},
+	{0x3805, 0x3f, 0, 0}, {0x3806, 0x07, 0, 0}, {0x3807, 0x9b, 0, 0},
+	{0x3810, 0x00, 0, 0},
+	{0x3811, 0x10, 0, 0}, {0x3812, 0x00, 0, 0}, {0x3813, 0x06, 0, 0},
+	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
+	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
+	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
+	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
+	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
+	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
+	{0x4407, 0x04, 0, 0}, {0x5001, 0xa3, 0, 0},
+};
+
 static const struct reg_value ov5640_setting_QCIF_176_144[] = {
 	{0x3c07, 0x08, 0, 0},
 	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
@@ -552,6 +571,10 @@ static const struct ov5640_mode_info ov5640_mode_init_data = {
 
 static const struct ov5640_mode_info
 ov5640_mode_data[OV5640_NUM_MODES] = {
+	{OV5640_MODE_QQVGA_160_120, SUBSAMPLING,
+	 160, 1896, 120, 984,
+	 ov5640_setting_QCIF_176_144,
+	 ARRAY_SIZE(ov5640_setting_QCIF_176_144)},
 	{OV5640_MODE_QCIF_176_144, SUBSAMPLING,
 	 176, 1896, 144, 984,
 	 ov5640_setting_QCIF_176_144,
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
