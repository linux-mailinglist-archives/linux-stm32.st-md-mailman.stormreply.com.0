Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4C773B4A0
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 12:09:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 013C4C6B456;
	Fri, 23 Jun 2023 10:09:07 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 704D0C6B454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 10:09:06 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso455740f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 03:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687514946; x=1690106946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QwyUb1LcLxFuKvlYDOLM+hUXxmW+mTunlzrn4iVWnOo=;
 b=0mmVBYGrvOJOt+Jg5VZ0+zKW+YJWPhN5BKjhv/JMmHRQ99euFJfiQ7hDBHFm8wxebQ
 x9x3aNpCzEamSQrRKJBoatuR16RXW0X0LVYv0toaMt/AijJGi6BNlS+aG1iuPW6WAZu3
 5MURUoFjAQLiREdG+zzRQ5v9m/sc4rrD6uzBuGvVydh+4Adk0pn0Wkn3sjGblzXQAmki
 I0o+KmZru/W8iSIyURvKsEtkhcVoS7MpfRS4V41ILnn6IfuVYT46pRIM9gqAaUIlvs2I
 7CAZQiPTPKtuMhKui7b1fBzbVppytynni412lmmMYFToE3aNbmR5dbsiZ/1QPVCdNUDE
 AswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687514946; x=1690106946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QwyUb1LcLxFuKvlYDOLM+hUXxmW+mTunlzrn4iVWnOo=;
 b=RResTHnLNxdTZzrnd7Sii+qII0nW/CjyCqe32T9KuAu5wb3z1vv0EddEGSt0Fxjvaa
 LcXgyLxn7QoT6ozHEBC0EXfL5xFdDYKNjQNfE8YOgsgYxYK5Dst8GnEYt9F2Dxi1kKqj
 l9UrIQLLgOVU7sp7afQkyPwhbFOxvXkUkZEeuTh7Th2Kaq1hLe5Bh3bFkmi4bfeX1cf0
 Xgl083QgXTIDFsmcaQpY9hDoYQhYwIFx1vkFYAepWadNQu1hE6dCjauvKySrZo+xfkFy
 7cEQ3Tk+BB2NtQ2VazNKBMYpibx+W+tLQBUIJegTnSgWv/a7Lb/2Bv8QBvYR8Wqc7NZa
 W3xQ==
X-Gm-Message-State: AC+VfDwY7Q6yrjA8s2MU+pkyVNveYdEb8tFQ7uVPU5AJtt7nWmXYpDot
 BAr+KS9HQ/7NCMDZfCMLCJwEAg==
X-Google-Smtp-Source: ACHHUZ6Yfbx0ZEsY9mqVJJgEUR3r5qG9URJm//hluEHwrdGGaVMBXDJc7spRqAxURWphyNTAVEpZTQ==
X-Received: by 2002:a5d:43c2:0:b0:30f:c00d:8a7 with SMTP id
 v2-20020a5d43c2000000b0030fc00d08a7mr3285754wrr.44.1687514946092; 
 Fri, 23 Jun 2023 03:09:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
 by smtp.gmail.com with ESMTPSA id
 k18-20020adfe8d2000000b0030ae3a6be4asm9278100wrn.72.2023.06.23.03.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 03:09:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>
Date: Fri, 23 Jun 2023 12:08:44 +0200
Message-Id: <20230623100845.114085-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623100845.114085-1-brgl@bgdev.pl>
References: <20230623100845.114085-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 11/12] net: stmmac: replace the
	rx_clk_runs_in_lpi field with a flag
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Drop the boolean field of the plat_stmmacenet_data structure in favor of a
simple bitfield flag.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c       | 3 ++-
 include/linux/stmmac.h                                  | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 79e196397aea..743f2261b964 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -790,7 +790,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (of_property_read_bool(np, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
-		plat_dat->rx_clk_runs_in_lpi = 1;
+		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->has_integrated_pcs)
 		plat_dat->flags |= STMMAC_FLAG_HAS_INTEGRATED_PCS;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ebe82e7b50fc..2d68a6e84b0e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1085,7 +1085,8 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 	stmmac_mac_set(priv, priv->ioaddr, true);
 	if (phy && priv->dma_cap.eee) {
 		priv->eee_active =
-			phy_init_eee(phy, !priv->plat->rx_clk_runs_in_lpi) >= 0;
+			phy_init_eee(phy, !(priv->plat->flags &
+				STMMAC_FLAG_RX_CLK_RUNS_IN_LPI)) >= 0;
 		priv->eee_enabled = stmmac_eee_init(priv);
 		priv->tx_lpi_enabled = priv->eee_enabled;
 		stmmac_set_eee_pls(priv, priv->hw, true);
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 47708ddd57fd..c3769dad8238 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -214,6 +214,7 @@ struct dwmac4_addrs {
 #define STMMAC_FLAG_MULTI_MSI_EN		BIT(7)
 #define STMMAC_FLAG_EXT_SNAPSHOT_EN		BIT(8)
 #define STMMAC_FLAG_INT_SNAPSHOT_EN		BIT(9)
+#define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI		BIT(10)
 
 struct plat_stmmacenet_data {
 	int bus_id;
@@ -280,7 +281,6 @@ struct plat_stmmacenet_data {
 	int rss_en;
 	int mac_port_sel_speed;
 	bool en_tx_lpi_clockgating;
-	bool rx_clk_runs_in_lpi;
 	int has_xgmac;
 	u8 vlan_fail_q;
 	unsigned int eee_usecs_rate;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
