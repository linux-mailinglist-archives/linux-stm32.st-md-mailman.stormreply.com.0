Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D796B9407
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 13:40:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFEF9C6904F;
	Tue, 14 Mar 2023 12:40:27 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF011C64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 12:40:26 +0000 (UTC)
Received: from maxwell.localdomain ([109.43.51.107]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MkYkC-1qO0UO1e0M-00m3Lr; Tue, 14 Mar 2023 13:39:46 +0100
From: Jochen Henneberg <jh@henneberg-systemdesign.com>
To: netdev@vger.kernel.org
Date: Tue, 14 Mar 2023 13:37:59 +0100
Message-Id: <20230314123759.132521-3-jh@henneberg-systemdesign.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314123759.132521-1-jh@henneberg-systemdesign.com>
References: <20230314123759.132521-1-jh@henneberg-systemdesign.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:l1W1LjxOLRyxarFh4d7uXBRK1UHreknpzqZxegOM2jODzpg/YnC
 9we6QMFFMqqrvH21mCENI6V0GewVL31+FUjESlQG/GgCnknsFYczuD3QVxAowBFgssxKeKC
 BvP40Y6ELDXd3GZ27r2KYfUuPWtMiyJOvLPWLgjjxUnr2hsS6L6ExUn8v0AUlKJ591P77sJ
 29IArAxiVdxnm/YEFKiCg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:93Q4pkTBlcY=;L5+hOIGa4JQQYKT/ivORpETbJOe
 xeRgGVFuV+HZv/dkjU1Gn5zajrzC/NSAczXyiKaGKF3dXytSyT2NHBuijTXe5DrPwOvbPhtCn
 ICG8jUlOsPn2Q4/TKm4qT4cMBijg72sg20InodyDEBX8c8tOJbzo/nM0X77ZPPr76kmFHdSJg
 pcQEB005uHvucrHD/FdsRu6pijUCgehsy61z1lrRFNm4tlVA1luN7TxZPPOdxR3wy4wYEf0IL
 Vnvl2TiaBQwRWGkQjOrS1sCeeAb8CMoNgj6cHDjitRc/YIfljqaF/+UfjsbRWRWVg3OS8TNlt
 6AbH+5lAQ4dyh6PIBab6Ii6HZMs9m74jwC4qR37Yp9gV/on2QdNoXLST3mWgH1u588N5OKZbg
 M4+M8P49WbGom3FbZNaG9085ykEj4tpiS3Y/fpiRj2rRXA+aZWnCh7rbb/6lcTv9cKPRQCWau
 hYO6kBO24PGlEI1qZI9OoN7j3+qLqmN67+Bd5lDQT8oAVY5WEyHQxThBnYwOkYDoFaz95E6d1
 lHK0F/wlaZKQNWy3y3GUpihlQyDGX3NpoRfWsixcbjvzsSFd2KX48IS7QqSbTXqeSiI97xIDj
 tt2bTUmPbcALTvigORsXdGXK0AWc21IPyudnHxhsCSuaN2FXfquLvLWovdQMPGuUX5DsIjETC
 5pcZzGIFJnNEc4XYVW5EASaf2SswvjSCV6YMWMuE2g==
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 2/2] net: stmmac: Premature loop
	termination check was ignored
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

The premature loop termination check makes sense only in case of the
jump to read_again where the count may have been updated. But
read_again did not include the check.

Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Signed-off-by: Jochen Henneberg <jh@henneberg-systemdesign.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ea51c7c93101..4886668a54c5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5031,10 +5031,10 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 			len = 0;
 		}
 
+read_again:
 		if (count >= limit)
 			break;
 
-read_again:
 		buf1_len = 0;
 		entry = next_entry;
 		buf = &rx_q->buf_pool[entry];
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
