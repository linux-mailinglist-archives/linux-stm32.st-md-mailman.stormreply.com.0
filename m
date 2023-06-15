Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3367173186F
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 14:15:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E98E4C6A61A;
	Thu, 15 Jun 2023 12:15:05 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54CB7C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 12:15:04 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-4f60a27c4a2so9882819e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686831303; x=1689423303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ehfVzvQExF8A0HC8WC/ILIhv/WTmHbal1y8W4TeN1es=;
 b=Wu7sz9no4+E8WobBYLCTxrRQ/ms5cwOJWlPzNtXwqHQMxzmBf5xhIkwHh6m0zZ747E
 Xd8rdNa2gg+7ZwyKASQElj9GxfdetYldiyx+OqRdXH02wPTOy8aPbQW4+Uk80h2jUH4O
 1+qye4b806eH5haBuO/GcTONTvg/RUyUfVowUuLIqaRUA4+z4YouDS4U4UAn8WrBlqxT
 UhKIyOyvnt2b3hS2nx8L1ASe+qeIQGGv25SN/2Qstdr5ZNnoiRgaPs87RWveDl591nAT
 PjCryBJlEXlDJmLud0L8AWDCywY0Mo3IsceqcK4BzuFY9zkl+TXGnaQFVggc4Gw+QotL
 +vbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686831303; x=1689423303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ehfVzvQExF8A0HC8WC/ILIhv/WTmHbal1y8W4TeN1es=;
 b=glnJRn5EnMQhzVp8/MNNyPoMIs+9ZPV9OqBGr7/Ws7+sJaPgRXuHD0vl7AboFxEryD
 zV2mEzlLk2VyD1+cMVDd0O1efXvXiR9xmLOGHVa+vTfVNdjbk3SlSiTME/4OdTxDDMMz
 278EhCic1oCbkS/i2+14xamxsqqrpkuZBjuW3mPmDvQndXizMSryeUf4sbLsc/U6cFts
 AjD6lIyZVuW/zj0l982wI2k22km39stmfX/dAUSSUCjT+OgW0RGJAZPz8+zMk5ZoTjTw
 qStx3N/PMlGvDPFycaEiV29aOP6nGmqAeVXeHYUY+vW8SBA7sZf1kY/Dk1maH7CRpWAd
 QX3A==
X-Gm-Message-State: AC+VfDzdkER3EySkRWF646cR2r5qY6YaU8n2jI863WhPBPmuI9fOSdrk
 +qxD6j0eyTxTrJL7U6PjSqccqw==
X-Google-Smtp-Source: ACHHUZ501jOXOdbI2vCoh9Z+8k50wxBJblPlQxddMcmLJtJFW3AHRsWBrNj0ZJXAqwZBC0Y5jwcrWQ==
X-Received: by 2002:a05:6512:44b:b0:4f2:6817:2379 with SMTP id
 y11-20020a056512044b00b004f268172379mr9064077lfk.23.1686831303698; 
 Thu, 15 Jun 2023 05:15:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2ad4:65a7:d9f3:a64e])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a5d4291000000b003047ea78b42sm20918012wrq.43.2023.06.15.05.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 05:15:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Thu, 15 Jun 2023 14:14:19 +0200
Message-Id: <20230615121419.175862-24-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615121419.175862-1-brgl@bgdev.pl>
References: <20230615121419.175862-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 23/23] arm64: dts: qcom: sa8775p-ride:
	enable ethernet0
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

Enable the first 1Gb ethernet port on sa8775p-ride development board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 88 +++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index bf90f825ff67..b2aa16037707 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -261,6 +261,94 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&ethernet0 {
+	phy-mode = "sgmii";
+	phy-handle = <&sgmii_phy>;
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	snps,ps-speed = <1000>;
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
+		reset-delay-us = <11000>;
+		reset-post-delay-us = <70000>;
+
+		sgmii_phy: phy@8 {
+			reg = <0x8>;
+			device_type = "ethernet-phy";
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+		snps,tx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
 &i2c11 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&qup_i2c11_default>;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
