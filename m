Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D225A95CF19
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 16:12:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A640C7128F;
	Fri, 23 Aug 2024 14:12:30 +0000 (UTC)
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11AE2C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 14:12:24 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724422314; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=C7PH9zMpE4BMks1lgSGa3vL9pq4gb6RMI+rrRalhUxQv5U4LYS3w1/nN3HJ+xkr8+E/tBYod5/tp6LyVD5KJlBDtx+HMAPR0f8qg4LglJMlPTSgSm3dEdUZM3+cjFrnaxYB5YNqZHSAVQ1/Ic5WkbZMXzdX2RO03ca+EoJwnx6Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724422314;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ROKKRsYio3xxAWmx1+IWV2SIFpDUD68JNopHgT+vf9Y=; 
 b=EIWuVxUovOr0FypNSp/bGh7Tk8d2K7bkzScFAd9T1LMex5aiCsjzNXSiWEF+9HW9xl/VFsHYsY7Wypvqtu5zYr9LLh12si+eqCUIOoZIpPkC6LG3Qw2anTmdr9DdV9fZdvCHfTyNzCp/cwNGZLwrKAg2PBzNyvQJrTU4fWYdJyU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
 dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724422314; 
 s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ROKKRsYio3xxAWmx1+IWV2SIFpDUD68JNopHgT+vf9Y=;
 b=h38/bthj92pZiGKrNEBgZJC/YYHYYdIJ4g6j2ZvhqXmaU5JT578PI2mdVLUgA8XB
 /Gt2VU/btw7knMxKMWW5dgYytLCYwP7kgzy03eI/+2XKY42ftK84uy5Xnx8zRvHs/rg
 KHvSSBpOJF+NRUzXUCyti4OjC+uMEweVMO0XPifE=
Received: by mx.zohomail.com with SMTPS id 1724422312337529.5391082814358;
 Fri, 23 Aug 2024 07:11:52 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 23 Aug 2024 10:11:13 -0400
Message-ID: <20240823141318.51201-2-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240823141318.51201-1-detlev.casanova@collabora.com>
References: <20240823141318.51201-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@collabora.com, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/3] ethernet: stmmac: dwmac-rk: Fix typo
	for RK3588 code
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

Fix SELET -> SELECT in RK3588_GMAC_CLK_SELET_CRU and
RK3588_GMAC_CLK_SELET_IO

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 7ae04d8d291c8..9cf0aa58d13bf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1141,8 +1141,8 @@ static const struct rk_gmac_ops rk3568_ops = {
 #define RK3588_GMAC_CLK_RMII_MODE(id)		GRF_BIT(5 * (id))
 #define RK3588_GMAC_CLK_RGMII_MODE(id)		GRF_CLR_BIT(5 * (id))
 
-#define RK3588_GMAC_CLK_SELET_CRU(id)		GRF_BIT(5 * (id) + 4)
-#define RK3588_GMAC_CLK_SELET_IO(id)		GRF_CLR_BIT(5 * (id) + 4)
+#define RK3588_GMAC_CLK_SELECT_CRU(id)		GRF_BIT(5 * (id) + 4)
+#define RK3588_GMAC_CLK_SELECT_IO(id)		GRF_CLR_BIT(5 * (id) + 4)
 
 #define RK3588_GMA_CLK_RMII_DIV2(id)		GRF_BIT(5 * (id) + 2)
 #define RK3588_GMA_CLK_RMII_DIV20(id)		GRF_CLR_BIT(5 * (id) + 2)
@@ -1240,8 +1240,8 @@ static void rk3588_set_gmac_speed(struct rk_priv_data *bsp_priv, int speed)
 static void rk3588_set_clock_selection(struct rk_priv_data *bsp_priv, bool input,
 				       bool enable)
 {
-	unsigned int val = input ? RK3588_GMAC_CLK_SELET_IO(bsp_priv->id) :
-				   RK3588_GMAC_CLK_SELET_CRU(bsp_priv->id);
+	unsigned int val = input ? RK3588_GMAC_CLK_SELECT_IO(bsp_priv->id) :
+				   RK3588_GMAC_CLK_SELECT_CRU(bsp_priv->id);
 
 	val |= enable ? RK3588_GMAC_CLK_RMII_NOGATE(bsp_priv->id) :
 			RK3588_GMAC_CLK_RMII_GATE(bsp_priv->id);
-- 
2.46.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
