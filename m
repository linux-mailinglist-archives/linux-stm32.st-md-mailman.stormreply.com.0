Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 375B9D11C53
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jan 2026 11:16:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02923C57A50;
	Mon, 12 Jan 2026 10:16:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD3B3C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 10:16:30 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60C8s2gj676100
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 12 Jan 2026 10:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q+Z6aIVkrhhREMp41SA/JdGCM+9SvWLbacrpqL7MVlU=; b=N4gKoyI65i9dDHJk
 Y9vPOXxQ44naxTz7AJdgU4cno65B9RAWMj9qvyAOFqW/nz2JMcunfyD07+cwh4bC
 EGn1HDB3rryhUBvugqxNwZAmfLZdEr2CIWNNP5YhpCeZcaL5QqTCAeI0HEuQWYte
 EDkVu7hcMC1xpV8uIcQ1qG2jLClRmkYJkgQUJ3r4wqCvsPY/NGfQP/e5MmOGOT+k
 5jrOowKETiVdzWdMpwGdORWpGE6EDnTIboo1M1NKHx297vbJavRDkz6XwfPE/9dG
 oLBzHvN/YgcZAi5nXWyEwbI1UkAZbieaoeIPbCQ4E7J6KFBFNfk+ykS19HtP+o3M
 Bib2yA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmwur891s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 10:16:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b22ab98226so1678221685a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 02:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768212988; x=1768817788;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Q+Z6aIVkrhhREMp41SA/JdGCM+9SvWLbacrpqL7MVlU=;
 b=ZXdbuRDhfancVgX2KtgJ/HQ758HcnW9Sg3+kF7yAJvLHcXY5ZClnMupNSVn6lVGjbR
 WLsGWuQjrOASH/dB69DHURkC2Lwx2PhoFE7uwu/7MsAU7YPBPvqn6zqCki2+13mQ5q6T
 JMxdnrHkn20uFt4+k0vlyBCdQkuLpNTb5IN9Oqd/UW3kuqx3IumYmDK090c6KPdTvA2r
 LHUcpRqeu5kolHGeNqKPtRfYvhSrjMGcOn3dgO1XZZKC/lpSIxuTazFK0lgblZArNffG
 cJH3muG2dnYv9457FCnqvA6sX5rp75S14vIX/Lvl2oRAPRN/TSE78UYE6fJjNullSju3
 a1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768212988; x=1768817788;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Q+Z6aIVkrhhREMp41SA/JdGCM+9SvWLbacrpqL7MVlU=;
 b=cYoY80ahk+oovp0YAPuR37Zu89fpvtEo7l1dcz1hsiaru2aDBF9p+MZwmW994V7ls0
 CHYloAqQm4O6t3QWqTYIiQqj/mhjYwjbHf/1CgBGSKlGm+krYniPegTNsZFRc/2n4Fwe
 i9KanaPZjj4ZSftEI86d7MOTIOEOl5EuCs5xlno+1zDn9+rPin6x+JLOjh2bqrv4Abml
 Z2lxtVTaddXoUDCTrzeuIzyqGmkDfF0taE0wT8JTotQ0qLd48jaFRCTTNJUyv1s609Nm
 E5BLX45xpOACpGuZMvK4i4ebFUCmmhTqn+AiN7j/c/16B3oiJ2kVbrzh8JYoV72gGBgt
 BaCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwhBH7OYkFoKj5W/1TTdxaTtLcKk1rNCLQlCUnq16iXxU40RJytUTfqJLsfm6aC88PPdleApKrhPDzqg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx0sGKd8sxLdjaiOVO8Z89oX/vsngEYF+HNEKOf0Q2xIl3NnY7V
 CcyGkMAhi1x+pBmIyOvEgZwtSkTbrbuxpVmwYRbwBHjb0A0tbdW4GNixAp8QV/DsdP8izM2kUDm
 u2Z9FDce1iT8HvuT+CEZJ+MaM3S27zSNnNrJvZy3bMNNU6GAkclL88yMof3KnEVJVQyfv6MkPQe
 RIIoZcIoc=
X-Gm-Gg: AY/fxX49YJlciNv3eMvj2zpGpwkeu+3qAkbvjRKtjhdXc0AOMcjRbnJ7Stw8fef48M8
 3nkHk3rPT/tTHovRmvI65MFzpwJtU/+sa0xgRrAh6ouHrw8RPVrq/oS5beSz4pTAKrM9RAqX+8u
 uK2Y3rGJKOaV2ZmRYi7FPmpjdBUnNel/7Hktv0G89IoNscfkbaiCkW6zeIPqhTGpl3FxTD3GRaS
 EHM+03gbpCnzLQ/25MCFpSPt8sXoiVf/Lp2ncRHdKTlgHCAWRuUq0hCKv9iJJjhrGbaZUQ/spJv
 zCh/jEDUbzvTI9oDB9onMxNVXiM4BgM64SbKGypUNFZu/GIkLBdIrFgZGWoMxHYG8+u0UgnZZCa
 pVZUVeJp50EK4HdHJKTn894iHLqY1ODbtg2pJvNR3
X-Received: by 2002:a05:620a:4802:b0:8c3:7e09:7305 with SMTP id
 af79cd13be357-8c38936be22mr2495996985a.8.1768212988125; 
 Mon, 12 Jan 2026 02:16:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFDcFp13cELDqg5yb5c2F8mogs77zvA10+uG/S30hV3BqtYmfe0ZqkG8u1DcAICWOnVi+8xw==
X-Received: by 2002:a05:620a:4802:b0:8c3:7e09:7305 with SMTP id
 af79cd13be357-8c38936be22mr2495991485a.8.1768212987621; 
 Mon, 12 Jan 2026 02:16:27 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:eb74:bf66:83a8:4e98])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d865f0cf2sm126530355e9.3.2026.01.12.02.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 02:16:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:15:42 +0100
MIME-Version: 1.0
Message-Id: <20260112-qcom-sa8255p-emac-v6-3-86a3d4b2ad83@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5782;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+98MGhNEMTse5rrzUsNGNnR0YKmhUi7WzCmUr+BPXL0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpZMnoliueKXick+xAzQraAN3ULEXA7idrAkBy1
 J9TMOwkINiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaWTJ6AAKCRAFnS7L/zaE
 w+9jD/0Y5/ZiDp9I1wx8sDKr9gzh2IhVqIDuVPk1jNE9b8uNWjJCxrJA68RJohfUkeOMBW4A6W3
 /4c18p9KiRuGcKp/fw0+OQ5lLiGPMe2nsOCZzUXxxBX3tgtHk+fIPkKh3wxl3JMafbuxsuoOQqJ
 oVYHWrbxwMxIbTzLwVwD+FxNYxi7+ISo3fqhFz1D1Pkvd32mgiGqeMvV9tZDOIiB9TV9K2I/5IT
 LxXjmfFxYBVLuR+5INNiiHleBrhekDuild2FCXkSjXwdhWyEYZmDcCOi61z4v6XtxN84OqKtcWy
 b7iph6sGKcvUmZwIWMMIWk1mozl/Sna1wwX0PdmifEPV9mr+pl/v83h3mmoKij5QWofCvMfJkAp
 jtoMcAt7P1/J1Jfn39OpvwZEAE8+6Dfy5sRV89ktbJH8J/6BAHlsUXuRed5m/RitDDnE0qfmZs6
 pFccfzaOcVGXexqzPAtb1IWBDIKCWM137KKJm0di89Nnhn22v3DmEjRpG3vu3Dq9DA77Ei292gr
 z3S2OkUV+o0yMOBRhHGHvhl/KCPHg5qkwsKM02fIyqDLn79VEoflziIkEW7+ZH5arc3DwnxfXQe
 4Y8wrx/Q7W/SjEGf00ABgVj/mTcKipD2ujP8qOVCGO31mIuMhIuQowFziIyx5WXSCnubuaKhlwr
 oP6YF6+Aui8XK3A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MSBTYWx0ZWRfX97BfgHHs9PiO
 2PPlAiHs6ZKFbrkXS+gZ5BUgG+DV8yJ1zICS88Wd7Vb5MTWRRFlU6Px/2gMuyYdXfJuMkGPc83q
 7c3Tv4VZzei5Ka6hqtZLv70WQ94XwbZPqnVsJ6hQoJwLn94pzwQH/1vux7uPRGAkGuYOe1/Fuo9
 eyRNX+xf29CtzCk9NsnX2WkaqipI+Z88ZiwYWh2Q/wm8GSwk9DzYM+VJ+zoxAc654uLc6uSwVzM
 6biReob32wm7XP5KpKBBKEoY+HIrlzGKzknXCyHuxjO8nR6/hNd1F8atOsdk6stqExZ1eKF0WA3
 KdMhTRg6IipAbcR9Qf6EqrgOt7+VwHs3pLVa+RKsorj2vZ+mYYydtpSEG93tyTwDu5b/qg7lTgj
 T6ewXZ1Tny2obc3e0dd8bvPJro8Al3Xin/uaRk19Le0fLTsVGZQdzp2q83ZOY3lf7Wfwx5dW7tr
 FK8cYxzNO31qbzbHd3w==
X-Authority-Analysis: v=2.4 cv=HrJ72kTS c=1 sm=1 tr=0 ts=6964c9fd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=fYgtqwV50X64hY7jBhMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: g36zGQssYcDi7lc0rzRMmSzerMTLAsjx
X-Proofpoint-ORIG-GUID: g36zGQssYcDi7lc0rzRMmSzerMTLAsjx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120081
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <brgl@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RESEND net-next v6 3/7] net: stmmac:
 qcom-ethqos: wrap emac driver data in additional structure
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

As the first step in enabling power domain support in the driver, we'll
split the device match data and runtime data structures into their
general and power-management-specific parts. To allow that: first wrap
the emac driver data in another layer which will later be expanded.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 51 ++++++++++++++++------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 457748e5781231680b64382fa73e195cf7473924..e0f0eca943420e24dad4e506e12bbb1eb731b8f5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -97,6 +97,10 @@ struct ethqos_emac_driver_data {
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_match_data {
+	const struct ethqos_emac_driver_data *drv_data;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
@@ -225,6 +229,10 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_qcs404_data = {
+	.drv_data = &emac_v2_3_0_data,
+};
+
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -241,6 +249,10 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_sm8150_data = {
+	.drv_data = &emac_v2_1_0_data,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -273,6 +285,10 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sc8280xp_data = {
+	.drv_data = &emac_v3_0_0_data,
+};
+
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -308,6 +324,10 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sa8775p_data = {
+	.drv_data = &emac_v4_0_0_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -723,7 +743,8 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	const struct ethqos_emac_driver_data *data;
+	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -774,13 +795,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->mac_base = stmmac_res.addr;
 
 	data = device_get_match_data(dev);
-	ethqos->por = data->por;
-	ethqos->num_por = data->num_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
+	drv_data = data->drv_data;
+
+	ethqos->por = drv_data->por;
+	ethqos->num_por = drv_data->num_por;
+	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
+	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
+	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");
@@ -808,14 +831,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (ethqos->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+		plat_dat->dwmac4_addrs = &drv_data->dwmac4_addrs;
 	plat_dat->pmt = 1;
 	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
-	if (data->dma_addr_width)
-		plat_dat->host_dma_width = data->dma_addr_width;
+	if (drv_data->dma_addr_width)
+		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
@@ -830,10 +853,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_ethqos_match[] = {
-	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
-	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
-	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
-	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
+	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_qcs404_data},
+	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_sa8775p_data},
+	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_sc8280xp_data},
+	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_sm8150_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ethqos_match);

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
