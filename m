Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE74CD6A14
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Dec 2025 17:08:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AE02C57B41;
	Mon, 22 Dec 2025 16:08:48 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92EF4C57A51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Dec 2025 16:08:46 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-7c76d855ddbso1174291a34.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Dec 2025 08:08:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766419725; x=1767024525;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hyZg86sigq1gMHsuNeTho1/FwyX760bGjSc75ceM6vw=;
 b=vxMtM4BEJ+U49AZ07DFJxeK9q+4PjyEqRMfe7LV+MKnc5rscSnR681p92GzivKa6u9
 LprllQh7Ru22SD3/l6aG3winTtln7W9r4j7wrllCeUqdBK0Y6WSBDDpptBrmW0t3btUu
 h3EJQG9yZMfLfmgYMG43U7szGqfU9q7U5UDWublQuENFA6sOFifOrw9csaZv+8zyxOws
 OsbjEPLSY9yZP8K9bOCkdJ4nClxOUMRFXmMhdMcQsSEbniENMQuabaBWyPTrTAm3lSbN
 D/8RJF4BH68FyW1zfnxYcVdWoVTrl3jRWYYjOS0xWHyND8ZZb8T7BwZBM/17v9eCCFUn
 spiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgJ6rApaH2GmWBXBP8gjmtQP0fSybXH4EDZniOyt1tOJDsXBlZj1ZLuGr/adyf//sOhoFiu2jZNqrhsw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyA2dvS/fHL07Lsl7KYrFe4m7ROE5bqimXo7kiVdAGgt+TO0jRP
 t+m2UCLPJooA4GALTZqSyF1a6icL+Q0PAiB5DUCQCSm6wNcp45/n6iAM
X-Gm-Gg: AY/fxX6DUo90HUZYLnlIonkxORHdM+dNHzI4jGaXioDwBwrTFxcRW+RkSoFwexXO/HE
 SGfdLcC2XPtfTLFSntV/0xsTdv2/6jay6CIA1Gyl+38x1gyChzBGVma2pfgGniPmmKTEdJLwpRc
 Kh01JepEO5gve+uMwe61pYK7Kj/ljo+gcTigylryP8KqdFmmtAR882MbfACTMWhegC+FKOtgNZp
 83dgnzd+KlLxaz1G7Pl4Fxf42PyGw9+u//Om3k+Rtjz0clXNvWakWydTLs0lcePnmfTnUYMOj/t
 krQEcpIMcmNLPxh1EELEucpm3F3wcOVFSfkcIFADQcbMBEIJNPeSN7VdLuX5K8YBCIWcaXBlzlS
 9Jq67z+EPlUh5bQRY/FHCY+ySxudlZd2zUUb9l1RX54k41HDb1txqrxtSGQbyCB330urf89iPqN
 9ICvj/Cjs8KdFzmg==
X-Google-Smtp-Source: AGHT+IGV9jTfvLuDHm6IUAINCmnrI/nMYseqUSC5TAOi+jja5agqOaacIYROhfs88S9nISNt7xZ/ew==
X-Received: by 2002:a05:6830:438d:b0:7c9:5a1d:333a with SMTP id
 46e09a7af769-7cc667f3d57mr5586499a34.0.1766419725107; 
 Mon, 22 Dec 2025 08:08:45 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:4b::])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc6680358asm7793046a34.30.2025.12.22.08.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 08:08:44 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Mon, 22 Dec 2025 08:08:40 -0800
MIME-Version: 1.0
Message-Id: <20251222-gxring_stmicro-v1-1-d018a14644a5@debian.org>
X-B4-Tracking: v=1; b=H4sIAAhtSWkC/yXMQQrCMBAF0KuEv26gDVokVxGRNJ3GEZzKTJRA6
 d1FXT94G4yUyRDdBqU3G6+C6IbOId+SFPI8IzqEPhyHEIIvTVnK1eqDs67+0E8pj0tO82lE5/B
 UWrj9wjOEqhdqFZe/2Gu6U67fD/v+AU0f2wJ8AAAA
X-Change-ID: 20251222-gxring_stmicro-40bac6fcad86
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2067; i=leitao@debian.org;
 h=from:subject:message-id; bh=XP/dY8RnNlz7cQ91LtEg5lUtZbiwBCSohE3LI9cBdQU=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpSW0ML0A27ygUM+WxlW7UZuOgWF9A2oO34iVxt
 5+BqpDIdIWJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaUltDAAKCRA1o5Of/Hh3
 bYabD/4yHWJBxsgp/SieMEC85QSre8XYNcjUQGQSaXsb2FhE2sw5AfC/tz1gpWD3u31nFmsHzjs
 ZvsAd3vBCzuOZFQ6283RyqgIgvtnc8cCBFmfl5LFq6CWGOCwZH2hLJv+0pCB+NBHrcr4eBUsbSt
 x3Udr7nTZhsUhasX2/GtOITpRiA/uljSyx9iyA6+yRiOaUxR9ug7rfwFqodkA9WlNmENMXFV/1X
 K0oBL3oSeGvpWyShDaZ7Ip7jfPC5JjK8pseksKMs+cVe2/rgWXSOJ3PW2SaRqiGAO8Rt+yu6B/d
 xqaMm3GCo1Gg7kbudJEavDT0lJUl9VtaY/mw3R7rU+NjEcBqIJPA+Kf8sZVG/OBYhOXYf/SMMIa
 vkgQh1WixjXSZ3j1OsqMSHx1e86566z361Q56LndWJvu1DvrHpkg7t6FNS1vcsGpKsZ+UVFnKKd
 vTTclUMc8EFxuIk0qzdJIwz94FNyAbwhJffg4w8wiF7TSH4AlumCTW/1Fu3jkmMDGF/juiMfO24
 bYLOJ7lHNGP/cVe2wb23mvXvRSLrB13RoMUihQ+Ky3VMAj1+gX0dL1nPtcqO7lX6AAHqVbmjSlY
 NxEwpqkqZj7fU06EtVPZWAjcLW+nhvmTYm5jh6Dolm4wFA4AC792zBRatMT/NDPxh/xM6FnE1LZ
 tlZxvb7IAvsIdYg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
Cc: Breno Leitao <leitao@debian.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: convert to use
	.get_rx_ring_count
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

Convert the stmmac driver to use the new .get_rx_ring_count
ethtool operation instead of implementing .get_rxnfc for handling
ETHTOOL_GRXRINGS command.

Since stmmac_get_rxnfc() only handled ETHTOOL_GRXRINGS (returning
-EOPNOTSUPP for all other commands), remove it entirely and replace
it with the simpler stmmac_get_rx_ring_count() callback.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index b155e71aac51..c1e26965d9b5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -914,20 +914,11 @@ static int stmmac_set_per_queue_coalesce(struct net_device *dev, u32 queue,
 	return __stmmac_set_coalesce(dev, ec, queue);
 }
 
-static int stmmac_get_rxnfc(struct net_device *dev,
-			    struct ethtool_rxnfc *rxnfc, u32 *rule_locs)
+static u32 stmmac_get_rx_ring_count(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	switch (rxnfc->cmd) {
-	case ETHTOOL_GRXRINGS:
-		rxnfc->data = priv->plat->rx_queues_to_use;
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
-
-	return 0;
+	return priv->plat->rx_queues_to_use;
 }
 
 static u32 stmmac_get_rxfh_key_size(struct net_device *dev)
@@ -1121,7 +1112,7 @@ static const struct ethtool_ops stmmac_ethtool_ops = {
 	.get_eee = stmmac_ethtool_op_get_eee,
 	.set_eee = stmmac_ethtool_op_set_eee,
 	.get_sset_count	= stmmac_get_sset_count,
-	.get_rxnfc = stmmac_get_rxnfc,
+	.get_rx_ring_count = stmmac_get_rx_ring_count,
 	.get_rxfh_key_size = stmmac_get_rxfh_key_size,
 	.get_rxfh_indir_size = stmmac_get_rxfh_indir_size,
 	.get_rxfh = stmmac_get_rxfh,

---
base-commit: 7b8e9264f55a9c320f398e337d215e68cca50131
change-id: 20251222-gxring_stmicro-40bac6fcad86

Best regards,
--  
Breno Leitao <leitao@debian.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
