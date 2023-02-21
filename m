Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C54869F01A
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Feb 2023 09:23:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEAC9C6A60F;
	Wed, 22 Feb 2023 08:23:30 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A12EC035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Feb 2023 13:43:55 +0000 (UTC)
Received: from maxwell ([109.42.115.188]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MLAAs-1pDLWN3diM-00IDz4; Tue, 21 Feb 2023 14:43:46 +0100
User-agent: mu4e 1.8.14; emacs 28.2
From: Jochen Henneberg <jh@henneberg-systemdesign.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,Alexandre Torgue
 <alexandre.torgue@foss.st.com>,Jose Abreu <joabreu@synopsys.com>,"David S.
 Miller" <davem@davemloft.net>,Eric Dumazet <edumazet@google.com>,Jakub
 Kicinski <kuba@kernel.org>,Paolo Abeni <pabeni@redhat.com>,Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 21 Feb 2023 14:38:27 +0100
Message-ID: <87fsaz6smr.fsf@henneberg-systemdesign.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:UEjmjts8a3oTdsLqA0rvc+/8E/eBATSNya9dC/1ORtjI2CTbQIV
 026feQLR23g4KIE8KNi+xOP9CLdOH2OCXKfaoWA6GH2HDSTi19nBIPyzmtVl2wMYrIjCvH3
 isHWzjznLhletxDQAJCJ3eXjglO8hIlRuBFGx4NH3AuMwGPmeL/2W7tTxG5se50qeIZyDWM
 nhIs4cPTID5tfbZgbCH5A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hfcDjeh03tY=;ECX8dzDbXfN9rfXK6kwd13XaVdA
 plcxuHQEJSbZRS2MoHMrIfI4W3X4fA9yud3XR3SLlfyy6fW+rU5MpWv29L728UboBd9Xtr/Me
 vj0x+ADiyYtjQHLjlbN4SpV1FX7f/hK3OI8FoQZUWbIjNvRTfG5hL/voyJOcUi+PKMbJline6
 F2VvIIQkwHWoQV/2ujAy04NFcuwInsyUxJ8seNMfsAqRtZJyyzxRQyP13IT3i8v5xXMMY+nBP
 Gwae4vGb1hSSevQuzp0bFovEfqF264SNPHwEXJpXkq5cXUXU5wA1Fq3WDdvzq12r0SFjm69HD
 hjWHk1melr4CpoAeJiN71vPoWvUuP+5BwcPNrnKoWUk5o+AHYCcUiI51LVVeH1uxRZs1F6SJm
 TUKjnFHEM2jN7z7iyl1OfySdxix6seajn3XarwI/JBTpCiyAl/aHm7v07rRAJKyY7xVa3ksto
 pq13Bu5HeOntVL77H1wP6A0tipBtFiFiiWx6r0HByoM06sm5iQr/TXG7p5xTRsRQx1jXM9tMH
 Nn2qP6Jcujq7ySFDnRg8vyeLQOydkSxODJepkYlin4rFyqKvMBsKPEcncKv9M3CngvPXpZp2p
 WHaIH5CBHpsKOHd+2pMt+pCZepX+tDqg9jWStMfiFVchnC0oC9KVBlHVvIiLEOc8gaoK11HQ5
 gTpdHRegceCg7RJGBHJgCHiwVD2gsUVjhagP9MoJKw==
X-Mailman-Approved-At: Wed, 22 Feb 2023 08:23:28 +0000
Subject: [Linux-stm32] [PATCH net] net: stmmac: Premature loop termination
	check was ignored
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

Signed-off-by: Jochen Henneberg <jh@henneberg-systemdesign.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1a5b8dab5e9b..de98c009866a 100644
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
@@ -5221,10 +5221,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			len = 0;
 		}
 
+read_again:
 		if (count >= limit)
 			break;
 
-read_again:
 		buf1_len = 0;
 		buf2_len = 0;
 		entry = next_entry;
-- 
2.39.2
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
