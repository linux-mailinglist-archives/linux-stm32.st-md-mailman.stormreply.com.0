Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6CA9A359F
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Oct 2024 08:40:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFDA9C78037;
	Fri, 18 Oct 2024 06:40:27 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D99D7C78035
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 06:40:25 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-20cb47387ceso14715585ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 23:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729233624; x=1729838424;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oAXwTR66yAILUnUD8iXKY4J9SzL8DhxXJKiHt0S8h0U=;
 b=XVYG6H9tGFLG/OM7ZCaJTFzMvx/12sfl2zvS27mD5zZfYw6h7cGIk8/cUY/qodhyY/
 LHVlXJ4WGqrkh/B+2LAZabdzLNaBsHVbKWzECh5n70vj5Q3JjQo4vhyJxVNKcM8BRRk6
 7SqRSSVYro2dak+n2if6NlHs/RPOR1G3WtEfCXZYHLP7+MmLYzij/uHSFvX23LXcO+Jr
 jyYgp2mM0A2npSa7cCefTdErxMAr1NHssSr1yVUD7T7Rt1dFaHm1hkJKp38O6jI0vRAP
 fAf2DeS3OwdVLdGR9k2TkFZNdpSXjEmznqJ/LOt/V0ULSb4yQHCKeufwK/qTYPNAhFdO
 v7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729233624; x=1729838424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oAXwTR66yAILUnUD8iXKY4J9SzL8DhxXJKiHt0S8h0U=;
 b=k8emsQOhefTiep2tZPdgQ7WrHzuBel8bHLWsjFpWIBFRJ8edhB50GVv3lfC+K1Zewt
 7qkSx8bbeEGKAdlp9GGOri8eSbye6vEcudWGw7yr6wxr7+mbd3Cq9Ao4KNraqaxnfkV8
 FUiveOppQDpF1ZWh12S1EIlybPHHKRgNtuf4PFKmMObE18XuBmG/T6rtRx0/rO4YN9lU
 h/N9hkabiCGqrUIJmv0kJwXvM/eRt7KfMqerR4Oi0alBNatDu/AT3awq3+rSZGh0OGv4
 wZ/EKIcOeR/yWHnfy6fATKJ60rLKjirrMjK4/dR+IZ0r97H1tRWW+z8t1lByiMCjK2v/
 3qCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWqpfUtG0kKGmCFl7c59MHxkVcfo/BgL0+kfAkcLD7SSIkVXV6vYxdHZcn0tIeLH35hBS8wtVKlbfSsQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyc6q9pQVJ/poRg4Io86CWNB/RNEYzBVcqtGG7SeCU3+pPl5hjb
 /6fgjkvE9wDd6Z8IB7xGQCSF2Kfp8FrPJwND6cE9/UuTKClm0FII
X-Google-Smtp-Source: AGHT+IHFQ90ihWqPYEL7Ct51SslG3VL9y32CIIVvGJDd5cHSgLsXcnYM+ZbtTXhZ468ZOJA50p73OQ==
X-Received: by 2002:a17:903:32cf:b0:20c:5e86:9b5e with SMTP id
 d9443c01a7336-20e5a719f37mr18587745ad.3.1729233624372; 
 Thu, 17 Oct 2024 23:40:24 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-20e5a74766fsm6285455ad.73.2024.10.17.23.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 23:40:23 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 18 Oct 2024 14:39:13 +0800
Message-Id: <1776606b2eda8430077551ca117b035f987b5b70.1729233020.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729233020.git.0x1207@gmail.com>
References: <cover.1729233020.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v2 7/8] net: stmmac: xgmac: Complete
	FPE support
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

Implement the necessary stmmac_fpe_ops function callbacks for xgmac.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index dfe911b3f486..c90ed7c1279d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -373,6 +373,78 @@ static void dwxgmac3_fpe_configure(void __iomem *ioaddr,
 			     &dwxgmac3_fpe_info);
 }
 
+static int dwxgmac3_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
+{
+	return common_fpe_irq_status(ioaddr + XGMAC_MAC_FPE_CTRL_STS, dev);
+}
+
+static void dwxgmac3_fpe_send_mpacket(void __iomem *ioaddr,
+				      struct stmmac_fpe_cfg *cfg,
+				      enum stmmac_mpacket_type type)
+{
+	common_fpe_send_mpacket(ioaddr + XGMAC_MAC_FPE_CTRL_STS, cfg, type);
+}
+
+static int dwxgmac3_fpe_get_add_frag_size(const void __iomem *ioaddr)
+{
+	return FIELD_GET(FPE_MTL_ADD_FRAG_SZ,
+			 readl(ioaddr + XGMAC_MTL_FPE_CTRL_STS));
+}
+
+static void dwxgmac3_fpe_set_add_frag_size(void __iomem *ioaddr,
+					   u32 add_frag_size)
+{
+	u32 value;
+
+	value = readl(ioaddr + XGMAC_MTL_FPE_CTRL_STS);
+	writel(u32_replace_bits(value, add_frag_size, FPE_MTL_ADD_FRAG_SZ),
+	       ioaddr + XGMAC_MTL_FPE_CTRL_STS);
+}
+
+static int dwxgmac3_fpe_map_preemption_class(struct net_device *ndev,
+					     struct netlink_ext_ack *extack,
+					     u32 pclass)
+{
+	u32 val, offset, count, preemptible_txqs = 0;
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	u32 num_tc = ndev->num_tc;
+
+	if (!num_tc) {
+		/* Restore default TC:Queue mapping */
+		for (u32 i = 0; i < priv->plat->tx_queues_to_use; i++) {
+			val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
+			writel(u32_replace_bits(val, i, XGMAC_Q2TCMAP),
+			       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
+		}
+	}
+
+	/* Synopsys Databook:
+	 * "All Queues within a traffic class are selected in a round robin
+	 * fashion (when packets are available) when the traffic class is
+	 * selected by the scheduler for packet transmission. This is true for
+	 * any of the scheduling algorithms."
+	 */
+	for (u32 tc = 0; tc < num_tc; tc++) {
+		count = ndev->tc_to_txq[tc].count;
+		offset = ndev->tc_to_txq[tc].offset;
+
+		if (pclass & BIT(tc))
+			preemptible_txqs |= GENMASK(offset + count - 1, offset);
+
+		for (u32 i = 0; i < count; i++) {
+			val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(offset + i));
+			writel(u32_replace_bits(val, tc, XGMAC_Q2TCMAP),
+			       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(offset + i));
+		}
+	}
+
+	val = readl(priv->ioaddr + XGMAC_MTL_FPE_CTRL_STS);
+	writel(u32_replace_bits(val, preemptible_txqs, FPE_MTL_PREEMPTION_CLASS),
+	       priv->ioaddr + XGMAC_MTL_FPE_CTRL_STS);
+
+	return 0;
+}
+
 const struct stmmac_fpe_ops dwmac5_fpe_ops = {
 	.fpe_configure = dwmac5_fpe_configure,
 	.fpe_send_mpacket = dwmac5_fpe_send_mpacket,
@@ -384,4 +456,9 @@ const struct stmmac_fpe_ops dwmac5_fpe_ops = {
 
 const struct stmmac_fpe_ops dwxgmac_fpe_ops = {
 	.fpe_configure = dwxgmac3_fpe_configure,
+	.fpe_send_mpacket = dwxgmac3_fpe_send_mpacket,
+	.fpe_irq_status = dwxgmac3_fpe_irq_status,
+	.fpe_get_add_frag_size = dwxgmac3_fpe_get_add_frag_size,
+	.fpe_set_add_frag_size = dwxgmac3_fpe_set_add_frag_size,
+	.fpe_map_preemption_class = dwxgmac3_fpe_map_preemption_class,
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
