Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89212D11C65
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jan 2026 11:16:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53382C5A4CA;
	Mon, 12 Jan 2026 10:16:46 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F586C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 10:16:44 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60CAEdX91315899
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 12 Jan 2026 10:16:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zFQc/f3LoJcO0STRMTwCXpqS5V+wMQxonKqr50466RY=; b=CWekP62O4C6/tK6C
 7awP5boXinwMgc85FDOWC/SKKXHx9BV50Zpt9DxPBm7fAmDzS8YOheL5a9JzTjFL
 1ZYa6+QH3W/KmN4s6Fu3rzl1ITLWc3ZiIfmTIJ9i4NRZ5PqdkbduZxqTXKhAfCa1
 vvVPvZS4mGNYj8DBLTPRAxIjgDHmlBp5hgPLFzOQ8ad/COhRWZnUARSYv53guWfa
 Lou2DCVyy5a0Dl7btlpA6T/G43XOp/2S5/irke7lIuf+Or+wmkUpJVi7oDl/K16W
 PwSbynnewk0ryTiuBo+xooRHiCI6FupdygiG8e+HjghRl7vxdXBhdl0TI5XRkmax
 bLBtUw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hg094-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 10:16:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b2e2342803so1639340685a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 02:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768213002; x=1768817802;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zFQc/f3LoJcO0STRMTwCXpqS5V+wMQxonKqr50466RY=;
 b=FtBjGV0SGk8ctsbhCVwyh0wl8n0Xcvv9NTC1hDvbgOqhJ2hmXFSxn5V2E6S4RDEb9x
 tA0NgxKRMj7PZueySvaIZqhT3jUpT5aRRD90Q12tpR4SExAdVvrMSRBUkZp8ZbSLhJgL
 9HXXVNDct7L6fB2fnfDicU+aQdiDlPYKUQaKKaHdhQkA1qCUFwHfaQjJHyT/XNV9uE3x
 Uyo3IV3qIkhTw7KZjnoB9jx1ATsZ2UfCKUvij0DW6rcs6nonBWw84KgNPUC+FXj07+F/
 O5uv5Ee+1nD8fumfdf3OOUsI8/PF0pf67Tpsd5a0GczTiAfHBSyGXvgazwyGyd7aINe3
 S9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768213002; x=1768817802;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zFQc/f3LoJcO0STRMTwCXpqS5V+wMQxonKqr50466RY=;
 b=cHU1/v0GMCguBZ5s/JyWOGKTXik2ACRNqvWGFbbsdoNJuSpPWcU16gq4DeF0TQgh7o
 km7DGDFZcOX7A3yA2W5inMcAiLqL+bYxXV2/k8ovPJ749uwvveUgrGpNPrHrpFHvn8/G
 xymyuY+JD9qfdoTJgWdrekku7qO/Xt5X+l2R6hZgoSRuaAXy0UYTl5wBT2CKe4WNpOau
 h8bsnt8V7iQ1z6EVvZbKJvGVgOZiFXCGJJRGDEGPSxO5tfjJ94GwAEQUsV7mZFo5kKuw
 tRrNvoYw0b7aXFCG8r4HyYCLeveM7YMu7Pw2C0xQ1euf8+xqm7v7s/o7VOCuBjrzdLD0
 Aw/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB5ssGIP3ZfQ+6R7fITDQjh4aiYqnlMJMzSlu3S3k/49HSRgTEwhTXH1NTyLz+EEFAAgq2zRz8OwucZA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxTv8+UEo5lU23AuUd6MU9OKVMAHGYGTfdEoi+2w2TNuX6+/mWC
 EUYytGZMEIYBtvkF47e2yEou6zXieGZO6DGGzpc2sX8H5wUrsyLjilYYdltsjaPrgnCscTG4xCR
 +ZiTX6jc/JTmheKj1VaiIefQ8RHnzvxvCSma39qxZjh4bLe+wmkJRK5sqLk+kDm7BGes4jUAn3p
 ObUbKXa0c=
X-Gm-Gg: AY/fxX7M9DX+P3X6cin8VcPq3h/cP4bazhhxUwZYD74VGC1uYg0vsLSpBdJIV0x/oVW
 bM8AoHzB6qWmjlX5YO1elUltgKyt2hukO9NFXiLTPNgvglz87NHGGGjwRKev4QSYWlEpjojas2z
 0owTX5q2W4UxIsuIuWLyo7tRI4kgFKpUQbrhrtId/5QHHpXu8ojDY2KWgDCFm9zS7inNdsyh1hE
 VRLefiVJAhJGniEVMNa9Yab9W4V0VZomxjL/W7fzZ91NmpQ6sQ70zIw8tUHCo+iI/kuAadlM7fR
 tBfWBXcp/l6TIRUA0BxCKxIFQatKe4UH+dmhRtlAUpXGJQXW7WPePbRWYkwefN2morUk6iHpYFz
 vlyZk8kAOoQtocGj0TfVNGPeo2HZPYhCVVo0Cn6PD
X-Received: by 2002:a05:620a:1996:b0:8bb:9f02:489e with SMTP id
 af79cd13be357-8c38940620emr2373996285a.74.1768213002340; 
 Mon, 12 Jan 2026 02:16:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXrXS0SxS5wUZ+G1qIZvL98E3Q6AjlGOfNWIhNB5m1WYNLwnoGAnA5FBbfRLH/dJTEWbNC1A==
X-Received: by 2002:a05:620a:1996:b0:8bb:9f02:489e with SMTP id
 af79cd13be357-8c38940620emr2373991585a.74.1768213001730; 
 Mon, 12 Jan 2026 02:16:41 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:eb74:bf66:83a8:4e98])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d865f0cf2sm126530355e9.3.2026.01.12.02.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 02:16:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:15:46 +0100
MIME-Version: 1.0
Message-Id: <20260112-qcom-sa8255p-emac-v6-7-86a3d4b2ad83@oss.qualcomm.com>
References: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
In-Reply-To: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
 Romain Gantois <romain.gantois@bootlin.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>,
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Shuang Liang <liangshuang@eswincomputing.com>,
 Zhi Li <lizhi2@eswincomputing.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
 Samin Guo <samin.guo@starfivetech.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Swathi K S <swathi.ks@samsung.com>, Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11165;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Q4SqwaEAy0IJuUoTx5Bp8FCAYjHMaOkZg5PDcibPFy8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpZMntsWlm4Apuxv8jvFWEjs4JamoLfF23vK94x
 EWQucytZNqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaWTJ7QAKCRAFnS7L/zaE
 w1oVD/92r422DsOUyqEO0JTWxjhBhRUCUsiAse4D5wRHEp7uEYWB/k+LtgscpIwiiPb4xTXG83y
 3ChBZUvT8j6cj51KWa8kNgjyUu3fSFz1lcn/+tngDc1PHIDEGMMNDYSPP7UjQCtfi+6zjm3BCJz
 m7npoS+M15kAN02TpEhg0uwpJyIR8OTXwiIAoYxIdxm7l1J2mghP4NHSjQ2THaiLQtQkog1DONl
 gtAQ6WNTU+QoX8tRr6PU/vTDcu50X0n15BYpUWlRl2JiQQ7j6oo4aTBwECq+pStwKJHS6Aol0FU
 Vag1UfGNNbtQgPcMWS/sOHMitiYNRrXww5orrwBB+NOFW/8JrNmMrXQNJHLiDpkHs4lCrMmLs6b
 oIWHJxLQof12Yu/HFLoXxOb2g4bi7m+fFObMZPLqN61ar9Sd5ii1s6qsFoBvKsB7DRlOHksv4sL
 ZTUfnkUm/X/trorKTBT3rd1z22VSk0Rzi3QpIoeGMeMOBT62ZoceMMdhpCqxWYROMNTfwBXlQYq
 PoodmiAzQUEz+ACjO2SlzBKbZBOiO99cvgDyLWClwb1krNOTxWjEDTvsqofdilKMWXUxbPoZNXX
 z8ffcKG4dxW52ef2qoT+IP+T/XsHuCYL0lqRT8jm4MpPpWN4OerC/fRHr4lW1plgo2LetgXGqzx
 moKId7VMtPY2i8g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: KvXDoPfr3ew6NLuSe-pUUYo1oNQf2MAF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MCBTYWx0ZWRfXyJCaT6XKeZO+
 s7VHyGMHnSIp13fd0RS13Tlptr202RPRA8eqliq9EWEf+B3Yi8jq4pW665dVk4a1mtlOSdLUIfb
 JyMPfHDZjQN4Q4xNKlvyW10h2FB6/dv5pzkhRjXAW6gNt/jWcpLHmyGqT+aFQFVA7+0jipDNmLJ
 Y08dfJ4OZ2w6VC1jIbEAwR+pCl3ET7g0eDfbxxveWR8Emh0HQgBsEoJqBJs59Bf0YvET8EGF6vd
 oGUBd2eDgmlczl83tr7DhUV8hSKIPyjD5ss+PqqBJIN7NQ0LAiDl092yoAl/d/uijwSx+9TFGwP
 zAHca6hiO7wlKhXjKtqCnfLMAFatDtcrONkHE7FmImVVBx0NpJLne24ikoKzHL9yMRRNwGhug6b
 u8YSbs83sMfVHtThDobiU/R5zhKYhTLc8MkK0FJpsB2IAJHlMuwRVnKzhOHydd7W0iOBv8tBUp0
 nj3ZB0bPQXYr14Hg0tA==
X-Proofpoint-ORIG-GUID: KvXDoPfr3ew6NLuSe-pUUYo1oNQf2MAF
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=6964ca0b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gYhETRYomtM5McKHAMIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120080
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RESEND net-next v6 7/7] net: stmmac:
 qcom-ethqos: add support for sa8255p
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

From: Bartosz Golaszewski <brgl@kernel.org>

Extend the driver to support a new model - sa8255p. Unlike the
previously supported variants, this one's power management is done in
the firmware using SCMI. This is modeled in linux using power domains so
add support for them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 234 ++++++++++++++++++---
 1 file changed, 209 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 8ba57bba3f2eebe9e44964f9e6c7c67e46ccb02d..54f8ef3cfd7d55a89920c94d4ba13c331d51d26c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -7,6 +7,8 @@
 #include <linux/platform_device.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_domain.h>
 
 #include "stmmac.h"
 #include "stmmac_platform.h"
@@ -81,6 +83,13 @@
 
 #define SGMII_10M_RX_CLK_DVDR			0x31
 
+enum ethqos_pd_selector {
+	ETHQOS_PD_CORE = 0,
+	ETHQOS_PD_MDIO,
+	ETHQOS_PD_SERDES,
+	ETHQOS_NUM_PDS,
+};
+
 struct ethqos_emac_por {
 	unsigned int offset;
 	unsigned int value;
@@ -98,6 +107,9 @@ struct ethqos_emac_driver_data {
 
 struct ethqos_emac_pm_data {
 	const char *link_clk_name;
+	bool use_domains;
+	struct dev_pm_domain_attach_data pd;
+	unsigned int clk_ptp_rate;
 };
 
 struct ethqos_emac_match_data {
@@ -111,13 +123,20 @@ struct ethqos_emac_pm_ctx {
 	struct phy *serdes_phy;
 };
 
+struct ethqos_emac_pd_ctx {
+	struct dev_pm_domain_list *pd_list;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void __iomem *mac_base;
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
-	struct ethqos_emac_pm_ctx pm;
+	union {
+		struct ethqos_emac_pm_ctx pm;
+		struct ethqos_emac_pd_ctx pd;
+	};
 	phy_interface_t phy_mode;
 	int serdes_speed;
 	int (*set_serdes_speed)(struct qcom_ethqos *ethqos);
@@ -341,6 +360,25 @@ static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.pm_data = &emac_sa8775p_pm_data,
 };
 
+static const char * const emac_sa8255p_pd_names[] = {
+	"core", "mdio", "serdes"
+};
+
+static const struct ethqos_emac_pm_data emac_sa8255p_pm_data = {
+	.pd = {
+		.pd_flags = PD_FLAG_NO_DEV_LINK,
+		.pd_names = emac_sa8255p_pd_names,
+		.num_pd_names = ETHQOS_NUM_PDS,
+	},
+	.use_domains = true,
+	.clk_ptp_rate = 230400000,
+};
+
+static const struct ethqos_emac_match_data emac_sa8255p_data = {
+	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8255p_pm_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -407,6 +445,28 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
+static int qcom_ethqos_domain_on(struct qcom_ethqos *ethqos,
+				 enum ethqos_pd_selector sel)
+{
+	struct device *dev = ethqos->pd.pd_list->pd_devs[sel];
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		dev_err(&ethqos->pdev->dev,
+			"Failed to enable the power domain for %s\n",
+			dev_name(dev));
+	return ret;
+}
+
+static void qcom_ethqos_domain_off(struct qcom_ethqos *ethqos,
+				   enum ethqos_pd_selector sel)
+{
+	struct device *dev = ethqos->pd.pd_list->pd_devs[sel];
+
+	pm_runtime_put_sync(dev);
+}
+
 static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -623,6 +683,13 @@ static int ethqos_set_serdes_speed_phy(struct qcom_ethqos *ethqos)
 	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
 }
 
+static int ethqos_set_serdes_speed_pd(struct qcom_ethqos *ethqos)
+{
+	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
+
+	return dev_pm_opp_set_level(dev, ethqos->serdes_speed);
+}
+
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
@@ -712,6 +779,28 @@ static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 	phy_exit(ethqos->pm.serdes_phy);
 }
 
+static int qcom_ethqos_pd_serdes_powerup(struct net_device *ndev, void *priv)
+{
+	struct qcom_ethqos *ethqos = priv;
+	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
+	int ret;
+
+	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
+	if (ret < 0)
+		return ret;
+
+	return dev_pm_opp_set_level(dev, ethqos->serdes_speed);
+}
+
+static void qcom_ethqos_pd_serdes_powerdown(struct net_device *ndev, void *priv)
+{
+	struct qcom_ethqos *ethqos = priv;
+	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
+
+	dev_pm_opp_set_level(dev, 0);
+	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_SERDES);
+}
+
 static int ethqos_clks_config(void *priv, bool enabled)
 {
 	struct qcom_ethqos *ethqos = priv;
@@ -742,6 +831,68 @@ static void ethqos_clks_disable(void *data)
 	ethqos_clks_config(data, false);
 }
 
+static void ethqos_disable_serdes(void *data)
+{
+	struct qcom_ethqos *ethqos = data;
+
+	qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
+}
+
+static int ethqos_pd_clks_config(void *priv, bool enabled)
+{
+	struct qcom_ethqos *ethqos = priv;
+	int ret = 0;
+
+	if (enabled) {
+		ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_MDIO);
+		if (ret < 0) {
+			dev_err(&ethqos->pdev->dev,
+				"Failed to enable the MDIO power domain\n");
+			return ret;
+		}
+
+		ethqos_set_func_clk_en(ethqos);
+	} else {
+		qcom_ethqos_domain_off(ethqos, ETHQOS_PD_MDIO);
+	}
+
+	return ret;
+}
+
+static int qcom_ethqos_pd_init(struct device *dev, void *priv)
+{
+	struct qcom_ethqos *ethqos = priv;
+	int ret;
+
+	/*
+	 * Enable functional clock to prevent DMA reset after timeout due
+	 * to no PHY clock being enabled after the hardware block has been
+	 * power cycled. The actual configuration will be adjusted once
+	 * ethqos_fix_mac_speed() is called.
+	 */
+	ethqos_set_func_clk_en(ethqos);
+
+	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_CORE);
+	if (ret)
+		return ret;
+
+	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_MDIO);
+	if (ret) {
+		qcom_ethqos_domain_off(ethqos, ETHQOS_PD_CORE);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void qcom_ethqos_pd_exit(struct device *dev, void *data)
+{
+	struct qcom_ethqos *ethqos = data;
+
+	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_MDIO);
+	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_CORE);
+}
+
 static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 {
 	struct plat_stmmacenet_data *plat_dat = priv->plat;
@@ -782,8 +933,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 	}
 
-	plat_dat->clks_config = ethqos_clks_config;
-
 	ethqos = devm_kzalloc(dev, sizeof(*ethqos), GFP_KERNEL);
 	if (!ethqos)
 		return -ENOMEM;
@@ -825,28 +974,67 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
+	ethqos->serdes_speed = SPEED_1000;
 
-	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(ethqos->pm.link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
-				     "Failed to get link_clk\n");
+	if (pm_data && pm_data->use_domains) {
+		ethqos->set_serdes_speed = ethqos_set_serdes_speed_pd;
 
-	ret = ethqos_clks_config(ethqos, true);
-	if (ret)
-		return ret;
+		ret = devm_pm_domain_attach_list(dev, &pm_data->pd,
+						 &ethqos->pd.pd_list);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "Failed to attach power domains\n");
 
-	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
-	if (ret)
-		return ret;
+		plat_dat->clks_config = ethqos_pd_clks_config;
+		plat_dat->serdes_powerup = qcom_ethqos_pd_serdes_powerup;
+		plat_dat->serdes_powerdown = qcom_ethqos_pd_serdes_powerdown;
+		plat_dat->exit = qcom_ethqos_pd_exit;
+		plat_dat->init = qcom_ethqos_pd_init;
+		plat_dat->clk_ptp_rate = pm_data->clk_ptp_rate;
 
-	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->pm.serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
-				     "Failed to get serdes phy\n");
+		ret = qcom_ethqos_pd_init(dev, ethqos);
+		if (ret)
+			return ret;
+
+		ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to enable the serdes power domain\n");
+
+		ret = devm_add_action_or_reset(dev, ethqos_disable_serdes, ethqos);
+		if (ret)
+			return ret;
+	} else {
+		ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
+
+		ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
+		if (IS_ERR(ethqos->pm.link_clk))
+			return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
+					     "Failed to get link_clk\n");
+
+		ret = ethqos_clks_config(ethqos, true);
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+		if (ret)
+			return ret;
+
+		ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+		if (IS_ERR(ethqos->pm.serdes_phy))
+			return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
+					     "Failed to get serdes phy\n");
+
+		ethqos_update_link_clk(ethqos, SPEED_1000);
+
+		plat_dat->clks_config = ethqos_clks_config;
+		plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
+
+		if (ethqos->pm.serdes_phy) {
+			plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
+			plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
+		}
+	}
 
-	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
-	ethqos->serdes_speed = SPEED_1000;
-	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);
 
 	plat_dat->bsp_priv = ethqos;
@@ -864,11 +1052,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (drv_data->dma_addr_width)
 		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
-	if (ethqos->pm.serdes_phy) {
-		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
-		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
-	}
-
 	/* Enable TSO on queue0 and enable TBS on rest of the queues */
 	for (i = 1; i < plat_dat->tx_queues_to_use; i++)
 		plat_dat->tx_queues_cfg[i].tbs_en = 1;
@@ -878,6 +1061,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_qcs404_data},
+	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_sa8255p_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_sa8775p_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_sc8280xp_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_sm8150_data},

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
