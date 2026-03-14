Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHqcHIYuuGm3aAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 17:23:34 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BDD29D4DB
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 17:23:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2D65C9008A;
	Mon, 16 Mar 2026 16:23:33 +0000 (UTC)
Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4CF7C87ED6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Mar 2026 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mmpsystems.pl; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EgCsQpLfP6jlSC3mUtz80d1LyhN5q7HHT6hn2BMEbcI=; b=ZNPvi+McsNM6sE7cSCcvs2gMnt
 OsbLb7qY/gGb/PN6F/geAZ+HRQmKgclGugspuJIQa16LMG74KvYVkzb9Ikt1ykW4FsJqUoGHOYffM
 BmbysA7+7zM9YaHvTMh2B2IfOxjl2Y2oK4wF43p/3+xeChXWl2dpGzU+nZI6ckmYM8BCyTxjoM62H
 FLFPMVK4/W8RxaLgiHkLeyZ65J7KQKvnG8HEJTv1AwlH8rqqs2lvnLkVCIJnNcXFH29WgItZLjS+W
 CUP3XtsrKfKEfGPM6W07UVbcn2GwfspKJYjg7AjiRJqn/cEtfQRQhgakkzglQGa49doBw6abKTMXM
 hXYDmBfg==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
 by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <michal.piekos@mmpsystems.pl>)
 id 1w1Qur-00000006o6Z-2wCk; Sat, 14 Mar 2026 16:28:37 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sat, 14 Mar 2026 16:27:46 +0100
MIME-Version: 1.0
Message-Id: <20260314-vlan-restore-error-v1-1-4fc6c3e2115f@mmpsystems.pl>
X-B4-Tracking: v=1; b=H4sIAHF+tWkC/x3MTQqAIBBA4avIrBvQ/ukq0cJqrIHQGCOC8O5Jy
 2/x3guRhCnCoF4Qujly8BmmULDs1m+EvGZDqctWV6bG+7AeheIVhJBEgqDr58qapXONtpDDU8j
 x80/HKaUP7JbUyWQAAAA=
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773502079; l=1719;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=/vy+c1nLswFOkWzuqJsjFYoXMYDn1ssIa4VCRdJjqZI=;
 b=Cu15vltkrAWQrlPZvWghHLF0X7ub3MupcOdEB2OM0WisVyNFkoVZePcUctt+43i2PwPh4l1Fk
 e83DoBoc1+pApN/haQ4gv2Vm+I4+fIuayVxZpr3tYcRVbiPRIH0qIQa
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-Mailman-Approved-At: Mon, 16 Mar 2026 16:23:30 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] net: stmmac: skip VLAN restore when VLAN hash
 ops are missing
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
	DATE_IN_PAST(1.00)[48];
	R_DKIM_REJECT(1.00)[mmpsystems.pl:s=x];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[mmpsystems.pl : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,renesas.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ovidiu.panait.rb@renesas.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[michal.piekos@mmpsystems.pl,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mmpsystems.pl:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[michal.piekos@mmpsystems.pl,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.812];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,mmpsystems.pl:email,mmpsystems.pl:mid]
X-Rspamd-Queue-Id: 00BDD29D4DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

stmmac_vlan_restore() unconditionally calls stmmac_vlan_update() when
NETIF_F_VLAN_FEATURES is set. On platforms where priv->hw->vlan (or
->update_vlan_hash) is not provided, stmmac_update_vlan_hash() returns
-EINVAL via stmmac_do_void_callback(), resulting in a spurious
"Failed to restore VLANs" error even when no VLAN filtering is in use.

Check presence of VLAN hash ops before stmmac_vlan_update().

Fixes: bd7ad51253a7 ("net: stmmac: Fix VLAN HW state restore")
Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
This patch fixes a noisy "Failed to restore VLANs" message on platforms
where stmmac VLAN hash ops are not implemented.
stmmac_vlan_restore() calls stmmac_vlan_update() without checking for
VLAN hash ops presence which results in -EINVAL. 
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6827c99bde8c..bc09439ec00b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6869,6 +6869,9 @@ static int stmmac_vlan_restore(struct stmmac_priv *priv)
 	if (priv->hw->num_vlan)
 		stmmac_restore_hw_vlan_rx_fltr(priv, priv->dev, priv->hw);
 
+	if (!priv->hw->vlan || !priv->hw->vlan->update_vlan_hash)
+		return 0;
+
 	ret = stmmac_vlan_update(priv, priv->num_double_vlans);
 	if (ret)
 		netdev_err(priv->dev, "Failed to restore VLANs\n");

---
base-commit: 1c9982b4961334c1edb0745a04cabd34bc2de675
change-id: 20260314-vlan-restore-error-f8b3a1c7f50a

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
