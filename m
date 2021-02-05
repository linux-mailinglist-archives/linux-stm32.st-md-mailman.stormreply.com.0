Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0CB3109E2
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Feb 2021 12:09:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AC66C57B5F;
	Fri,  5 Feb 2021 11:09:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FDF5C57B52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 11:09:53 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 115ApxOZ025610; Fri, 5 Feb 2021 12:09:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=+/RZX5SIxV5sG9B0VrBpihRo0TMSApvV68YrCoWQaf4=;
 b=r1KpIA+jppvt/n5v9fwU0nFT+yoFHaEgD73mEwQ3bKIMm78pOK45BuEa//sAM9dmRsKU
 /OikQREdJdvMsU6Azv+e2JwnV6tSTR8+TpFpN1v8k5/mhzr3UeGgEpUiE3XL+efKaHDK
 oY9hvspPaWl1WlwPF77cnwDeoNEU27g30UG08RdZPyuUoACCqiiRe+mvEQTuAQbtCfsH
 yZPKx4FnGQpq1G1Zcpz3GB/8Avzl6PH6dM/TMCeF1SgEF4uzO57sC9zvJrNORbxEmjg3
 wubfR7QU5fqKobU9sSmabHgm7Ly3ra6tTi2UU4wXMAw3T9up6CGVbdB7SVyoOzcq9knK FA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36d0fse9j6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 12:09:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E332510002A;
 Fri,  5 Feb 2021 12:09:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D7F34229F3C;
 Fri,  5 Feb 2021 12:09:44 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 12:09:44
 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: <broonie@kernel.org>, <amelie.delaunay@foss.st.com>
Date: Fri, 5 Feb 2021 12:08:56 +0100
Message-ID: <1612523342-10466-3-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612523342-10466-1-git-send-email-alain.volmat@foss.st.com>
References: <1612523342-10466-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_06:2021-02-05,
 2021-02-05 signatures=0
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, alain.volmat@foss.st.com, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/8] spi: stm32: do not mandate cs_gpio
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

CS gpios is not mandatory, the driver should allow working
even when CS are not given.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/spi/spi-stm32.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 137213633e6d..8c6af3aa0dc3 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1946,12 +1946,6 @@ static int stm32_spi_probe(struct platform_device *pdev)
 		goto err_pm_disable;
 	}
 
-	if (!master->cs_gpiods) {
-		dev_err(&pdev->dev, "no CS gpios available\n");
-		ret = -EINVAL;
-		goto err_pm_disable;
-	}
-
 	dev_info(&pdev->dev, "driver initialized\n");
 
 	return 0;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
