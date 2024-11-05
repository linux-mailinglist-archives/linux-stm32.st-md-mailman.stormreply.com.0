Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A30789BC762
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2024 08:52:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CBFEC7801A;
	Tue,  5 Nov 2024 07:52:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2263AC78015
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2024 07:52:39 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A56uQp6022315;
 Tue, 5 Nov 2024 08:52:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 kO/XdeoBo7X02W334+E6LhxLlDrGOL8A5vE8mC37cg8=; b=XpkexCjym+l4hQgo
 U6c1wzZjWYwCdjZqsUb7tcu4lZelqK17QRqJJkf+eLkVd0EK8n0xLUUmFpEVd4H4
 HmVC+eMUmnfePgGeTlfkepYwIgmAXvbQts7BTPj3gp66aBIHYviZ09QnG89nnQZM
 fFwy45+NXFMYDthNLbpJMcs0Gi3j/Cdr5TIm4mmc15h/2cWdIYv2loDMIS1wyQ3J
 O1adt7S/XWxj8bdQ/moGAXiQFXL+M/D68QtqHs1uV7qIvvoTnuaLqVus8AEOn+h+
 n0UYYt1D3QNamd4dq8SOQ9XMXMQYMKaOGzT6/xezRaXMQMUn2v2g/WYOwCcCapS4
 wWe9cQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42ncxbtucv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2024 08:52:27 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9C6E440047;
 Tue,  5 Nov 2024 08:50:26 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64495250FA3;
 Tue,  5 Nov 2024 08:49:33 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 08:49:33 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 5 Nov 2024 08:49:11 +0100
MIME-Version: 1.0
Message-ID: <20241105-csi_dcmipp_mp25-v2-8-b9fc8a7273c2@foss.st.com>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
In-Reply-To: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 08/15] media: stm32: dcmipp: add bayer
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
index 48596592bfd517b9d46946d27f154f0d17ebed78..d6fad99e44bba5bcab1df056ba9208e82aff4bea 100644
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
index a19c8235af565fb5f673ba90b37ebfcadf03d72e..72f1bb4c64ad4c194c14467dfc354a04bc69e208 100644
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
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
