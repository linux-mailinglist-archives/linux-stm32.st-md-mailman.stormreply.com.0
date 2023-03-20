Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 069036C245B
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 23:16:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF841C6A606;
	Mon, 20 Mar 2023 22:16:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D148C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 22:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679350615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UcZ24ZaYybRtPqLVIgPQFtW7rz0akj/SPyjHKg9YcJc=;
 b=cyy6B9fFgU03L1k2J/lRCld9vqTYcek+uPhIpCGueMkGF9FpKDbvFEWdh50q7R7goDbYda
 Li+C14/gR3vmkfDgVedFNyUSEshcNIm9PY3Tb6iq4U9i5kPOV/85cX8Ze4/a4yFz3w+w/v
 gyLjVahnTsKp9mmRJL1ZPFtciFzJR98=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-MhwWf_ISOny9VyB7LyzTsA-1; Mon, 20 Mar 2023 18:16:54 -0400
X-MC-Unique: MhwWf_ISOny9VyB7LyzTsA-1
Received: by mail-ot1-f71.google.com with SMTP id
 d14-20020a0568301b6e00b0069f3c72187cso1594267ote.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 15:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679350614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UcZ24ZaYybRtPqLVIgPQFtW7rz0akj/SPyjHKg9YcJc=;
 b=5ar4+ULpT9z0+DzoSnrcaGRwJT8MU2W++YxeOtDBM2/n9Wp4yCncgAKrazDLTHbX5i
 5+2OC7u06/FXruqW61JymL1RzbTUHnL6mmFPvSg5dsUInh5My2BHo6l3+IDrn0TacL9H
 HvA1xcEi+VLJ23JfjnAUfaiOZGyYLyAJmu51Q/ZtdYuAb9PJUSQU8h+cUXaiLqhOanOf
 FXtNaHgR36WpfDXh7x3QdwAutj2WyXnVzXslyWF3QJC0nRDGr7IR+CF0pcaJYkDyGXaP
 k8dcHwQJaKBVCSj3ibqoWqNU8oyQB1bMUKSjRGAl/YyIWpiqS0y9FIlhazmcuezZ7SRJ
 X3Lw==
X-Gm-Message-State: AO0yUKVd7lzBjtPQPo5yyD7pB7VUQtYtNrBxTwRTgORuAO7tz94DUc1c
 BPUiuP3Oy6mbvZevY0mXd6QWiuEVqCgzp+JOtmxUzr8yLJgJLmGxHweN5f7ohLuH36C+wO2v95K
 LYeDQu9dOyziigWWmD0E8oA2pJG9Osa9yUYtrSiLR
X-Received: by 2002:a05:6830:1d67:b0:69f:7f2e:9474 with SMTP id
 l7-20020a0568301d6700b0069f7f2e9474mr152764oti.16.1679350613816; 
 Mon, 20 Mar 2023 15:16:53 -0700 (PDT)
X-Google-Smtp-Source: AK7set88qtZ4v8k1HOBLwE7ZvoHS8oAzo1vuNep16/9zREb9pfCiFyhvnnD5S69+nn+LVuujapH8tw==
X-Received: by 2002:a05:6830:1d67:b0:69f:7f2e:9474 with SMTP id
 l7-20020a0568301d6700b0069f7f2e9474mr152732oti.16.1679350613600; 
 Mon, 20 Mar 2023 15:16:53 -0700 (PDT)
Received: from halaney-x13s.redhat.com
 (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
 by smtp.gmail.com with ESMTPSA id
 q204-20020a4a33d5000000b0053853156b5csm4092465ooq.8.2023.03.20.15.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 15:16:53 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 20 Mar 2023 17:16:10 -0500
Message-Id: <20230320221617.236323-6-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320221617.236323-1-ahalaney@redhat.com>
References: <20230320221617.236323-1-ahalaney@redhat.com>
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
 echanude@redhat.com, mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next v2 05/12] clk: qcom: gcc-sc8280xp:
	Add EMAC GDSCs
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

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

I'm still unsure if Bjorn wants to take this patch or net-dev, and how I am
supposed to indicate such other than commenting here (per Stephen's
comment on v1): https://lore.kernel.org/netdev/e5cb46e8874b12dbe438be12ee0cf949.sboyd@kernel.org/#t

Changes since v1:
	* Add Stephen's Acked-by
	* Explicitly tested on x13s laptop with no noticeable side effect (Konrad)

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
