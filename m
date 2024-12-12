Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 091839EE28D
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Dec 2024 10:20:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE03DC78F76;
	Thu, 12 Dec 2024 09:20:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 530BDC78038
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2024 09:20:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC6Pixh025528;
 Thu, 12 Dec 2024 10:20:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 dijISF3YlI8nYJBk9LFYkS/tCO33US68/qrqpE/iPBE=; b=KrZ08M9bypPrKl+v
 euFwL4fsb7IaLNwM2MA2xWAyqNQt+s2NOjX4ojbcitfQwQF7Wigj0INAjDfAJ4X3
 Abl0aO0mZ46VpwoHBk9DsJ3jgVuQvlSLbgtfewvL3SeuMhG97YJD+DSXC4F+OooZ
 wFKq1bvgYNuADcRSsn1L+oUushFmuIoYgPSHuAmoZxx/BbaSicAYXBkUptYQSNyw
 wSVU8T4u06dPUvBbtDD0Xz27O3DGLBA4t9MNhYPy6XUs3LrHsj6Up1/vnhvwJvtm
 oTBotEN4ptQKp0YEd5pod60mSmfY9wOw13nrpZRBUOAbiTuJjcrkocKpcEJaqcr1
 sjbUDA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ftj70qnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2024 10:20:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8A6484004F;
 Thu, 12 Dec 2024 10:19:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2FE36258A6C;
 Thu, 12 Dec 2024 10:18:09 +0100 (CET)
Received: from localhost (10.129.178.65) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Dec
 2024 10:18:08 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 12 Dec 2024 10:17:34 +0100
MIME-Version: 1.0
Message-ID: <20241212-csi_dcmipp_mp25-v4-10-fbeb55a05ed7@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v4 10/15] media: stm32: dcmipp: avoid
 duplicated format on enum in bytecap
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

Avoid duplication of enumerated pixelformat on the bytecap
video capture device.  Indeed, since the bytecap format list
contains both CSI & parallel 16bits formats, ensure that same
pixelformat are not reported twice when performing enumeration
of supported formats.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         | 42 +++++++++++-----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index da80e1aa37ca..1c1b6b48918e 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -268,34 +268,34 @@ static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file, void *priv,
 {
 	const struct dcmipp_bytecap_pix_map *vpix;
 	unsigned int index = f->index;
-	unsigned int i;
+	unsigned int i, prev_pixelformat = 0;
 
-	if (f->mbus_code) {
-		/*
-		 * If a media bus code is specified, only enumerate formats
-		 * compatible with it.
-		 */
-		for (i = 0; i < ARRAY_SIZE(dcmipp_bytecap_pix_map_list); i++) {
-			vpix = &dcmipp_bytecap_pix_map_list[i];
-			if (vpix->code != f->mbus_code)
-				continue;
+	/*
+	 * List up all formats (or only ones matching f->mbus_code), taking
+	 * care of removing duplicated entries (due to support of both
+	 * parallel & csi 16 bits formats
+	 */
+	for (i = 0; i < ARRAY_SIZE(dcmipp_bytecap_pix_map_list); i++) {
+		vpix = &dcmipp_bytecap_pix_map_list[i];
+		/* Skip formats not matching requested mbus code */
+		if (f->mbus_code && vpix->code != f->mbus_code)
+			continue;
 
-			if (index == 0)
-				break;
+		/* Skip duplicated pixelformat */
+		if (vpix->pixelformat == prev_pixelformat)
+			continue;
 
-			index--;
-		}
+		prev_pixelformat = vpix->pixelformat;
 
-		if (i == ARRAY_SIZE(dcmipp_bytecap_pix_map_list))
-			return -EINVAL;
-	} else {
-		/* Otherwise, enumerate all formats. */
-		if (f->index >= ARRAY_SIZE(dcmipp_bytecap_pix_map_list))
-			return -EINVAL;
+		if (index == 0)
+			break;
 
-		vpix = &dcmipp_bytecap_pix_map_list[f->index];
+		index--;
 	}
 
+	if (i == ARRAY_SIZE(dcmipp_bytecap_pix_map_list))
+		return -EINVAL;
+
 	f->pixelformat = vpix->pixelformat;
 
 	return 0;

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
