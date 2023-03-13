Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E81C46B7E51
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 17:57:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3D84C69053;
	Mon, 13 Mar 2023 16:57:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 699EDC6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 16:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678726664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FkVDFtAQ2HQaEyizSIOrTNSjW2E/XPvrw+UQkBvQei4=;
 b=cxw5MI7axlHvX+HtFrp/MJ9jxWen48K1cf5mDUtz451QdCALfC2CUKmNNikl6sePjzKlP7
 4z3RbGtyqhJpKaeO6B0iD0xiwmrmSNX4OQUxcJu2LgdYy9+MARehmiRfoksQQUge7zGZfm
 6TNCfxgLAb15z2l1IyLwIm+YnVKMc5E=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-vhuDsjGOMXKMiH8jfurzGg-1; Mon, 13 Mar 2023 12:57:43 -0400
X-MC-Unique: vhuDsjGOMXKMiH8jfurzGg-1
Received: by mail-oo1-f72.google.com with SMTP id
 y140-20020a4a4592000000b0052540059057so3511175ooa.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 09:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678726662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FkVDFtAQ2HQaEyizSIOrTNSjW2E/XPvrw+UQkBvQei4=;
 b=j8D/DuCh6pIrEUIY92bwdvRP/DUADmjhkS2wqq3dBvkJjTYuGySmiI+AFmIuzJFTs5
 fPwUDPgLQTHzGsYv+axCjaQR0qtswGEas3lrYePflEMFw53NgAcUMM4Jd2sMBqo77TIk
 pWy90NnzpKXRpUaDm9Q15W0+f8v4f9rd/eLVlOm9kEWy4wCywFKZySF6uTqVkT8YVhWL
 gDBO6teDmaMRvpVyNvjs5xRT8jvj0KXZywDbjQK1AQcarvU6Jhk3I6wm4SSViR+XOyB6
 kmDEwu5D+Y50UcLWJBIPjtezLVRFapk4cj7RDuEkr1AqxlIEBfuOl94QunTXBKZU4x5A
 uxHA==
X-Gm-Message-State: AO0yUKU0wEVPFA2a9VP8WPI3w6fzDk5AG7ryxLeDlOP+j6MxFXUUCNAQ
 hArhd9jT+GMq88RQ454klZvaE9qcsHyWkvUbvvfOIi/uGolp++yY3HA7X+gCBCMTRXP2f1g1utD
 F51o7OOv0ermbg6m+0lwWZU7js6u2rxT/NWtOfrX5
X-Received: by 2002:aca:130d:0:b0:378:7c77:6021 with SMTP id
 e13-20020aca130d000000b003787c776021mr13373617oii.8.1678726662722; 
 Mon, 13 Mar 2023 09:57:42 -0700 (PDT)
X-Google-Smtp-Source: AK7set9zI+gra3VQW7qNd6jbtiTXOZJk4ZtO+IfaDcE9o1iUhzMPehPEW5A3iOw3mlYvk5kuKPNxoA==
X-Received: by 2002:aca:130d:0:b0:378:7c77:6021 with SMTP id
 e13-20020aca130d000000b003787c776021mr13373580oii.8.1678726662434; 
 Mon, 13 Mar 2023 09:57:42 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::21])
 by smtp.gmail.com with ESMTPSA id
 o2-20020acad702000000b00384d3003fa3sm3365273oig.26.2023.03.13.09.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 09:57:42 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 13 Mar 2023 11:56:14 -0500
Message-Id: <20230313165620.128463-6-ahalaney@redhat.com>
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
Subject: [Linux-stm32] [PATCH net-next 05/11] clk: qcom: gcc-sc8280xp: Add
	EMAC GDSCs
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

Add the EMAC GDSCs to allow the EMAC hardware to be enabled.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/clk/qcom/gcc-sc8280xp.c               | 18 ++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index b3198784e1c3..04a99dbaa57e 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -6873,6 +6873,22 @@ static struct gdsc usb30_sec_gdsc = {
 	.pwrsts = PWRSTS_RET_ON,
 };
 
+static struct gdsc emac_0_gdsc = {
+	.gdscr = 0xaa004,
+	.pd = {
+		.name = "emac_0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc emac_1_gdsc = {
+	.gdscr = 0xba004,
+	.pd = {
+		.name = "emac_1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
 static struct clk_regmap *gcc_sc8280xp_clocks[] = {
 	[GCC_AGGRE_NOC_PCIE0_TUNNEL_AXI_CLK] = &gcc_aggre_noc_pcie0_tunnel_axi_clk.clkr,
 	[GCC_AGGRE_NOC_PCIE1_TUNNEL_AXI_CLK] = &gcc_aggre_noc_pcie1_tunnel_axi_clk.clkr,
@@ -7351,6 +7367,8 @@ static struct gdsc *gcc_sc8280xp_gdscs[] = {
 	[USB30_MP_GDSC] = &usb30_mp_gdsc,
 	[USB30_PRIM_GDSC] = &usb30_prim_gdsc,
 	[USB30_SEC_GDSC] = &usb30_sec_gdsc,
+	[EMAC_0_GDSC] = &emac_0_gdsc,
+	[EMAC_1_GDSC] = &emac_1_gdsc,
 };
 
 static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
diff --git a/include/dt-bindings/clock/qcom,gcc-sc8280xp.h b/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
index cb2fb638825c..721105ea4fad 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
@@ -492,5 +492,7 @@
 #define USB30_MP_GDSC					9
 #define USB30_PRIM_GDSC					10
 #define USB30_SEC_GDSC					11
+#define EMAC_0_GDSC					12
+#define EMAC_1_GDSC					13
 
 #endif
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
