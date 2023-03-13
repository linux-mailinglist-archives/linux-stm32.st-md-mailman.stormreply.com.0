Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E316B7E56
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 17:58:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CEEEC6A61A;
	Mon, 13 Mar 2023 16:58:18 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 258CAC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 16:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678726696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UvT8dewLuU3QnqVEc1CXfBrmN1ZPxzVWkwUJz3YT87Y=;
 b=XpQShXx+tYWngNaMhTMIDlYhc3sJBmVfDN9qefqTA69Aj+xPodOWAlHh/zHe9xVk6uAInS
 P/PsLqRu0Id2ZawWr1LLz4fOF+pT108tFP9bJjqmAFq1p6te38UKw1DAbpBazGC/H0Jknl
 RkB2pqxevZ/PNBSKSdSIA6uCJI6dc4c=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-nZThZy25Pqio2Cjmb8GeCQ-1; Mon, 13 Mar 2023 12:58:07 -0400
X-MC-Unique: nZThZy25Pqio2Cjmb8GeCQ-1
Received: by mail-oo1-f70.google.com with SMTP id
 t18-20020a4a7452000000b00525456d55f7so3518515ooe.14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 09:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678726686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UvT8dewLuU3QnqVEc1CXfBrmN1ZPxzVWkwUJz3YT87Y=;
 b=0ls4OmeKrKUsGYXhoYyHe+8jxaCbdbPZ/AOJxG5Lr/sQxy0rNC/uwdg5UpTFwgQ6vN
 xusvUaEIlGMvACPPbP0207ODHbI4I4aUcIY4dGn+cGBrHYN18CU5FzU9WDTweK611ttc
 bOmjo8gnUWX4goN0enDuTz7p2pEqHEWCPc7WnVYIaMzViAUneW4o6dDE7gp+fHKj1lJY
 lVFE6MVEhUm0Sf5YwU21y05HqXnu7Cj3Tb02XvufRG0Y/cJ1l+K6kOZuWtF9BvI0enbt
 hp8RaDRUf/goKlOh+u2P5tdvoV+0W0xjCIB9wf6lnihxNC2AE1Zyw5GJxaP4Rw9QdlrL
 qTlw==
X-Gm-Message-State: AO0yUKUb+1oQPQwOcBFRKr8TcgvhPkJmZ2irIpYBxuLWgf18jyeWv+El
 uCQ4AnJoYt9qo/2AFQUHmmGwVwF2zkTSVNFoBTj+AXT+XfUNY+qviU/n/H2ud+Jhv+rbNGwC4Jy
 MUvTJQ6kEWR5DLkiB26oKQqWtGfu1Wyw6yODoTtKj
X-Received: by 2002:a05:6808:a19:b0:37f:8776:7fb with SMTP id
 n25-20020a0568080a1900b0037f877607fbmr15913843oij.24.1678726686590; 
 Mon, 13 Mar 2023 09:58:06 -0700 (PDT)
X-Google-Smtp-Source: AK7set+WjxF5eMC/5GAjn7mgs0DvZdG92v2v9SNlkN9egFVAPTvhTUYGhYSYuKXbszu7ZOxcCLmAdQ==
X-Received: by 2002:a05:6808:a19:b0:37f:8776:7fb with SMTP id
 n25-20020a0568080a1900b0037f877607fbmr15913817oij.24.1678726686349; 
 Mon, 13 Mar 2023 09:58:06 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::21])
 by smtp.gmail.com with ESMTPSA id
 o2-20020acad702000000b00384d3003fa3sm3365273oig.26.2023.03.13.09.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 09:58:06 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 13 Mar 2023 11:56:18 -0500
Message-Id: <20230313165620.128463-10-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313165620.128463-1-ahalaney@redhat.com>
References: <20230313165620.128463-1-ahalaney@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org,
 Andrew Halaney <ahalaney@redhat.com>, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 agross@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next 09/11] net: ethernet: stmmac:
	dwmac-qcom-ethqos: Respect phy-mode and TX delay
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

The driver currently sets a MAC TX delay of 2 ns no matter what the
phy-mode is. If the phy-mode indicates the phy is in charge of the
TX delay (rgmii-txid, rgmii-id), don't do it in the MAC.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 732774645c1a..6f272cae330d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -279,6 +279,16 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 
 static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 {
+	int phy_mode;
+	int phase_shift;
+
+	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
+	phy_mode = device_get_phy_mode(&ethqos->pdev->dev);
+	if (phy_mode == PHY_INTERFACE_MODE_RGMII_ID || phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
+		phase_shift = 0;
+	else
+		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
+
 	/* Disable loopback mode */
 	rgmii_updatel(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
 		      0, RGMII_IO_MACRO_CONFIG2);
@@ -300,9 +310,9 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 			      RGMII_CONFIG_PROG_SWAP, RGMII_IO_MACRO_CONFIG);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
 			      0, RGMII_IO_MACRO_CONFIG2);
+
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-			      RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-			      RGMII_IO_MACRO_CONFIG2);
+				  phase_shift, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      0, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
@@ -336,8 +346,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 		rgmii_updatel(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
 			      0, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-			      RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-			      RGMII_IO_MACRO_CONFIG2);
+				  phase_shift, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_2,
 			      BIT(6), RGMII_IO_MACRO_CONFIG);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
@@ -375,7 +384,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 		rgmii_updatel(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
 			      0, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-			      0, RGMII_IO_MACRO_CONFIG2);
+				  phase_shift, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_9,
 			      BIT(12) | GENMASK(9, 8),
 			      RGMII_IO_MACRO_CONFIG);
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
