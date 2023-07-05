Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3D4748AD1
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jul 2023 19:44:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E88ADC6B45C;
	Wed,  5 Jul 2023 17:44:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A438C6B462
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jul 2023 17:44:09 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 365EZlaU001538; Wed, 5 Jul 2023 19:44:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=MXa5UGOKwnuvRKspTklCvl9TbHyucJqEV4w5bCIDszM=;
 b=D9nczGzstJ6f5lpSWPoHDy9dcrhQP/+mh1s3PXBz4cDva5p7HX/YUnTy9lZQOSd4Kaua
 A8CnEg84GbIRl8aM2QZBK87gkbGDQnRVdHNjVdkLX7aLA3IPG+Ontgi7THTyFyPDMIRw
 20D3lK6iO/I/wB/k7tuqc4m/w3a5A6KNXbcbj/x0+4rniuaw47KmWJtyhud+daMfiKDs
 b8bw64jEq1ifH4jJHs9Xi0MZ0wlly7siey4V/fNob4hpykEFUAZOFfx28UU1sjx/AOGn
 +QDEMqW4LPotR0cOycm85Oct3cIlK7eHPb2pZrKzqkZ6iMzguDjGoiPG8mXOD7inaC/g mQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rn09qp4fv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jul 2023 19:44:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2C94C10005E;
 Wed,  5 Jul 2023 19:44:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 25F9D252250;
 Wed,  5 Jul 2023 19:44:05 +0200 (CEST)
Received: from localhost (10.201.20.168) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 5 Jul
 2023 19:44:04 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo
 <a.zummo@towertech.it>
Date: Wed, 5 Jul 2023 19:43:54 +0200
Message-ID: <20230705174357.353616-5-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230705174357.353616-1-valentin.caron@foss.st.com>
References: <20230705174357.353616-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_09,2023-07-05_01,2023-05-22_02
Cc: linux-rtc@vger.kernel.org,
 Christophe Guibout <christophe.guibout@foss.st.com>,
 linux-kernel@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/7] rtc: stm32: don't print an error on
	probe deferral
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

Change stm32-rtc driver to not generate an error message when
device probe operation is deferred for a clock.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 drivers/rtc/rtc-stm32.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index cad88668bcfb..5ebf0b8e75f9 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -6,6 +6,7 @@
 
 #include <linux/bcd.h>
 #include <linux/clk.h>
+#include <linux/errno.h>
 #include <linux/iopoll.h>
 #include <linux/ioport.h>
 #include <linux/mfd/syscon.h>
@@ -759,16 +760,13 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 		rtc->rtc_ck = devm_clk_get(&pdev->dev, NULL);
 	} else {
 		rtc->pclk = devm_clk_get(&pdev->dev, "pclk");
-		if (IS_ERR(rtc->pclk)) {
-			dev_err(&pdev->dev, "no pclk clock");
-			return PTR_ERR(rtc->pclk);
-		}
+		if (IS_ERR(rtc->pclk))
+			return dev_err_probe(&pdev->dev, PTR_ERR(rtc->pclk), "no pclk clock");
+
 		rtc->rtc_ck = devm_clk_get(&pdev->dev, "rtc_ck");
 	}
-	if (IS_ERR(rtc->rtc_ck)) {
-		dev_err(&pdev->dev, "no rtc_ck clock");
-		return PTR_ERR(rtc->rtc_ck);
-	}
+	if (IS_ERR(rtc->rtc_ck))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->rtc_ck), "no rtc_ck clock");
 
 	if (rtc->data->has_pclk) {
 		ret = clk_prepare_enable(rtc->pclk);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
