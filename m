Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 758DC9126B
	for <lists+linux-stm32@lfdr.de>; Sat, 17 Aug 2019 20:55:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BE0BC35E19;
	Sat, 17 Aug 2019 18:55:04 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (unknown [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14143C35E05
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Aug 2019 18:55:00 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 36558C0E47;
 Sat, 17 Aug 2019 18:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1566068097; bh=Xz26BZZOJit3JigreKorMytvcGTIkOB52bvcggv67Lw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=mZjFubm+xr8+O6xgLmM40IaSQZ1VVIYCxMbp2pkaz7tzhNXm30LN1piAHhGj3sYOU
 OTsHMQLZm1Qoz9hqEwbEJf1ypRq+crcDb6ZLYZQV5QdVkwZAb1UGJ6bu4rHwSmkzPG
 mEJKxyQTIsATJHCrBUgxSAR/JxBmZ2j9WJRgdy1YWr7bSRBLZhGVJxlWNPiAS2d3Wy
 JtE8iOdkA6uzyQX0QN6adxMhdrTq9yeIH3r+Yqh5e9GUimsG7TFk+tHk/sfQzEDOid
 y0kSIyZjMhel/n7VixWIYLbfHNGRFJA97e5J0fpp9jmSlJccr4TyQ8FJIOhZqKg+JU
 JtgkiBhCReNRw==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id E6034A0079;
 Sat, 17 Aug 2019 18:54:55 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Sat, 17 Aug 2019 20:54:48 +0200
Message-Id: <072518f78634fba212122d4a5039ecaedf3ff675.1566067803.git.joabreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1566067802.git.joabreu@synopsys.com>
References: <cover.1566067802.git.joabreu@synopsys.com>
In-Reply-To: <cover.1566067802.git.joabreu@synopsys.com>
References: <cover.1566067802.git.joabreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 09/12] net: stmmac: selftests: Add
	tests for SA Insertion/Replacement
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Add 4 new tests:
	- SA Insertion (register based)
	- SA Insertion (descriptor based)
	- SA Replacament (register based)
	- SA Replacement (descriptor based)

Signed-off-by: Jose Abreu <joabreu@synopsys.com>

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 .../net/ethernet/stmicro/stmmac/stmmac_selftests.c | 98 +++++++++++++++++++++-
 1 file changed, 97 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index abab84f2ef8b..acfab86431b1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -45,6 +45,7 @@ struct stmmac_packet_attrs {
 	int size;
 	int remove_sa;
 	u8 id;
+	int sarc;
 };
 
 static u8 stmmac_test_next_id;
@@ -230,7 +231,10 @@ static int stmmac_test_loopback_validate(struct sk_buff *skb,
 		if (!ether_addr_equal(ehdr->h_dest, tpriv->packet->dst))
 			goto out;
 	}
-	if (tpriv->packet->src) {
+	if (tpriv->packet->sarc) {
+		if (!ether_addr_equal(ehdr->h_source, ehdr->h_dest))
+			goto out;
+	} else if (tpriv->packet->src) {
 		if (!ether_addr_equal(ehdr->h_source, tpriv->packet->src))
 			goto out;
 	}
@@ -1004,6 +1008,82 @@ static int stmmac_test_rxp(struct stmmac_priv *priv)
 }
 #endif
 
+static int stmmac_test_desc_sai(struct stmmac_priv *priv)
+{
+	unsigned char src[ETH_ALEN] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
+	struct stmmac_packet_attrs attr = { };
+	int ret;
+
+	attr.remove_sa = true;
+	attr.sarc = true;
+	attr.src = src;
+	attr.dst = priv->dev->dev_addr;
+
+	priv->sarc_type = 0x1;
+
+	ret = __stmmac_test_loopback(priv, &attr);
+
+	priv->sarc_type = 0x0;
+	return ret;
+}
+
+static int stmmac_test_desc_sar(struct stmmac_priv *priv)
+{
+	unsigned char src[ETH_ALEN] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
+	struct stmmac_packet_attrs attr = { };
+	int ret;
+
+	attr.sarc = true;
+	attr.src = src;
+	attr.dst = priv->dev->dev_addr;
+
+	priv->sarc_type = 0x2;
+
+	ret = __stmmac_test_loopback(priv, &attr);
+
+	priv->sarc_type = 0x0;
+	return ret;
+}
+
+static int stmmac_test_reg_sai(struct stmmac_priv *priv)
+{
+	unsigned char src[ETH_ALEN] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
+	struct stmmac_packet_attrs attr = { };
+	int ret;
+
+	attr.remove_sa = true;
+	attr.sarc = true;
+	attr.src = src;
+	attr.dst = priv->dev->dev_addr;
+
+	if (stmmac_sarc_configure(priv, priv->ioaddr, 0x2))
+		return -EOPNOTSUPP;
+
+	ret = __stmmac_test_loopback(priv, &attr);
+
+	stmmac_sarc_configure(priv, priv->ioaddr, 0x0);
+	return ret;
+}
+
+static int stmmac_test_reg_sar(struct stmmac_priv *priv)
+{
+	unsigned char src[ETH_ALEN] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
+	struct stmmac_packet_attrs attr = { };
+	int ret;
+
+	attr.sarc = true;
+	attr.src = src;
+	attr.dst = priv->dev->dev_addr;
+
+	if (stmmac_sarc_configure(priv, priv->ioaddr, 0x3))
+		return -EOPNOTSUPP;
+
+	ret = __stmmac_test_loopback(priv, &attr);
+
+	stmmac_sarc_configure(priv, priv->ioaddr, 0x0);
+	return ret;
+}
+
 #define STMMAC_LOOPBACK_NONE	0
 #define STMMAC_LOOPBACK_MAC	1
 #define STMMAC_LOOPBACK_PHY	2
@@ -1065,6 +1145,22 @@ static const struct stmmac_test {
 		.name = "Flexible RX Parser   ",
 		.lb = STMMAC_LOOPBACK_PHY,
 		.fn = stmmac_test_rxp,
+	}, {
+		.name = "SA Insertion (desc)  ",
+		.lb = STMMAC_LOOPBACK_PHY,
+		.fn = stmmac_test_desc_sai,
+	}, {
+		.name = "SA Replacement (desc)",
+		.lb = STMMAC_LOOPBACK_PHY,
+		.fn = stmmac_test_desc_sar,
+	}, {
+		.name = "SA Insertion (reg)  ",
+		.lb = STMMAC_LOOPBACK_PHY,
+		.fn = stmmac_test_reg_sai,
+	}, {
+		.name = "SA Replacement (reg)",
+		.lb = STMMAC_LOOPBACK_PHY,
+		.fn = stmmac_test_reg_sar,
 	},
 };
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
