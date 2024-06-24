Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCB2914520
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2024 10:42:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CCFAC71287;
	Mon, 24 Jun 2024 08:42:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9885C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 08:42:51 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45O82p4Y006217;
 Mon, 24 Jun 2024 10:42:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=AeCFDncPm+RmmKekJr5ls2
 XtImCTJaOsCJTIji/uvL0=; b=Qlt54Ecxz/AioprZnMS6IBTR4WI7IwO74hsiZw
 ooMmltq5IR7S8dCj7knsL0Fmdwyqnc39lfqgij+C2Bdb0CvY3It7PYf48rDNW+0D
 3wpWjhSn6I0TILWpq3drbChLOTpgcte9/0HD1jcTA/6hzHYJZAP886j+oxpFJKrO
 floMB63eWxqXMRPULya+Wat58WixUln7pF+6KAF3MPJ9hmaw6EZZE+FGtNdg3PwW
 E+wgOW73TXyoDmhDwJs0Cjp5CEreUxAkSzKBH6ma7szU7b6vKkCtWi7VbbnOnVhl
 OJQTLHRA2DD6b9Iq9W+VdPIuftrChjd1hQ5iQCWEyUErs00A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yx860by2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jun 2024 10:42:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D804A4002D;
 Mon, 24 Jun 2024 10:42:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C6134209EC7;
 Mon, 24 Jun 2024 10:41:53 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 24 Jun
 2024 10:41:53 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Mon, 24 Jun 2024 10:41:22 +0200
Message-ID: <20240624084123.3009122-1-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_07,2024-06-21_01,2024-05-17_01
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH] media: stm32: dcmipp: correct error handling
	in dcmipp_create_subdevs
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

Correct error handling within the dcmipp_create_subdevs by properly
decrementing the i counter when releasing the subdeves.

Fixes: 28e0f3772296 ("media: stm32-dcmipp: STM32 DCMIPP camera interface driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 4acc3b90d03a..4924ee36cfda 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -202,7 +202,7 @@ static int dcmipp_create_subdevs(struct dcmipp_device *dcmipp)
 	return 0;
 
 err_init_entity:
-	while (i > 0)
+	while (i-- > 0)
 		dcmipp->pipe_cfg->ents[i - 1].release(dcmipp->entity[i - 1]);
 	return ret;
 }
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
