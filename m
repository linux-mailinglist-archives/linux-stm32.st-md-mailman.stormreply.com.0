Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4B24245A0
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Oct 2021 20:05:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A2CDC597B3;
	Wed,  6 Oct 2021 18:05:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C1C9C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Oct 2021 18:05:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90F4561037;
 Wed,  6 Oct 2021 18:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633543539;
 bh=5YNmGloASLfZX1qBz/WxSnaeRHiHJ2EubVXj2iaSHM0=;
 h=Date:From:To:Cc:Subject:From;
 b=mTajuYWmuAbYfmmJ2yFqXn0e/aHYDF6JA+KY2WuaELoHe+xqZ841z+zau9aLkywaJ
 XhzkpSwLwfI7+rAjlhryLne8EOttKFipx8GKarwcNmyv9S+ohWYY9GClq/dfg41TcP
 PJ1/OqOnAluSfaxUKVcJePPWtk3o2xz54v0O8CUNN9OVIIqIwSLVq+zcmc5ws1VSeG
 ROHtLOqBA+ClJKOLDtV1+U7YMPu92NrUTDDouKGrruFfwNxWfstdsEoe3CDVk7JyXc
 Yzji/y9Ir2Q8tzAluOhVj+bkKpEdZ3nJVerdb1DZqIqsMwxalF5CoAY/25qa/Ui8oD
 GfVJpURW+sVsA==
Date: Wed, 6 Oct 2021 13:09:44 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Message-ID: <20211006180944.GA913477@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH][next] net: stmmac: selftests: Use kcalloc()
 instead of kzalloc()
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

Use 2-factor multiplication argument form kcalloc() instead
of kzalloc().

Link: https://github.com/KSPP/linux/issues/162
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index 0462dcc93e53..e649a3e6a529 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -1104,13 +1104,13 @@ static int stmmac_test_rxp(struct stmmac_priv *priv)
 		goto cleanup_sel;
 	}
 
-	actions = kzalloc(nk * sizeof(*actions), GFP_KERNEL);
+	actions = kcalloc(nk, sizeof(*actions), GFP_KERNEL);
 	if (!actions) {
 		ret = -ENOMEM;
 		goto cleanup_exts;
 	}
 
-	act = kzalloc(nk * sizeof(*act), GFP_KERNEL);
+	act = kcalloc(nk, sizeof(*act), GFP_KERNEL);
 	if (!act) {
 		ret = -ENOMEM;
 		goto cleanup_actions;
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
