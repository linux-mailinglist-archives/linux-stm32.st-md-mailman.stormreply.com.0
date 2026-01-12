Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 767B6D11C62
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jan 2026 11:16:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4131AC5A4CA;
	Mon, 12 Jan 2026 10:16:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C11DAC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 10:16:41 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60CAEk6R1316017
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 12 Jan 2026 10:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1mI+SoGu++t5t8DDdzkiN7FdMcg5cRsj8gUxzvIA8wg=; b=LzKp1vd3CVvTxyrg
 891A3N3bCDhSzqosNgMudxdOkCW1ACjnF4NR0tLDYL/hiQZMP8SdOTJrz5Fy/HRO
 yPL2rU5xEtH6ftkYw2tfao85xbkTcIvVQVdx822EppUHSztYV4ng7eioRQKX9D1T
 MqFI85XMf5BeOnF3EbDWdn97v3LYIvQ1AHzbJKZUxzzal3t+klOneF0eAIUsHp+L
 /iR4mjt0DYwO2ZtQ+g5Vb0ZhNpV+4VwJ6E/TDQcLmBDy/mdCTCrD1Ty8Sf4M2jCE
 JbJ+YMLhA56yzDQE6HtIRGZdx7inIh7ykX/eb/jGtFF2XUN2PajYZ4/3o0T0PZAy
 EoxMBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hg08s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 10:16:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b9fa6f808cso1839383885a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 02:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768212999; x=1768817799;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1mI+SoGu++t5t8DDdzkiN7FdMcg5cRsj8gUxzvIA8wg=;
 b=iuFRaKcdJnT9YmXpKDmkLRSWakhdLFD7qgLzrjazGuSOFehK6RdrI7KW8Iq+oyoDZP
 j1P0gxRv/il5u6C2HIsTkrH3drI0qDq+JUv5XxUYfKjQ1eeYRSBmpysAQvqte7YYeSTH
 PvsboQFlGSfSUGcR781lkl/NOehrAGu82Xq5/mnZE+bdRepxncWzodPd3yAWvtl80L6x
 Rr+izvzgBGIiuNQ9vDGtn+QVLw5mYjd/14XXm7/LWQE7TWVsL+YfgVoptz+EMa74721v
 +VmAZCnk+H+4xkJVwF/kg2f3Y7UN3QIQdw4KZziz7a1f2S7mnUfaj045y1z8ritawwuA
 bOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768212999; x=1768817799;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1mI+SoGu++t5t8DDdzkiN7FdMcg5cRsj8gUxzvIA8wg=;
 b=A6w82toxAuvysRovTKaBny18ZIzSzbFGSgKwnLy9/YU0rDAlnldVeVohxCaT1qN2Hm
 KIL4fjgmXfxBljfHQpP66dFqYl3yVQro4/9Am27KYBoDd3gUZbzWXVrYGDwbC2LYcyoA
 5PeTKfuBvLruqPI/MhG0kQgoZIB//f6hmTB0sxrtFJFdDMx2KNuKOxiYxrx0CMmk25cF
 zQB9avlzwzM9Ps8jv6qG2wP8DE7fYJ7QlLbZKPN90Ww7VNRthKW/N7id19oH9N/wcUPg
 U5u1kX/19q3G6AO275UQE+VTRnTN9P1X9m9VWXJDTWYVfF5UF5T1E1Q9R5PONFgHWxO6
 gP2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXml+mAGJLv/OS1W6NDH4QRfNssOIlaeRCpjDLIyyGlVXGZufUmNF/ekGMmpxM04AnfUpZPNBZW0sCgGg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxwQxpvmk9DXRfPcFaIsRZ1PE9eJ0N5in57WBNr78O8sY7isKhe
 YSMjXTIy+vGXLccaNTO5wkKf1n4TQlZHcv2cyN5elBmZ/WGGNFFjF3zYP6aEWjpIEVNm/PUXTnM
 Y4gr0T6RZErfV0DcXwBtoK/Q01uDRfuth/I01WGCZkUHP7FE1tuDvUKJ7n4/bqSB1fPIGBIPE7F
 okYFpVhHc=
X-Gm-Gg: AY/fxX5zr145N9Ud+W6BhbeuimazHlhu59nP01DfN9Pof56MrteemCuQLgkiX4qoV94
 tmITdFU53+NWI0dvkZUbH51Rhtg3zh4OK6HF98nIQdXq5ZzJjLcA0RjK9s36VePoxNpHxBmryTv
 9WYUiLboUT55cqFJ0lTPVtOJagGo3nfQ3mTtIZ5GN2GVHcc7EJEDLoBrgajJwLs/eOZF2XUQ59a
 3IgyuRSyWwI3l4WtZSWVNRbboyYQTCEDjobNXiaVeMt59ph9F8Cb0d8tXfY9+zpZEFmrEHX8jAT
 qvpX+d7ZlW3ZhyVoqFzZD/quPJGC0FnE/GuqQNdkmu68+wnbT0FdRBz9Mki2xoWL5E9H2lUILlk
 HYdPZzQxiOu+B3++WsyQ4RGVSzDsnx/C7xrqNp4yU
X-Received: by 2002:a05:620a:258c:b0:88f:c0e1:ec2 with SMTP id
 af79cd13be357-8c3893f7e49mr2354230985a.60.1768212999100; 
 Mon, 12 Jan 2026 02:16:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHChba9lYARVO8Wf79JzkrcaWw0Ivu8ZXpRcyXcwijI59hBIn5H5xOpL1yFSlfcxTqLJoYP2A==
X-Received: by 2002:a05:620a:258c:b0:88f:c0e1:ec2 with SMTP id
 af79cd13be357-8c3893f7e49mr2354228485a.60.1768212998603; 
 Mon, 12 Jan 2026 02:16:38 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:eb74:bf66:83a8:4e98])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d865f0cf2sm126530355e9.3.2026.01.12.02.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 02:16:38 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:15:45 +0100
MIME-Version: 1.0
Message-Id: <20260112-qcom-sa8255p-emac-v6-6-86a3d4b2ad83@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1989;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XhZwpSvJ7UE7PtdunInQMevxaiqF8VYCYkdOSwXLngk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpZMns4kbe8XUdsvQKvrAsOQ1wzF3np1c8DjUeM
 3bh/6KE3EuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaWTJ7AAKCRAFnS7L/zaE
 w1PtD/9zyqAcP4ZgryRKibjlq5X13bpzu6/2kJ2pincj0K2b7lSUuzwczycjHuQLc4wndagggJI
 mvPxyLijrA2tCDAsMbbEJTrsy3HO/XOrXt6K/p1RZF+4zCSaNoP/Wzl4CASdrJx7/F1fA3CD8Hi
 r6nRm2l8eVWqVGMp1pbwIXpPhpLTq+8+rMhN5ir2pVHvlI6SYkkmiuc8CDM2ZuOTsXvChwftKHF
 e6OCAd2Qj5Klg5RP+WWiIEN+0/W1djw0WlLbm18SOKfPFiyo70K7BMaBRQDDV131rekfqUQqUKr
 IbsKs+nUHGj7WVpyrvYkBzvBSsPGfRyu6pqo/d9tayimwvMPzjLzgRoGpH9+a0381KriRGPc2Z1
 qe/mpz/jcm1tdaZj+PlLSYkNr6Dspjo3qLeUNRC/ZFhpKcFZolv8fIjq4V7ZuXPFy6Jlk1Sa9ed
 SkRit3Olz1XtMYdgD2Szhu5MA5NdZS6REnVyeQh7CcCuj4jl+i5e2YKpn3aiKkrDSO5QEi/8TyK
 2hsl7l0BxZnaelZxdzMsUV0ycXT3EniRqFjaNyrDtSzrtbS3wl9cN3/kuPx/2UMnxRf/PEFNf6A
 9tSHg0ZQVON4XnXyYSUSBdVRe3ZyL1Eo3Gec5MXfbhQ/AJAl8OHmy76nwzI86ZhuM2Hunxq7DV3
 qakjiD2YLFuHwwA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: PKQFwJX8cuAc4KOF4qDHvr5OCAiwf4Xj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MCBTYWx0ZWRfX9sS4vPL+lNv8
 uzLNcyE0UnrYBtdL4s9SeFRXWA/3DnhRgB4Il0lAOw/E+LVBe51NntFMhhr4IdQc/vocN5bBr89
 0+BwvJKmwCX883NxqPox/DovBUlCQx7pEDz7CGnnM7agqS49znElChcfzO1zr63uAOeL7J8ZUzU
 0Jmok35ycsxA1GiIzEi5xZhOSJGL3419HaY/HNPx6XtIGWBWiwrxPiUBiOhLpSGtcc31H2b6xIx
 T/ruYu2RBo4KKz/lr1G0l9DkUdBvCZzmW/Q3VcU7UwyxeHK3lTDBhOuXfyEPdZbFCWnemzIoC+F
 2+y/tjweHCc/5efEFJwPYdZbWgDEjUv/RjGHS6asLLPO46EJKe0sKUKqPesHVGDaznppR2KOZXU
 bTGBzdZ+iw+D0eLhhWWcOBxgun17GKgG8lEP2kF6AZQ5Rm6SaYsYMHef4iKgxGMTT0y4QFuXWyO
 SfHmghICg5APt4iKDpw==
X-Proofpoint-ORIG-GUID: PKQFwJX8cuAc4KOF4qDHvr5OCAiwf4Xj
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=6964ca08 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pVQroq3X6MeQavp43gIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
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
Subject: [Linux-stm32] [PATCH RESEND net-next v6 6/7] net: stmmac:
 qcom-ethqos: define a callback for setting the serdes speed
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

Ahead of adding support for firmware driven power management, let's
allow different ways of setting the PHY speed. To that end create a
callback with a single implementation for now, that will be extended
later.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 856fa2c7c896ea3068ac38d9ee71b4173edce80b..8ba57bba3f2eebe9e44964f9e6c7c67e46ccb02d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -120,6 +120,7 @@ struct qcom_ethqos {
 	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 	int serdes_speed;
+	int (*set_serdes_speed)(struct qcom_ethqos *ethqos);
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -617,11 +618,16 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
+static int ethqos_set_serdes_speed_phy(struct qcom_ethqos *ethqos)
+{
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
+}
+
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
+		ethqos->set_serdes_speed(ethqos);
 	}
 }
 
@@ -838,6 +844,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
+	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
