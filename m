Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A47139204
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2020 14:19:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 154F4C36B0B;
	Mon, 13 Jan 2020 13:19:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94A25C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 13:19:39 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DDIVCk021817; Mon, 13 Jan 2020 14:19:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=PNpmZ/1bn7ZvtvS1FYTPLDxvUN515Mcm8HzueivD4+0=;
 b=BZ3bX30GGJDNZ+GCxhSU4q7rNQBOnnslt+RwvEWXid6vy9gJsyP7nkdyzLJLkW6JE+OS
 XBv73V/9HRnUYHL0l9h0wDsDKNr1XUGIhbNDeb3eXseoGPCxsh+sZzOmt+IqKR5T7b8u
 RncjhkcbwGx+MM0D2b5z1JjGNMG5jKDvelShapkfeMQoG6v17D5i9UTxHCDeIy270wRg
 Ozvqga/4kDrdCnN49Nlj97Qj9H20ePJuW36/s2HGEo5PnMcWIm71+TGZJySI2BVAxy5N
 t+SKrT7b1uGLHjrQvr41heCV3OOmhpwFi/wuM83A91yWZIpJXw+htV5L5Nn+iKgl0mYZ HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf77arbpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 14:19:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E376C10002A;
 Mon, 13 Jan 2020 14:19:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D36A42B8214;
 Mon, 13 Jan 2020 14:19:21 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 13 Jan 2020 14:19:21 +0100
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <jic23@kernel.org>
Date: Mon, 13 Jan 2020 14:18:59 +0100
Message-ID: <1578921539-6353-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_03:2020-01-13,
 2020-01-13 signatures=0
Cc: etienne.carriere@st.com, lars@metafoo.de, linux-iio@vger.kernel.org,
 pmeerw@pmeerw.net, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 knaack.h@gmx.de, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] iio: adc: stm32-adc: don't print an error on
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

From: Etienne Carriere <etienne.carriere@st.com>

Do not print an error trace when deferring probe for some resource.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/iio/adc/stm32-adc-core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index 97655d7..2df88d2 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -688,7 +688,8 @@ static int stm32_adc_probe(struct platform_device *pdev)
 	priv->vref = devm_regulator_get(&pdev->dev, "vref");
 	if (IS_ERR(priv->vref)) {
 		ret = PTR_ERR(priv->vref);
-		dev_err(&pdev->dev, "vref get failed, %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "vref get failed, %d\n", ret);
 		return ret;
 	}
 
@@ -696,7 +697,8 @@ static int stm32_adc_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->aclk)) {
 		ret = PTR_ERR(priv->aclk);
 		if (ret != -ENOENT) {
-			dev_err(&pdev->dev, "Can't get 'adc' clock\n");
+			if (ret != -EPROBE_DEFER)
+				dev_err(&pdev->dev, "Can't get 'adc' clock\n");
 			return ret;
 		}
 		priv->aclk = NULL;
@@ -706,7 +708,8 @@ static int stm32_adc_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->bclk)) {
 		ret = PTR_ERR(priv->bclk);
 		if (ret != -ENOENT) {
-			dev_err(&pdev->dev, "Can't get 'bus' clock\n");
+			if (ret != -EPROBE_DEFER)
+				dev_err(&pdev->dev, "Can't get 'bus' clock\n");
 			return ret;
 		}
 		priv->bclk = NULL;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
