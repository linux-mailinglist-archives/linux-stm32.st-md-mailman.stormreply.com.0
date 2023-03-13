Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 145A66B7E52
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 17:57:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1279C69053;
	Mon, 13 Mar 2023 16:57:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3405FC6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 16:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678726669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yTmnd9hxPpCOOutU5STf4RtQkxrVi6PXtGHNfI7VNJw=;
 b=DEaL0+fNPUYXgw5OhGyCV7Lp6czBeQLYg4QxQZXIrLrRPVzZlL4TyMakB5vhz52QKCpqB9
 S7QTQG6boTy8bY110wxsBz66z44RBF1iRkK29LHiDbYHL6LzqilVt7HeA78P7zl2qbD9iB
 HA7OJ1zXJEoBecKYX6GqnkQ5rCamb7g=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-a_kTgyVEPjyFalqgQh63TQ-1; Mon, 13 Mar 2023 12:57:48 -0400
X-MC-Unique: a_kTgyVEPjyFalqgQh63TQ-1
Received: by mail-oi1-f200.google.com with SMTP id
 bf30-20020a056808191e00b003843744eaecso5615939oib.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 09:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678726667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yTmnd9hxPpCOOutU5STf4RtQkxrVi6PXtGHNfI7VNJw=;
 b=GorYITCvQ5c3fKixaO1eBrxFViPRzTF2uZqSTQA8OF52vLrG2fuCUnveGJdVHKS7CX
 ITUYGK2pJIyzDKxTgGzP98QdoOCFtOb2v+4ZdiiL6a3fGhj9z3PPQfssQ16rlsNa26Cq
 Hq2MTOt6O1IZZUmh+zw1kddogrJFD14WRq3Fmxe+ieZeYzrl47uaX8dijIXYR7zJXFTr
 vynFCKnFhdya6REZ3JzgDgHoFCQeKTmq9Crdfop6Vz/vbTOz8OYwfeQioJHkTXllMJvo
 nUQFrsj4fONqeZwivs8Kya+GqTlqxU2IcUAAlSwCRK6pSd+0+9VUiyIbcyBrVFEWLwtg
 fI0Q==
X-Gm-Message-State: AO0yUKXso6QSIpTk1huAN7iPEwQTGgQfz9cI1fyjDgYpOKR8MBtBo+q3
 b1UvExv7hclZKMIRiCdnH+5/lrwwddEy3zF5rTMrKjtQyp3GBe0N0XWSpm9yPtETR6zqJNXfGWo
 JIkSB630/iHHt44V5Ld2qoFZgKbHjJ3gk7+rbUYSH
X-Received: by 2002:a05:6870:100f:b0:177:c2bd:3f70 with SMTP id
 15-20020a056870100f00b00177c2bd3f70mr1768605oai.54.1678726666846; 
 Mon, 13 Mar 2023 09:57:46 -0700 (PDT)
X-Google-Smtp-Source: AK7set9LTjJnVi7KbqyM3HxA+UA+0412jb6ywCtvfKt8ocQUFVHxB1G6jo2+/GA0kywQ4LDzFQSvgA==
X-Received: by 2002:a05:6870:100f:b0:177:c2bd:3f70 with SMTP id
 15-20020a056870100f00b00177c2bd3f70mr1768573oai.54.1678726666521; 
 Mon, 13 Mar 2023 09:57:46 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::21])
 by smtp.gmail.com with ESMTPSA id
 o2-20020acad702000000b00384d3003fa3sm3365273oig.26.2023.03.13.09.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 09:57:46 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 13 Mar 2023 11:56:15 -0500
Message-Id: <20230313165620.128463-7-ahalaney@redhat.com>
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
Subject: [Linux-stm32] [PATCH net-next 06/11] arm64: dts: qcom: sc8280xp:
	Add ethernet nodes
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

This platform has 2 MACs integrated in it, go ahead and describe them.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 53 ++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 0d02599d8867..a63e8e81a8c4 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -761,6 +761,59 @@ soc: soc@0 {
 		ranges = <0 0 0 0 0x10 0>;
 		dma-ranges = <0 0 0 0 0x10 0>;
 
+		ethernet0: ethernet@20000 {
+			compatible = "qcom,sc8280xp-ethqos";
+			reg = <0x0 0x00020000 0x0 0x10000>,
+				<0x0 0x00036000 0x0 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+
+			clocks = <&gcc GCC_EMAC0_AXI_CLK>,
+				<&gcc GCC_EMAC0_SLV_AHB_CLK>,
+				<&gcc GCC_EMAC0_PTP_CLK>,
+				<&gcc GCC_EMAC0_RGMII_CLK>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii";
+
+			interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 936 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_lpi";
+			iommus = <&apps_smmu 0x4c0 0xf>;
+			power-domains = <&gcc EMAC_0_GDSC>;
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <4096>;
+
+			status = "disabled";
+		};
+
+		ethernet1: ethernet@23000000 {
+			compatible = "qcom,sc8280xp-ethqos";
+			reg = <0x0 0x23000000 0x0 0x10000>,
+				<0x0 0x23016000 0x0 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+
+			clocks = <&gcc GCC_EMAC1_AXI_CLK>,
+				<&gcc GCC_EMAC1_SLV_AHB_CLK>,
+				<&gcc GCC_EMAC1_PTP_CLK>,
+				<&gcc GCC_EMAC1_RGMII_CLK>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii";
+
+			interrupts = <GIC_SPI 929 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 919 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_lpi";
+
+			iommus = <&apps_smmu 0x40 0xf>;
+			power-domains = <&gcc EMAC_1_GDSC>;
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <4096>;
+
+			status = "disabled";
+		};
+
 		gcc: clock-controller@100000 {
 			compatible = "qcom,gcc-sc8280xp";
 			reg = <0x0 0x00100000 0x0 0x1f0000>;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
