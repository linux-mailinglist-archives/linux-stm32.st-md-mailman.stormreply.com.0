Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF2B91D9D1
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2024 10:20:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C1A5C6C820;
	Mon,  1 Jul 2024 08:20:42 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B75BFC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jul 2024 08:20:34 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7067435d376so1873494b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Jul 2024 01:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719822033; x=1720426833;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MC5/1uIy6r+d6wkfwo0SgQbace/5QXNKCEPCP25Y26U=;
 b=QL+Bzol9qZcdx3YPq8Ktn32lhF3XvvbSWtTjyUlgUNuu4DFCOqgoKTLSGtq5OA07y6
 JxH3XLbTVuayJpgfyS/6EfqN3XM4Pw+O49AsastXPH+0cJHiBCNBxnFOhU+qV0VH89VZ
 MWn8Q+FUHfskD1Ql3toIbWRVVhwW/eos7OifcS0aA7Tr1S+ahQGBx+KELt+iwJI7dXFx
 xL4AKrIXyMS0uZBXHMswl4JKoYkZrPIU/Q+hmjY4z1A0I/QoknmGI4SkAr4p3K8Kkzu8
 NuLZoYtv8lt1/HEjkL73oF1gTFCSVKoXAPWs8RJsKND9ONQ8cdePzqcsw5R4gBldiyBX
 0PHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719822033; x=1720426833;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MC5/1uIy6r+d6wkfwo0SgQbace/5QXNKCEPCP25Y26U=;
 b=xVIfaNDPBYyOORUHBwqRJdGoerH55kAVdjPLnLJnRV3EMEpQ4Vmi26DrmbCHmx1y0H
 75u8uPXoDxLE21ESWHSl/4zYQ/4HImt0kBEUXSkIvZ29Gq24gcMwD2bfPJNk0wTWyHPw
 A9iqnKWZCX4H8mpVkRWS25JFVR3lj1sdhRf2iIqJvQRWnAaZOGEIBIZseLFxtimAFGQR
 9ghm99A7AMgdMlliqik1/TMVGUgDQfDVdrFGJFWztUB0vUC6I0ornwVFi6+aGKVJ4GyN
 XN6AWdaTBBMeQjc04Rw/3Sh4S+QhInmYrboLtUKh1jx4Xt9QUdbg8iR4cS/LH8hUYfFn
 L7Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfBmjXpFq13WX+eA4RfQ59p82PIF7Ti/7F2Kmcx7GnPWhH9KYlPtzR0pChqSskFlHCFhGEZNRoU2Ezh9wxxOEIxNMzlEuJzMW1NnAIyew51d5tKoy9EiWu
X-Gm-Message-State: AOJu0YxCeKB+0+QQGTX7cYkZ32YMZflgfrA0i58RadwLN4Q+iE6FUbzP
 H3pgOc7WfV+FPt/+L5QgTXWWMrKxe8dPxJx2mL8f+vLoeaIQZMo2
X-Google-Smtp-Source: AGHT+IHwmPMU7oYRhiuqelGxgEX+rgaw/YH4bqX/NunRhcIN6nUMudhE6o8PIx3RNMLJoj1enQ/H9g==
X-Received: by 2002:a05:6a00:4b13:b0:705:cc7d:ab7d with SMTP id
 d2e1a72fcca58-70851875908mr16008127b3a.5.1719822033063; 
 Mon, 01 Jul 2024 01:20:33 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-708044ac424sm5864836b3a.161.2024.07.01.01.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 01:20:32 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>, Lai Peter Jun Ann <jun.ann.lai@intel.com>
Date: Mon,  1 Jul 2024 16:19:36 +0800
Message-Id: <20240701081936.752285-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v1] net: stmmac: enable HW-accelerated
	VLAN stripping for gmac4 only
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

Commit 750011e239a5 ("net: stmmac: Add support for HW-accelerated VLAN
stripping") enables MAC level VLAN tag stripping for all MAC cores, but
leaves set_hw_vlan_mode() and rx_hw_vlan() un-implemented for both gmac
and xgmac.

On gmac and xgmac, ethtool reports rx-vlan-offload is on, both MAC and
driver do nothing about VLAN packets actually, although VLAN works well.

Driver level stripping should be used on gmac and xgmac for now.

Fixes: 750011e239a5 ("net: stmmac: Add support for HW-accelerated VLAN stripping")
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b3afc7cb7d72..c58782c41417 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7662,9 +7662,10 @@ int stmmac_dvr_probe(struct device *device,
 #ifdef STMMAC_VLAN_TAG_USED
 	/* Both mac100 and gmac support receive VLAN tag detection */
 	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX;
-	ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
-	priv->hw->hw_vlan_en = true;
-
+	if (priv->plat->has_gmac4) {
+		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
+		priv->hw->hw_vlan_en = true;
+	}
 	if (priv->dma_cap.vlhash) {
 		ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
 		ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
