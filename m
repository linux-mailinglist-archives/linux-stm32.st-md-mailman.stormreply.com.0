Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3AF455EFA
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Nov 2021 16:09:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B517C5EC78;
	Thu, 18 Nov 2021 15:09:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 501D0C5EC57
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Nov 2021 15:09:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AIEcMa4015322;
 Thu, 18 Nov 2021 16:08:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=8VGavK9hiCnHSl3HTo4xQl3V9mEIutGOoDIiRVVysKM=;
 b=aER9icTPlyVPw3i9iuaWESG5SBOk86gglh+WuwhRVARUTFKFZ68XrJii1xmx7PL+hVBY
 Mydey0iyCnvqxWMLNrn/sdHY1ImcOiIQsU1XdaySbhYq1lgy33YiPAhKuW/HTmI1xddY
 Q9TtmoMpPD13e6MGHOGb+XMiTbq35fKPhqJ6O1PdwR/bctAXEhtw1TaJMeUsXr4hktxL
 WZgJEjZ6FmtKV0iGPY7MaSY7/lExW0LtjP25eK20esRS+YmweNLighr61LrNNNwvPFro
 JSHNncCZsbAfldLb4Xo2pqcWhuCudHSfnuK9x5SGcH3xElZBKs2ssm9h5KcuYWlJaIyh yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cdccsvqwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 16:08:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 37F8210002A;
 Thu, 18 Nov 2021 16:08:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F22823153A;
 Thu, 18 Nov 2021 16:08:46 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 18 Nov 2021 16:08:45
 +0100
From: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 18 Nov 2021 16:07:50 +0100
Message-ID: <20211118150756.6593-4-nicolas.toromanoff@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211118150756.6593-1-nicolas.toromanoff@foss.st.com>
References: <20211118150756.6593-1-nicolas.toromanoff@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_12,2021-11-17_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 3/9] crypto: stm32/cryp - fix CTR counter
	carry
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

STM32 CRYP hardware doesn't manage CTR counter bigger than max U32, as
a workaround, at each block the current IV is saved, if the saved IV
lower u32 is 0xFFFFFFFF, the full IV is manually incremented, and set
in hardware.
Fixes: bbb2832620ac ("crypto: stm32 - Fix sparse warnings")

Signed-off-by: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
---
 drivers/crypto/stm32/stm32-cryp.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
index 7b55ad6d2f1a..9d6ccf1eb4ce 100644
--- a/drivers/crypto/stm32/stm32-cryp.c
+++ b/drivers/crypto/stm32/stm32-cryp.c
@@ -163,7 +163,7 @@ struct stm32_cryp {
 	struct scatter_walk     in_walk;
 	struct scatter_walk     out_walk;
 
-	u32                     last_ctr[4];
+	__be32                  last_ctr[4];
 	u32                     gcm_ctr;
 };
 
@@ -1218,26 +1218,25 @@ static void stm32_cryp_check_ctr_counter(struct stm32_cryp *cryp)
 	u32 cr;
 
 	if (unlikely(cryp->last_ctr[3] == 0xFFFFFFFF)) {
-		cryp->last_ctr[3] = 0;
-		cryp->last_ctr[2]++;
-		if (!cryp->last_ctr[2]) {
-			cryp->last_ctr[1]++;
-			if (!cryp->last_ctr[1])
-				cryp->last_ctr[0]++;
-		}
+		/*
+		 * In this case, we need to increment manually the ctr counter,
+		 * as HW doesn't handle the U32 carry.
+		 */
+		crypto_inc((u8 *)cryp->last_ctr, sizeof(cryp->last_ctr));
 
 		cr = stm32_cryp_read(cryp, CRYP_CR);
 		stm32_cryp_write(cryp, CRYP_CR, cr & ~CR_CRYPEN);
 
-		stm32_cryp_hw_write_iv(cryp, (__be32 *)cryp->last_ctr);
+		stm32_cryp_hw_write_iv(cryp, cryp->last_ctr);
 
 		stm32_cryp_write(cryp, CRYP_CR, cr);
 	}
 
-	cryp->last_ctr[0] = stm32_cryp_read(cryp, CRYP_IV0LR);
-	cryp->last_ctr[1] = stm32_cryp_read(cryp, CRYP_IV0RR);
-	cryp->last_ctr[2] = stm32_cryp_read(cryp, CRYP_IV1LR);
-	cryp->last_ctr[3] = stm32_cryp_read(cryp, CRYP_IV1RR);
+	/* The IV registers are BE  */
+	cryp->last_ctr[0] = cpu_to_be32(stm32_cryp_read(cryp, CRYP_IV0LR));
+	cryp->last_ctr[1] = cpu_to_be32(stm32_cryp_read(cryp, CRYP_IV0RR));
+	cryp->last_ctr[2] = cpu_to_be32(stm32_cryp_read(cryp, CRYP_IV1LR));
+	cryp->last_ctr[3] = cpu_to_be32(stm32_cryp_read(cryp, CRYP_IV1RR));
 }
 
 static bool stm32_cryp_irq_read_data(struct stm32_cryp *cryp)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
