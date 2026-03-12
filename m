Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDBMIAausmlGOwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 13:13:58 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5F627183B
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 13:13:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3638CC8F28F;
	Thu, 12 Mar 2026 12:13:58 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94B86C8F28E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 12:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1je3WPymH0THXPKtudz8hsGg9eMg3RuF4V2JvpxjpKU=; b=fD00DkIsZRZnMotPVW6c92fsr8
 qYlqS2A4/6uEUr9kh2vU2a0OzRx6R7jgxPO9aZkhswtaTlpQ1Zndn0QkyOoPjjhPWdop70aQnKyac
 ubClQMMut0InmZP6QVpzhrU0W1d433gI+O2ofGGh4LuVum7W4CBCD8bhgpMhSIrHfk1Rtd5hRbZA4
 8tKakuzAva+ngMLHTHMJ16s5o53Ecvb4CWn0idCnIs2kQNksCraTv5jBDYAnCQdAEQUBmB/iWhu+H
 dif3SQvc27decXL224n42EupBc9dHJv31yY9YL6/Dr4b9wquiJOBNoR1qxzOanlpOx4FrWDGEBKS1
 zw9Wnbpw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53376 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1w0evJ-000000007kl-0l9a;
 Thu, 12 Mar 2026 12:13:53 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1w0evI-0000000CzY7-1fyo; Thu, 12 Mar 2026 12:13:52 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1w0evI-0000000CzY7-1fyo@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Mar 2026 12:13:52 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: avoid passing pci_dev
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[kernel];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,armlinux.org.uk:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 6C5F627183B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pci_dev is only used to provide the ethtool bus_info using
pci_name(priv->plat->pdev). This is the same as dev_name(priv->device).
Thus, rather than passing the pci_dev, make use of what we already
have.

To avoid unexpectedly exposing the device name through ethtool where
it wasn't provided before, add a flag priv->plat->provide_bus_info
to enable this, which only dwmac-intel needs to set.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c    | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 5 ++---
 include/linux/stmmac.h                               | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 421c6c81ca5e..f621077c30a4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -589,7 +589,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	int ret;
 	int i;
 
-	plat->pdev = pdev;
+	plat->provide_bus_info = true;
 	plat->phy_addr = -1;
 	plat->clk_csr = STMMAC_CSR_250_300M;
 	plat->core_type = DWMAC_CORE_GMAC4;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index c1e26965d9b5..92585d27ab88 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -312,10 +312,9 @@ static void stmmac_ethtool_getdrvinfo(struct net_device *dev,
 		strscpy(info->driver, MAC100_ETHTOOL_NAME,
 			sizeof(info->driver));
 
-	if (priv->plat->pdev) {
-		strscpy(info->bus_info, pci_name(priv->plat->pdev),
+	if (priv->plat->provide_bus_info)
+		strscpy(info->bus_info, dev_name(priv->device),
 			sizeof(info->bus_info));
-	}
 }
 
 static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 937985276e6b..72febd246bdb 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -348,7 +348,7 @@ struct plat_stmmacenet_data {
 	int rss_en;
 	int mac_port_sel_speed;
 	u8 vlan_fail_q;
-	struct pci_dev *pdev;
+	bool provide_bus_info;
 	int int_snapshot_num;
 	int msi_mac_vec;
 	int msi_wol_vec;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
