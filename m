Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D31E7862A16
	for <lists+linux-stm32@lfdr.de>; Sun, 25 Feb 2024 12:38:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F22BC6C838;
	Sun, 25 Feb 2024 11:38:42 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B846C6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Feb 2024 11:38:41 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1708861121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Nd1jp0ik0EQ8lB4/a6qsMXOn4vrUpwGeAyAe+L+hO74=;
 b=2Kl/5+Vz2RGNX9IRizM/tRprQhU4nMEu8+jdI/nwr0dXIDCI62kr4l+QhcvCILGd80SVaH
 DC6u8JNDYaV8iyBldD0qlo5h4WrY5VxvkXSaCHnyiQPaFZ4olgaaE7RvlUFRJZLmFvup1+
 L9V+9ahaQwCwwiqymU0U+TkTwOotKgFoV8Igi6UdB5SeTQVvcuriXBpmHaEyDZv9P2sq6X
 UBzw/nn3eJpc1Jkm4FG3kA+zUxiLw6NAdPiBQEEa2yYCnlA9tLF8gwx0PRZQ1BfiDBEvQy
 uzcPKSylBqADmG/yWPx7kCYxMn6bAvojJCnA6NlXeKR78N/ZMXaWKrGpMkQwaw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1708861121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Nd1jp0ik0EQ8lB4/a6qsMXOn4vrUpwGeAyAe+L+hO74=;
 b=bgRHsuM6ku0+shTnNChydhV6wAmCSP/Ocbdf6eZIfn7IMUd9PaXfAho5W4iOE/wlPp2jjW
 CF5eHWjPceLFAzAw==
Date: Sun, 25 Feb 2024 12:38:37 +0100
MIME-Version: 1.0
Message-Id: <20240222-stmmac_xdp-v2-1-4beee3a037e4@linutronix.de>
X-B4-Tracking: v=1; b=H4sIALwm22UC/22NQQ6CMBBFr0JmbU07iiIr72GIaelUJpFC2kowh
 LtbWLt8/+flLRApMEWoiwUCTRx58BnwUEDbaf8iwTYzoMSzREQRU9/r9jnbUZRVScapSyXNCbJ
 gdCRhgvZttym9jonCdoyBHM975QGeEjR57DimIXz38qT2619kUkIJqixaNNebc/L+Zv9JYfA8H
 y1Bs67rD1hDlJbGAAAA
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1989; i=kurt@linutronix.de;
 h=from:subject:message-id; bh=nO+yNgUNWjiWE9FvprklDXQiq6XovnJDIndTRXHt+DI=;
 b=owEBbQKS/ZANAwAKAcGT0fKqRnOCAcsmYgBl2ya/itUaWlWcQlzoS007kcDGfWCQqL9H4sNex
 3nznKAs996JAjMEAAEKAB0WIQS8ub+yyMN909/bWZLBk9HyqkZzggUCZdsmvwAKCRDBk9HyqkZz
 gq63D/9a5xGEBWftDOSIqgb07v1rM8qCP849lIzLis3u5Ys3mwrMSOkDkpj7seZVvzwdqLlMQ5H
 3kcwf6QyiEUXWtabPlmdv2tlBWvmnNS5zQMxu+mlnoC4RS7xAarFnIzcNVaWijGQVpKnfsq69h3
 ZI41n+YI0h9qFJzVObhyifR5u8YJuvzxzHLWsi/npuyGNPYLaWSlS0TL5n5uyDqqH6Kg2KaR+PL
 lTjrwlgNpyKqLJvziYwNDijD0EEmf+7BLYAwDpdD3Pt73WCvpqmKds/M8Khp0qbSwiBS5D9iLRD
 5dAlmBG9rpZ8Kr6Y1DtYy72//A/FKECZMbt9HZ0mtIRVfBTyEOnJMmIbvuCbi++KLOa+jsEtOFH
 xot8ftlqcJRQD5oSOFjBi7LAzGRzxJsMlItbwjNx7pP90dePaAh3VJFGalLtWHX/Rk6/25MIIIQ
 hgvnGsXM/ODxS1FqXLl40YJqe/r0+YzGY48UOWGNuDihY9P3/cg4RhbQmtuVveN1Oz4ap3QDaEN
 x+Q6johoucfQ5yFexV5XjUs9VzCfWCOefLfRFLV/u2zgY5+Ob2YjpQ+B1p4AmTiddeEduUBieyK
 T9TOcWTZ1R4pFX0JnT/TGcJTV+tPJnkd9c6CbeDyzNZxwWAfxHQqDk0RBoseQ/gqGAQJ2/AyhRY
 3QO4vT04ftJz5vg==
X-Developer-Key: i=kurt@linutronix.de; a=openpgp;
 fpr=BCB9BFB2C8C37DD3DFDB5992C193D1F2AA467382
Cc: Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>, Stanislav Fomichev <sdf@google.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v2] net: stmmac: Complete meta data only
	when enabled
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

Currently using plain XDP/ZC sockets on stmmac results in a kernel crash:

|[  255.822584] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
|[...]
|[  255.822764] Call trace:
|[  255.822766]  stmmac_tx_clean.constprop.0+0x848/0xc38

The program counter indicates xsk_tx_metadata_complete(). It works on
compl->tx_timestamp, which is not set by xsk_tx_metadata_to_compl() due to
missing meta data. Therefore, call xsk_tx_metadata_complete() only when
meta data is actually used.

Tested on imx93 without XDP, with XDP and with XDP/ZC.

Fixes: 1347b419318d ("net: stmmac: Add Tx HWTS support to XDP ZC")
Suggested-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Link: https://lore.kernel.org/netdev/87r0h7wg8u.fsf@kurt.kurt.home/
Acked-by: Stanislav Fomichev <sdf@google.com>
Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
---
Changes in v2:
- Add more details to change log (Maciej)
- Link to v1: https://lore.kernel.org/r/20240222-stmmac_xdp-v1-1-e8d2d2b79ff0@linutronix.de
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index e80d77bd9f1f..8b77c0952071 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2672,7 +2672,8 @@ static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue,
 			}
 			if (skb) {
 				stmmac_get_tx_hwtstamp(priv, p, skb);
-			} else {
+			} else if (tx_q->xsk_pool &&
+				   xp_tx_metadata_enabled(tx_q->xsk_pool)) {
 				struct stmmac_xsk_tx_complete tx_compl = {
 					.priv = priv,
 					.desc = p,

---
base-commit: 2a770cdc4382b457ca3d43d03f0f0064f905a0d0
change-id: 20240222-stmmac_xdp-585ebf1680b3

Best regards,
-- 
Kurt Kanzenbach <kurt@linutronix.de>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
