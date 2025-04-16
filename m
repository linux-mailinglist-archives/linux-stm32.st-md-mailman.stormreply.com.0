Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CA3A8AD35
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Apr 2025 03:02:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92361C7802F;
	Wed, 16 Apr 2025 01:02:22 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DF64C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 01:02:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9F380447CA;
 Wed, 16 Apr 2025 01:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E76C4CEE7;
 Wed, 16 Apr 2025 01:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744765339;
 bh=pxx/BrdLMS5Mul/HFokaPLtg/6DDJYpnVXSSateVRNs=;
 h=From:To:Cc:Subject:Date:From;
 b=Ls4HvtgK/y+KTLUCOZzykdiJaX8cTl1dQ4ZonA75BNbJjzCHmKVHV+wUH2bR+QVw9
 My8lEaDI8qdNDQaxpFoq/u8x4e5nkqt2ClaWt/DIcnolEblHSKQ+3osoGqwoTqa/+3
 Dm+qqHGJsW+YwVaoL4gWUrTTZBn7zdN/JwcO4/CL8QzG2M7ytRbWf9GPtP3pIQihSz
 yJVsIaqL3csj9ZvXmN972Ikyq346YVGfEx0kY0YP65BfXFB82aXBjYWZQf1r3G/1ik
 KF8Z+vjR8RM41fNhwWOpHZWQuWgo7GWS6gMfNZF7UqMmVXQVxE1fKWRmWRk+PXnigZ
 flOePqbJby6Yw==
From: Kees Cook <kees@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Date: Tue, 15 Apr 2025 18:02:15 -0700
Message-Id: <20250416010210.work.904-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10779; i=kees@kernel.org;
 h=from:subject:message-id; bh=pxx/BrdLMS5Mul/HFokaPLtg/6DDJYpnVXSSateVRNs=;
 b=owGbwMvMwCVmps19z/KJym7G02pJDOn/Gad1NGVU6W/WfyJdUZi984XlOb31Yrwd+hLp+axH9
 u1gm7m7o5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgFYCKyuxn+l0wtitpevZL7p9xZ
 h031fhFrzGxyj9pc/ryRMzivRZF7KSPDBwFbj8yl7DXPpy6+d6LaOubjukXbu7+YHxBqkfaXm1X
 PAAA=
X-Developer-Key: i=kees@kernel.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Cc: imx@lists.linux.dev, Kees Cook <kees@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>, Ziwei Xiao <ziweixiao@google.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Joshua Washington <joshwash@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Furong Xu <0x1207@gmail.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Simon Horman <horms@kernel.org>, Petr Tesarik <petr@tesarici.cz>,
 Ido Schimmel <idosch@nvidia.com>, Richard Cochran <richardcochran@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Shailend Chand <shailend@google.com>,
 Wei Fang <wei.fang@nxp.com>, Harshitha Ramamurthy <hramamurthy@google.com>,
 Jeroen de Borst <jeroendb@google.com>, linux-arm-kernel@lists.infradead.org,
 Petr Machata <petrm@nvidia.com>, Kory Maincent <kory.maincent@bootlin.com>,
 Willem de Bruijn <willemb@google.com>, Geoff Levand <geoff@infradead.org>,
 netdev@vger.kernel.org, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 "David S. Miller" <davem@davemloft.net>,
 Shannon Nelson <shannon.nelson@amd.com>
Subject: [Linux-stm32] [PATCH] net: ethtool: Adjust exactly
	ETH_GSTRING_LEN-long stats to use memcpy
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

Many drivers populate the stats buffer using C-String based APIs (e.g.
ethtool_sprintf() and ethtool_puts()), usually when building up the
list of stats individually (i.e. with a for() loop). This, however,
requires that the source strings be populated in such a way as to have
a terminating NUL byte in the source.

Other drivers populate the stats buffer directly using one big memcpy()
of an entire array of strings. No NUL termination is needed here, as the
bytes are being directly passed through. Yet others will build up the
stats buffer individually, but also use memcpy(). This, too, does not
need NUL termination of the source strings.

However, there are cases where the strings that populate the
source stats strings are exactly ETH_GSTRING_LEN long, and GCC
15's -Wunterminated-string-initialization option complains that the
trailing NUL byte has been truncated. This situation is fine only if the
driver is using the memcpy() approach. If the C-String APIs are used,
the destination string name will have its final byte truncated by the
required trailing NUL byte applied by the C-string API.

For drivers that are already using memcpy() but have initializers that
truncate the NUL terminator, mark their source strings as __nonstring to
silence the GCC warnings.

For drivers that have initializers that truncate the NUL terminator and
are using the C-String APIs, switch to memcpy() to avoid destination
string truncation and mark their source strings as __nonstring to silence
the GCC warnings. (Also introduce ethtool_cpy() as a helper to make this
an easy replacement).

Specifically the following warnings were investigated and addressed:

../drivers/net/ethernet/chelsio/cxgb/cxgb2.c:364:9: warning: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (33 chars into 32 available) [-Wunterminated-string-initialization]
  364 |         "TxFramesAbortedDueToXSCollisions",
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/net/ethernet/freescale/enetc/enetc_ethtool.c:165:33: warning: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (33 chars into 32 available) [-Wunterminated-string-initialization]
  165 |         { ENETC_PM_R1523X(0),   "MAC rx 1523 to max-octet packets" },
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/net/ethernet/freescale/enetc/enetc_ethtool.c:190:33: warning: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (33 chars into 32 available) [-Wunterminated-string-initialization]
  190 |         { ENETC_PM_T1523X(0),   "MAC tx 1523 to max-octet packets" },
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/net/ethernet/google/gve/gve_ethtool.c:76:9: warning: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (33 chars into 32 available) [-Wunterminated-string-initialization]
   76 |         "adminq_dcfg_device_resources_cnt", "adminq_set_driver_parameter_cnt",
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c:117:53: warning: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (33 chars into 32 available) [-Wunterminated-string-initialization]
  117 |         STMMAC_STAT(ptp_rx_msg_type_pdelay_follow_up),
      |                                                     ^
../drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c:46:12: note: in definition of macro 'STMMAC_STAT'
   46 |         { #m, sizeof_field(struct stmmac_extra_stats, m),       \
      |            ^
../drivers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c:328:24: warning: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (33 chars into 32 available) [-Wunterminated-string-initialization]
  328 |                 .str = "a_mac_control_frames_transmitted",
      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c:340:24: warning: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (33 chars into 32 available) [-Wunterminated-string-initialization]
  340 |                 .str = "a_pause_mac_ctrl_frames_received",
      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Wei Fang <wei.fang@nxp.com>
Cc: Clark Wang <xiaoning.wang@nxp.com>
Cc: Jeroen de Borst <jeroendb@google.com>
Cc: Harshitha Ramamurthy <hramamurthy@google.com>
Cc: Ido Schimmel <idosch@nvidia.com>
Cc: Petr Machata <petrm@nvidia.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Simon Horman <horms@kernel.org>
Cc: Geoff Levand <geoff@infradead.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Praveen Kaligineedi <pkaligineedi@google.com>
Cc: Willem de Bruijn <willemb@google.com>
Cc: Joshua Washington <joshwash@google.com>
Cc: Furong Xu <0x1207@gmail.com>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Jisheng Zhang <jszhang@kernel.org>
Cc: Petr Tesarik <petr@tesarici.cz>
Cc: netdev@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/net/ethernet/chelsio/cxgb/cxgb2.c             |  2 +-
 drivers/net/ethernet/freescale/enetc/enetc_ethtool.c  |  4 ++--
 drivers/net/ethernet/google/gve/gve_ethtool.c         |  4 ++--
 .../net/ethernet/mellanox/mlxsw/spectrum_ethtool.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c  |  2 +-
 include/linux/ethtool.h                               | 11 +++++++++++
 6 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb/cxgb2.c b/drivers/net/ethernet/chelsio/cxgb/cxgb2.c
index 3b7068832f95..4a0e2d2eb60a 100644
--- a/drivers/net/ethernet/chelsio/cxgb/cxgb2.c
+++ b/drivers/net/ethernet/chelsio/cxgb/cxgb2.c
@@ -351,7 +351,7 @@ static void set_msglevel(struct net_device *dev, u32 val)
 	adapter->msg_enable = val;
 }
 
-static const char stats_strings[][ETH_GSTRING_LEN] = {
+static const char stats_strings[][ETH_GSTRING_LEN] __nonstring_array = {
 	"TxOctetsOK",
 	"TxOctetsBad",
 	"TxUnicastFramesOK",
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
index ece3ae28ba82..f47c8b6cc511 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
@@ -141,7 +141,7 @@ static const struct {
 
 static const struct {
 	int reg;
-	char name[ETH_GSTRING_LEN];
+	char name[ETH_GSTRING_LEN] __nonstring;
 } enetc_port_counters[] = {
 	{ ENETC_PM_REOCT(0),	"MAC rx ethernet octets" },
 	{ ENETC_PM_RALN(0),	"MAC rx alignment errors" },
@@ -264,7 +264,7 @@ static void enetc_get_strings(struct net_device *ndev, u32 stringset, u8 *data)
 			break;
 
 		for (i = 0; i < ARRAY_SIZE(enetc_port_counters); i++)
-			ethtool_puts(&data, enetc_port_counters[i].name);
+			ethtool_cpy(&data, enetc_port_counters[i].name);
 
 		break;
 	}
diff --git a/drivers/net/ethernet/google/gve/gve_ethtool.c b/drivers/net/ethernet/google/gve/gve_ethtool.c
index eae1a7595a69..3c1da0cf3f61 100644
--- a/drivers/net/ethernet/google/gve/gve_ethtool.c
+++ b/drivers/net/ethernet/google/gve/gve_ethtool.c
@@ -67,7 +67,7 @@ static const char gve_gstrings_tx_stats[][ETH_GSTRING_LEN] = {
 	"tx_xsk_sent[%u]", "tx_xdp_xmit[%u]", "tx_xdp_xmit_errors[%u]"
 };
 
-static const char gve_gstrings_adminq_stats[][ETH_GSTRING_LEN] = {
+static const char gve_gstrings_adminq_stats[][ETH_GSTRING_LEN] __nonstring_array = {
 	"adminq_prod_cnt", "adminq_cmd_fail", "adminq_timeouts",
 	"adminq_describe_device_cnt", "adminq_cfg_device_resources_cnt",
 	"adminq_register_page_list_cnt", "adminq_unregister_page_list_cnt",
@@ -113,7 +113,7 @@ static void gve_get_strings(struct net_device *netdev, u32 stringset, u8 *data)
 						i);
 
 		for (i = 0; i < ARRAY_SIZE(gve_gstrings_adminq_stats); i++)
-			ethtool_puts(&s, gve_gstrings_adminq_stats[i]);
+			ethtool_cpy(&s, gve_gstrings_adminq_stats[i]);
 
 		break;
 
diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c
index 3f64cdbabfa3..0a8fb9c842d3 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c
@@ -262,7 +262,7 @@ static int mlxsw_sp_port_set_pauseparam(struct net_device *dev,
 }
 
 struct mlxsw_sp_port_hw_stats {
-	char str[ETH_GSTRING_LEN];
+	char str[ETH_GSTRING_LEN] __nonstring;
 	u64 (*getter)(const char *payload);
 	bool cells_bytes;
 };
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 918a32f8fda8..844f7d516a40 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -37,7 +37,7 @@
 #define ETHTOOL_DMA_OFFSET	55
 
 struct stmmac_stats {
-	char stat_string[ETH_GSTRING_LEN];
+	char stat_string[ETH_GSTRING_LEN] __nonstring;
 	int sizeof_stat;
 	int stat_offset;
 };
diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index 013d25858642..7edb5f5e7134 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -1330,6 +1330,17 @@ extern __printf(2, 3) void ethtool_sprintf(u8 **data, const char *fmt, ...);
  */
 extern void ethtool_puts(u8 **data, const char *str);
 
+/**
+ * ethtool_cpy - Write possibly-not-NUL-terminated string to ethtool string data
+ * @data: Pointer to a pointer to the start of string to write into
+ * @str: NUL-byte padded char array of size ETH_GSTRING_LEN to copy from
+ */
+#define ethtool_cpy(data, str)	do {				\
+	BUILD_BUG_ON(sizeof(str) != ETH_GSTRING_LEN);		\
+	memcpy(*(data), str, ETH_GSTRING_LEN);			\
+	*(data) += ETH_GSTRING_LEN;				\
+} while (0)
+
 /* Link mode to forced speed capabilities maps */
 struct ethtool_forced_speed_map {
 	u32		speed;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
