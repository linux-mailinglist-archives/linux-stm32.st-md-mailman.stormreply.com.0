Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G7TOlpS6GnlJAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Apr 2026 06:45:14 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED90441FD9
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Apr 2026 06:45:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89C4BC87ECC;
	Wed, 22 Apr 2026 04:45:13 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBF4EC3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2026 04:45:11 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-42c08cbae4cso1952341fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2026 21:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776833110; x=1777437910;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5Cj4omnP69kMXkBuQqesz50Z/3zgQMt+xBhIxIth3BY=;
 b=GZPNuNEbq8dZBoW58aPZ3Q6fKN65tpK9l4kkGflCPJIFCMa9L2nChQYvA95zZ3Xhkt
 PFGOF1E0T7jb1mdUqgcDBmZ3B2SEpjRfim0zSyfL73JgGv+ZTiE0X2eHNJLKgIWrJAR3
 MXSpFgqyHsZV6j1pGDvPlwlCsZQpVGhCMwpfWA8S5z9BltSvbQ72cndEXFI2O7OKuj1U
 3kALBZZ0UqJyLdqHwk89DQjsMgJ1irzH95kfJxArZSZg+vM/nIWLXfbm1ORVRgsB9FXC
 AJBScZ4+PExybBZu+RxeOtDdTSgJUww4u7QAtPnY4lg5SFdI4g2n7R/8DBicI1dXXtzc
 QQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776833110; x=1777437910;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Cj4omnP69kMXkBuQqesz50Z/3zgQMt+xBhIxIth3BY=;
 b=SF4svNT20vjUMwGLsAL3Z+cKbUc9I6QO81iwQEoszy6c+3pK30UPNo5/SPMTej1HFZ
 eC6i5KLF5KZvMi1S5ia/3pTgBAWWFK8GxPc4HAX2i7hmevvZxo/25y1kqiVLa+m+qu6u
 lSgNWh7Igs2Grm7EcVFJ9cr67Hc8ExFcaAsWuhNyfcoy003VtWbXjTDUO6TlrHZGLksI
 iUclFBeikX4c35l5BeAxpZpSa3FMscXk/GxxPYbDHsdQp0sX4Pk2pOLdztmvmXRVbVNb
 DGUJAF6+NUjDlWhfDLRSE6diA900OBxjDXR8r99zePHfXIS/lepvOCqZTtkZnpb+Pxtp
 tHHg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+uMlh11Ldycv09b++TLdAeOIZpQfveuj7tQ7LI/IMSY/q0CZGBJuAHqcTQoMsnndp3+l9EyS74kU/Iaw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw2saGy2qWAT8vnrZZKI8anRHVIgwbR1RooRxJKLzEtdtW+dVOu
 IGrXGmgV6CfXiLw5Y3epUCCkMUi8jnMiGsqjRK5Y43PPsWr8sSpMBjKW
X-Gm-Gg: AeBDies/hO0UHH83yQTtVL42UbHWowadc7DYv2JvalSxInZgMwuW8KJldo05HlA3CAX
 5dK1uXZKcI/HFC5TD2fikNZm3nWHJXySZ7eEnLY+oFkdj0vXZgF2ZsHX0C1n12kRvMhMYvEEVKS
 h1UDciWDP/IEyC0pxFUhAbby5e7hSPrvYtlQg58HwE2Qh37XHRDNzWPcDNt5CxVtYFiZhgMsaT1
 BAQGXCWj9RXLQQ2v5Ag5qggI7VDiKufIg1HT2LdF6ns4Lxa4Ur7odUZY14g1FDoRQUOasGGAHSA
 L65q9xV3W2DEJXuYw5ZFtKI/nsQA3KM2b0iL7222cT8iptDXoW2FnkuquOpznNCikbSladZwwwO
 7FMBfoP5XA0HBLCoO9kD0B3I/S1ZGC2Tww3rxjKzVEXByEQVqz92IWXMfb8QQ75X2JeiDsfTtvO
 dyhW0bhRAZokccKrK8GfwGtxoWTR6+rYQGWOs0Ur9NfUQXmrDG+9to8L89/P1d4n+phJs9Kg==
X-Received: by 2002:a05:6870:82a4:b0:41c:3db:58d8 with SMTP id
 586e51a60fabf-42aded57eccmr12187382fac.29.1776833110389; 
 Tue, 21 Apr 2026 21:45:10 -0700 (PDT)
Received: from localhost (static-23-234-115-121.cust.tzulo.com.
 [23.234.115.121]) by smtp.gmail.com with UTF8SMTPSA id
 586e51a60fabf-42fb269f69bsm2841483fac.12.2026.04.21.21.45.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 21:45:09 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Date: Tue, 21 Apr 2026 21:45:03 -0700
Message-ID: <20260422044503.5349-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Cc: Baruch Siach <baruch@tkos.co.il>, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, stable@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Sam Edwards <CFSworks@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [Linux-stm32] [PATCH net v6] net: stmmac: Prevent NULL deref when
	RX memory exhausted
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:baruch@tkos.co.il,m:linux-kernel@vger.kernel.org,m:linux@armlinux.org.uk,m:vladimir.oltean@nxp.com,m:fancer.lancer@gmail.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:stable@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:peppe.cavallaro@st.com,m:CFSworks@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:andrew@lunn.ch,m:fancerlancer@gmail.com,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[tkos.co.il,vger.kernel.org,armlinux.org.uk,nxp.com,gmail.com,bootlin.com,st.com,st-md-mailman.stormreply.com,lists.infradead.org,renesas.com];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-0.738];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 4ED90441FD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The CPU receives frames from the MAC through conventional DMA: the CPU
allocates buffers for the MAC, then the MAC fills them and returns
ownership to the CPU. For each hardware RX queue, the CPU and MAC
coordinate through a shared ring array of DMA descriptors: one
descriptor per DMA buffer. Each descriptor includes the buffer's
physical address and a status flag ("OWN") indicating which side owns
the buffer: OWN=0 for CPU, OWN=1 for MAC. The CPU is only allowed to set
the flag and the MAC is only allowed to clear it, and both must move
through the ring in sequence: thus the ring is used for both
"submissions" and "completions."

In the stmmac driver, stmmac_rx() bookmarks its position in the ring
with the `cur_rx` index. The main receive loop in that function checks
for rx_descs[cur_rx].own=0, gives the corresponding buffer to the
network stack (NULLing the pointer), and increments `cur_rx` modulo the
ring size. After the loop exits, stmmac_rx_refill(), which bookmarks its
position with `dirty_rx`, allocates fresh buffers and rearms the
descriptors (setting OWN=1). If it fails any allocation, it simply stops
early (leaving OWN=0) and will retry where it left off when next called.

This means descriptors have a three-stage lifecycle (terms my own):
- `empty` (OWN=1, buffer valid)
- `full` (OWN=0, buffer valid and populated)
- `dirty` (OWN=0, buffer NULL)

But because stmmac_rx() only checks OWN, it confuses `full`/`dirty`. In
the past (see 'Fixes:'), there was a bug where the loop could cycle
`cur_rx` all the way back to the first descriptor it dirtied, resulting
in a NULL dereference when mistaken for `full`. The aforementioned
commit resolved that *specific* failure by capping the loop's iteration
limit at `dma_rx_size - 1`, but this is only a partial fix: if the
previous stmmac_rx_refill() didn't complete, then there are leftover
`dirty` descriptors that the loop might encounter without needing to
cycle fully around. The current code therefore panics (see 'Closes:')
when stmmac_rx_refill() is memory-starved long enough for `cur_rx` to
catch up to `dirty_rx`.

Fix this by explicitly checking, before advancing `cur_rx`, if the next
entry is dirty; exit the loop if so. This prevents processing of the
final, used descriptor until stmmac_rx_refill() succeeds, but
fully prevents the `cur_rx == dirty_rx` ambiguity as the previous bugfix
intended: so remove the clamp as well. Since stmmac_rx_zc() is a
copy-paste-and-tweak of stmmac_rx() and the code structure is identical,
any fix to stmmac_rx() will also need a corresponding fix for
stmmac_rx_zc(). Therefore, apply the same check there.

In stmmac_rx() (not stmmac_rx_zc()), a related bug remains: after the
MAC sets OWN=0 on the final descriptor, it will be unable to send any
further DMA-complete IRQs until it's given more `empty` descriptors.
Currently, the driver simply *hopes* that the next stmmac_rx_refill()
succeeds, risking an indefinite stall of the receive process if not. But
this is not a regression, so it can be addressed in a future change.

Fixes: b6cb4541853c7 ("net: stmmac: avoid rx queue overrun")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221010
Cc: stable@vger.kernel.org
Suggested-by: Russell King <linux@armlinux.org.uk>
Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---

This is v6 of [1], which was itself split out of [2]. This patch prevents a
NULL dereference in the stmmac receive path, and (at Russell's suggestion) in
the zero-copy path as well.

The approach is different from the previous version and checks the dirty_rx
index in the loop proper, copied directly from Russell's suggestion [3]. Parts
of the commit message also use his phrasing. For these reasons he is credited
with `Suggested-by`.

The commit message now acknowledges the pipeline stall that can occur in case
of failure of the next stmmac_rx_refill() after the MAC consumes the final
descriptor. I still intend to fix that bug when I can find the time to finish
investigating and implement the timer as requested by Jakub, however I'm
sending this patch now to resolve the outright _panic_ and simplify review.
The stmmac_rx_zc() path is not affected by this stall.

[1] https://lore.kernel.org/netdev/20260415023947.7627-1-CFSworks@gmail.com/
[2] https://lore.kernel.org/netdev/20260401041929.12392-1-CFSworks@gmail.com/
[3] https://lore.kernel.org/netdev/ad-LAB08-_rpmMzK@shell.armlinux.org.uk/

---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ca68248dbc78..3591755ea30b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5549,9 +5549,12 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 			break;
 
 		/* Prefetch the next RX descriptor */
-		rx_q->cur_rx = STMMAC_NEXT_ENTRY(rx_q->cur_rx,
-						priv->dma_conf.dma_rx_size);
-		next_entry = rx_q->cur_rx;
+		next_entry = STMMAC_NEXT_ENTRY(rx_q->cur_rx,
+					       priv->dma_conf.dma_rx_size);
+		if (unlikely(next_entry == rx_q->dirty_rx))
+			break;
+
+		rx_q->cur_rx = next_entry;
 
 		np = stmmac_get_rx_desc(priv, rx_q, next_entry);
 
@@ -5686,7 +5689,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 	dma_dir = page_pool_get_dma_dir(rx_q->page_pool);
 	bufsz = DIV_ROUND_UP(priv->dma_conf.dma_buf_sz, PAGE_SIZE) * PAGE_SIZE;
-	limit = min(priv->dma_conf.dma_rx_size - 1, (unsigned int)limit);
 
 	if (netif_msg_rx_status(priv)) {
 		void *rx_head = stmmac_get_rx_desc(priv, rx_q, 0);
@@ -5733,9 +5735,12 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		if (unlikely(status & dma_own))
 			break;
 
-		rx_q->cur_rx = STMMAC_NEXT_ENTRY(rx_q->cur_rx,
-						priv->dma_conf.dma_rx_size);
-		next_entry = rx_q->cur_rx;
+		next_entry = STMMAC_NEXT_ENTRY(rx_q->cur_rx,
+					       priv->dma_conf.dma_rx_size);
+		if (unlikely(next_entry == rx_q->dirty_rx))
+			break;
+
+		rx_q->cur_rx = next_entry;
 
 		np = stmmac_get_rx_desc(priv, rx_q, next_entry);
 
-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
