Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8A628617F
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Oct 2020 16:46:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78C57C32EA8;
	Wed,  7 Oct 2020 14:46:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39F70C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 14:46:38 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097EbrKx011378; Wed, 7 Oct 2020 16:46:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=xtHuYU7RyxhKMSekYokUpepTS+x6mnkCtOrrV18E1w8=;
 b=uOg/tjZozo0U1j4keiC4UW2RGjGXVWiCK05mh5vIiNtXum/MQo5Gea407Be4xNRJ062T
 aPXlX5KtPXf3lZ03mFteiAxeN3ySlFR3ZnVzegk9EMbwlCs6T411NTjzjROE3ZSGlxaz
 PCUiAQELgZkDbqgdwb/866+GXVw3QMfAn2G2fjhYM1UvuhNEV5LOION0eENebf5e0C7N
 wsregzU+O7qWuDteZ/0MjJgxH5Mn9b18YQvuJtjPoBlsnPnVGxfqP/Aqg/GM9kpVPSdb
 GQHCp3itdxwGLxSD8TLTC0Acf8bbmGENxfKZNjCbiTxHlM9LU/2ZCyFRpo2CvLUux4Ur Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3402tk5ewh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 16:46:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 15ABB10002A;
 Wed,  7 Oct 2020 16:46:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B55792B4D24;
 Wed,  7 Oct 2020 16:46:16 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG1NODE1.st.com (10.75.127.1)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Oct 2020 16:46:16
 +0200
From: Hugues Fruchet <hugues.fruchet@st.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jacopo Mondi
 <jacopo@jmondi.org>, Steve Longerbeam <slongerbeam@gmail.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Date: Wed, 7 Oct 2020 16:43:17 +0200
Message-ID: <1602081798-17548-1-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG1NODE1.st.com
 (10.75.127.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_09:2020-10-06,
 2020-10-07 signatures=0
Cc: Alain Volmat <alain.volmat@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH] media: ov5640: fix MIPI power sequence
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

fixes: b1751ae652fb ("media: i2c: ov5640: Separate out mipi configuration from s_power")

Fix ov5640_write_reg()return value unchecked at power off.
Reformat code to keep register access below the register description.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 drivers/media/i2c/ov5640.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 8d0254d..f34e62e 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -1940,14 +1940,6 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
 {
 	int ret;
 
-	if (!on) {
-		/* Reset MIPI bus settings to their default values. */
-		ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x58);
-		ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00, 0x04);
-		ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00, 0x00);
-		return 0;
-	}
-
 	/*
 	 * Power up MIPI HS Tx and LS Rx; 2 data lanes mode
 	 *
@@ -1958,7 +1950,8 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
 	 * [3] = 0	: Power up MIPI LS Rx
 	 * [2] = 0	: MIPI interface disabled
 	 */
-	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x40);
+	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00,
+			       on ? 0x40 : 0x58);
 	if (ret)
 		return ret;
 
@@ -1969,7 +1962,8 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
 	 * [5] = 1	: Gate clock when 'no packets'
 	 * [2] = 1	: MIPI bus in LP11 when 'no packets'
 	 */
-	ret = ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00, 0x24);
+	ret = ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00,
+			       on ? 0x24 : 0x04);
 	if (ret)
 		return ret;
 
@@ -1981,7 +1975,8 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
 	 * [5] = 1	: MIPI data lane 1 in LP11 when 'sleeping'
 	 * [4] = 1	: MIPI clock lane in LP11 when 'sleeping'
 	 */
-	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00, 0x70);
+	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00,
+			       on ? 0x70 : 0x00);
 	if (ret)
 		return ret;
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
