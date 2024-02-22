Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F5285F4D5
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Feb 2024 10:45:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BAF0C6B47A;
	Thu, 22 Feb 2024 09:45:34 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 865B0C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 09:45:32 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1708595131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hDPIpDaJ04CEUJVADkl2USSeO4nobgJA2IAQrE2lwHE=;
 b=MWlwlCPHtPUyElbQv/nVU2F1JnjJPVHNU1v4NMGQVnceTPlYBmk730QRsnUAbF5Bouw0b1
 JTjQUIj4wG4y14dr34p4CO/QwGOtWJ6PeVYq69oTsT7DD5rcXp0utZDgqicu1QLOfnjcR8
 mSjabYhLhcuQnvGjbUCtooPIMWyEwIHQ8eQ3qfvtuhM5tsbrEMp3Oj2+JAv/pvilHPRNyY
 bcb9rCFScggMxDNfgoMIGWC/iFnwLbcxIQ4u7fZO3Bal8PwPMcBbBxQy3Xp3R6skTfo69g
 EXH7K4mZb6MWNLaWMKODzSHY1cIfip3+iZkkA3zWpnjNVD4iSfzXetDZ6nV1og==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1708595131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hDPIpDaJ04CEUJVADkl2USSeO4nobgJA2IAQrE2lwHE=;
 b=MxGKK76kOYzpcuMnnAUCOVbNmESzHb6aCMutTvsQLIIUHJP23j2DIJOSXjviCIuu6cdl1R
 WMZvWpOyK0iyVEAA==
Date: Thu, 22 Feb 2024 10:45:24 +0100
MIME-Version: 1.0
Message-Id: <20240222-stmmac_xdp-v1-1-e8d2d2b79ff0@linutronix.de>
X-B4-Tracking: v=1; b=H4sIALMX12UC/x2N0QqDMAwAf0XyvELN5pD9yhgjrVHz0E6SIoL47
 6s+HsdxOxirsMGr2UF5FZNfrtDeGogz5YmdDJUBPT48IjorKVH8bsPiur7jMLbP3oc71CCQsQt
 KOc5nksgK6ykW5VG26/KGzAU+x/EHwB3qpXoAAAA=
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1670; i=kurt@linutronix.de;
 h=from:subject:message-id; bh=+uP4Aru1jO+hGv9BqKIcoveDNM3YshsEp66xmEqSbno=;
 b=owEBbQKS/ZANAwAKAcGT0fKqRnOCAcsmYgBl1xe5krMQNx7AKgDQ6kfscGrcYyY+wgvhNsbdr
 Kmy6KpDJkCJAjMEAAEKAB0WIQS8ub+yyMN909/bWZLBk9HyqkZzggUCZdcXuQAKCRDBk9HyqkZz
 gtgZD/9wcuhH+3J6snCA+Xn8jYNRSY8o2hCaqYmzqiuZynWNp1AnKnPkyPthIVuAEISiPfb0JBA
 PnX2WzT7WM/dtNW/XlxuEsMvVc4Lm35eIWmmpHJHJ1AUgMeXddxYuahrST726AQU7+QWptGBkEE
 BMOSuJ/rEfWDUZNOR5twXV/O9UoHQ7EAnUIMTOuIwLerhi+lFXwC6wSsGLKmjiS08wUT83BYzlf
 NgQDZy84CxY2fuKV110GB8aRS7pju8paZtZJhL8CFCOcNJ6aq/nZdqV4Fa9H357eIQlqqHLzPOx
 fE1dYu1xPhKErWfn8vQCfLWgz2lHEogDAPHBR8ZFnrSPgbhc9DTBjA9h4E6iO2ybC3i6H7/zWLX
 yCJEG0n7jXeKPS+Zf+DridZyGPdKgyKBcClPaikmc9HBK08EvmegFSHGA1zkiNxjAgt1LKquSJ1
 IUetlz69p/YrVM6Qx9V01sPejfbeFviQRl35RObJWpopx9ug5n8W2ohr6DNszdaxKjE8ju8EJh7
 x35G4bx8HMPRbl68atdLaeStK+15pDdwDPZWAuojghO31sk6u6MuSlQjgMjbKAlEZ7NjyupFlQU
 B1Ayqlho+unvlf49pa5YUCJ8eULvhvw2Eh/8j7YC5nYr2eYRbrHI2kzgSPRJ8k1ccK4RUJ6V9Bh
 91tc+TF+qX/qSKQ==
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
Subject: [Linux-stm32] [PATCH net] net: stmmac: Complete meta data only when
	enabled
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

Currently using XDP/ZC sockets on stmmac results in a kernel crash:

|[  255.822584] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
|[...]
|[  255.822764] Call trace:
|[  255.822766]  stmmac_tx_clean.constprop.0+0x848/0xc38

The program counter indicates xsk_tx_metadata_complete(). However, this
function shouldn't be called unless metadata is actually enabled.

Tested on imx93 without XDP, with XDP and with XDP/ZC.

Fixes: 1347b419318d ("net: stmmac: Add Tx HWTS support to XDP ZC")
Suggested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Link: https://lore.kernel.org/netdev/87r0h7wg8u.fsf@kurt.kurt.home/
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
base-commit: 603ead96582d85903baec2d55f021b8dac5c25d2
change-id: 20240222-stmmac_xdp-585ebf1680b3

Best regards,
-- 
Kurt Kanzenbach <kurt@linutronix.de>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
