Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOjuCTQGn2mZYgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 15:24:52 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B82198AC2
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 15:24:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59C3FC87EC2;
	Wed, 25 Feb 2026 14:24:51 +0000 (UTC)
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C61AC87EC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 14:24:50 +0000 (UTC)
X-CSE-ConnectionGUID: L+IALaWDRBO0q4YalVUyWw==
X-CSE-MsgGUID: cCWN2MKST6q+m7KfE0ELWQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 25 Feb 2026 23:24:49 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.192])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id D25B14017D8D;
 Wed, 25 Feb 2026 23:24:42 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux@armlinux.org.uk,
 rmk+kernel@armlinux.org.uk, maxime.chevallier@bootlin.com,
 boon.khai.ng@altera.com, rohan.g.thomas@altera.com,
 vladimir.oltean@nxp.com, hayashi.kunihiko@socionext.com,
 boon.leong.ong@intel.com, kim.tatt.chuah@intel.com
Date: Wed, 25 Feb 2026 14:24:13 +0000
Message-ID: <20260225142414.130144-5-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225142414.130144-1-ovidiu.panait.rb@renesas.com>
References: <20260225142414.130144-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 4/5] net: stmmac: Add write_hw
	parameter to VLAN filter operations
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
	NEURAL_HAM(-0.00)[-0.948];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,renesas.com:mid,renesas.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: C7B82198AC2
X-Rspamd-Action: no action

Add a write_hw parameter to the VLAN add/delete HW filter functions and
to stmmac_vlan_update(). This flag controls whether the actual hardware
register accesses are performed. When set to false, only the software
state is updated.

The next commit will use this to defer hardware writes when the
interface is down.

No functional change.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v2 changes: none.

 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  6 ++--
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 25 +++++++++-----
 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 34 ++++++++++++-------
 3 files changed, 41 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 0db96a387259..d7598c76251f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -647,10 +647,12 @@ struct stmmac_vlan_ops {
 	void (*set_hw_vlan_mode)(struct mac_device_info *hw);
 	int (*add_hw_vlan_rx_fltr)(struct net_device *dev,
 				   struct mac_device_info *hw,
-				   __be16 proto, u16 vid);
+				   __be16 proto, u16 vid,
+				   bool write_hw);
 	int (*del_hw_vlan_rx_fltr)(struct net_device *dev,
 				   struct mac_device_info *hw,
-				   __be16 proto, u16 vid);
+				   __be16 proto, u16 vid,
+				   bool write_hw);
 	void (*restore_hw_vlan_rx_fltr)(struct net_device *dev,
 					struct mac_device_info *hw);
 };
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a02575f67057..19c86e3b42cc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6751,7 +6751,8 @@ static u32 stmmac_vid_crc32_le(__le16 vid_le)
 	return crc;
 }
 
-static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
+static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double,
+			      bool write_hw)
 {
 	u32 crc, hash = 0;
 	u16 pmatch = 0;
@@ -6773,7 +6774,11 @@ static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
 		hash = 0;
 	}
 
-	return stmmac_update_vlan_hash(priv, priv->hw, hash, pmatch, is_double);
+	if (write_hw)
+		return stmmac_update_vlan_hash(priv, priv->hw, hash, pmatch,
+					       is_double);
+
+	return 0;
 }
 
 /* FIXME: This may need RXC to be running, but it may be called with BH
@@ -6795,17 +6800,18 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 
 	set_bit(vid, priv->active_vlans);
 	num_double_vlans = priv->num_double_vlans + is_double;
-	ret = stmmac_vlan_update(priv, num_double_vlans);
+	ret = stmmac_vlan_update(priv, num_double_vlans, true);
 	if (ret) {
 		clear_bit(vid, priv->active_vlans);
 		goto err_pm_put;
 	}
 
 	if (priv->hw->num_vlan) {
-		ret = stmmac_add_hw_vlan_rx_fltr(priv, ndev, priv->hw, proto, vid);
+		ret = stmmac_add_hw_vlan_rx_fltr(priv, ndev, priv->hw, proto,
+						 vid, true);
 		if (ret) {
 			clear_bit(vid, priv->active_vlans);
-			stmmac_vlan_update(priv, priv->num_double_vlans);
+			stmmac_vlan_update(priv, priv->num_double_vlans, true);
 			goto err_pm_put;
 		}
 	}
@@ -6837,17 +6843,18 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
 
 	clear_bit(vid, priv->active_vlans);
 	num_double_vlans = priv->num_double_vlans - is_double;
-	ret = stmmac_vlan_update(priv, num_double_vlans);
+	ret = stmmac_vlan_update(priv, num_double_vlans, true);
 	if (ret) {
 		set_bit(vid, priv->active_vlans);
 		goto del_vlan_error;
 	}
 
 	if (priv->hw->num_vlan) {
-		ret = stmmac_del_hw_vlan_rx_fltr(priv, ndev, priv->hw, proto, vid);
+		ret = stmmac_del_hw_vlan_rx_fltr(priv, ndev, priv->hw, proto,
+						 vid, true);
 		if (ret) {
 			set_bit(vid, priv->active_vlans);
-			stmmac_vlan_update(priv, priv->num_double_vlans);
+			stmmac_vlan_update(priv, priv->num_double_vlans, true);
 			goto del_vlan_error;
 		}
 	}
@@ -6870,7 +6877,7 @@ static int stmmac_vlan_restore(struct stmmac_priv *priv)
 	if (priv->hw->num_vlan)
 		stmmac_restore_hw_vlan_rx_fltr(priv, priv->dev, priv->hw);
 
-	ret = stmmac_vlan_update(priv, priv->num_double_vlans);
+	ret = stmmac_vlan_update(priv, priv->num_double_vlans, true);
 	if (ret)
 		netdev_err(priv->dev, "Failed to restore VLANs\n");
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
index fcc34867405e..f81015179d04 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
@@ -53,7 +53,8 @@ static int vlan_write_filter(struct net_device *dev,
 
 static int vlan_add_hw_rx_fltr(struct net_device *dev,
 			       struct mac_device_info *hw,
-			       __be16 proto, u16 vid)
+			       __be16 proto, u16 vid,
+			       bool write_hw)
 {
 	int index = -1;
 	u32 val = 0;
@@ -76,7 +77,8 @@ static int vlan_add_hw_rx_fltr(struct net_device *dev,
 		}
 
 		hw->vlan_filter[0] = vid;
-		vlan_write_single(dev, vid);
+		if (write_hw)
+			vlan_write_single(dev, vid);
 
 		return 0;
 	}
@@ -97,17 +99,21 @@ static int vlan_add_hw_rx_fltr(struct net_device *dev,
 		return -EPERM;
 	}
 
-	ret = vlan_write_filter(dev, hw, index, val);
+	if (write_hw) {
+		ret = vlan_write_filter(dev, hw, index, val);
+		if (ret)
+			return ret;
+	}
 
-	if (!ret)
-		hw->vlan_filter[index] = val;
+	hw->vlan_filter[index] = val;
 
-	return ret;
+	return 0;
 }
 
 static int vlan_del_hw_rx_fltr(struct net_device *dev,
 			       struct mac_device_info *hw,
-			       __be16 proto, u16 vid)
+			       __be16 proto, u16 vid,
+			       bool write_hw)
 {
 	int i, ret = 0;
 
@@ -115,7 +121,8 @@ static int vlan_del_hw_rx_fltr(struct net_device *dev,
 	if (hw->num_vlan == 1) {
 		if ((hw->vlan_filter[0] & VLAN_TAG_VID) == vid) {
 			hw->vlan_filter[0] = 0;
-			vlan_write_single(dev, 0);
+			if (write_hw)
+				vlan_write_single(dev, 0);
 		}
 		return 0;
 	}
@@ -124,12 +131,13 @@ static int vlan_del_hw_rx_fltr(struct net_device *dev,
 	for (i = 0; i < hw->num_vlan; i++) {
 		if ((hw->vlan_filter[i] & VLAN_TAG_DATA_VEN) &&
 		    ((hw->vlan_filter[i] & VLAN_TAG_DATA_VID) == vid)) {
-			ret = vlan_write_filter(dev, hw, i, 0);
+			if (write_hw) {
+				ret = vlan_write_filter(dev, hw, i, 0);
+				if (ret)
+					return ret;
+			}
 
-			if (!ret)
-				hw->vlan_filter[i] = 0;
-			else
-				return ret;
+			hw->vlan_filter[i] = 0;
 		}
 	}
 
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
