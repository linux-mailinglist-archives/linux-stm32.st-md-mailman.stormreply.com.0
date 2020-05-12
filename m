Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F021CF720
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2020 16:27:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52865C32E90;
	Tue, 12 May 2020 14:27:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05AC8C349C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 14:13:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04CE79eP017016; Tue, 12 May 2020 16:11:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=N5gw/0/2xGWHzgaCQ9DhPL30ROpwXAld1iCkL40gku4=;
 b=ygdzCWPgn5s1dlZUJHgXJ8Bo6ZVI4XMSBg9wHcoeR+XdeOc3stLgcbBivlmeo7T+RQPP
 dFK8oYSz490PGVy3hpWZbWSyXWlT1prvA5YQezfAiBq5OmzDAN5Cy42ni1rxO9kpcw8s
 YOaYcNmDwLNdfnVf0Z8Da+9UqmQUkU/bbPNpHBbeF8kSQlSH1xHd92INaQ5zwI3fAYON
 awFWULkXZ5dkiZ/A/3byUOHRXxZ7+QvPmSSQh1M+k+JCUTepmmO7QLFK+k4BAfaQvnDX
 xlMGTLcREu8KiDZp3lUKhk/xYu8orYY9NTb7B5QEbSVDYZA+de8QMaT+WR82pITpprHB ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wkdh0hx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 16:11:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C222B100039;
 Tue, 12 May 2020 16:11:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B436C2C060B;
 Tue, 12 May 2020 16:11:57 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 12 May 2020 16:11:57 +0200
From: Nicolas Toromanoff <nicolas.toromanoff@st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Tue, 12 May 2020 16:11:11 +0200
Message-ID: <20200512141113.18972-4-nicolas.toromanoff@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512141113.18972-1-nicolas.toromanoff@st.com>
References: <20200512141113.18972-1-nicolas.toromanoff@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-12_04:2020-05-11,
 2020-05-12 signatures=0
X-Mailman-Approved-At: Tue, 12 May 2020 14:27:26 +0000
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 3/5] crypto: stm32/crc: fix multi-instance
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

Ensure CRC algorithm is registered only once in crypto framework when
there are several instances of CRC devices.

Update the CRC device list management to avoid that only the first CRC
instance is used.

Fixes: b51dbe90912a ("crypto: stm32 - Support for STM32 CRC32 crypto module")

Signed-off-by: Nicolas Toromanoff <nicolas.toromanoff@st.com>
---
 drivers/crypto/stm32/stm32-crc32.c | 48 ++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-crc32.c b/drivers/crypto/stm32/stm32-crc32.c
index 1c3e411b7acb..10304511f9b4 100644
--- a/drivers/crypto/stm32/stm32-crc32.c
+++ b/drivers/crypto/stm32/stm32-crc32.c
@@ -91,16 +91,29 @@ static int stm32_crc_setkey(struct crypto_shash *tfm, const u8 *key,
 	return 0;
 }
 
-static int stm32_crc_init(struct shash_desc *desc)
+static struct stm32_crc *stm32_crc_get_next_crc(void)
 {
-	struct stm32_crc_desc_ctx *ctx = shash_desc_ctx(desc);
-	struct stm32_crc_ctx *mctx = crypto_shash_ctx(desc->tfm);
 	struct stm32_crc *crc;
 
 	spin_lock_bh(&crc_list.lock);
 	crc = list_first_entry(&crc_list.dev_list, struct stm32_crc, list);
+	if (crc)
+		list_move_tail(&crc->list, &crc_list.dev_list);
 	spin_unlock_bh(&crc_list.lock);
 
+	return crc;
+}
+
+static int stm32_crc_init(struct shash_desc *desc)
+{
+	struct stm32_crc_desc_ctx *ctx = shash_desc_ctx(desc);
+	struct stm32_crc_ctx *mctx = crypto_shash_ctx(desc->tfm);
+	struct stm32_crc *crc;
+
+	crc = stm32_crc_get_next_crc();
+	if (!crc)
+		return -ENODEV;
+
 	pm_runtime_get_sync(crc->dev);
 
 	/* Reset, set key, poly and configure in bit reverse mode */
@@ -125,9 +138,9 @@ static int stm32_crc_update(struct shash_desc *desc, const u8 *d8,
 	struct stm32_crc_ctx *mctx = crypto_shash_ctx(desc->tfm);
 	struct stm32_crc *crc;
 
-	spin_lock_bh(&crc_list.lock);
-	crc = list_first_entry(&crc_list.dev_list, struct stm32_crc, list);
-	spin_unlock_bh(&crc_list.lock);
+	crc = stm32_crc_get_next_crc();
+	if (!crc)
+		return -ENODEV;
 
 	pm_runtime_get_sync(crc->dev);
 
@@ -200,6 +213,8 @@ static int stm32_crc_digest(struct shash_desc *desc, const u8 *data,
 	return stm32_crc_init(desc) ?: stm32_crc_finup(desc, data, length, out);
 }
 
+static unsigned int refcnt;
+static DEFINE_MUTEX(refcnt_lock);
 static struct shash_alg algs[] = {
 	/* CRC-32 */
 	{
@@ -290,12 +305,18 @@ static int stm32_crc_probe(struct platform_device *pdev)
 	list_add(&crc->list, &crc_list.dev_list);
 	spin_unlock(&crc_list.lock);
 
-	ret = crypto_register_shashes(algs, ARRAY_SIZE(algs));
-	if (ret) {
-		dev_err(dev, "Failed to register\n");
-		clk_disable_unprepare(crc->clk);
-		return ret;
+	mutex_lock(&refcnt_lock);
+	if (!refcnt) {
+		ret = crypto_register_shashes(algs, ARRAY_SIZE(algs));
+		if (ret) {
+			mutex_unlock(&refcnt_lock);
+			dev_err(dev, "Failed to register\n");
+			clk_disable_unprepare(crc->clk);
+			return ret;
+		}
 	}
+	refcnt++;
+	mutex_unlock(&refcnt_lock);
 
 	dev_info(dev, "Initialized\n");
 
@@ -316,7 +337,10 @@ static int stm32_crc_remove(struct platform_device *pdev)
 	list_del(&crc->list);
 	spin_unlock(&crc_list.lock);
 
-	crypto_unregister_shashes(algs, ARRAY_SIZE(algs));
+	mutex_lock(&refcnt_lock);
+	if (!--refcnt)
+		crypto_unregister_shashes(algs, ARRAY_SIZE(algs));
+	mutex_unlock(&refcnt_lock);
 
 	pm_runtime_disable(crc->dev);
 	pm_runtime_put_noidle(crc->dev);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
