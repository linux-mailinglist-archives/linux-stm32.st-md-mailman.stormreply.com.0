Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2839EE28C
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Dec 2024 10:20:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63A6BC78F63;
	Thu, 12 Dec 2024 09:20:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CF0BC7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2024 09:20:27 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC6nprT020794;
 Thu, 12 Dec 2024 10:20:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 pKHWtr7CObu7BlBwgtuANHPjX1WTy8471GU17YfD5dk=; b=rACcgzmyWHpsfa0b
 wlNxREBv+bF6wAHmmjiTU0MNWzSrPuYhyOJ6Ui37SGIXYCM7+FaPt9WrY7qVRqxo
 kdqbgwKWY58ciWBmzYLMu8xvgm90lr00h6UImsj2PyRKKD6ewqgEBBpGZASNT8f6
 J2hV681NUUosrEo8YEkDJJwGyKa1fslDpQVp/wTm6fF9trmheCaWLrfI55C6wwLB
 S3qR28gWqhjTPDfJsNEkMQpHOx3e0rsOaeO+AT5CKpp697tuSS7OBh6kXfK2OK8e
 1poX8V1BfgfXOyUVl0i5rlMOSryKMYwyQpmguZw8S955ttiNQX+XCe3wg2ikEyuB
 osVsNA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ccnmf789-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2024 10:20:15 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A3A7240049;
 Thu, 12 Dec 2024 10:18:58 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E951F2576EE;
 Thu, 12 Dec 2024 10:18:07 +0100 (CET)
Received: from localhost (10.129.178.65) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Dec
 2024 10:18:07 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 12 Dec 2024 10:17:32 +0100
MIME-Version: 1.0
Message-ID: <20241212-csi_dcmipp_mp25-v4-8-fbeb55a05ed7@foss.st.com>
References: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
In-Reply-To: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, Hans
 Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.1
X-Originating-IP: [10.129.178.65]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v4 08/15] media: stm32: dcmipp: add bayer
 10~14 bits formats
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

Add support for bayer formats from 10 to 14 bits.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c    | 12 ++++++++++++
 .../media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c   | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 209693e8296e..6596902a1760 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -65,6 +65,18 @@ static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_pix_map_list[] = {
 	PIXMAP_MBUS_PFMT(SGBRG8_1X8, SGBRG8),
 	PIXMAP_MBUS_PFMT(SGRBG8_1X8, SGRBG8),
 	PIXMAP_MBUS_PFMT(SRGGB8_1X8, SRGGB8),
+	PIXMAP_MBUS_PFMT(SBGGR10_1X10, SBGGR10),
+	PIXMAP_MBUS_PFMT(SGBRG10_1X10, SGBRG10),
+	PIXMAP_MBUS_PFMT(SGRBG10_1X10, SGRBG10),
+	PIXMAP_MBUS_PFMT(SRGGB10_1X10, SRGGB10),
+	PIXMAP_MBUS_PFMT(SBGGR12_1X12, SBGGR12),
+	PIXMAP_MBUS_PFMT(SGBRG12_1X12, SGBRG12),
+	PIXMAP_MBUS_PFMT(SGRBG12_1X12, SGRBG12),
+	PIXMAP_MBUS_PFMT(SRGGB12_1X12, SRGGB12),
+	PIXMAP_MBUS_PFMT(SBGGR14_1X14, SBGGR14),
+	PIXMAP_MBUS_PFMT(SGBRG14_1X14, SGBRG14),
+	PIXMAP_MBUS_PFMT(SGRBG14_1X14, SGRBG14),
+	PIXMAP_MBUS_PFMT(SRGGB14_1X14, SRGGB14),
 	PIXMAP_MBUS_PFMT(JPEG_1X8, JPEG),
 };
 
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index a19c8235af56..72f1bb4c64ad 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -57,6 +57,18 @@ static const struct dcmipp_byteproc_pix_map dcmipp_byteproc_pix_map_list[] = {
 	PIXMAP_MBUS_BPP(SGBRG8_1X8, 1),
 	PIXMAP_MBUS_BPP(SGRBG8_1X8, 1),
 	PIXMAP_MBUS_BPP(SRGGB8_1X8, 1),
+	PIXMAP_MBUS_BPP(SBGGR10_1X10, 2),
+	PIXMAP_MBUS_BPP(SGBRG10_1X10, 2),
+	PIXMAP_MBUS_BPP(SGRBG10_1X10, 2),
+	PIXMAP_MBUS_BPP(SRGGB10_1X10, 2),
+	PIXMAP_MBUS_BPP(SBGGR12_1X12, 2),
+	PIXMAP_MBUS_BPP(SGBRG12_1X12, 2),
+	PIXMAP_MBUS_BPP(SGRBG12_1X12, 2),
+	PIXMAP_MBUS_BPP(SRGGB12_1X12, 2),
+	PIXMAP_MBUS_BPP(SBGGR14_1X14, 2),
+	PIXMAP_MBUS_BPP(SGBRG14_1X14, 2),
+	PIXMAP_MBUS_BPP(SGRBG14_1X14, 2),
+	PIXMAP_MBUS_BPP(SRGGB14_1X14, 2),
 	PIXMAP_MBUS_BPP(JPEG_1X8, 1),
 };
 

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
