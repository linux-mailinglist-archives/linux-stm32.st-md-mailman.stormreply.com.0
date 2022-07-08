Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC80056BC00
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Jul 2022 17:05:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76020C640F4;
	Fri,  8 Jul 2022 15:05:05 +0000 (UTC)
Received: from smtpbg.qq.com (unknown [43.155.67.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDEF2C03FEA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Jul 2022 15:05:02 +0000 (UTC)
X-QQ-mid: bizesmtp68t1657292646tnxdblf7
Received: from localhost.localdomain ( [182.148.15.249])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 08 Jul 2022 23:04:01 +0800 (CST)
X-QQ-SSF: 01000000002000B0C000B00A0000000
X-QQ-FEAT: qZu16BA30Err+swO0ObxsJvuzg/K2BB5PMsEr3EdcHw0malLovmoCSEn9VV4q
 xM9Ta7LPg7o2Av4TbQxU4r8lLZRTlZChb2lSBg/ZfAzZmV3EIISX0IS7tU55pkwYJc8uko4
 E0G2kY5MwA8/BNuh1EiRdDrrTTSjZHwLmRPxgtU2sqqrY6ixOS4Zpzl8HVl/2bWqsFfEZ/s
 pTNjznhBjWSLtKIoirIFtRBRra38t3HYZHLePDONlkt5nUO5ZquS1npNVSptc41Sg3yCQUt
 WN8WAxnlLSrKZmOJTxReL0Kxtod+1Pw2PqvD7JaXgs/hBengpXg18Y8bvASAg0me3XMfKJ4
 tFv6CfDZRVF/APTiD+k8uQ6zxMHXY/DtaU0G4F5R7ixJM+N75mDYOiddEoTPg==
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Fri,  8 Jul 2022 23:03:54 +0800
Message-Id: <20220708150354.40101-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
Cc: netdev@vger.kernel.org, Jilin Yuan <yuanjilin@cdjrlc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] fddi/skfp: fix repeated words in comments
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

 Delete the redundant word 'test'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/net/fddi/skfp/fplustm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/fddi/skfp/fplustm.c b/drivers/net/fddi/skfp/fplustm.c
index 4cbb145c74ab..036062376c06 100644
--- a/drivers/net/fddi/skfp/fplustm.c
+++ b/drivers/net/fddi/skfp/fplustm.c
@@ -1314,7 +1314,7 @@ void mac_set_rx_mode(struct s_smc *smc, int mode)
 	o Connect a UPPS ISA or EISA station to the network.
 	o Give the FORMAC of UPPS station the command to send
 	  restricted tokens until the ring becomes instable.
-	o Now connect your test test client.
+	o Now connect your test client.
 	o The restricted token monitor should detect the restricted token,
 	  and your break point will be reached.
 	o You can ovserve how the station will clean the ring.
-- 
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
