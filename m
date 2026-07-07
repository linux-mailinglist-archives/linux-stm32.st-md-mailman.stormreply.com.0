Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cWz8Fn1ZTWr3ygEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 21:54:37 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB14E71F704
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 21:54:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=agner.ch header.s=dkim header.b=jEWu6VgA;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=agner.ch (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93C94C7C7E8;
	Tue,  7 Jul 2026 19:54:36 +0000 (UTC)
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 518CAC7129F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2026 19:54:35 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3c38:10::3a0])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 316905CD106;
 Tue,  7 Jul 2026 21:54:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1783454074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y3NpIc8JZ08lCs6TTHGP7X1cz/YqBmnc+QKbmFf0dIk=;
 b=jEWu6VgA3R7UyzMjcKI1AAh9/uw2KVhDn2V3vKUuP3vWJgafj6du0Q8IQCV2IJiNJjlHT6
 QH2cpRg9WpF1Csu9dbajDtM1xorXMuc+hFkCz7yn1/A4F1a9XXT7NnsSp1x7CHCQRtE3Zg
 6YhopjV6+pbvB1b7ioeUOb2c54Eo1us=
From: Stefan Agner <stefan@agner.ch>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>
Date: Tue,  7 Jul 2026 21:54:25 +0200
Message-ID: <20260707195425.405989-1-stefan@agner.ch>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <message-id-of-your-v1-mail>
References: <message-id-of-your-v1-mail>
MIME-Version: 1.0
Cc: regressions@lists.linux.dev, netdev@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [Linux-stm32] [PATCH net v2] net: stmmac: resume PHY before
	hardware setup when opening the interface
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[agner.ch:s=dkim];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[agner.ch : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:regressions@lists.linux.dev,m:netdev@vger.kernel.org,m:stefan@agner.ch,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,agner.ch,bootlin.com,armlinux.org.uk,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org,renesas.com];
	FORGED_SENDER(0.00)[stefan@agner.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[agner.ch:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[stefan@agner.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,agner.ch:from_mime,agner.ch:email,agner.ch:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB14E71F704

Since the referenced commit, changing the MTU on a running interface no
longer disconnects and reconnects the PHY; __stmmac_release() merely
stops phylink, which also suspends the PHY (BMCR power-down) when WoL
is not enabled. __stmmac_open() then performs the DMA software reset in
stmmac_hw_setup() before phylink_start() resumes the PHY again.

IEEE 802.3 22.2.4.1.5 allows a PHY to stop its receive clock while
powered down, and stmmac requires a running receive clock for the DMA
software reset to complete (the phylink config sets mac_requires_rxc).
On such setups, e.g. the RK3566-based Home Assistant Green with an
RTL8211F-VD PHY in RGMII mode, any runtime MTU change now times out and
leaves the interface dead:

  rk_gmac-dwmac fe010000.ethernet end0: Failed to reset the dma
  rk_gmac-dwmac fe010000.ethernet end0: stmmac_hw_setup: DMA engine initialization failed
  rk_gmac-dwmac fe010000.ethernet end0: __stmmac_open: Hw setup failed
  rk_gmac-dwmac fe010000.ethernet end0: failed reopening the interface after MTU change

In the field this is triggered by NetworkManager applying an MTU while
activating the connection, breaking networking entirely.

Resume the PHY in __stmmac_open() before the hardware setup, making it
the counterpart of the phylink_stop() in __stmmac_release(), like
stmmac_resume() already does for the same reason. phylink_start() also
resumes the PHY, but only after stmmac_hw_setup(), and it cannot be
moved before the hardware setup since it may bring the link up
immediately from a workqueue, racing with the initialization (see the
comment in stmmac_resume()). For the regular ndo_open path the PHY has
just been attached and is not suspended, in which case
phylink_prepare_resume() does nothing.

Fixes: db299a0c09e9 ("net: stmmac: move PHY handling out of __stmmac_open()/release()")
Link: https://github.com/home-assistant/operating-system/issues/4858
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
Changes in v2:
- Move the PHY resume from stmmac_change_mtu() into __stmmac_open() so
  that it also counters the PHY suspend caused by __stmmac_release()
  (suggested by Andrew Lunn), placed before stmmac_reset_queues_param()
  to match the ordering used in stmmac_resume()

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4147,6 +4147,15 @@
 			dma_conf->tx_queue[i].tbs = priv->dma_conf.tx_queue[i].tbs;
 	memcpy(&priv->dma_conf, dma_conf, sizeof(*dma_conf));
 
+	/* The PHY is suspended when the interface is reopened without
+	 * disconnecting the PHY, e.g. on MTU change. IEEE 802.3 allows PHYs
+	 * to stop their receive clock while powered down, but the DMA
+	 * software reset in stmmac_hw_setup() requires a running receive
+	 * clock, and phylink_start() below resumes the PHY only after the
+	 * hardware setup. Resume a suspended PHY here first.
+	 */
+	phylink_prepare_resume(priv->phylink);
+
 	stmmac_reset_queues_param(priv);
 
 	ret = stmmac_hw_setup(dev);
-- 
2.49.0
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
