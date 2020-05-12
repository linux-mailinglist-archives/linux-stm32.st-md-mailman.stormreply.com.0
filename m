Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB4E1CF722
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2020 16:27:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F31FC32EA5;
	Tue, 12 May 2020 14:27:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0906AC349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 14:13:21 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04CE2CvQ020028; Tue, 12 May 2020 16:11:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=de8DH4LiaffmmWtTVyqpc6yqQovYM+Xegj25cuzjLL4=;
 b=GtlFKoXjBkm/nAmGEUgN68TD4K3F0/REqiBwzS9nz8Bq0F50L9+RuHhHktaANFJinOxr
 zgl0Vrz1kOM4ccadNonFYbvcybuLG0XfkRYwHWk3FXk+j9KaRvUnXnVfJ6m4AaaHYtPD
 cKqQKX9iWQCyWa9Q5qTReV2OgmTLzhGSer2PcGwchp9578VkkszFEmkJFoqyy0x1EFlO
 Tugx4VEU+q4A0b9s8omTP0HKRkATtTIMkiMv5iTjyQGlifbd1c0OmQaqZls4rDPxC/tU
 KpBYtK8ftj2PLLxDU0SWNDOjAghSCJEvnZD3n0xPc9tQSowY0YqqegDYSrEyAgcWJqx3 MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wj9wh0k7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 16:11:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D93C1100034;
 Tue, 12 May 2020 16:11:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD2D52BAE54;
 Tue, 12 May 2020 16:11:58 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 12 May 2020 16:11:58 +0200
From: Nicolas Toromanoff <nicolas.toromanoff@st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Tue, 12 May 2020 16:11:12 +0200
Message-ID: <20200512141113.18972-5-nicolas.toromanoff@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512141113.18972-1-nicolas.toromanoff@st.com>
References: <20200512141113.18972-1-nicolas.toromanoff@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-12_03:2020-05-11,
 2020-05-12 signatures=0
X-Mailman-Approved-At: Tue, 12 May 2020 14:27:26 +0000
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 4/5] crypto: stm32/crc: don't sleep in runtime
	pm
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

Ensure stm32_crc_update() and stm32_crc_init() can be called
in atomic context and can't sleep.

Add pm_runtime_irq_safe() to make pm_runtime_get_sync() atomic.
Change runtime pm to call clk_enable()/clk_disable() and change
system pm to unprepare/prepare the clock and force runtime pm
suspend/resume.

Signed-off-by: Nicolas Toromanoff <nicolas.toromanoff@st.com>
---
 drivers/crypto/stm32/stm32-crc32.c | 45 ++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-crc32.c b/drivers/crypto/stm32/stm32-crc32.c
index 10304511f9b4..413415c216ef 100644
--- a/drivers/crypto/stm32/stm32-crc32.c
+++ b/drivers/crypto/stm32/stm32-crc32.c
@@ -297,6 +297,7 @@ static int stm32_crc_probe(struct platform_device *pdev)
 
 	pm_runtime_get_noresume(dev);
 	pm_runtime_set_active(dev);
+	pm_runtime_irq_safe(dev);
 	pm_runtime_enable(dev);
 
 	platform_set_drvdata(pdev, crc);
@@ -350,34 +351,60 @@ static int stm32_crc_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int stm32_crc_runtime_suspend(struct device *dev)
+static int __maybe_unused stm32_crc_suspend(struct device *dev)
 {
 	struct stm32_crc *crc = dev_get_drvdata(dev);
+	int ret;
 
-	clk_disable_unprepare(crc->clk);
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		return ret;
+
+	clk_unprepare(crc->clk);
 
 	return 0;
 }
 
-static int stm32_crc_runtime_resume(struct device *dev)
+static int __maybe_unused stm32_crc_resume(struct device *dev)
 {
 	struct stm32_crc *crc = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(crc->clk);
+	ret = clk_prepare(crc->clk);
 	if (ret) {
-		dev_err(crc->dev, "Failed to prepare_enable clock\n");
+		dev_err(crc->dev, "Failed to prepare clock\n");
+		return ret;
+	}
+
+	return pm_runtime_force_resume(dev);
+}
+
+static int __maybe_unused stm32_crc_runtime_suspend(struct device *dev)
+{
+	struct stm32_crc *crc = dev_get_drvdata(dev);
+
+	clk_disable(crc->clk);
+
+	return 0;
+}
+
+static int __maybe_unused stm32_crc_runtime_resume(struct device *dev)
+{
+	struct stm32_crc *crc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(crc->clk);
+	if (ret) {
+		dev_err(crc->dev, "Failed to enable clock\n");
 		return ret;
 	}
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops stm32_crc_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(stm32_crc_suspend,
+				stm32_crc_resume)
 	SET_RUNTIME_PM_OPS(stm32_crc_runtime_suspend,
 			   stm32_crc_runtime_resume, NULL)
 };
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
