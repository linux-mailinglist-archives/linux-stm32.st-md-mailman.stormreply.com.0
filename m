Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DD82A6BBF
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Nov 2020 18:33:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D05CC36B36;
	Wed,  4 Nov 2020 17:33:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83D86C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Nov 2020 17:33:35 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A4HVs48031157; Wed, 4 Nov 2020 18:32:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=VlIPvqN556x6We0Z5ZCWHUxsDDwlLtSPq21CGa4llNs=;
 b=mIlVgtvw5OmMz+ApfFWBn1mFG5TCko/ok3n/f98M5TCZuVWlWSUk5oNZrLmvn3VwYbl8
 ZETDdWd8EOFf0i+Tcwa+PNrIOlZz50DQSbgQfcLGDozAfw43YKp9nvh65Tj+fUEsFX0b
 drOM1YCuEJZkb43MazgOlriNMs7IsXKZwCzyczEQ14R4e3GUgaS2+beArX2rNIy3tDwx
 N5npAUflBU+LdqeJitOI3wy+Xz4keUAhzBzTLDr7jAFFvFypxnjq7P7hrdJEcYjjPgOV
 hA5VU9+fEgVIQ9A8ZqH1ADfNtjAIzVkVxgrC8JxMDVecpgab4YsAEHSRhvCedo34luEW JQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34h00egtye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Nov 2020 18:32:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1BE06100034;
 Wed,  4 Nov 2020 18:32:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0F697225C2A;
 Wed,  4 Nov 2020 18:32:26 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG1NODE1.st.com (10.75.127.1)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Nov 2020 18:32:25
 +0100
From: Hugues Fruchet <hugues.fruchet@st.com>
To: Alexandre Torgue <alexandre.torgue@st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Rob Herring <robh+dt@kernel.org>
Date: Wed, 4 Nov 2020 18:32:09 +0100
Message-ID: <1604511132-4014-2-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604511132-4014-1-git-send-email-hugues.fruchet@st.com>
References: <1604511132-4014-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG1NODE1.st.com
 (10.75.127.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-04_12:2020-11-04,
 2020-11-04 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yannick Fertre <yannick.fertre@st.com>, Alain Volmat <alain.volmat@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v5 1/4] media: stm32-dcmi: add support of
	BT656 bus
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

Add support of BT656 embedded synchronization bus.
This mode allows to save hardware synchro lines hsync & vsync by replacing
them with synchro codes embedded in data stream.
This bus type is only compatible with 8 bits width data bus.
Due to reserved values 0x00 & 0xff used for synchro codes, valid data vary
from 0x1 to 0xfe, this is up to sensor to clip accordingly pixel data. As
a consequence of this clipping, JPEG is not supported with this bus type.
DCMI crop feature is also not available with this bus type.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 37 +++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index fd1c41c..7705683 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -157,6 +157,7 @@ struct stm32_dcmi {
 	struct vb2_queue		queue;
 
 	struct v4l2_fwnode_bus_parallel	bus;
+	enum v4l2_mbus_type		bus_type;
 	struct completion		complete;
 	struct clk			*mclk;
 	enum state			state;
@@ -777,6 +778,23 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (dcmi->bus.flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
 		val |= CR_PCKPOL;
 
+	/*
+	 * BT656 embedded synchronisation bus mode.
+	 *
+	 * Default SAV/EAV mode is supported here with default codes
+	 * SAV=0xff000080 & EAV=0xff00009d.
+	 * With DCMI this means LSC=SAV=0x80 & LEC=EAV=0x9d.
+	 */
+	if (dcmi->bus_type == V4L2_MBUS_BT656) {
+		val |= CR_ESS;
+
+		/* Unmask all codes */
+		reg_write(dcmi->regs, DCMI_ESUR, 0xffffffff);/* FEC:LEC:LSC:FSC */
+
+		/* Trig on LSC=0x80 & LEC=0x9d codes, ignore FSC and FEC */
+		reg_write(dcmi->regs, DCMI_ESCR, 0xff9d80ff);/* FEC:LEC:LSC:FSC */
+	}
+
 	reg_write(dcmi->regs, DCMI_CR, val);
 
 	/* Set crop */
@@ -1067,8 +1085,9 @@ static int dcmi_set_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f)
 	if (ret)
 		return ret;
 
-	/* Disable crop if JPEG is requested */
-	if (pix->pixelformat == V4L2_PIX_FMT_JPEG)
+	/* Disable crop if JPEG is requested or BT656 bus is selected */
+	if (pix->pixelformat == V4L2_PIX_FMT_JPEG &&
+	    dcmi->bus_type != V4L2_MBUS_BT656)
 		dcmi->do_crop = false;
 
 	/* pix to mbus format */
@@ -1592,6 +1611,11 @@ static int dcmi_formats_init(struct stm32_dcmi *dcmi)
 			if (dcmi_formats[i].mbus_code != mbus_code.code)
 				continue;
 
+			/* Exclude JPEG if BT656 bus is selected */
+			if (dcmi_formats[i].fourcc == V4L2_PIX_FMT_JPEG &&
+			    dcmi->bus_type == V4L2_MBUS_BT656)
+				continue;
+
 			/* Code supported, have we got this fourcc yet? */
 			for (j = 0; j < num_fmts; j++)
 				if (sd_fmts[j]->fourcc ==
@@ -1873,9 +1897,18 @@ static int dcmi_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "CSI bus not supported\n");
 		return -ENODEV;
 	}
+
+	if (ep.bus_type == V4L2_MBUS_BT656 &&
+	    ep.bus.parallel.bus_width != 8) {
+		dev_err(&pdev->dev, "BT656 bus conflicts with %u bits bus width (8 bits required)\n",
+			ep.bus.parallel.bus_width);
+		return -ENODEV;
+	}
+
 	dcmi->bus.flags = ep.bus.parallel.flags;
 	dcmi->bus.bus_width = ep.bus.parallel.bus_width;
 	dcmi->bus.data_shift = ep.bus.parallel.data_shift;
+	dcmi->bus_type = ep.bus_type;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq <= 0)
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
