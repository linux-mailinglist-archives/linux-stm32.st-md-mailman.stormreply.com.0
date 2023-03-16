Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D20856BC80C
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 09:01:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88514C6904C;
	Thu, 16 Mar 2023 08:01:27 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9352EC65043
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 08:01:26 +0000 (UTC)
Received: from maxwell.fritz.box ([109.42.114.157]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MqbI0-1qGED61Gd6-00meWG; Thu, 16 Mar 2023 09:00:52 +0100
From: Jochen Henneberg <jh@henneberg-systemdesign.com>
To: netdev@vger.kernel.org
Date: Thu, 16 Mar 2023 08:59:40 +0100
Message-Id: <20230316075940.695583-3-jh@henneberg-systemdesign.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316075940.695583-1-jh@henneberg-systemdesign.com>
References: <20230316075940.695583-1-jh@henneberg-systemdesign.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:mqMzrAtMQmUMQjWx51L0PSHKPyASH1/pEP3wcHN2eEBqi8Q745U
 dgnh3N/rVmxXjU3Kov4wy1nZQCU97qDoSFMciWFBjRg6VkCPfWd9pgSNmsV6lDUKn1COfnv
 93Gv3vqS/qwd2NcZCVHnCNle88/BG2ojDCQib3nNuyS9BIhUL5EPkZOpkjCRLwkakQi1R/C
 9k7cARiszzI+CJuxOmcmw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ybRtu81gIRA=;V2R8iM2fSpQWWWvzF7mFI0zI+yK
 AaF3EvGmlLkuwcS8HVBO50+PQR7jc+Xn/fOmg6zduiAj1hMOlDBgTdVk7JZXioy27aV7trG5l
 o9c49RXatLazS5v2+oE15DQivVxklcmFov3N/MX+MTDkUFrgPR8Il5AlgIr5Cyt7+1uby3q3T
 jcS0Orzz+zUdTeSpcDirdU9NfB+97riiiGi5cchHjrommOkve3Q+16rMRIz+2w9EAf2keFkqY
 BoswUNwmbhcxkH+ZCRqt02sbO+2PBCJbNd09ZcxLOwlLSCwGS1Il06Cd25pHbF2NQEtBFzo4h
 NvKG9nQTKexV09UeutHA8iCq4Pi86JqjMdcsfxTTJ6lNMAyBfiFClMGsbowYqCTweJFt0Wve4
 DMIxU0lO6d3hji1C2ZKllwFm/d9TQBjDNeSW4Jd94oPut/74Wni2F79tOLLTKODmNXLIFiito
 W+0nWGgRzYCnW5FofIvHWMpC0t6KjR9LJb/Uun9WJWTL8OL4JrYlHEc7x9EniFXA7fgx0Ibwe
 pGwzy78aFPbLLLiD/HyEcDTBQ94RBQqCw2Y1KH5hJcdQ/92tHbci/FryOdDileRTjzYLjjakt
 fbWQUJ2vwfJnEEN283jS3pcv7Ws42AcraqJAENQBGo8I3ZZpn/TELx4A8mhp0LhAif2yJd3Ii
 RlnFTPzEHNh1F886moIdXs3QF0lm0UDaGtvYx7dmgo+0hPqwN7GENHXIfmm/+TE=
X-Topics: 
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net V2 2/2] net: stmmac: Premature loop
	termination check was ignored on ZC rx
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
