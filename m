Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wG8rInAZsWn6qgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:27:44 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A95F25DD83
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:27:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BC93C9008B;
	Wed, 11 Mar 2026 07:27:44 +0000 (UTC)
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79D4DC8F269
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 11:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
 t=1773143727; bh=KQiEoi/5KK1uW5/WekNTwCqBkzEqSA1SWtsVPdM2q90=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Hzc3GuxHf6WKr4EWmy7suWfFtUIN+cSSog0xcKAdq1K62+58VIbGObMn11FXUjfnw
 XSgX37V9MsgZIzaqlzkHaWhxgePi5JwVjORgVIpVxik46tgfvcV/Ti0iljkdkzgEMz
 GP23Vofxf0i5EbReeE876OiemRlixpOKPI/O3H3w=
Received: from [212.42.244.71] (helo=mail.avm.de)
 by mail.avm.de with ESMTP (eXpurgate 4.55.2)
 (envelope-from <phahn-oss@avm.de>)
 id 69b006ae-e21d-7f0000032729-7f000001da34-1
 for <multiple-recipients>; Tue, 10 Mar 2026 12:55:26 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
 by mail.avm.de (Postfix) with ESMTPS;
 Tue, 10 Mar 2026 12:55:26 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:49:04 +0100
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-38-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
To: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org, 
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev, 
 Philipp Hahn <phahn-oss@avm.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=6679; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=KQiEoi/5KK1uW5/WekNTwCqBkzEqSA1SWtsVPdM2q90=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAZXMdz3AdJ9BDXSNnmAtbN1zmhCLGlM5aT0i
 DUnFwIG7QKJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGVwAKCRA0LQZT0ays
 20CyB/4lggnkY4K4Lo4sONwYMpv2ax2osa3aOBaZeOsk7IrX5OefQhdbIn4njQGFhSRkoN1OS74
 RFM1P8Zj2ox5AT2OTTsGgJszYrviPiI6f3OB4fORCX0D5Uy+q+MJ9QaHAVOTki7YRDRPqPU8eot
 qXUXo3MWBintiQb+VUgj0c7V53AbuvEdsGiANz4ngxrRyeRv0LQno6AOBMWbXRBogpDl1L0S2i4
 UZBntAPoWZbboJc05+3p5MczuG3QperMntaj9Tb4wrxw8nvaoynlDjGr2dg61cj+UKtCoiisS82
 re/u1kbEtkI5dJs+aKf1mABBLdny1Poccch6DjzUum6aDXBE
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143726-95E77E6F-9B3D9DCE/0/0
X-purgate-type: clean
X-purgate-size: 6681
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-Mailman-Approved-At: Wed, 11 Mar 2026 07:27:23 +0000
Cc: Taras Chornyi <taras.chornyi@plvision.eu>,
 Igor Russkikh <irusskikh@marvell.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Potnuri Bharat Teja <bharat@chelsio.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Chan <mchan@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH 38/61] net: Prefer IS_ERR_OR_NULL over manual
	NULL check
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
X-Rspamd-Queue-Id: 4A95F25DD83
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[avm.de : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[avm.de:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:amd-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:bpf@vger.kernel.org,m:ceph-devel@vger.kernel.org,m:cocci@inria.fr,m:dm-devel@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:gfs2@lists.linux.dev,m:intel-gfx@lists.freedesktop.org,m:intel-wired-lan@lists.osuosl.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-block@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-ext4@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-mm@kvack.org,m:linux-modules@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-nfs@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-phy@l
 ists.infradead.org,m:linux-pm@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-sctp@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-trace-kernel@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:netdev@vger.kernel.org,m:ntfs3@lists.linux.dev,m:samba-technical@lists.samba.org,m:sched-ext@lists.linux.dev,m:target-devel@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:v9fs@lists.linux.dev,m:phahn-oss@avm.de,m:taras.chornyi@plvision.eu,m:irusskikh@marvell.com,m:przemyslaw.kitszel@intel.com,m:bharat@chelsio.com,m:keyur@os.amperecomputing.com,m:linux@armlinux.org.uk,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:iyappan@os.amperecomputing.com,m:anthony.l.nguyen@intel.com,m:quan@os.amperecomputing.com,m:mcoquelin.stm32@gmail.com,m:mchan@broadcom.com,m:pavan.chebbi@broa
 dcom.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:hkallweit1@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[phahn-oss@avm.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[plvision.eu,marvell.com,intel.com,chelsio.com,os.amperecomputing.com,armlinux.org.uk,lunn.ch,google.com,gmail.com,broadcom.com,kernel.org,redhat.com,davemloft.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[avm.de:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[72];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phahn-oss@avm.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.916];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
check.

Change generated with coccinelle.

To: Igor Russkikh <irusskikh@marvell.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
To: Michael Chan <mchan@broadcom.com>
To: Potnuri Bharat Teja <bharat@chelsio.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
To: Taras Chornyi <taras.chornyi@plvision.eu>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Iyappan Subramanian <iyappan@os.amperecomputing.com>
To: Keyur Chudgar <keyur@os.amperecomputing.com>
To: Quan Nguyen <quan@os.amperecomputing.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: intel-wired-lan@lists.osuosl.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-usb@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 drivers/net/ethernet/aquantia/atlantic/aq_ring.c        | 2 +-
 drivers/net/ethernet/broadcom/tg3.c                     | 2 +-
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c    | 3 +--
 drivers/net/ethernet/intel/ice/devlink/devlink.c        | 2 +-
 drivers/net/ethernet/marvell/prestera/prestera_router.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c       | 2 +-
 drivers/net/mdio/mdio-xgene.c                           | 2 +-
 drivers/net/usb/r8152.c                                 | 2 +-
 8 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_ring.c b/drivers/net/ethernet/aquantia/atlantic/aq_ring.c
index e270327e47fd804cc8ee5cfd53ed1b993c955c41..43edef35c4b1ff606b2f1519a07fad4c9a990ad4 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_ring.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_ring.c
@@ -810,7 +810,7 @@ static int __aq_ring_xdp_clean(struct aq_ring_s *rx_ring,
 		}
 
 		skb = aq_xdp_run_prog(aq_nic, &xdp, rx_ring, buff);
-		if (IS_ERR(skb) || !skb)
+		if (IS_ERR_OR_NULL(skb))
 			continue;
 
 		if (ptp_hwtstamp_len > 0)
diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 2328fce336447eb4a796f9300ccc0ab536ff0a35..8ed79f34f03d81184dcc12e6eaff009cb8f7756e 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -7943,7 +7943,7 @@ static int tg3_tso_bug(struct tg3 *tp, struct tg3_napi *tnapi,
 
 	segs = skb_gso_segment(skb, tp->dev->features &
 				    ~(NETIF_F_TSO | NETIF_F_TSO6));
-	if (IS_ERR(segs) || !segs) {
+	if (IS_ERR_OR_NULL(segs)) {
 		tnapi->tx_dropped++;
 		goto tg3_tso_bug_end;
 	}
diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
index 3307e50426819087ad985178c4a5383f16b8e7b4..1c8a6445d4b2e3535d8f1b7908dd02d8dd2f23fa 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
@@ -1032,8 +1032,7 @@ static void ch_flower_stats_handler(struct work_struct *work)
 	do {
 		rhashtable_walk_start(&iter);
 
-		while ((flower_entry = rhashtable_walk_next(&iter)) &&
-		       !IS_ERR(flower_entry)) {
+		while (!IS_ERR_OR_NULL((flower_entry = rhashtable_walk_next(&iter)))) {
 			ret = cxgb4_get_filter_counters(adap->port[0],
 							flower_entry->filter_id,
 							&packets, &bytes,
diff --git a/drivers/net/ethernet/intel/ice/devlink/devlink.c b/drivers/net/ethernet/intel/ice/devlink/devlink.c
index 6c72bd15db6d75a1d4fa04ef8fefbd26fb6e84bd..3d08b9187fd76ca3198af28111b6f1c1765ea01e 100644
--- a/drivers/net/ethernet/intel/ice/devlink/devlink.c
+++ b/drivers/net/ethernet/intel/ice/devlink/devlink.c
@@ -791,7 +791,7 @@ static void ice_traverse_tx_tree(struct devlink *devlink, struct ice_sched_node
 						  node->parent->rate_node);
 	}
 
-	if (rate_node && !IS_ERR(rate_node))
+	if (!IS_ERR_OR_NULL(rate_node))
 		node->rate_node = rate_node;
 
 traverse_children:
diff --git a/drivers/net/ethernet/marvell/prestera/prestera_router.c b/drivers/net/ethernet/marvell/prestera/prestera_router.c
index b036b173a308b5f994ad8538eb010fa27196988c..4492938e8a3da91d32efe8d45ccbe2eb437c0e49 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_router.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_router.c
@@ -1061,7 +1061,7 @@ static void __prestera_k_arb_hw_state_upd(struct prestera_switch *sw,
 		n = NULL;
 	}
 
-	if (!IS_ERR(n) && n) {
+	if (!IS_ERR_OR_NULL(n)) {
 		neigh_event_send(n, NULL);
 		neigh_release(n);
 	} else {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6827c99bde8c22db42b363d2d36ad6f26075ed50..356a4e9ce04b1fcf8786d7274d31ace404be2cf6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1275,7 +1275,7 @@ static int stmmac_init_phy(struct net_device *dev)
 	/* Some DT bindings do not set-up the PHY handle. Let's try to
 	 * manually parse it
 	 */
-	if (!phy_fwnode || IS_ERR(phy_fwnode)) {
+	if (IS_ERR_OR_NULL(phy_fwnode)) {
 		int addr = priv->plat->phy_addr;
 		struct phy_device *phydev;
 
diff --git a/drivers/net/mdio/mdio-xgene.c b/drivers/net/mdio/mdio-xgene.c
index a8f91a4b7fed0927ee14e408000cd3a2bfb9b09a..09b30b563295c6085dc1358ac361301e5cf6b2a8 100644
--- a/drivers/net/mdio/mdio-xgene.c
+++ b/drivers/net/mdio/mdio-xgene.c
@@ -265,7 +265,7 @@ struct phy_device *xgene_enet_phy_register(struct mii_bus *bus, int phy_addr)
 	struct phy_device *phy_dev;
 
 	phy_dev = get_phy_device(bus, phy_addr, false);
-	if (!phy_dev || IS_ERR(phy_dev))
+	if (IS_ERR_OR_NULL(phy_dev))
 		return NULL;
 
 	if (phy_device_register(phy_dev))
diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 0c83bbbea2e7c322ee6339893e281237663bd3ae..73f17ebd7d40007eec5004f887a46249defd28ab 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -2218,7 +2218,7 @@ static void r8152_csum_workaround(struct r8152 *tp, struct sk_buff *skb,
 
 		features &= ~(NETIF_F_SG | NETIF_F_IPV6_CSUM | NETIF_F_TSO6);
 		segs = skb_gso_segment(skb, features);
-		if (IS_ERR(segs) || !segs)
+		if (IS_ERR_OR_NULL(segs))
 			goto drop;
 
 		__skb_queue_head_init(&seg_list);

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
