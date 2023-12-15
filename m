Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE87A814DE2
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Dec 2023 18:07:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3041C6DD6D;
	Fri, 15 Dec 2023 17:07:40 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1DC2C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 17:07:38 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BFFFfo1028310; Fri, 15 Dec 2023 18:07:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=zyRZ/Q/TZCiWvMvtRWbxYFMjjaU8xoYNx1+SsX55M/8=; b=C9
 QuhZ69FlZh7Gd4Dchk10XnCclyuYqLaCzsOIXH3zckGNog9toWQXR9HGn+PIhr37
 LN1/HbLdE8gV+49XIRhQhE2J/bCprYRNpDifC4Nzyb2IiUkvfl8C5tJqoC3RCMGt
 9+3yKAlIKvSjuPSLfqTUyWKveadgWc++TDAUaPDcioK6EPvxFxAD5TOo0sPiZmNd
 eyIrNSWp9o+H7rTQuguabc6YzwnDyxWdyc3C8q1jK3BwLB8+0HdxrHE6WOnyRxb4
 tFXcAfdzzXIEMkVd4skDkmh/XE84UOwD+zfuXayEJDh+CqTfDSgArEJo++qiUvYK
 k+1UywzDi+RxV0p0zv0A==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3v0s9f0bh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Dec 2023 18:07:29 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 961A0100052;
 Fri, 15 Dec 2023 18:07:28 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8DDAB23BDFC;
 Fri, 15 Dec 2023 18:07:28 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Dec
 2023 18:07:28 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Pierre-Yves MORDRET
 <pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 15 Dec 2023 18:06:05 +0100
Message-ID: <20231215170617.95868-2-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231215170617.95868-1-alain.volmat@foss.st.com>
References: <20231215170617.95868-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_10,2023-12-14_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/9] i2c: stm32f7: use dev_err_probe upon
	calls of devm_request_irq
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

Convert error handling upon calls of devm_request_irq functions during
the probe of the driver.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 983509936727..d99f152ac727 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -2199,19 +2199,13 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 					stm32f7_i2c_isr_event_thread,
 					IRQF_ONESHOT,
 					pdev->name, i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq event %i\n",
-			irq_event);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to request irq event\n");
 
 	ret = devm_request_irq(&pdev->dev, irq_error, stm32f7_i2c_isr_error, 0,
 			       pdev->name, i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq error %i\n",
-			irq_error);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to request irq error\n");
 
 	setup = of_device_get_match_data(&pdev->dev);
 	if (!setup) {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
