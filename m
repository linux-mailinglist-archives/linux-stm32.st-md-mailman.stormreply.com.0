Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPYPN5Af1mklBQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 11:27:44 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 946093B9E0F
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 11:27:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C37DC08D19;
	Wed,  8 Apr 2026 09:27:44 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C63EFC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2026 09:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l/uumbg2htkDWqchC9pV2fd0IznYJi1xURkP8jIplg8=; b=jkT/iqKfYIAcIwAFGl/L7H7e6J
 Atf5/PlrZ4RMNWrgxaX55XnQWRSxSXCT8qBn5QJ4rZxCgNItXhv99FcCqP9m+JmJehLxCurQEP9Sz
 CqPwq4nD9s5T82umqqPCpwQqEiPyM542xxg2CoaeTEDSGIIWr9nOKsK8GFgLzRWDwJ+ikwkNTPr0t
 fq5GaLj4BpKC7CDpuc4SJL+LFUc/pjSMkrTtGbCwUlWiXt1574bSCaQYEmJ94xjQI8MwKOOH3yT5v
 luj8YljJ1ihZMOBNcEaVZkKAKHxafFNqc7e5MOwVVNQxEV4Wk1O+dyAwwsQcj8JBQz42nFTS6jab3
 hMDQng9Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33376 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1wAPBn-0000000023T-42Wy;
 Wed, 08 Apr 2026 10:27:12 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1wAPBg-0000000F7kA-3HFF; Wed, 08 Apr 2026 10:27:04 +0100
In-Reply-To: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1wAPBg-0000000F7kA-3HFF@rmk-PC.armlinux.org.uk>
Date: Wed, 08 Apr 2026 10:27:04 +0100
Cc: Paolo Abeni <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
 Jakub Kicinski <kuba@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 05/10] net: stmmac: rename
	confusing synopsys_id
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
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[kernel];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:pabeni@redhat.com,m:samuel@sholland.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:jitendra.vegiraju@broadcom.com,m:kuba@kernel.org,m:wens@kernel.org,m:linux-sunxi@lists.linux.dev,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.218];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,armlinux.org.uk:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 946093B9E0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

priv->synopsys_id is the Synopsys IP version, defined by snpsver in
the databook. This is made up of the major version in bits 7:4 and
the first digit of the minor version in bits 3:0. Change the type
for synopsys_id to be a u8 and rename to snpsver.

For reference, the values for snpsver:

GMAC100 cores do not have a readable snpsver number.

GMAC cores generally have a snpsver number less than 0x40.

GMAC4 cores may have a version number that overlaps GMAC cores
(see first entry for DWMAC_CORE_GMAC4).

XGMAC and XLGMAC cores each have an entirely separate IP version
number space from GMAC and GMAC4, which are distinguished by their
respective userver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.c           | 10 +++++-----
 drivers/net/ethernet/stmicro/stmmac/stmmac.h         |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    | 12 ++++++------
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c    |  8 ++++----
 8 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index eb14c197d6ae..789b384a2838 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -326,7 +326,7 @@ static int loongson_dwmac_setup(void *apriv, struct mac_device_info *mac)
 	 * original value so the correct HW-interface would be selected.
 	 */
 	if (ld->multichan) {
-		priv->synopsys_id = DWMAC_CORE_3_70;
+		priv->snpsver = DWMAC_CORE_3_70;
 		*dma = dwmac1000_dma_ops;
 		dma->init_chan = loongson_dwmac_dma_init_channel;
 		dma->dma_interrupt = loongson_dwmac_dma_interrupt;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 48c52eb96233..4bff7592c652 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -1069,7 +1069,7 @@ static int sun8i_dwmac_setup(void *ppriv, struct mac_device_info *mac)
 	mac->unicast_filter_entries = 8;
 
 	/* Synopsys Id is not available */
-	priv->synopsys_id = 0;
+	priv->snpsver = 0;
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 03437f1cf3df..635d711a554e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -380,7 +380,7 @@ static int dwxgmac2_get_hw_feature(void __iomem *ioaddr,
 	dma_cap->vlhash = (hw_cap & XGMAC_HWFEAT_VLHASH) >> 4;
 	dma_cap->half_duplex = (hw_cap & XGMAC_HWFEAT_HDSEL) >> 3;
 	dma_cap->mbps_1000 = (hw_cap & XGMAC_HWFEAT_GMIISEL) >> 1;
-	if (dma_cap->mbps_1000 && priv->synopsys_id >= DWXGMAC_CORE_2_20)
+	if (dma_cap->mbps_1000 && priv->snpsver >= DWXGMAC_CORE_2_20)
 		dma_cap->mbps_10_100 = 1;
 
 	/* MAC HW feature 1 */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 7f95a2a5be4c..e5629afc391f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -72,7 +72,7 @@ static int stmmac_dwmac1_quirks(struct stmmac_priv *priv)
 		dev_info(priv->device, "Enhanced/Alternate descriptors\n");
 
 		/* GMAC older than 3.50 has no extended descriptors */
-		if (priv->synopsys_id >= DWMAC_CORE_3_50) {
+		if (priv->snpsver >= DWMAC_CORE_3_50) {
 			dev_info(priv->device, "Enabled extended descriptors\n");
 			priv->extend_desc = true;
 		} else {
@@ -299,7 +299,7 @@ stmmac_hwif_find(enum dwmac_core_type core_type, u8 snpsver, u8 userver)
 
 		if (core_type != entry->core_type)
 			continue;
-		/* Use synopsys_id var because some setups can override this */
+		/* Use snpsver var because some setups can override this */
 		if (snpsver < entry->min_snpsver)
 			continue;
 		if (core_type == DWMAC_CORE_XGMAC &&
@@ -324,7 +324,7 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 	stmmac_get_version(priv, &version);
 
 	/* Save ID for later use */
-	priv->synopsys_id = version.snpsver;
+	priv->snpsver = version.snpsver;
 
 	/* Lets assume some safe values first */
 	if (core_type == DWMAC_CORE_GMAC4) {
@@ -355,8 +355,8 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 
 	/* Fallback to generic HW */
 
-	/* Use synopsys_id var because some setups can override this */
-	entry = stmmac_hwif_find(core_type, priv->synopsys_id, version.userver);
+	/* Use snpsver var because some setups can override this */
+	entry = stmmac_hwif_find(core_type, priv->snpsver, version.userver);
 	if (!entry) {
 		dev_err(priv->device,
 			"Failed to find HW IF (id=0x%x, gmac=%d/%d)\n",
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 8ba8f03e1ce0..9a5d9c404e4f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -304,7 +304,7 @@ struct stmmac_priv {
 	struct dma_features dma_cap;
 	struct stmmac_counters mmc;
 	int hw_cap_support;
-	int synopsys_id;
+	u8 snpsver;
 	u32 msg_enable;
 	/* Our MAC Wake-on-Lan options */
 	int wolopts;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 92585d27ab88..343cf903c0bf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -553,7 +553,7 @@ static void stmmac_get_ethtool_stats(struct net_device *dev,
 				priv->xstats.phy_eee_wakeup_error_n = val;
 		}
 
-		if (priv->synopsys_id >= DWMAC_CORE_3_50)
+		if (priv->snpsver >= DWMAC_CORE_3_50)
 			stmmac_mac_debug(priv, priv->ioaddr,
 					(void *)&priv->xstats,
 					rx_queues_count, tx_queues_count);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 01a983001ab4..295d31d7b28b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -755,7 +755,7 @@ static int stmmac_hwtstamp_set(struct net_device *dev,
 			config->rx_filter = HWTSTAMP_FILTER_PTP_V2_EVENT;
 			ptp_v2 = PTP_TCR_TSVER2ENA;
 			snap_type_sel = PTP_TCR_SNAPTYPSEL_1;
-			if (priv->synopsys_id < DWMAC_CORE_4_10)
+			if (priv->snpsver < DWMAC_CORE_4_10)
 				ts_event_en = PTP_TCR_TSEVNTENA;
 			ptp_over_ipv4_udp = PTP_TCR_TSIPV4ENA;
 			ptp_over_ipv6_udp = PTP_TCR_TSIPV6ENA;
@@ -6624,7 +6624,7 @@ static int stmmac_dma_cap_show(struct seq_file *seq, void *v)
 	seq_printf(seq, "\tAV features: %s\n", (priv->dma_cap.av) ? "Y" : "N");
 	seq_printf(seq, "\tChecksum Offload in TX: %s\n",
 		   (priv->dma_cap.tx_coe) ? "Y" : "N");
-	if (priv->synopsys_id >= DWMAC_CORE_4_00 ||
+	if (priv->snpsver >= DWMAC_CORE_4_00 ||
 	    priv->plat->core_type == DWMAC_CORE_XGMAC) {
 		seq_printf(seq, "\tIP Checksum Offload in RX: %s\n",
 			   (priv->dma_cap.rx_coe) ? "Y" : "N");
@@ -7454,7 +7454,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	if (priv->plat->rx_coe) {
 		priv->hw->rx_csum = priv->plat->rx_coe;
 		dev_info(priv->device, "RX Checksum Offload Engine supported\n");
-		if (priv->synopsys_id < DWMAC_CORE_4_00)
+		if (priv->snpsver < DWMAC_CORE_4_00)
 			dev_info(priv->device, "COE Type %d\n", priv->hw->rx_csum);
 	}
 	if (priv->plat->tx_coe)
@@ -7520,7 +7520,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	 * has to be disable and this can be done by passing the
 	 * riwt_off field from the platform.
 	 */
-	if ((priv->synopsys_id >= DWMAC_CORE_3_50 ||
+	if ((priv->snpsver >= DWMAC_CORE_3_50 ||
 	     priv->plat->core_type == DWMAC_CORE_XGMAC) &&
 	    !priv->plat->riwt_off) {
 		priv->use_riwt = 1;
@@ -7897,7 +7897,7 @@ static int __stmmac_dvr_probe(struct device *device,
 
 	/* Only DWMAC core version 5.20 onwards supports HW descriptor prefetch.
 	 */
-	if (priv->synopsys_id < DWMAC_CORE_5_20)
+	if (priv->snpsver < DWMAC_CORE_5_20)
 		priv->plat->dma_cfg->dche = false;
 
 	stmmac_check_ether_addr(priv);
@@ -7997,7 +7997,7 @@ static int __stmmac_dvr_probe(struct device *device,
 
 	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
 		ndev->max_mtu = XGMAC_JUMBO_LEN;
-	else if (priv->plat->enh_desc || priv->synopsys_id >= DWMAC_CORE_4_00)
+	else if (priv->plat->enh_desc || priv->snpsver >= DWMAC_CORE_4_00)
 		ndev->max_mtu = JUMBO_LEN;
 	else
 		ndev->max_mtu = SKB_MAX_HEAD(NET_SKB_PAD + NET_IP_ALIGN);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index afe98ff5bdcb..0107119f68d2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -74,7 +74,7 @@ static void stmmac_xgmac2_c22_format(struct stmmac_priv *priv, int phyaddr,
 {
 	u32 tmp = 0;
 
-	if (priv->synopsys_id < DWXGMAC_CORE_2_20) {
+	if (priv->snpsver < DWXGMAC_CORE_2_20) {
 		/* Until ver 2.20 XGMAC does not support C22 addr >= 4. Those
 		 * bits above bit 3 of XGMAC_MDIO_C22P register are reserved.
 		 */
@@ -136,7 +136,7 @@ static int stmmac_xgmac2_mdio_read_c22(struct mii_bus *bus, int phyaddr,
 	u32 addr;
 
 	/* Until ver 2.20 XGMAC does not support C22 addr >= 4 */
-	if (priv->synopsys_id < DWXGMAC_CORE_2_20 &&
+	if (priv->snpsver < DWXGMAC_CORE_2_20 &&
 	    phyaddr > MII_XGMAC_MAX_C22ADDR)
 		return -ENODEV;
 
@@ -199,7 +199,7 @@ static int stmmac_xgmac2_mdio_write_c22(struct mii_bus *bus, int phyaddr,
 	u32 addr;
 
 	/* Until ver 2.20 XGMAC does not support C22 addr >= 4 */
-	if (priv->synopsys_id < DWXGMAC_CORE_2_20 &&
+	if (priv->snpsver < DWXGMAC_CORE_2_20 &&
 	    phyaddr > MII_XGMAC_MAX_C22ADDR)
 		return -ENODEV;
 
@@ -625,7 +625,7 @@ int stmmac_mdio_register(struct net_device *ndev)
 		new_bus->read_c45 = &stmmac_xgmac2_mdio_read_c45;
 		new_bus->write_c45 = &stmmac_xgmac2_mdio_write_c45;
 
-		if (priv->synopsys_id < DWXGMAC_CORE_2_20) {
+		if (priv->snpsver < DWXGMAC_CORE_2_20) {
 			/* Right now only C22 phys are supported */
 			max_addr = MII_XGMAC_MAX_C22ADDR;
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
