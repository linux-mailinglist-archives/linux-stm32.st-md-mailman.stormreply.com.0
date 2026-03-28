Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id i4w3Gp+Xx2mFZgUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Mar 2026 09:55:59 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BE334DDEB
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Mar 2026 09:55:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EF06C8F28A;
	Sat, 28 Mar 2026 08:55:58 +0000 (UTC)
Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BC2BC8F288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 08:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mmpsystems.pl; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W9D8vCzCrRJ5LPPbiAlFNwBx1RgUj04xH732MSvsX1E=; b=cw/PSUbNcg/qV3aSySproi+46b
 W4YCBnfrBl1BwW4KsBBH2MU+F7BBr+tZt9Y2yRpuGWgva3tHHyVfLXwyh5aquGvXq1VwiafVvt6hi
 aiT66Pq0eHtSdMZz1fm+MgNFToKjNZkrgnQosP+xCFgbp/qOEwxkSeh63mSsUmpUNnXF5sye27KaR
 CBpKQSo80mC7QpIm15t913/z4BipHh/rzUdNYV0rERciL6UCmefkJQkdrXJAlaGWktL3IpOtOU+fz
 lWRHOV1woaQ2E9zC5FO++SeCUVB8o68Ott/DIUMu2dC+fyjRs/7QjsIPuH0sVYdRnppWDwqsrVkK/
 OwMxtMnA==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
 by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <michal.piekos@mmpsystems.pl>)
 id 1w6PSU-00000002znC-02RV; Sat, 28 Mar 2026 09:55:54 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sat, 28 Mar 2026 09:55:51 +0100
MIME-Version: 1.0
Message-Id: <20260328-vlan-restore-error-v4-1-f88624c530dc@mmpsystems.pl>
X-B4-Tracking: v=1; b=H4sIAJaXx2kC/33NSwrCMBCA4atI1kaaZ6sr7yEuYjpjA32RlGApv
 btJV0WKy3+Y+WYhAbyDQG6nhXiILrihTyHPJ2Ib07+Bujo14QXXhWCSxtb01EOYBg8UvB88xeo
 lDLMlqsKQdDh6QPfZ0MczdePy9rz9iCxP/3KRUUYlWm0FcMYU3rtuDHOYoAuXsSWZjHzHcHbI8
 Mwoi0obxbmojxixZ6pDRiSmRlmaQlytRv3LrOv6BRYVpxFGAQAA
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774688151; l=3201;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=lmB9RkAsJOKKgD5XsOpXtoTGuYHWZeBiE4dI8gGBpmE=;
 b=k0d4LG2qW5S5JB0Fw6C5IlvnEM6iE36A+wAxwIDuP+cwTUSfPySgFjTY8DhZb7fP9denByW3G
 X1IW0pnaROsDzVv+iTBKmYEfIuVIHP+iXVC3oPv1jrAgIM5eUD2bwuS
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v4] net: stmmac: skip VLAN restore when VLAN
 hash ops are missing
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[mmpsystems.pl:s=x];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[mmpsystems.pl : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,renesas.com];
	FORGED_SENDER(0.00)[michal.piekos@mmpsystems.pl,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ovidiu.panait.rb@renesas.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[michal.piekos@mmpsystems.pl,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mmpsystems.pl:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	NEURAL_SPAM(0.00)[0.014];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: E8BE334DDEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

stmmac_vlan_restore() unconditionally calls stmmac_vlan_update() when
NETIF_F_VLAN_FEATURES is set. On platforms where priv->hw->vlan (or
->update_vlan_hash) is not provided, stmmac_update_vlan_hash() returns
-EINVAL via stmmac_do_void_callback(), resulting in a spurious
"Failed to restore VLANs" error even when no VLAN filtering is in use.

Remove not needed comment.
Remove not used return value from stmmac_vlan_restore().

Tested on Orange Pi Zero 3.

Fixes: bd7ad51253a7 ("net: stmmac: Fix VLAN HW state restore")
Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
This patch fixes a noisy "Failed to restore VLANs" message on platforms
where stmmac VLAN hash ops are not implemented.
stmmac_vlan_restore() calls stmmac_vlan_update() without checking for
VLAN hash ops presence which results in -EINVAL. 
---
Changes in v4:
- Remove not used return value of stmmac_vlan_restore()
- Link to v3: https://lore.kernel.org/r/20260328-vlan-restore-error-v3-1-df47a039c6f6@mmpsystems.pl

Changes in v3:
- Remove the offending comment
- Restore the original check for NETIF_F_VLAN_FEATURES
- Link to v2: https://lore.kernel.org/r/20260321-vlan-restore-error-v2-1-45cf56a5223d@mmpsystems.pl

Changes in v2:
- Replace check for hash ops with check for HW FILTER flags
- Link to v1: https://lore.kernel.org/r/20260314-vlan-restore-error-v1-1-4fc6c3e2115f@mmpsystems.pl
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6827c99bde8c..13d3cac056be 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -156,7 +156,7 @@ static void stmmac_tx_timer_arm(struct stmmac_priv *priv, u32 queue);
 static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue);
 static void stmmac_set_dma_operation_mode(struct stmmac_priv *priv, u32 txmode,
 					  u32 rxmode, u32 chan);
-static int stmmac_vlan_restore(struct stmmac_priv *priv);
+static void stmmac_vlan_restore(struct stmmac_priv *priv);
 
 #ifdef CONFIG_DEBUG_FS
 static const struct net_device_ops stmmac_netdev_ops;
@@ -6859,21 +6859,15 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
 	return ret;
 }
 
-static int stmmac_vlan_restore(struct stmmac_priv *priv)
+static void stmmac_vlan_restore(struct stmmac_priv *priv)
 {
-	int ret;
-
 	if (!(priv->dev->features & NETIF_F_VLAN_FEATURES))
-		return 0;
+		return;
 
 	if (priv->hw->num_vlan)
 		stmmac_restore_hw_vlan_rx_fltr(priv, priv->dev, priv->hw);
 
-	ret = stmmac_vlan_update(priv, priv->num_double_vlans);
-	if (ret)
-		netdev_err(priv->dev, "Failed to restore VLANs\n");
-
-	return ret;
+	stmmac_vlan_update(priv, priv->num_double_vlans);
 }
 
 static int stmmac_bpf(struct net_device *dev, struct netdev_bpf *bpf)

---
base-commit: be762d8b6dd7efacb61937d20f8475db8f207655
change-id: 20260314-vlan-restore-error-f8b3a1c7f50a

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
