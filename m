Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12499D11C4D
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jan 2026 11:16:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D019CC56603;
	Mon, 12 Jan 2026 10:16:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA49BC56603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 10:16:26 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60C844t61041986
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 12 Jan 2026 10:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 u3CANCoZnA5JFEckMdXBmY1C/JzkS+TKyANzWnvW0ps=; b=kGZ+YJUIz+BF53tj
 DvtCbErSPxhCkQJ3S51//Fu5hVdEClGBAjycxAtQBf8JqCDNBvVXObaLS+L9BOGt
 D9v5c2zALBZ6oyBaJTLEMPZgpBHueOnWBMSVJ20KzhoAFbs70PCftqnfOf3OOpMR
 +g3e9wVNLQKkcDO0WbV6iW1ZH0Rj3iacgMDRE+UG6D2FF27xPbmlJGz9MpmO7IrO
 qIJaV8AW0VGJx0Rmxf+gkS+EB5yEsAGaa5s9j8kYxQ5gFFf/I9r+dGJY++BpdVin
 4S0cC+By/0CkSHaUnEaQ8zmrReBGWH4uYA/SCizCGK2krA/eC3wqXNS7uEVX6kLW
 +dT8AQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfxfvga9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 10:16:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c2a3a614b5so1430152285a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 02:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768212984; x=1768817784;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=u3CANCoZnA5JFEckMdXBmY1C/JzkS+TKyANzWnvW0ps=;
 b=TJrk5Oc8O3WJ272nsb8cQl0sWrzr8eO2DxelWFHz2FDNf5j1SrUmGaX2UC+rmotMgg
 Ab2p+CXbcED67TscFME0tIEV3HdtMNE1K/ip2mZV4vkrT/NwbiEChJAcCCZhAFnUelCM
 xJkJoWNPXFoqrNPNUUw+z94T6lbFIpViCyN1PLRAX+yIUU+NyyUYd0mSlgt167rJBYKI
 cDZAqhEWM5a9QG/mv5/i/kV7W4I0Y1Tf9VDvHL+1yofyqCBiG7d4olR4rVslYkoCOK8s
 AkWjBHyEapQcGaB84vQkeJmLzeC+v3dFJeOijK9zIQZsF/IseWS/05HdqksS5NQofolW
 Il1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768212984; x=1768817784;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=u3CANCoZnA5JFEckMdXBmY1C/JzkS+TKyANzWnvW0ps=;
 b=BRFG7MIl/IqNUlo4I9x6uC9Iwq/UrqY9uXk3LUNHx/IA8Ud+Lk8ShnQP7Iy0Gy1ZHo
 BX1DT8Drm1Bj4DmX42fd4qC4oUi4oVE2O3VZb6fhwUDh0EgL19w9iWYrKIbSCIeaLaAq
 uV4XU1jYZX+ui23dkR1IQUOG8IyY4J5NVGm4AUHUM7SBM3IxIoCGOsBh+6WWjnlJ594q
 n5vpjN2+gQWRZZa3O4XDUeXfQ0ZxlKqPlqB4WI4Rhh4+UB7M6pLcvjsLBgHWIBiL7r9B
 ICGvXMNVWYfK1dSLaU9mq4fYSzhxj6oy1qctsinqqVIJEcVWBeGS5cr5pMuV2Vf2yhgH
 R6QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk7bLyxOqlA3BYC/KiZGkjm5mjGlj5OQEb4Qhg7xOegUBTIhYV7CLL/DyzVKCkHt5A4k7d7Y9L6+1ZeA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzxLtRa0wk7vJCrKKpYpAVl0tCdwDzLtRpQ0Z/e/SEc/QAguVo5
 jmhkWYOZQpdiYin34BcC7dRx0JXXyGPOuRKK4oa7fHhFQ209/H4+GmVL4X5DCbqi4KLITmaro5K
 KrPb7lEgj/msoqTSOmyv4oainl3xnHVbcMBKRbRJGVxVoh81h+zKky8OBdbMisG7/Ac+dPmuHCy
 8TQv5EygQ=
X-Gm-Gg: AY/fxX4FRXIhzyMDDBUhtHrgiec4E8cgWvjlIjE82FivjdmMhUZdvRborEFEyceu1yT
 t3faUciFJJegfdUF79TEsI246tUly3wBlFmslwzNW5uOY69N5ZFMNdaIKvZdZ85OCCY3Ro8k/Yz
 d9hAiOFVPBaueY+7bnKDTUURpvGh8lMFraEKibgIhrnIfqpA+vkR1YFxDP68rVLtbQAf7p+lig+
 StW63iXmVUDcHqTizDGk6yBT/xrRNPfWxehlaegzbYIeSrDME2O9RwUM65v4JvP0jT+rsX33ZFD
 b/Dr9kVVEI1j+fOOYLQ+c/eVQqe4QKdiXq/lnLAi9l684H78JjAknA++vH4Eiy6uwx0WVmov9Pu
 Eet0yJnK3Day0kyW7WOWxLu+O67hczJaDH7+6cQHm
X-Received: by 2002:a05:620a:172b:b0:8b2:eefb:c8ab with SMTP id
 af79cd13be357-8c37f4e8521mr2840672385a.19.1768212984070; 
 Mon, 12 Jan 2026 02:16:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGm1+BMB3wcHY+CfBZCzxk3TfmnwQG4rssPyIYg62GrFRai7K9ghgpyZ0S5lhQa3cL4tO8HBw==
X-Received: by 2002:a05:620a:172b:b0:8b2:eefb:c8ab with SMTP id
 af79cd13be357-8c37f4e8521mr2840664685a.19.1768212983551; 
 Mon, 12 Jan 2026 02:16:23 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:eb74:bf66:83a8:4e98])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d865f0cf2sm126530355e9.3.2026.01.12.02.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 02:16:23 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:15:41 +0100
MIME-Version: 1.0
Message-Id: <20260112-qcom-sa8255p-emac-v6-2-86a3d4b2ad83@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2971;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5JRKlaK1PvzHkhM84UuOQHNNYPMck5ucBln5/d8C5Fk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpZMnnyYKxObLe0zkriAGSkbmbpZaPApgDozlsZ
 /q4OAMJQFyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaWTJ5wAKCRAFnS7L/zaE
 w/uoEACZYn8RkTNsWZELfKwfkZp2Zq87dICjgpuLqzd9iuW4pgU0Uco9G/gXWcMiMEAcOB93IfP
 6V6Z5rJ0chtzBov4JYuo8JJf7JFIuASYaXj5HN0bKm1ncR7tuEtrvuFjXEGgfGtU4VxHtczlaVg
 Yd9wtvKN7QtkeHeYfHwrSYaX2RASMRODw0XRPw5jqr4t4NwmF8LjPGZqYAOpR2iE7A9JdR+oUBQ
 XeeqXJudbQYzEw0Rc0ZA4T/4Z5MtaNhkycar+yuNFZ8nfP76eSal+tElLfjkxWthTnc43t2wLb3
 YbXXmYCIx8cprn++YEi/rkFhSd7i2ajfjZ7xqxKpX0ILeXTP8b4AxBTq0X9mcDVGR8ri599HLgx
 4Faj2vxNxK0xNVqrXxxSYPpmwPxSsYxGzX319xD3sxiGYkEug1OxLwXD62Dv/qGRDJ/9oxjz2VR
 snYj02FtZsOxxvPU6Pt+mZ6hEaeuGwEKWJR0M1YbDmzISLNJFlOp4jg44YK4BDomeZSTIvqLfmz
 gnDcmQKsZT2ffA754kGnRcuWxGLuIYu5VJyNLAh1a/FnCXD0CEi/GSR1G59c6Sh2LN/RoHNaQpQ
 xG1SuFuOtUkbYoJbQN5t/ciZeY6UYYguue3YrDyDthkeWzMdGh417zeMDAHcNLgmE+blaUeUfcS
 NfyrI/chIE1Z1ag==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: NwWQO-gUDOt_s9P6izC9YpuSaXm0eFBZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MSBTYWx0ZWRfX4EIgP6c9fI8a
 1mUfOM5SnsbWl0p/p6z0Rad0xWd2h/fvg+8wUMQkg+1Rgb/UdEMDP68kL3aajVwO701i44RwYjv
 X1uIyRKP2b1rtrUbBA1rj/LUGv2YRkDT56yLZQA/VTXyC+VcTTTF0ilR6L9KsLeP5SulLlND7IP
 3NOfR22+Rf/Jdx08jk+I1XFe++n5iXXvjo8hQV+G3z+NNdnurl7yU897GGhPU/emWZIAII1f4IO
 DeG3zJxM9gssjaID4mZXAwHe4lRiTFfSiVyU6m5USH2bXYnr1GB8pfbuYDOg2d3XPYDeP8xjYkC
 GdxZ6jMiAAcdQ9dcdWQa2iMcICZA/eRYBcZ0vWiuaaA5wiuZd9iQQg5O4P19AW6KTOKv0B1xrD/
 BbnDf8JGHV+t6WP2PTVA1bUUhLhA6HsdINBr3jLKwcnVr1Rk+BmdpmxWQXGQa1o/drjyGwcnrBP
 uiE6QMKhPgrPMf8VJCA==
X-Authority-Analysis: v=2.4 cv=c7WmgB9l c=1 sm=1 tr=0 ts=6964c9f9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aGGWjMbO5e2og8PNdkwA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NwWQO-gUDOt_s9P6izC9YpuSaXm0eFBZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120081
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RESEND net-next v6 2/7] net: stmmac:
 qcom-ethqos: use generic device properties
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

In order to drop the dependency on CONFIG_OF, convert all device property
getters from OF-specific to generic device properties and stop pulling
in any linux/of.h symbols.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig             | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 907fe2e927f015542b6a7228eae9a6c6945be3ac..1310312e3e099841da89d2f19b138b4459ecb504 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -135,7 +135,7 @@ config DWMAC_MESON
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 0826a7bd32ff55bef62f8fda4e3eaef64facdb5d..457748e5781231680b64382fa73e195cf7473924 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-19, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
@@ -723,7 +723,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -774,7 +773,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->mac_base = stmmac_res.addr;
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -811,9 +810,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
-	if (of_property_read_bool(np, "snps,tso"))
+	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
+	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
