Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A774462E06
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Nov 2021 08:57:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33F86C5EC74;
	Tue, 30 Nov 2021 07:57:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 863BFC5EC72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Nov 2021 07:57:04 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AU6fCtI000697;
 Tue, 30 Nov 2021 08:56:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=s7kOc9rz1OlOoz1QIFijPdtLi7gNjG7VJzQJv0JYfT0=;
 b=dcHKDLg4DolBQV+nH3GUtBJC3heU+jmRnpqiODbE7qczOrP4JPO99rANtPrAUR+UGbNl
 4axmyJ1YCAQFmZRPoKWNp9Zkch0bE6/f6Oox0CLROlFQA1BJUVcPZ6NI3TwmXnTunYN1
 rmRfZP/U6fg5cvkfkp8IxF860tE0y+hf90JYTXKGod2lsp2Hd0ef+xq5nhlIhLWmDJIo
 DvMr9YPYsfLiJ/flhtM/aMHePyQy5ILbWlOb7fej3UeQYhd6VXPPZKb8TPP+UNGTQotM
 Xtlr5qakIocx4uJsHOo2TDFgAHBTpx/nK6EVHEPSCCGLkH4KuELHNMOG/A6jObiyMDnD Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cnewbgdpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 08:56:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 92F7710002A;
 Tue, 30 Nov 2021 08:56:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89C8721A224;
 Tue, 30 Nov 2021 08:56:51 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 30 Nov 2021 08:56:51
 +0100
From: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 30 Nov 2021 08:55:01 +0100
Message-ID: <20211130075501.21958-10-nicolas.toromanoff@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211130075501.21958-1-nicolas.toromanoff@foss.st.com>
References: <20211130075501.21958-1-nicolas.toromanoff@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_06,2021-11-28_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 9/9] crypto: stm32/cryp - reorder hw
	initialization
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

The CRYP IP checks the written key depending of the configuration, it's
safer to write the whole configuration to hardware then the key to avoid
unexpected key rejection.

Signed-off-by: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
---
 drivers/crypto/stm32/stm32-cryp.c | 39 ++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
index faae7ad262ac..c6640f616d8d 100644
--- a/drivers/crypto/stm32/stm32-cryp.c
+++ b/drivers/crypto/stm32/stm32-cryp.c
@@ -232,6 +232,11 @@ static inline int stm32_cryp_wait_busy(struct stm32_cryp *cryp)
 			!(status & SR_BUSY), 10, 100000);
 }
 
+static inline void stm32_cryp_enable(struct stm32_cryp *cryp)
+{
+	writel_relaxed(readl_relaxed(cryp->regs + CRYP_CR) | CR_CRYPEN, cryp->regs + CRYP_CR);
+}
+
 static inline int stm32_cryp_wait_enable(struct stm32_cryp *cryp)
 {
 	u32 status;
@@ -534,9 +539,6 @@ static int stm32_cryp_hw_init(struct stm32_cryp *cryp)
 	/* Disable interrupt */
 	stm32_cryp_write(cryp, CRYP_IMSCR, 0);
 
-	/* Set key */
-	stm32_cryp_hw_write_key(cryp);
-
 	/* Set configuration */
 	cfg = CR_DATA8 | CR_FFLUSH;
 
@@ -562,23 +564,36 @@ static int stm32_cryp_hw_init(struct stm32_cryp *cryp)
 	/* AES ECB/CBC decrypt: run key preparation first */
 	if (is_decrypt(cryp) &&
 	    ((hw_mode == CR_AES_ECB) || (hw_mode == CR_AES_CBC))) {
-		stm32_cryp_write(cryp, CRYP_CR, cfg | CR_AES_KP | CR_CRYPEN);
+		/* Configure in key preparation mode */
+		stm32_cryp_write(cryp, CRYP_CR, cfg | CR_AES_KP);
 
+		/* Set key only after full configuration done */
+		stm32_cryp_hw_write_key(cryp);
+
+		/* Start prepare key */
+		stm32_cryp_enable(cryp);
 		/* Wait for end of processing */
 		ret = stm32_cryp_wait_busy(cryp);
 		if (ret) {
 			dev_err(cryp->dev, "Timeout (key preparation)\n");
 			return ret;
 		}
-	}
 
-	cfg |= hw_mode;
+		cfg |= hw_mode | CR_DEC_NOT_ENC;
 
-	if (is_decrypt(cryp))
-		cfg |= CR_DEC_NOT_ENC;
+		/* Apply updated config (Decrypt + algo) and flush */
+		stm32_cryp_write(cryp, CRYP_CR, cfg);
+	} else {
+		cfg |= hw_mode;
+		if (is_decrypt(cryp))
+			cfg |= CR_DEC_NOT_ENC;
 
-	/* Apply config and flush (valid when CRYPEN = 0) */
-	stm32_cryp_write(cryp, CRYP_CR, cfg);
+		/* Apply config and flush */
+		stm32_cryp_write(cryp, CRYP_CR, cfg);
+
+		/* Set key only after configuration done */
+		stm32_cryp_hw_write_key(cryp);
+	}
 
 	switch (hw_mode) {
 	case CR_AES_GCM:
@@ -606,9 +621,7 @@ static int stm32_cryp_hw_init(struct stm32_cryp *cryp)
 	}
 
 	/* Enable now */
-	cfg |= CR_CRYPEN;
-
-	stm32_cryp_write(cryp, CRYP_CR, cfg);
+	stm32_cryp_enable(cryp);
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
