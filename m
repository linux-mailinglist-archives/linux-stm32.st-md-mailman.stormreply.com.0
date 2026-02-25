Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBJENyUGn2neYgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 15:24:37 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B613198AAD
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 15:24:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DB1AC87EC2;
	Wed, 25 Feb 2026 14:24:37 +0000 (UTC)
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD948C87EC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 14:24:35 +0000 (UTC)
X-CSE-ConnectionGUID: LVII5tWxSmyv/yfO/AUg+g==
X-CSE-MsgGUID: cswNqotXT5a0/Ds7dT1xwQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 25 Feb 2026 23:24:35 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.192])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3468A4017D8D;
 Wed, 25 Feb 2026 23:24:28 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux@armlinux.org.uk,
 rmk+kernel@armlinux.org.uk, maxime.chevallier@bootlin.com,
 boon.khai.ng@altera.com, rohan.g.thomas@altera.com,
 vladimir.oltean@nxp.com, hayashi.kunihiko@socionext.com,
 boon.leong.ong@intel.com, kim.tatt.chuah@intel.com
Date: Wed, 25 Feb 2026 14:24:11 +0000
Message-ID: <20260225142414.130144-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225142414.130144-1-ovidiu.panait.rb@renesas.com>
References: <20260225142414.130144-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 2/5] net: stmmac: Improve double
	VLAN handling
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk,bootlin.com,altera.com,nxp.com,socionext.com,intel.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:rmk+kernel@armlinux.org.uk,m:maxime.chevallier@bootlin.com,m:boon.khai.ng@altera.com,m:rohan.g.thomas@altera.com,m:vladimir.oltean@nxp.com,m:hayashi.kunihiko@socionext.com,m:boon.leong.ong@intel.com,m:kim.tatt.chuah@intel.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ovidiu.panait.rb@renesas.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.954];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 8B613198AAD
X-Rspamd-Action: no action

The double VLAN bits (EDVLP, ESVL, DOVLTC) are handled inconsistently
between the two vlan_update_hash() implementations:

- dwxgmac2_update_vlan_hash() explicitly clears the double VLAN bits when
is_double is false, meaning that adding a 802.1Q VLAN will disable
double VLAN mode:

  $ ip link add link eth0 name eth0.200 type vlan id 200 protocol 802.1ad
  $ ip link add link eth0 name eth0.100 type vlan id 100
  # Double VLAN bits no longer set

- vlan_update_hash() sets these bits and only clears them when the last
VLAN has been removed, so double VLAN mode remains enabled even after all
802.1AD VLANs are removed.

Address both issues by tracking the number of active 802.1AD VLANs in
priv->num_double_vlans. Pass this count to stmmac_vlan_update() so both
implementations correctly set the double VLAN bits when any 802.1AD
VLAN is active, and clear them only when none remain.

Also update vlan_update_hash() to explicitly clear the double VLAN bits
when is_double is false, matching the dwxgmac2 behavior.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v2 changes: none.

 drivers/net/ethernet/stmicro/stmmac/stmmac.h     |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 ++++++++++++----
 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c    |  8 ++++++++
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 51c96a738151..33667a26708c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -323,6 +323,7 @@ struct stmmac_priv {
 	void __iomem *ptpaddr;
 	void __iomem *estaddr;
 	unsigned long active_vlans[BITS_TO_LONGS(VLAN_N_VID)];
+	unsigned int num_double_vlans;
 	int sfty_irq;
 	int sfty_ce_irq;
 	int sfty_ue_irq;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f2f120ddba46..45f2f3492dbd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6779,6 +6779,7 @@ static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
 static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
+	unsigned int num_double_vlans;
 	bool is_double = false;
 	int ret;
 
@@ -6790,7 +6791,8 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 		is_double = true;
 
 	set_bit(vid, priv->active_vlans);
-	ret = stmmac_vlan_update(priv, is_double);
+	num_double_vlans = priv->num_double_vlans + is_double;
+	ret = stmmac_vlan_update(priv, num_double_vlans);
 	if (ret) {
 		clear_bit(vid, priv->active_vlans);
 		goto err_pm_put;
@@ -6800,11 +6802,13 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 		ret = stmmac_add_hw_vlan_rx_fltr(priv, ndev, priv->hw, proto, vid);
 		if (ret) {
 			clear_bit(vid, priv->active_vlans);
-			stmmac_vlan_update(priv, is_double);
+			stmmac_vlan_update(priv, priv->num_double_vlans);
 			goto err_pm_put;
 		}
 	}
 
+	priv->num_double_vlans = num_double_vlans;
+
 err_pm_put:
 	pm_runtime_put(priv->device);
 
@@ -6817,6 +6821,7 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vid)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
+	unsigned int num_double_vlans;
 	bool is_double = false;
 	int ret;
 
@@ -6828,7 +6833,8 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
 		is_double = true;
 
 	clear_bit(vid, priv->active_vlans);
-	ret = stmmac_vlan_update(priv, is_double);
+	num_double_vlans = priv->num_double_vlans - is_double;
+	ret = stmmac_vlan_update(priv, num_double_vlans);
 	if (ret) {
 		set_bit(vid, priv->active_vlans);
 		goto del_vlan_error;
@@ -6838,11 +6844,13 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
 		ret = stmmac_del_hw_vlan_rx_fltr(priv, ndev, priv->hw, proto, vid);
 		if (ret) {
 			set_bit(vid, priv->active_vlans);
-			stmmac_vlan_update(priv, is_double);
+			stmmac_vlan_update(priv, priv->num_double_vlans);
 			goto del_vlan_error;
 		}
 	}
 
+	priv->num_double_vlans = num_double_vlans;
+
 del_vlan_error:
 	pm_runtime_put(priv->device);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
index b18404dd5a8b..de1a70e1c86e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
@@ -183,6 +183,10 @@ static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
 			value |= VLAN_EDVLP;
 			value |= VLAN_ESVL;
 			value |= VLAN_DOVLTC;
+		} else {
+			value &= ~VLAN_EDVLP;
+			value &= ~VLAN_ESVL;
+			value &= ~VLAN_DOVLTC;
 		}
 
 		writel(value, ioaddr + VLAN_TAG);
@@ -193,6 +197,10 @@ static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
 			value |= VLAN_EDVLP;
 			value |= VLAN_ESVL;
 			value |= VLAN_DOVLTC;
+		} else {
+			value &= ~VLAN_EDVLP;
+			value &= ~VLAN_ESVL;
+			value &= ~VLAN_DOVLTC;
 		}
 
 		writel(value | perfect_match, ioaddr + VLAN_TAG);
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
