Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD832A99E9
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 17:57:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BF64C3FAD4;
	Fri,  6 Nov 2020 16:57:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9018BC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 16:57:53 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6Gq9uk030614; Fri, 6 Nov 2020 17:57:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=qJ5g4+BsJ2ro+DNS0P3N/BkqpRkYSggwgfeaYoIQ6QM=;
 b=xi1OazMft+2qavfr8UxD/+1hpoLSv0oHMmIpkJLAJHZqtmT/ckum6tZZxw/f/si3uEFp
 q+eIay4O64Mmb4MOVLJ+5XBi1M/0dE7N6wOg2AK4fwbtDhXCIR4CqEhGizRPJ4Q860UL
 G5ZNe3dk9Axk8b/itmh7j0242INT0wk9yuxc9nASTsxpaeU6NHUGQp6q4J8cScKDk/0N
 K3USH4SesgJejYP0LBcyewJVwOfXaRgjV/zmAw/zofzoeGguVuTqviWJU8HnDwXp0yTB
 7yt7adX0GaKQVXaO1jC4yVC/c5hijuoSBJc01eW5bbik3D1P4tcHLbd67rEP73CRaBpa kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34h00ewjuk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 17:57:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3F52C10002A;
 Fri,  6 Nov 2020 17:57:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D2922C38D3;
 Fri,  6 Nov 2020 17:57:46 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG1NODE3.st.com (10.75.127.3)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 17:57:45
 +0100
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <jic23@kernel.org>
Date: Fri, 6 Nov 2020 17:57:26 +0100
Message-ID: <1604681846-31234-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] iio: adc: stm32-adc: adapt clock duty cycle
	for proper operation
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

For proper operation, STM32 ADC should be used with a clock duty cycle
of 50%, in the range of 49% to 51%. Depending on the clock tree, divider
can be used in case clock duty cycle is out of this range.
In case clk_get_scaled_duty_cycle() returns an error, kindly apply a
divider by default (don't make the probe fail).

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/iio/adc/stm32-adc-core.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index cd870c0..d64a9e8 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -202,7 +202,7 @@ static int stm32h7_adc_clk_sel(struct platform_device *pdev,
 {
 	u32 ckmode, presc, val;
 	unsigned long rate;
-	int i, div;
+	int i, div, duty;
 
 	/* stm32h7 bus clock is common for all ADC instances (mandatory) */
 	if (!priv->bclk) {
@@ -226,6 +226,11 @@ static int stm32h7_adc_clk_sel(struct platform_device *pdev,
 			return -EINVAL;
 		}
 
+		/* If duty is an error, kindly use at least /2 divider */
+		duty = clk_get_scaled_duty_cycle(priv->aclk, 100);
+		if (duty < 0)
+			dev_warn(&pdev->dev, "adc clock duty: %d\n", duty);
+
 		for (i = 0; i < ARRAY_SIZE(stm32h7_adc_ckmodes_spec); i++) {
 			ckmode = stm32h7_adc_ckmodes_spec[i].ckmode;
 			presc = stm32h7_adc_ckmodes_spec[i].presc;
@@ -234,6 +239,13 @@ static int stm32h7_adc_clk_sel(struct platform_device *pdev,
 			if (ckmode)
 				continue;
 
+			/*
+			 * For proper operation, clock duty cycle range is 49%
+			 * to 51%. Apply at least /2 prescaler otherwise.
+			 */
+			if (div == 1 && (duty < 49 || duty > 51))
+				continue;
+
 			if ((rate / div) <= priv->max_clk_rate)
 				goto out;
 		}
@@ -246,6 +258,10 @@ static int stm32h7_adc_clk_sel(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
+	duty = clk_get_scaled_duty_cycle(priv->bclk, 100);
+	if (duty < 0)
+		dev_warn(&pdev->dev, "bus clock duty: %d\n", duty);
+
 	for (i = 0; i < ARRAY_SIZE(stm32h7_adc_ckmodes_spec); i++) {
 		ckmode = stm32h7_adc_ckmodes_spec[i].ckmode;
 		presc = stm32h7_adc_ckmodes_spec[i].presc;
@@ -254,6 +270,9 @@ static int stm32h7_adc_clk_sel(struct platform_device *pdev,
 		if (!ckmode)
 			continue;
 
+		if (div == 1 && (duty < 49 || duty > 51))
+			continue;
+
 		if ((rate / div) <= priv->max_clk_rate)
 			goto out;
 	}
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
