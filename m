Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6754174F96B
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 22:58:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2455EC6B457;
	Tue, 11 Jul 2023 20:58:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B41EC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 20:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689109094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DGh+uAGSNBabNs8otONzVd5nXL6Ue86FrE6lpV0zFTs=;
 b=ccKcEHQqNDz9xSZV1ZnUB4860nuqgkThrH6VxQmxG2XkF0689mQU5miCLlg40S+tQdVglB
 d1LQiwgLMhF+CwGBa41eE7JSvw8oti69FgEtnmSfxNWKftR5mHyxGtgtyZ4zDDX6M+WRvS
 usoHg4tsw7VLG1LXNqtyq8m+3pKgP4A=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-2lHwAEafOleBpwr8ucAFNA-1; Tue, 11 Jul 2023 16:58:11 -0400
X-MC-Unique: 2lHwAEafOleBpwr8ucAFNA-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-5704970148dso62815857b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 13:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689109091; x=1691701091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DGh+uAGSNBabNs8otONzVd5nXL6Ue86FrE6lpV0zFTs=;
 b=akYaWpiKxejIijb3RCKvA4io/FdJBfAwUXgCjt4JxGh9wtLLTPLgZHp+zGJyfeMFvW
 ERjzIlLyJmrFe+61Zj3d9bic7kHghKFZMcM8ZYiPN9VqfJ85HigYdcDql4AF9fLxKObE
 wG/cfrUtNXMVQTu1bSdBVsQ8td5M1yXQwfrRodSxx+IAMrdrshYJWMkwvcomFPZEEU9F
 726pTHCBjb+Vm/K/hsycasyuJejjaoCBfP/t3DqNinPhmPm1JQlsfL8kZVdDUNwe+6mo
 +uV8fejvxApkgoYL6YxYKvzaOHFk6H3eRI2RZnxxd49gloc3ZuWT6AHxEMoG24rbzWHQ
 bIng==
X-Gm-Message-State: ABy/qLZF4mspQLizbLQeiTlU8QbTNGMT2AHU1mM4BHU13YHjrEF04PFK
 KxVFn21uVPhCHz8c9kGRMTtLw5s3CI3YlCza8p++nAip4FUPwthlS8UOsRFvH4Vaoc62t6CBmMq
 xe/hdX4pUrJSPPwV0//5c13SfRcFYbX0z5sJ00vsh
X-Received: by 2002:a0d:d851:0:b0:56d:5272:d540 with SMTP id
 a78-20020a0dd851000000b0056d5272d540mr15383336ywe.46.1689109090880; 
 Tue, 11 Jul 2023 13:58:10 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEBKIgazDrRhr2+67U2dBV7TYIWtfQ85b0QfXe8t9Je+goLDwuNWjUTwlmm9dlLHEZL6Qvc5A==
X-Received: by 2002:a0d:d851:0:b0:56d:5272:d540 with SMTP id
 a78-20020a0dd851000000b0056d5272d540mr15383327ywe.46.1689109090644; 
 Tue, 11 Jul 2023 13:58:10 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::22])
 by smtp.gmail.com with ESMTPSA id
 j136-20020a81928e000000b00545a08184cesm785353ywg.94.2023.07.11.13.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 13:58:10 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 11 Jul 2023 15:35:30 -0500
Message-ID: <20230711205732.364954-2-ahalaney@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711205732.364954-1-ahalaney@redhat.com>
References: <20230711205732.364954-1-ahalaney@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: vkoul@kernel.org, bhupesh.sharma@linaro.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, jsuraj@qti.qualcomm.com, davem@davemloft.net,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH RFC/RFT net-next 1/3] net: stmmac: Make
	ptp_clk_freq_config variable type explicit
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

The priv variable is _always_ of type (struct stmmac_priv *), so let's
stop using (void *) since it isn't abstracting anything.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 3 +--
 include/linux/stmmac.h                            | 4 +++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index ab9f876b6df7..718bae6872da 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -257,9 +257,8 @@ static void intel_speed_mode_2500(struct net_device *ndev, void *intel_data)
 /* Program PTP Clock Frequency for different variant of
  * Intel mGBE that has slightly different GPO mapping
  */
-static void intel_mgbe_ptp_clk_freq_config(void *npriv)
+static void intel_mgbe_ptp_clk_freq_config(struct stmmac_priv *priv)
 {
-	struct stmmac_priv *priv = (struct stmmac_priv *)npriv;
 	struct intel_priv_data *intel_priv;
 	u32 gpio_value;
 
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 06090538fe2d..c0cbcef1a2f0 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -76,6 +76,8 @@
 			| DMA_AXI_BLEN_32 | DMA_AXI_BLEN_64 \
 			| DMA_AXI_BLEN_128 | DMA_AXI_BLEN_256)
 
+struct stmmac_priv;
+
 /* Platfrom data for platform device structure's platform_data field */
 
 struct stmmac_mdio_bus_data {
@@ -245,7 +247,7 @@ struct plat_stmmacenet_data {
 	int (*serdes_powerup)(struct net_device *ndev, void *priv);
 	void (*serdes_powerdown)(struct net_device *ndev, void *priv);
 	void (*speed_mode_2500)(struct net_device *ndev, void *priv);
-	void (*ptp_clk_freq_config)(void *priv);
+	void (*ptp_clk_freq_config)(struct stmmac_priv *priv);
 	int (*init)(struct platform_device *pdev, void *priv);
 	void (*exit)(struct platform_device *pdev, void *priv);
 	struct mac_device_info *(*setup)(void *priv);
-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
