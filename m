Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFZAHuOczGkDUgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Apr 2026 06:19:47 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7373749D3
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Apr 2026 06:19:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19655C8F27F;
	Wed,  1 Apr 2026 04:19:47 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CBD5C87EBD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2026 04:19:46 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-7d7c77fd31cso5973944a34.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 21:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775017185; x=1775621985;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p8Gs/LCy7pdaKThZ7lAOXGPZaybDiCKVdDXO7zMbjMs=;
 b=fMjCgoPqVNRH+Ky+bdD3ABhQqUxsIgvI8TjwhQpCjzpJvXWVYHf5idpttVacU8D7qg
 gw0JI5NxwfRvZ01Cp153EzzkF9Jhe6se1BUqykrVjgUn4JlCv2tiyOpdcfG5lcL29hCb
 P3Cf6K+mP1yaRTvk5uOCIjm6O2vxEFgGWzHP2knipWI4JotsxprWlGbhk81HIxpTWW2k
 X8wVL0zm7uZHPsaQnTetSTqTBteNTYyB1XVqxVsD8Y21mibz5+zBbH1dOvJhohB/nJCD
 p9UNhoe8m5tbJtr219GcFZa2nMLkH8QgMHcangTibMcelQMsiWuAhjjo4PhdQKYLCQP9
 zO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775017185; x=1775621985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p8Gs/LCy7pdaKThZ7lAOXGPZaybDiCKVdDXO7zMbjMs=;
 b=X5RMInFKFGm86Y9V4Nv1WohDxdh/r7QvdJV3j7iRFOsvDCXDNABB+q8URdD3R2NMKw
 ALL1Od5d3voitkasDGv5niRvg8ZCzL8ty8wj7wauNO7dH/1pqVsyZron5aeNsJGEzcjB
 /IHOAQ61s0Gm3QP5oNsxyNsdasVsI6vSGbjuJ/zhIAXMlsFOOhCDTOkpmO2dfaV2dHO3
 OBWYxnty2eD64pT9OaKsFOXsO09bjwKMTQSWiOqZmqh5vQrUaA2rEirTBKhLcFuZMoZJ
 kucvNRh7a8JCeZPmJ//F1k4o00CSFAzdjS7wcV0RfHDelv9UcNMyREzQ7bEiJredEt4I
 lsvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrd2AEL2S2clAI52fA7RKqzWVJtV/pn6nhbnrc2/dYTE1JUgNNGUIpNylxMO6+1FObnZ7VU+ZC1oBfkw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyuzJKHPwjNlofmBxqLrWSTklGx772K8i9JpMaEvEHxcmGpsnpU
 6dlkrwGWhYZgHJwQ/Fs4m+O0zSkZqWyM4XTM+HI7xIIqMADAqQaaGxgW
X-Gm-Gg: ATEYQzyanqgXZOf9JYaofGYB7FnlTHahyht87aqsP3K0VkNB8qLiXs6L+Ocjg3C29oP
 kjsLhNVkboHn8jqV44p0h7qjTqZy7+YOFII8d+JV/XWoow0k84RLgKW7RaeCIvJPBb5YKIUzLEF
 nHSq38N38W9qpEtwgei7COJCEFLMmaZqxF8ZMGldnidjn0eQBJNApKnj3tSD7+RInFsV1K72JV8
 lbdYWiOVg/gv3rNV+XDm1vKY++hhhubTpz5AsAl+LSCnAzu4DPzt+jF5WR0hzf+6gL/nI3OrUTL
 oYbTt6oOgGKXXzs2YPNnd9fUy1nSHXoLp0Ij9THsWkuHdWVdEJTgdiaiAagQ4ankewG9ySZ7Hjy
 pSzx+EN5C65mRtgOLRkiU84vteL3Gsndw+f7R2SgjtrcGNyvqcM6oufUYBOAhIc4EyDzZD/nshr
 tWxWtatJRb/TMzMs9TuUY3uN+pmpNF0x2B+SveO4uTqJQBMCMXd6JyU3tEUxU=
X-Received: by 2002:a05:6830:3709:b0:7c7:69c8:2d2 with SMTP id
 46e09a7af769-7db9925b999mr1505891a34.13.1775017185265; 
 Tue, 31 Mar 2026 21:19:45 -0700 (PDT)
Received: from localhost (static-23-234-115-121.cust.tzulo.com.
 [23.234.115.121]) by smtp.gmail.com with UTF8SMTPSA id
 46e09a7af769-7da0a7b5b41sm9925868a34.15.2026.03.31.21.19.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 21:19:44 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Date: Tue, 31 Mar 2026 21:19:29 -0700
Message-ID: <20260401041929.12392-3-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260401041929.12392-1-CFSworks@gmail.com>
References: <20260401041929.12392-1-CFSworks@gmail.com>
MIME-Version: 1.0
Cc: Baruch Siach <baruch@tkos.co.il>, linux-kernel@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, stable@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Sam Edwards <CFSworks@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [Linux-stm32] [PATCH net v4 2/2] net: stmmac: Prevent indefinite RX
	stall on buffer exhaustion
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:baruch@tkos.co.il,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:fancer.lancer@gmail.com,m:rmk+kernel@armlinux.org.uk,m:stable@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:peppe.cavallaro@st.com,m:CFSworks@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:andrew@lunn.ch,m:fancerlancer@gmail.com,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[tkos.co.il,vger.kernel.org,nxp.com,gmail.com,armlinux.org.uk,st.com,st-md-mailman.stormreply.com,lists.infradead.org,renesas.com];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 5C7373749D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The stmmac driver handles interrupts in the usual NAPI way: an interrupt
arrives, the NAPI instance is scheduled and interrupts are masked, and
the actual work occurs in the NAPI polling function. Once no further
work remains, interrupts are unmasked and the NAPI instance is put to
sleep to await a future interrupt. In the receive case, the MAC only
sends the interrupt when a DMA operation completes; thus the driver must
make sure a usable RX DMA descriptor exists before expecting a future
interrupt.

The main receive loop in stmmac_rx() exits under one of 3 conditions:
1) It encounters a DMA descriptor with OWN=1, indicating that no further
   pending data exists. The MAC will use this descriptor for the next
   RX DMA operation, so the driver can expect a future interrupt.
2) It exhausts the NAPI budget. In this case, the driver doesn't know
   whether the MAC has any usable DMA descriptors. But when the driver
   consumes its full budget, that signals NAPI to keep polling, so the
   question is moot.
3) It runs out of (non-dirty) descriptors in the RX ring. In this case,
   the MAC will only have a usable descriptor if stmmac_rx_refill()
   succeeds (at least partially).

Currently, stmmac_rx() lacks any check against scenario #3 and
stmmac_rx_refill() failing: it will stop NAPI polling and unmask
interrupts to await an interrupt that will never arrive, stalling the
receive pipeline indefinitely.

Also: even if not all descriptors are dirty, letting them accumulate
risks dropping frames in the next incoming traffic burst, if large
enough to exhaust the remaining valid ones.

Fix both of these problems by checking stmmac_rx_dirty() before return:
Use the same threshold as the zero-copy path (STMMAC_RX_FILL_BATCH) for
an unacceptably high number of neglected dirties, and tell NAPI to keep
polling (i.e. return budget) when that threshold is met.

Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")
Cc: stable@vger.kernel.org
Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fc11f75f7dc0..6822ca27cb0f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5604,6 +5604,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	unsigned int desc_size;
 	struct sk_buff *skb = NULL;
 	struct stmmac_xdp_buff ctx;
+	int budget = limit;
 	int xdp_status = 0;
 	int bufsz;
 
@@ -5870,6 +5871,14 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	priv->xstats.rx_dropped += rx_dropped;
 	priv->xstats.rx_errors += rx_errors;
 
+	/* stmmac_rx_refill() may fail, leaving some dirty entries behind.
+	 * A few is OK, but if it gets out of hand, we risk dropping frames
+	 * in the next traffic burst; in the worst case (100% dirty) we won't
+	 * even receive any future "DMA completed" interrupts.
+	 */
+	if (unlikely(stmmac_rx_dirty(priv, queue) >= STMMAC_RX_FILL_BATCH))
+		return budget;
+
 	return count;
 }
 
-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
