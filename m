Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jcOGGGYPymmX4wUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 07:51:34 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C398B355BBE
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 07:51:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC7E2C8F293;
	Mon, 30 Mar 2026 05:51:32 +0000 (UTC)
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 705A9C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 19:13:04 +0000 (UTC)
Received: by mail-dl1-f42.google.com with SMTP id
 a92af1059eb24-128b9b7e3edso571801c88.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 12:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774725183; x=1775329983;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nV0vTDjXno/BRjs9UsVyAooL1Z9SQRTeEW/NqAyKUfY=;
 b=W+neVhxkoLVrHIoHMBHxiAvYpGQCj2yHHfjWIor3Gmye1f9sBv2tbnkVob9ga58JOX
 DMDgsdPgKj1BVty29CBl7Ybf/P4/VUKh8h1T3CoY79D0YMl8HjDswc8cfzCE76WviMxq
 /W/3p2xKOZyPbxhFmVwqmBT7VwjOrTQPOdduB9tqUPeun64YUv9QJfZ3m17U3JrXRzMH
 vRSdydoyMdUoOwwGScKIUMjSgWrifHOwq/u32s28xcqqZP+Pxu2hs+ad3HjI4BS6brNG
 VSr0pGnTZ+0Ww1O4fJux0N+ZDrdlNReno4RDz9P2UMLp8GIBIaqCu2A04QSt6ZitBquX
 SYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774725183; x=1775329983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nV0vTDjXno/BRjs9UsVyAooL1Z9SQRTeEW/NqAyKUfY=;
 b=n/GWsGgwGchZJRI8CSoQrtHHbfPnnKaRvXNFNR/zTiMEub3juY6qgKyUOuI5Hv6i3p
 9UN941OZv1Sm5OP9bwU+5L0T3f15R7/K2WqlJwUAN6zDckAMEY3AdPQvZ59RaOjJILik
 fygEsHC1T186QYBc2nU/G0FDPwxmeCSy421KD3ExG1KCXwaUWbsE33IrsIvWRDBOvGkq
 JMpaDcUhOv2YuUzsqb/dW3fk9ry+Gb15/9Mv2UiAb0jI4BHU5/bS2NIM6F1j3te+znJ8
 aLFk1X/m3U7uoIX3Kbc1qWK4rQhH9pP7u8HmA7CEhWxbQH7DrrT+RY+/cMSDdJZB/Sdy
 2szg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJZjpngM4WZ7AVM3KARJzeXMfKf/7P2OgqogBKYggbiC/w/oTX9TfImNCFynbFcwTksKtXBiKyMYmdqg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxRxjCtnLd2oslMaijeQELYk6jGUYxVBcP/gZcVuxYc7mC3WGm7
 DycqJwsR8y2cZab/wXlr9b7/JuVrj76bl+pp8dLydenMUYsgzbWM7hYh+6VjiWTe
X-Gm-Gg: ATEYQzyYy4ToDMSV0wYOGlaNP7kJgoftcP/n6Fe6rAw/a1Pp0MusaEHgD8q4otVcay+
 Wko/OaiTFMqtFZJ/3FloCTAtO+QmhkfiYEy/WSGggUDG8lFPhVfFsMl9dbChsjAC8dAPe53SpDH
 8sIn84ePO3LKIgt7lPp0luVqJbowEfrUnaBDrRSFZkRQShf7h0ViECXGSZblDQ/2+7NEr+cc29C
 bWHlAk3g3MVNVSBNklUzvszQCJdqfH9pobsILWOdCXkeZzs8h88c2mdLc0QWDfZTvg4ktzQfAiZ
 3E+s/wbPLfglxMtbBPRUrxvVDObYlvo9N6JnGMxYCXlswz9EYa3oTnwFDGvksmNxxo48y7VCd2V
 CRrbvTO9H6KtkhE2Lohc8yW62erMpvvirlIXAHh3dEXKYchiG4HtHKijQvz9VCuhoPuotIAsDJl
 tYxl8CwNAcycUbYqwNhcHV5yXMSjbCjQGFMmkwoFR+lfAPB3cu0JM9q3YS
X-Received: by 2002:a05:7022:f102:b0:11d:fd26:234e with SMTP id
 a92af1059eb24-12ab28cdebbmr4140608c88.16.1774725182824; 
 Sat, 28 Mar 2026 12:13:02 -0700 (PDT)
Received: from localhost (static-23-234-93-211.cust.tzulo.com. [23.234.93.211])
 by smtp.gmail.com with UTF8SMTPSA id
 a92af1059eb24-12abbe21787sm2071517c88.11.2026.03.28.12.13.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Mar 2026 12:13:02 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Date: Sat, 28 Mar 2026 12:12:33 -0700
Message-ID: <20260328191233.519950-3-CFSworks@gmail.com>
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
Subject: [Linux-stm32] [PATCH v3 2/2] net: stmmac: Prevent indefinite RX
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
	NEURAL_SPAM(0.00)[0.999];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C398B355BBE
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

Fix this by checking stmmac_rx_dirty(): it will return 0 if
stmmac_rx_refill() fully succeeded and we can safely await an interrupt.
Any nonzero value means some allocations failed, in which case we risk
dropping frames if a large traffic burst exhausts the surviving
non-dirties. Therefore, simply return the full budget (to keep polling)
until all allocations succeed.

Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")
Cc: stable@vger.kernel.org
Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f98b070073c0..81f764352f3d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5604,6 +5604,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	unsigned int desc_size;
 	struct sk_buff *skb = NULL;
 	struct stmmac_xdp_buff ctx;
+	int budget = limit;
 	int xdp_status = 0;
 	int bufsz;
 
@@ -5870,6 +5871,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	priv->xstats.rx_dropped += rx_dropped;
 	priv->xstats.rx_errors += rx_errors;
 
+	/* If stmmac_rx_refill() failed, keep trying until it doesn't. */
+	if (unlikely(stmmac_rx_dirty(priv, queue) > 0))
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
