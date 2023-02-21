Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5129969F01C
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Feb 2023 09:23:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D146C6A615;
	Wed, 22 Feb 2023 08:23:31 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DDE3C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Feb 2023 20:00:06 +0000 (UTC)
Received: from maxwell ([109.42.115.188]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MqqLB-1oi0cp2xij-00mwY7; Tue, 21 Feb 2023 20:59:50 +0100
User-agent: mu4e 1.8.14; emacs 28.2
From: Jochen Henneberg <jh@henneberg-systemdesign.com>
To: Simon Horman <simon.horman@corigine.com>,Giuseppe Cavallaro
 <peppe.cavallaro@st.com>,Alexandre Torgue
 <alexandre.torgue@foss.st.com>,Jose Abreu <joabreu@synopsys.com>,"David S.
 Miller" <davem@davemloft.net>,Eric Dumazet <edumazet@google.com>,Jakub
 Kicinski <kuba@kernel.org>,Paolo Abeni <pabeni@redhat.com>,Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,Ong Boon Leong
 <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 21 Feb 2023 20:58:30 +0100
Message-ID: <87356y7pse.fsf@henneberg-systemdesign.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:PGSPSIWFzfFaZ6WQFk04hnkrL2Jr+FcXFWwVHu3dZurDPzXBb8W
 MEiFKk3Fs9MqaIpz2ZNHez+WdZY5pmgWk5dBjeMkgP1APdnpiwHk8vu3pC+p5hUaO/xoqoX
 SA8ectum9QkFYpa07y3YvQUwzhjX06GlmzexGgukvabZWturdbRfzvJT2mEbTJe3M33l6gN
 eR1jOIqJAugsKtJMeEKFg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IvducrWJ2gA=;sj6aQA6LBDhuosVehFMn9CkCfV+
 TuKyhZyizukGLSoLYW78SuZ7Cm18vUWvP7wvjDZoXOixSI76xnnFuuIPHm3m9XEIRu4Zi5EvQ
 /5bOP8ysHXZMYXoy3QKwtQzFqULJiUJerxe0p0XKTGjE69P0dsqPo96DXeLBFIzZDEVWeh9qx
 dbXEF/dlvnesjWyLOqJCQs/1U1kKenbLBtBzeUCNvJfqFtCdzTgDFzv6PTYibKM/v/F+ohnd+
 TyCijV0pR03YHdgjaQw4F0c5wt3AiKw4OlW//uIaJTsBMSuTw1k4hFc2v2tE71xPfeTk4sOOy
 +Zeq/xbtebg06AMMn4pXrtIxjK2ZjMR+evjObP1kW1NZFXJmGcZJXxa2qwupXZdMPkonBO1iZ
 kZpYoahZsQ+Qe2wN5JF04cj6JMbP7yJ0j+ot4gxRGa+yZBPEfrW2gWN+aNJLUIHqe8n9YaopY
 P5DdjV21uq78Lq8RG19c4i6ujTYJlnWrMITxqBo6QFbUm7jIPnfug88C+N+BSOdvOeNyQAVv5
 nicdGetivvcivvcF9K1ejXn3WSG+mycU6N1TKkPtUwZmHSr345UmQZqeUducRZk8SV96P6wty
 GlLY6K5wcPe8qdEVXospVWd5Hciw/2zfxdZ/06ktzPVZ/P1idiWjol7I6+Bu3/Zze//Roxig/
 xoHo9OXzj7s+AmoqsbUbWngLK2ioOUVrgzXTdosIqg==
X-Mailman-Approved-At: Wed, 22 Feb 2023 08:23:28 +0000
Subject: [Linux-stm32] [PATCH net V2] net: stmmac: Premature loop
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

Fixes: bba2556efad6 (net: stmmac: Enable RX via AF_XDP zero-copy)
Fixes: ec222003bd94 (net: stmmac: Prepare to add Split Header support)
Signed-off-by: Jochen Henneberg <jh@henneberg-systemdesign.com>
---
V2: Added fixes tags for both commits that introduced the issues

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
