Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5653411AE1
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2019 16:09:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26541C6C397
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2019 14:09:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 398F9C6C396
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2019 14:09:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x42Dwv1T002402; Thu, 2 May 2019 16:08:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=DotoY9nutLi40qa0Yd+weRq6+JlgwWdEZ7kKUqLTC+4=;
 b=Vfg77em4dNL5X+jwogs1tuWzG2L5MbFsl2dJnKokYyvhnkgXiihj+AsV6es0FjC/r0Z9
 VQZBKjiWr8SSOqA9b7YZrJm1kATEoepRXa2FWkgA7Q4IPNKWZVvRBNJJBfwID8HfEtjZ
 oNhF2+U5PJw/xsxFc2yjfSsjDJJv8+eqkQd3Wgwy8tiIn92rijFtJ6/t8oNlhfrL1A/B
 LugMZAoFrzk2UOK9mw609YDPvtxgV59SMPY1Rvi8yBvXFBsFQZr+YFDkTcUy6kw7WhOv
 wnz1ydmF4BwOsLTWyI2j8ckhrylvZmL2o/mOqYA6uM6zvdUkmfRxAmMceA8uVrEzrHex Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s6xgcry0r-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 02 May 2019 16:08:50 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B2C8F42;
 Thu,  2 May 2019 14:08:49 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7ECA22731;
 Thu,  2 May 2019 14:08:49 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.361.1; Thu, 2 May 2019
 16:08:49 +0200
Received: from lmecxl0923.lme.st.com (10.48.0.237) by webmail-ga.st.com
 (10.75.90.48) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 2 May 2019
 16:08:48 +0200
From: Ludovic Barre <ludovic.Barre@st.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 2 May 2019 16:08:44 +0200
Message-ID: <1556806126-15890-2-git-send-email-ludovic.Barre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
References: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.237]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-02_08:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org
Subject: [Linux-stm32] [PATCH V2 1/3] watchdog: stm32: update to
	devm_watchdog_register_device
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

From: Ludovic Barre <ludovic.barre@st.com>

This patch updates to devm_watchdog_register_device interface

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/watchdog/stm32_iwdg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index e00e3b3..e191bd8 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -243,7 +243,7 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev,
 			 "unable to set timeout value, using default\n");
 
-	ret = watchdog_register_device(wdd);
+	ret = devm_watchdog_register_device(&pdev->dev, wdd);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register watchdog device\n");
 		goto err;
@@ -263,7 +263,6 @@ static int stm32_iwdg_remove(struct platform_device *pdev)
 {
 	struct stm32_iwdg *wdt = platform_get_drvdata(pdev);
 
-	watchdog_unregister_device(&wdt->wdd);
 	clk_disable_unprepare(wdt->clk_lsi);
 	clk_disable_unprepare(wdt->clk_pclk);
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
