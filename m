Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wB6JH4L63mmzNAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 04:40:02 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1913D3FFCF1
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 04:40:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7E44C58D7A;
	Wed, 15 Apr 2026 02:39:54 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B898EC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 02:39:53 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-7dbb6c072f1so5794237a34.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 19:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776220792; x=1776825592;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/4pZEJvuS7ozDbMvLtLQ4Yf4fNz+jgNzCYp57Or0UAE=;
 b=IcLlPdiXrjtbCiw6517ffNhb3aevT+9hHvVRN70RkL4Ny5BBrQ9pX7crqGI0+P815x
 lWqloByKsAqCMLs1nK9B659BbwDJH7YSstj1kHMZDculDsDO5Kqq3H3Gq132f3FbkOl8
 dNB7wditTytSfaqCnQkD0YgzOEMvrLFiSyPPj3xkrp1fY5KqyC8D7RYMBn/mUs2YMn/e
 cO4kGAH6pBH4tZ3rz+ed1xGTrmVgw/YEvnL39qNxyP2bPXsj+w4MzketSDzrU+zEtRtu
 grYKtzKDboeh+6WBjJ/X5y5AK09Gcr3wHIpNNsvkUsKhIrlGiLUf46ToiprjndzdlnpB
 nrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776220792; x=1776825592;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/4pZEJvuS7ozDbMvLtLQ4Yf4fNz+jgNzCYp57Or0UAE=;
 b=OVmyQ4lkOkCt8oeLpYW8zo2rzx9pj6Lb02NTCD+987IxIBcFkS2XMYQGXdNJK7/eRI
 hCOzY8pirV05fbFtv/SVklVfrNUXGkPd/kh+p0XbXAcXfCDwV+fd6w6kBXr1e2hhQf25
 UyccMmvDIROsyB+p9PapC3w5eEGGP3gtYPjLTbTbj8pEBug3n7V6KzwKz1ve5HzDtOBN
 xtMewIZz41y8WQ6PH826l6COcfAZzATj74WZcO0Ju9vaXX0AusT4vOt1bdSzt4qhgBI5
 LOkJrdHTn2SAtsFxOlV+o078ZCtaxT/7CuVZzDQLt5NHjuW5lhedW8pbaUzUuuf77uQr
 sQiA==
X-Forwarded-Encrypted: i=1;
 AFNElJ96+NdAeXYhWg17brySIuFgTpaQYqtlnPVgwyySSUvxTm9DOFXsBlrT+hsTnyZtRPM0YKfIqpVz5mljtQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzLHiQHKQQ0U3kj9ixp30/Rls4pR1/ueROErFc4a1QG6MWAmRTx
 HeuEV9F/ippo+niPo9B7O0RxPA9yz5XDhygAFzjrcK6DGGmhDvjobmd9
X-Gm-Gg: AeBDiete+DjxZbbGrNRce7ayC482wOXxPEvQN8cU1I9F6GNy11uss+pm0ul9Mez6uA3
 Vi50pSWOyO7dBBlO1UPN7WO7mhzrAODqi8k5Re7MXA1ZSmWE9CR2h6lbiOiwHuT4eFK3ytPH2CN
 WZ3SZWEGoQ+q5EgOjOm5edfh4rEKh0LmuLIzmiHa/u43dFU3ZqysXdIwhxqc0wTKU8PwFrvr/cE
 tgWE+Z8hbak/zFHNVHDoZAdl7GzOR5kp83QEwlhhfyiy48TIdfvS57x0cIZaa0azFfIdHGL9bMj
 1h+BJ16VBjfGA7Nw7DXt7ygm6roEg1VQufhtP7tW5Ws9BACRjMrGC6BcMlv8qi4bdbzmr33+hiu
 r//BXihC2g3rrvsKIL06xC/3dcryxrmazdPGXEXbgFpc3d1mVSenLocRqTqECVd8AedP1BkdKzz
 E664ECjAiyNSrEeiwPVYi7J2oVqCLjYwFBd3hwnY4S6TPTYLVIgeP06qOBYTLwmydtA8VMLg==
X-Received: by 2002:a05:6830:25c5:b0:7d9:f50f:96cf with SMTP id
 46e09a7af769-7dc27c6632amr11719357a34.6.1776220792258; 
 Tue, 14 Apr 2026 19:39:52 -0700 (PDT)
Received: from localhost (static-23-234-115-121.cust.tzulo.com.
 [23.234.115.121]) by smtp.gmail.com with UTF8SMTPSA id
 46e09a7af769-7dc76a333e8sm406838a34.8.2026.04.14.19.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2026 19:39:51 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Date: Tue, 14 Apr 2026 19:39:47 -0700
Message-ID: <20260415023947.7627-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Cc: Baruch Siach <baruch@tkos.co.il>, linux-kernel@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, stable@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Sam Edwards <CFSworks@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [Linux-stm32] [PATCH net v5] net: stmmac: Prevent NULL deref when
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:baruch@tkos.co.il,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:fancer.lancer@gmail.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:stable@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:peppe.cavallaro@st.com,m:CFSworks@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:andrew@lunn.ch,m:fancerlancer@gmail.com,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[tkos.co.il,vger.kernel.org,nxp.com,gmail.com,bootlin.com,armlinux.org.uk,st.com,st-md-mailman.stormreply.com,lists.infradead.org,renesas.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.652];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 1913D3FFCF1
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

Fix this by further tightening the clamp from `dma_rx_size - 1` to
`dma_rx_size - stmmac_rx_dirty() - 1`, subtracting any remnant dirty
entries and limiting the loop so that `cur_rx` cannot catch back up to
`dirty_rx`. This carries no risk of arithmetic underflow: since the
maximum possible return value of stmmac_rx_dirty() is `dma_rx_size - 1`,
the worst the clamp can do is prevent the loop from running at all.

Fixes: b6cb4541853c7 ("net: stmmac: avoid rx queue overrun")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221010
Cc: stable@vger.kernel.org
Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---

Hi list,

This is a single patch broken out of [1]. The second patch in that series,
which proactively refills the RX ring buffer when memory is low, still has some
unresolved feedback: it should use a timer to avoid nuisance polling while the
system is suffering OOM.

Further discussion makes me wonder whether that second patch should even be
threshold-triggered at all, or if it should be a handler for the RBU
("Receive Buffer Unavailable") interrupt instead.

So, while that patch is back at the drawing board, I am submitting this one
(which is higher-priority as it resolves a *panic*) separately.

Regards,
Sam

[1] https://lore.kernel.org/all/20260401041929.12392-1-CFSworks@gmail.com/

---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 13d3cac056be..fc11f75f7dc0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5609,7 +5609,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 	dma_dir = page_pool_get_dma_dir(rx_q->page_pool);
 	bufsz = DIV_ROUND_UP(priv->dma_conf.dma_buf_sz, PAGE_SIZE) * PAGE_SIZE;
-	limit = min(priv->dma_conf.dma_rx_size - 1, (unsigned int)limit);
+	limit = min(priv->dma_conf.dma_rx_size - stmmac_rx_dirty(priv, queue) - 1,
+		    (unsigned int)limit);
 
 	if (netif_msg_rx_status(priv)) {
 		void *rx_head;
-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
