Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Eg0mCFDVS2pYbAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 18:18:24 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA67713204
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 18:18:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=riscstar-com.20251104.gappssmtp.com header.s=20251104 header.b=WpwBzGSj;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=riscstar.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42C43C8F273;
	Mon,  6 Jul 2026 16:18:23 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07F1EC7BF8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2026 16:18:21 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4758bd3731bso2248116f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 09:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783354701; x=1783959501;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tfbCqchrlviXWCGPv/jztbOY6XLQs0x4v6xEVILnr0I=;
 b=WpwBzGSjy180BmCwHK1bEdobXAeQZ7RneG0DMGkhnFi5akGQp5f+5LrpLSMJKjrKeQ
 HWEgRX59kCpYwceREegS/MZo+uvcBvGx+1RRR2fbGkpHyA2Q8bTFJqu9ekp7UAHKwuq3
 BES6GNXjYqTjlxG2Qkp2mai0yKZ2OBDMAmYO9xghlGxF+6y0ydN77FBISLu4HWo5XFFU
 6uqOlM2cOi07rl/HNBh+NfgD+hVEKLch9XM9QIkJv0Zu/OMq248EWz+7srvmiBapi8JO
 +oBgsVVU3+Si5d3nsDLwupLuV+xdSTauw0KQOMTx6yAXGCx1IJ4cbvtu0XtOmwkm+yQ9
 sS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783354701; x=1783959501;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tfbCqchrlviXWCGPv/jztbOY6XLQs0x4v6xEVILnr0I=;
 b=qeuM/lL6FHULLk43jeLEQg0dGoLRysofeWDPAQS/lKMItbz34PQC7TlT5P0AQGQDgY
 xJPqj7V6f1/9IaSg83187dZRE1xPKmGB7XYlzDlHZpWsW29ApAq0/r05MXfYQqAJWJRL
 MpG8/SUZHX0tM4nHIUfYCs9qBctWojKPJcPW61oi9D7ACaH7+H4lZE0BKnFFRbeAgVpP
 TQovBep8SwzNETp4qjtZadxrjuRj44aqvFOgEVOAs012R90/jSfgMJVIP2t4Qw2Np6S/
 Pdg+y5YQeoFDSYVYaRCP/xDHukazAvUGbMrWA2GWM74QigmApNWBYPcvylT/3MHJP3Ux
 j+VQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpvIwMixsLObaXYgUwZo4G5byIA6pPcilZDzjka6DlHHfMEvFhFS6DW5QhFzW20O+UduPEWkqSvUb4EWg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyD6iN8XEd6wEgw53qaRdMUsFrU51sUGSIvaXJfRZ+cjBQIqNqf
 wABGym9Tu6vmEwIgUNlcLLtacSRQq/Ak14LD2P5kc49S2zlavbS/Z14BwgWmyyFsJYg=
X-Gm-Gg: AfdE7cmqLngqEFo4MQiQxk4ZPZlzgdTCqLCjnWvVGRW1sA9R0TYyZdV0eaOBCQVfuwr
 WB1TnZedXIKE7xTpCr/LVol3XfpX7HBYgtL+LREOlp18Pd1znK6seidJaVEfyx9D18fTz+i4e8L
 +gm66+UEPkbDpXUJKze1FS5YLH8VaO8hrL8VXUWNj6INifYN90tdbTTZ9XkJyE3ci1CnZkeKN6t
 OK8xPU5CPsVMz1GofWZwEII+Uq2NUIAnqPpLIlKt0pBHfQ4M1pXvuF1kcgxFZC1GmK78ambZpDm
 F858IIq5FVqUonhLQRVvQV73v3Z3p8j4jZnaGyZIR418KiMrQstYGh21kwcx1aUIXp+mwDqsrAq
 saiA1Kf/kGGJHRsC+lCZt31mQS7xZ4/427zPSPVzmJVDf14ZsDKW6EwxmnsK0FdsLSN37UGLKPU
 XWHjHMop553kEj6MiPWJEpAZi6Uv/HoXsy6B8oDPw4Xx4DuY74HEs3FNOKfVtMl3Gs79mI+7RUC
 JLTCWiG9KlrGPrtAmGADYMA7BMhrD/SqEcXnw4Y+2Y/Sjs0/rFsfsgPTA6Wzy7i/W5xV2CPGA==
X-Received: by 2002:a5d:6f06:0:b0:460:d18:865c with SMTP id
 ffacd0b85a97d-479343d1d48mr18732847f8f.1.1783354700990; 
 Mon, 06 Jul 2026 09:18:20 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47ad69519c2sm27210959f8f.37.2026.07.06.09.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 09:18:20 -0700 (PDT)
From: Daniel Thompson <daniel@riscstar.com>
Date: Mon, 06 Jul 2026 17:17:58 +0100
MIME-Version: 1.0
Message-Id: <20260706-tc956x-stmmac-no_irq_teardown-v1-1-df009d0272bf@riscstar.com>
X-B4-Tracking: v=1; b=H4sIADXVS2oC/x3MQQqDMBAAwK/Inl2IAaPpV0QkjWu7B5O6CVYQ/
 27wOJc5IZEwJXhVJwjtnDiGgqauwH9d+BDyXAxaaaM6ZTB725oDU15X5zHEiWWbMjmZ4z9g77r
 W6rddet9AOX5CCx/PP4zXdQO0r0DCbwAAAA==
X-Change-ID: 20260706-tc956x-stmmac-no_irq_teardown-8a7592b9f8c1
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5016; i=daniel@riscstar.com;
 h=from:subject:message-id; bh=ouoDiKxWTnKt6awRW6bwvPT2mUd8MHBQltXVbya7+3Y=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBqS9U84VEoQ7ihoE0hX+1OTuNAmOcBS548F96qN
 5yoLvilNcCJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCakvVPAAKCRB84yVdOfeI
 oZRjD/4loyK8Dfw5UMFNwkUH9J6/cduTpTFyaslQOTZJTESnRVyseHrhkeVw7cHf3Fi6SVgNmiG
 5yiOYnCAl2WRYSqjGDED6k0mI8ZSVLsz7XS0yFVoke/YtvpQFMAzF/OwWv+Y8iLVLBcQcYlOqYz
 KH4EWYUIQILEvgWHcqWoRmMylNh5ynvN//1ZfG6AISVM/NW7aWToqxh3gC6Mact5sUGFCaScdF2
 O29pPBz6ZWdVJO0sS/Ru7Jw3mK25+al+R4RO3zNF+RpnFy78jIqme7dronYMV59e0vqgrJMG4Eg
 VoqmBXNq2AQNiYIJsOCY+zvvaeOPkhovbZqHWOx3+TVLvj2s2Ycf1aUjJfzWg2fE9IxiqWHuTL3
 261j9O07uS0cnFKvYVPJjQrUpLhYaE9W7jb+KZDnrf/rBDrGC92b4AQhjy2ZDxK8aY7n+zUgtMv
 jehciE0ZzbEy8695AZ1hGEqAkefjWmgAI4QEv4VZWMdJwiCi7q8r3/jGZ0fgft7+XKVwGiZ1+YQ
 rmTGklEohkpxwxFUPQ+AqbHT6avTd7ViPUjfiRMUk2E6M2Brjqdo7vYN5W5pWLJooqG+hJw3zuW
 3Ryqi2C43hWrDS5bmTTMPtY649iAbbgYk8jVLjtT09V7pFHRRAYSZRa5ISCIdBXICaMnEahwzri
 n33WXOa1mrqhCAg==
X-Developer-Key: i=daniel@riscstar.com; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
Cc: Alex Elder <elder@riscstar.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: Avoid freeing and re-requesting
 IRQ during XDP set prog
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,iogearbox.net,fomichev.me];
	FORGED_SENDER(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:hawk@kernel.org,m:john.fastabend@gmail.com,m:sdf@fomichev.me,m:elder@riscstar.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:bpf@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:from_mime,riscstar.com:email,riscstar.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EA67713204

Currently stmmac will run a full cycle of IRQ tear down and setup when
setting up a new XDP program. This makes tuning TSN systems difficult
because whenever a new XDP program is installed then the irq threads will
be stopped and restarted which will undo any thread tuning.

The problem is avoided by removing stmmac_free_irq()/stmmac_request_irq()
from stmmac_xdp_release()/stmmac_xdp_open().

stmmac_free_irq() implicitly synchronizes interrupts and, with that
removed, I was unable to prove that later actions in
stmmac_xdp_release() are safe when there are concurrent interrupts. To
avoid problems let's also move the code to disable DMA interrupts earlier
in the sequence and explicitly sync the interrupts handler(s).

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
---
This patch was developed (and tested) as part of the TC956x work that
Alex Elder and I have been working on. However the change should work with
any driver that uses the stmmac core so it makes sense to submit it as
a separate patch.
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 61 ++++++++++++++++++-----
 1 file changed, 48 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2a0d7eff88d3ff1ffa57e224c25f9e77bc28ed10..acd145f1f3069fde6043a9118c793758c5c8f4c0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2531,6 +2531,23 @@ static void stmmac_enable_all_dma_irq(struct stmmac_priv *priv)
 	}
 }
 
+static void stmmac_disable_all_dma_irq(struct stmmac_priv *priv)
+{
+	u8 rx_channels_count = priv->plat->rx_queues_to_use;
+	u8 tx_channels_count = priv->plat->tx_queues_to_use;
+	u8 dma_csr_ch = max(rx_channels_count, tx_channels_count);
+	u8 chan;
+
+	for (chan = 0; chan < dma_csr_ch; chan++) {
+		struct stmmac_channel *ch = &priv->channel[chan];
+		unsigned long flags;
+
+		spin_lock_irqsave(&ch->lock, flags);
+		stmmac_disable_dma_irq(priv, priv->ioaddr, chan, 1, 1);
+		spin_unlock_irqrestore(&ch->lock, flags);
+	}
+}
+
 /**
  * stmmac_start_all_dma - start all RX and TX DMA channels
  * @priv: driver private structure
@@ -3814,6 +3831,33 @@ static void stmmac_free_irq(struct net_device *dev,
 	}
 }
 
+static void stmmac_synchronize_irq(struct net_device *dev)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	struct stmmac_msi *msi = priv->msi;
+	int j;
+
+	for (j = priv->plat->tx_queues_to_use - 1; msi && j >= 0; j--) {
+		if (msi->tx_irq[j] > 0)
+			synchronize_irq(msi->tx_irq[j]);
+	}
+
+	for (j = priv->plat->rx_queues_to_use - 1; msi && j >= 0; j--) {
+		if (msi->rx_irq[j] > 0)
+			synchronize_irq(msi->rx_irq[j]);
+	}
+
+	if (msi && msi->sfty_ue_irq > 0 && msi->sfty_ue_irq != dev->irq)
+		synchronize_irq(msi->sfty_ue_irq);
+	if (msi && msi->sfty_ce_irq > 0 && msi->sfty_ce_irq != dev->irq)
+		synchronize_irq(msi->sfty_ce_irq);
+	if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
+		synchronize_irq(priv->wol_irq);
+	if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq)
+		synchronize_irq(priv->sfty_irq);
+	synchronize_irq(dev->irq);
+}
+
 static int stmmac_msi_init(struct stmmac_priv *priv,
 			   struct stmmac_resources *res)
 {
@@ -7108,8 +7152,9 @@ void stmmac_xdp_release(struct net_device *dev)
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
-	/* Free the IRQ lines */
-	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
+	/* Silence DMA interrupts */
+	stmmac_disable_all_dma_irq(priv);
+	stmmac_synchronize_irq(dev);
 
 	/* Stop TX/RX DMA channels */
 	stmmac_stop_all_dma(priv);
@@ -7156,10 +7201,8 @@ int stmmac_xdp_open(struct net_device *dev)
 	stmmac_reset_queues_param(priv);
 
 	/* DMA CSR Channel configuration */
-	for (chan = 0; chan < dma_csr_ch; chan++) {
+	for (chan = 0; chan < dma_csr_ch; chan++)
 		stmmac_init_chan(priv, priv->ioaddr, priv->plat->dma_cfg, chan);
-		stmmac_disable_dma_irq(priv, priv->ioaddr, chan, 1, 1);
-	}
 
 	/* Adjust Split header */
 	sph_en = (priv->hw->rx_csum > 0) && priv->sph_active;
@@ -7197,10 +7240,6 @@ int stmmac_xdp_open(struct net_device *dev)
 	/* Start Rx & Tx DMA Channels */
 	stmmac_start_all_dma(priv);
 
-	ret = stmmac_request_irq(dev);
-	if (ret)
-		goto irq_error;
-
 	/* Enable NAPI process*/
 	stmmac_enable_all_queues(priv);
 	netif_carrier_on(dev);
@@ -7209,10 +7248,6 @@ int stmmac_xdp_open(struct net_device *dev)
 
 	return 0;
 
-irq_error:
-	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
-		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
-
 init_error:
 	free_dma_desc_resources(priv, &priv->dma_conf);
 dma_desc_error:

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260706-tc956x-stmmac-no_irq_teardown-8a7592b9f8c1

Best regards,
-- 
Daniel Thompson <daniel@riscstar.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
