Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBBD561AC6
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Jun 2022 14:53:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4441FC04001;
	Thu, 30 Jun 2022 12:53:38 +0000 (UTC)
Received: from smtpbg.qq.com (unknown [43.155.67.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BC3AC03FC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jun 2022 12:53:35 +0000 (UTC)
X-QQ-mid: bizesmtp72t1656593552tbed00zi
Received: from localhost.localdomain ( [182.148.13.66])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 30 Jun 2022 20:52:29 +0800 (CST)
X-QQ-SSF: 0100000000200090C000C00A0000000
X-QQ-FEAT: 3uawQE1sH+1idMrgYZkQZYmgnB0Oe1InJoUgnZDAyhloS9Kj2+cIyY4wWO1Qj
 BAwAZb0xdjyYp9mUp7eedIeDvNo4VZuvgDnTa87G/f22InURrB+hd7vRR/RAjQryeX9Psv+
 5pLfUU0eBEaw1wP0RLa+WgrQZUj6VbTF4jM3IqvIa4KPzlpwNkTub0KKklZfTmF/xUNb0WU
 LDzaNzjC0hvkrs9adLW8HohWvTOz+Q0afx0KybKO01f8ZCra5wm5Qg4a2r9/Az8FUM6m8Ow
 035h/B90UOshGQRIpO6g6RIjQmTmSxxvK+q8/bjJbhNTHhDlE4ijjH+pQB1gYDg0xHvmZBs
 EOYm43oWHIF0edFeJT/BSodGGMZYQ==
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com
Date: Thu, 30 Jun 2022 20:52:22 +0800
Message-Id: <20220630125222.14357-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, joabreu@synopsys.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] stmicro/stmmac: fix repeated words in comments
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

Delete the redundant word 'all'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/net/ethernet/stmicro/stmmac/mmc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
index a57b0fa815ab..ea4910ae0921 100644
--- a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
@@ -197,7 +197,7 @@ static void dwmac_mmc_ctrl(void __iomem *mmcaddr, unsigned int mode)
 		 MMC_CNTRL, value);
 }
 
-/* To mask all all interrupts.*/
+/* To mask all interrupts.*/
 static void dwmac_mmc_intr_all_mask(void __iomem *mmcaddr)
 {
 	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_RX_INTR_MASK);
-- 
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
