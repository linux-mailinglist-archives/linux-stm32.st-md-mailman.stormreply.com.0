Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A40C0A20B0D
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2025 14:14:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67D60C78026;
	Tue, 28 Jan 2025 13:14:12 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEF0DC7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 13:14:10 +0000 (UTC)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250128131408epoutp01f8ba5987c05150d6e26c8dcf694779e7~e3YAJqBym2334723347epoutp01S
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 13:14:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250128131408epoutp01f8ba5987c05150d6e26c8dcf694779e7~e3YAJqBym2334723347epoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738070048;
 bh=IWuiuXQ0igrINl/bOG9DIa5HxlBrrmMZOMGsaT3cS7M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q3Gpggty6kSetSvoQuc9pKnyrScRJEwIWsaiJKgCc2FhxNJ9c3beqigF9Sxwwoz1Y
 IxLUidUoOZL+aUycDP2N8VWKlk7CdqKkhZx9QReq0JSMNIlNKGOKTP+slrKdYBtvFa
 IplN8Et0I5brC3LaGsCUwYuv61HAuNaiqfw/K3e0=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20250128131407epcas5p164a89429f9f508a3426bf77f4debba59~e3X-R0SFW0922109221epcas5p11;
 Tue, 28 Jan 2025 13:14:07 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.182]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Yj5Mx2LlSz4x9Pt; Tue, 28 Jan
 2025 13:14:05 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 58.E9.19710.D18D8976; Tue, 28 Jan 2025 22:14:05 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20250128102738epcas5p45c02f102fa40960d2aa8484603174755~e1GoXveeM2166621666epcas5p4B;
 Tue, 28 Jan 2025 10:27:38 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250128102738epsmtrp1ff44df668be463949a480f802159c534~e1GoVzdUn0854908549epsmtrp1_;
 Tue, 28 Jan 2025 10:27:38 +0000 (GMT)
X-AuditID: b6c32a44-363dc70000004cfe-a5-6798d81d326f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 BD.C1.18729.A11B8976; Tue, 28 Jan 2025 19:27:38 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250128102734epsmtip1907651c65fabbe417cf7e189f17a3306~e1Gkrjc0s1806918069epsmtip12;
 Tue, 28 Jan 2025 10:27:34 +0000 (GMT)
From: Swathi K S <swathi.ks@samsung.com>
To: krzk@kernel.org, robh@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 conor+dt@kernel.org, richardcochran@gmail.com, mcoquelin.stm32@gmail.com,
 andrew@lunn.ch, alim.akhtar@samsung.com, linux-fsd@tesla.com
Date: Tue, 28 Jan 2025 15:55:57 +0530
Message-Id: <20250128102558.22459-4-swathi.ks@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250128102558.22459-1-swathi.ks@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WTe0xTdxTHc+9te4tZ3V0F/EHQsWtmgAi0k3a/MpjLZvRmM5FN5hzOQAPX
 Filt7WPAfKAMyUCtQkQQyiMVxwTlJWARiqUCGkaATeUxoQMFh0+eUWGzrrRl++9zHt9zTs75
 /dgYd47lzY6Xa2iVXCwjWSsYjTf8/QLXDOZLeHdqOXDh0VkEjhY3smDviAWDl0w9KNT3pjNg
 SXsPE0503sfhkLkJhe1dZSi0Gp4zYW9vDQ77GnVMWPegnwnHHn8Db1/Ts2B+bysKs/rHmbD4
 9WUm7Cz1hC9+fYpAQ8M8Dt88aUDg2HQLDgv6jEzY3j2JwTctRhwaRkuZcL52CP/Eh6q/OIRS
 E6cacKqpYASnSuu0VF1FJou6UpZKNRnnUGqq9S6L0tVXIFRbK5+aeGXCqPrrcwhlSyvCqbm6
 tREroxLCpLQ4jlb50vJYRVy8XBJOfrEj+rNogZDHD+SL4Iekr1ycSIeTm7dFBG6Jl9n3Qvp+
 L5Zp7a4IsVpNBn8cplJoNbSvVKHWhJO0Mk6mDFEGqcWJaq1cEiSnNaF8Hu8DgT0xJkFadDwX
 VVaRyW3jL1lHkJs+WYgbGxAhIM08y1xiLtGMgL9sSVnICjvPImCmo4fpNF4gYDY9k7WsyDNN
 Ys6ACQG29AzcaczbjWdNjiwW4QcGfrnqCLgTR1CQ8+w3hwQjrmNgSDfBWMpaRUSB8uw5h4JB
 vA+shluOSThEKGiu7WQ6+70LKmvM2BK7ER+BScMMY6kQIErcwHB+m2uozaC2rcglWAUe36zH
 newNHp3KcHE0qNTdZThZCkYWs13aTcB8R2/3s+3T+YPqa8FO9xqQ21WFLjFGrAQn/x5HnX4O
 MBYv8zrw+km/q6QXaLww5WpFgcyu5yznWnQI+Hm0FT+NrC34v0UpglQgXrRSnSihYwVKvpxO
 +u9usYrEOsTx+gM2G5HBEluQBUHZiAUBbIx05+zpyZdwOXHilB9olSJapZXRagsisC8wG/P2
 iFXYv49cE80PEfFChEJhiGijkE+u5vzYlC7hEhKxhk6gaSWtWtahbDdv+3nG9PyBAWzDp9Y9
 grPp3SblupgIwz87RqUnDw13P7RKVHGWbcXf6oLOPZUeq7bcP3A4ssz6u4Kdgm6p3OtzRS6l
 T0+nmW+l1mxoD/fU5/AO2UKpM2GDqXlf3ZvYHxa5fVi4MSdFRj7IGz8oPJbrLtrF3T+laBG1
 RPZP3hBtz/D8/BK1/sDDXX3vaV+d2/nH7swwj8IvjzKSc1n+fRmeF88zFrcuWJL9Ct+6XGXy
 6Egamvn6XnmM4YTX1YSO0qhqQfPgn+vNfZyqhX1nFiXGkn07x/K5RzPOvyzfXQYyg2sKO/SV
 Sf1V3w0nL75dv9i6yXo89kLWwaTpgJm9h82336mxnfhpNclQS8X8AEylFv8L4a9Sr4YEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWRa0xSYRiA+87hcBDDncjyaKUbo02tLJrVZ7c1u53Wai1XtlYrlmdUijLQ
 TO2uP7zkpfI2U3OoLSlLCfQIYmhqZBZa03IlaelCM2+YWZoWWv+ed8+z9/3xclC+iuXGORMa
 TstDxSECNpdV8VTgvsqtPFuyJv+mA/zZlwlgV34FG5o761D4wPAKgbnmOBa8U/8Kg72Nn3DY
 YaxCYH1TEQItykEMms1lOGypSMGg+nM7Brv7A+EbXS4bZptrEJjY3oPB/N+lGGwsWAzHXwwA
 qNSO4XDmqxbA7uFqHOa0MBisb7aicKaawaGyqwCDY+Ud+LallKakA6F6U7U4VZXTiVMF6ghK
 rUpgU4+LLlNVjA2hhmra2FSKRgWo2hoR1TthQCnNExugpq/l4ZRN7X7A6Sh3cxAdcuYcLV+9
 9ST3dF5SBiJ7KDhf2/ODfQU8W5oIHDgk4UtmGaxoIuBy+IQekKnvm8CccCVHYzOwOV5Ilkx/
 weeiUUD+MDaw7YJNeJJv71XOCmciDSEfjT5B7ANKtKJkbNMIbq8WEkfIF81zq1jEctKiNM0y
 j9hI6ssb/53wIO+XGVE7OxCbSKtyhGVn/t+m+1omSANOBWCeCrjSMoVUIlWIZKJQOtJHIZYq
 IkIlPqfCpGow+05vLwZUqoZ96gDCAXWA5KACZ15CR7qEzwsSR0XT8rAT8ogQWlEHlnBYAhee
 izU5iE9IxOF0ME3LaPl/i3Ac3K4gOhbzS6hdZ7kVletrxSaNv0tdcuLGbxvMtM+vb8/DU2Wt
 hbQuy0WT3LWjLak2xv9l4eYk33tIs1/nVFWkvviueLrHL7b1p3C+dcPywL3CPseygZmxg1+M
 95l+07A2MMZ0XTJT8in16j4dqllx1pW7qO2S/1uLVupoCbCl5DVe3FKUfvvqAHpD57S/8HXn
 94b0PQpmfYvBfeKU54aa3chi90rpBy9BtLH8zoN3x70Ov0zIhpmHtqzv2hO/LOCZsy24OtIT
 uaQfZxb1Te72OiTavlIYz6zN0TtiF3Z2Dy0Qxn3kFh8bdPY4vObN1K5vvMmhoyu28rnNpZfj
 KGGD9zqTScBSnBaLvFG5QvwHMFskMj0DAAA=
X-CMS-MailID: 20250128102738epcas5p45c02f102fa40960d2aa8484603174755
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250128102738epcas5p45c02f102fa40960d2aa8484603174755
References: <20250128102558.22459-1-swathi.ks@samsung.com>
 <CGME20250128102738epcas5p45c02f102fa40960d2aa8484603174755@epcas5p4.samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 ravi.patel@samsung.com, rcsekar@samsung.com, netdev@vger.kernel.org,
 jayati.sahu@samsung.com, ssiddha@tesla.com, linux-kernel@vger.kernel.org,
 swathi.ks@samsung.com, joabreu@synopsys.com, pankaj.dubey@samsung.com,
 peppe.cavallaro@st.com, gost.dev@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 3/4] arm64: dts: fsd: Add Ethernet support
 for FSYS0 Block of FSD SoC
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The FSD SoC contains two instances of Synopsys DWC QoS Ethernet IP, one
in FSYS0 block and other in PERIC block.
The ethernet interface is managed by a switch which is not managed by
Linux.

Adds device tree node for Ethernet in FSYS0 Block and enables the same for
FSD platform.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Jayati Sahu <jayati.sahu@samsung.com>
Signed-off-by: Swathi K S <swathi.ks@samsung.com>
---
 arch/arm64/boot/dts/tesla/fsd-evb.dts      |  9 ++++
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi | 56 ++++++++++++++++++++++
 arch/arm64/boot/dts/tesla/fsd.dtsi         | 20 ++++++++
 3 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
index 8d7794642900..2c37097c709a 100644
--- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
+++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
@@ -64,6 +64,15 @@
 	};
 };
 
+&ethernet_0 {
+	status = "okay";
+
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+};
+
 &fin_pll {
 	clock-frequency = <24000000>;
 };
diff --git a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
index 3f898cf4874c..cb437483ff6e 100644
--- a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
@@ -64,6 +64,62 @@
 		samsung,pin-pud = <FSD_PIN_PULL_UP>;
 		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
 	};
+
+	eth0_tx_clk: eth0-tx-clk-pins {
+		samsung,pins = "gpf0-0";
+		samsung,pin-function = <FSD_PIN_FUNC_2>;
+		samsung,pin-pud = <FSD_PIN_PULL_DOWN>;
+		samsung,pin-drv = <FSD_PIN_DRV_LV6>;
+	};
+
+	eth0_tx_data: eth0-tx-data-pins {
+		samsung,pins = "gpf0-1", "gpf0-2", "gpf0-3", "gpf0-4";
+		samsung,pin-function = <FSD_PIN_FUNC_2>;
+		samsung,pin-pud = <FSD_PIN_PULL_UP>;
+		samsung,pin-drv = <FSD_PIN_DRV_LV6>;
+	};
+
+	eth0_tx_ctrl: eth0-tx-ctrl-pins {
+		samsung,pins = "gpf0-5";
+		samsung,pin-function = <FSD_PIN_FUNC_2>;
+		samsung,pin-pud = <FSD_PIN_PULL_UP>;
+		samsung,pin-drv = <FSD_PIN_DRV_LV6>;
+	};
+
+	eth0_phy_intr: eth0-phy-intr-pins {
+		samsung,pins = "gpf0-6";
+		samsung,pin-function = <FSD_PIN_FUNC_2>;
+		samsung,pin-pud = <FSD_PIN_PULL_NONE>;
+		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
+	};
+
+	eth0_rx_clk: eth0-rx-clk-pins {
+		samsung,pins = "gpf1-0";
+		samsung,pin-function = <FSD_PIN_FUNC_2>;
+		samsung,pin-pud = <FSD_PIN_PULL_UP>;
+		samsung,pin-drv = <FSD_PIN_DRV_LV6>;
+	};
+
+	eth0_rx_data: eth0-rx-data-pins {
+		samsung,pins = "gpf1-1", "gpf1-2", "gpf1-3", "gpf1-4";
+		samsung,pin-function = <FSD_PIN_FUNC_2>;
+		samsung,pin-pud = <FSD_PIN_PULL_UP>;
+		samsung,pin-drv = <FSD_PIN_DRV_LV6>;
+	};
+
+	eth0_rx_ctrl: eth0-rx-ctrl-pins {
+		samsung,pins = "gpf1-5";
+		samsung,pin-function = <FSD_PIN_FUNC_2>;
+		samsung,pin-pud = <FSD_PIN_PULL_UP>;
+		samsung,pin-drv = <FSD_PIN_DRV_LV6>;
+	};
+
+	eth0_mdio: eth0-mdio-pins {
+		samsung,pins = "gpf1-6", "gpf1-7";
+		samsung,pin-function = <FSD_PIN_FUNC_2>;
+		samsung,pin-pud = <FSD_PIN_PULL_NONE>;
+		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
+	};
 };
 
 &pinctrl_peric {
diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 690b4ed9c29b..cc67930ebf78 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -1007,6 +1007,26 @@
 			clocks = <&clock_fsys0 UFS0_MPHY_REFCLK_IXTAL26>;
 			clock-names = "ref_clk";
 		};
+
+		ethernet_0: ethernet@15300000 {
+			compatible = "tesla,fsd-ethqos";
+			reg = <0x0 0x15300000 0x0 0x10000>;
+			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_fsys0 FSYS0_EQOS_TOP0_IPCLKPORT_CLK_PTP_REF_I>,
+				 <&clock_fsys0 FSYS0_EQOS_TOP0_IPCLKPORT_ACLK_I>,
+				 <&clock_fsys0 FSYS0_EQOS_TOP0_IPCLKPORT_HCLK_I>,
+				 <&clock_fsys0 FSYS0_EQOS_TOP0_IPCLKPORT_RGMII_CLK_I>,
+				 <&clock_fsys0 FSYS0_EQOS_TOP0_IPCLKPORT_CLK_RX_I>;
+			clock-names = "ptp_ref", "master_bus", "slave_bus", "tx", "rx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&eth0_tx_clk>, <&eth0_tx_data>, <&eth0_tx_ctrl>,
+				    <&eth0_phy_intr>, <&eth0_rx_clk>, <&eth0_rx_data>,
+				    <&eth0_rx_ctrl>, <&eth0_mdio>;
+			local-mac-address = [00 00 00 00 00 00];
+			iommus = <&smmu_fsys0 0x0 0x1>;
+			phy-mode = "rgmii-id";
+			status = "disabled";
+		};
 	};
 };
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
