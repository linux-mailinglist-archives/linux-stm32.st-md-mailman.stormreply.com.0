Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AG8ZGGYPymmL4gUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 07:51:34 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C47D7355BC0
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 07:51:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEF51C8F291;
	Mon, 30 Mar 2026 05:51:32 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90380C8F289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 19:13:00 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-2c179d4e1a9so4031178eec.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 12:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774725179; x=1775329979;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FLw+KspfNI17fHokU2DyOGE90apcIrKC40CCDarAeuo=;
 b=mysHpT1qxEeDd2vAbpE4LiZQGK2+sKxrEMqaDb96KOn6x/M/1ZWk+CTLdCBhloW7dZ
 UBLkU7L4q1ttOy6a/6pGWNZC3ZOBx0W4j73Nm/rbRjmXqLCz/TsWKrkUMF07n2CmB5Lp
 3M/4FTbyStUGCDkmSyhXi9RfRdJ+cmAs9k/Kl5BEz8Ky63KqvpuLs9Py/MfDfDQ3p8en
 /zCMrmsCDVFuqAamfvOeVWKkNAoPy7h6iy22fWqFtvp6r7491WPjQ99YR2Clg6pMEuWw
 CIFyiszYplEQJ3Qaev4qVcYt87rdw29RDxY6Q1icLfavzrpfhdPU6pOHnEBBN5W84tR7
 VnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774725179; x=1775329979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FLw+KspfNI17fHokU2DyOGE90apcIrKC40CCDarAeuo=;
 b=lqrsZga6HP1zY3hujQpY723tkRUi546ngSNURa540zOxyt/98PRsEIJUa9WAcVTjj1
 xaZgLWCCAAxkOanp6cp6E7KcmzskWkMNIBBliL35VpVMsIRu61liM6wlEQ2zjtzHrXFF
 iEf3ho5FYQ2s4YqRI6bZCBVzuliR48mumPxuQizH9t7hcjZZHIMngBgzY5qyAARNKv2/
 B3izeX2Y/f2wbqMX0KUtKEPvBefIVJRLWNg1Kd5pTFa1x7Ws9ro0KSMVjVAOqETFGmjA
 jUrImerMcnvER8jjV+A5cUmxkHQ+/4xSu7g7ngfLfWsnToDy06N7SqcA7xKiFMAFHbQ/
 Ry7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmHusCMHHKkv2vU6gO18I3iJvBZ1IPo0SIbC3TGuPet4USSNWoD4GHgLXJFZ7OJW8yfct1b5FLjcq5Qw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz9l6JJfgOTLFGYu5VW6Hw84JAE53+NksiXMtCDzLdW3bdrwL46
 Dpvrto5ZCQhBmNnF7AoNIcJTOFWNps3wfv4vQsCBlwqg4t4JDJO8Y2JK
X-Gm-Gg: ATEYQzx7SfbUCFHz1xpW2Ix/UFVYGByvuCLGyhO/jhjiYOXaLJgDt//hKw5mhVPQzK7
 6m6qSDjomgot4IYGIpQx8SMwi50rkhRdZ/iitJsWhtamrD5RLrLhIkmrVZ37b08Vsg4j5/XDExV
 QHpcQelZE44TH3exDvoHqftkYsRChVJpL3cCt1Fx6u31ceV2UWr+hyts60l8RoRn7maNltnnliE
 amvpmcFf+g4r+O//KQ93Moq93xccsTAXsld2FNdYcwf6zr94QPjNldtWuzxttAdd1ENJ98WYjzp
 dMFXLkcE2cggG29pYRz3D9/idqKtZ8mEi4mCrT5l05aHnwYd0HJdsg+AOL6VE2bw+fruAdJDYxQ
 BHTzFb2Z3Er1v5EVuLHE0MHwbksIJAiDf+ieDdYYrECyGLOJUgIeJ3G7xO57hhyUrq4TKKDgb+x
 GF749ntTDaSf+5jvCaqJQFkKoXiT4KNY+YY2FUgsTYeaFi8sRxBuR+de0L
X-Received: by 2002:a05:7300:7fa4:b0:2c1:67e1:61c4 with SMTP id
 5a478bee46e88-2c185ce8740mr4319411eec.5.1774725178830; 
 Sat, 28 Mar 2026 12:12:58 -0700 (PDT)
Received: from localhost (static-23-234-93-211.cust.tzulo.com. [23.234.93.211])
 by smtp.gmail.com with UTF8SMTPSA id
 5a478bee46e88-2c3c68b2721sm2508384eec.14.2026.03.28.12.12.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Mar 2026 12:12:58 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Date: Sat, 28 Mar 2026 12:12:32 -0700
Message-ID: <20260328191233.519950-2-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260328191233.519950-1-CFSworks@gmail.com>
References: <20260328191233.519950-1-CFSworks@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2026 05:51:31 +0000
Cc: Baruch Siach <baruch@tkos.co.il>, linux-kernel@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, stable@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Sam Edwards <CFSworks@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [Linux-stm32] [PATCH v3 1/2] net: stmmac: Prevent NULL deref when
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
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[34];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:baruch@tkos.co.il,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:fancer.lancer@gmail.com,m:rmk+kernel@armlinux.org.uk,m:stable@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:peppe.cavallaro@st.com,m:CFSworks@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:andrew@lunn.ch,m:fancerlancer@gmail.com,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[tkos.co.il,vger.kernel.org,nxp.com,gmail.com,armlinux.org.uk,st.com,st-md-mailman.stormreply.com,lists.infradead.org,renesas.com];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.993];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C47D7355BC0
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
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6827c99bde8c..f98b070073c0 100644
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
