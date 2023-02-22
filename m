Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F92C69F01D
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Feb 2023 09:23:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EF9FC6A619;
	Wed, 22 Feb 2023 08:23:31 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BCC4C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Feb 2023 07:40:51 +0000 (UTC)
Received: from maxwell ([109.42.114.8]) by mrelayeu.kundenserver.de (mreue010
 [213.165.67.97]) with ESMTPSA (Nemesis) id 1MjSLi-1opOMz0UoM-00kvyc;
 Wed, 22 Feb 2023 08:40:35 +0100
User-agent: mu4e 1.8.14; emacs 28.2
From: Jochen Henneberg <jh@henneberg-systemdesign.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,Alexandre Torgue
 <alexandre.torgue@foss.st.com>,Jose Abreu <joabreu@synopsys.com>,"David S.
 Miller" <davem@davemloft.net>,Eric Dumazet <edumazet@google.com>,Jakub
 Kicinski <kuba@kernel.org>,Paolo Abeni <pabeni@redhat.com>,Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,Ong Boon Leong
 <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Wed, 22 Feb 2023 08:38:28 +0100
Message-ID: <87y1oq5es0.fsf@henneberg-systemdesign.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:kw0roPPoAZa1x6voWlAWTXw1lMGoFSGMoAVQEeIS5XD1h36ORDw
 YNIxBFWdNbXwS345whm6mIykdDyZ4BgNJWckdG6SgACNXtJA0tnAk5gVZHTkUp9wLIl5k95
 Jg/Wsvk/DTkohSIIRSwZX8fWyjC46p9pE2nUmP2jeIIA5IC8XZOdVzf/r+quqBeWmniPanD
 6wKJrVeIVdI7V66fSp9lw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:N7tPwk2Ow1g=;Gptd/97H+m36saouYGmfHZCqJuv
 XGYg59NycFPtpj+eh+W89J36G3+N4RKKFNWSh/T4foAZWajFDbJyMwdAWBvrxv4Ucgx7NHqMX
 vYyN6nsfIqD4EztJKr/ejo1VysFDHDkPwFCldDJuiOucIb9YH0Do1zAGETtOqY6ddibXA9lc5
 B3FZTP0mt6+A+64vb8hGm8svz/McRH+9Z7ph6z3j5yo3tNj9LTV/Ysc2sYXGDXekgwsAEmJcF
 pJNT5oE37chG+md0Xe9FmcIuWh5CSZp4zZlNjiYjs1WDKET6PlJDoaSajeNZ4Pq9bF5UG3NwB
 bKAthIZs6elOa7mqr0TguPAs1wnML7x3qqF6cGFuVY2nYiqYk9L3ohkRYvQOARoxu21Y3+UO+
 eVXdnvpkE9YAe3JQkRYg8j67F3M8dDefPvW/Au0hedecjtRp/9vy1nyBgrLvvSVDY1qb0IcPC
 2CIFl/z1RE5Z+aGBS1BbY+HZ0jLvk/Bt8BSvJx8mElJ/YkDU3gTUEMHiYUu9brPQ+1cEQqhQb
 fvTTg9pIfYjenoClvBjxQ9LAsyHrBmGb1EydHuPwhtNxVrUegKSy+2PEPGi01elyybjYfNYcv
 6Iezssx9R31E0Ii4g4n62zIWlBjbXFZvG+0l3z8tAsaoVwhpACei/2xXXxKIG1vhUhLJtGLb7
 CFEIdtWwhmAZgAi5tgD16/ZaQfRelhAe8YrhZNI7Lg==
X-Mailman-Approved-At: Wed, 22 Feb 2023 08:23:28 +0000
Subject: [Linux-stm32] [PATCH net V3] net: stmmac: Premature loop
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
Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
Signed-off-by: Jochen Henneberg <jh@henneberg-systemdesign.com>
---
V2: Added fixes tags
V3: Fixed fixes tag format

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
