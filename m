Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4387ECF2255
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE77AC5A4DF;
	Mon,  5 Jan 2026 07:16:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 582D5CFAC40
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 11:42:57 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BJBYS3j3702483
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 19 Dec 2025 11:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kD1ssSCTHDMOR3VnweMegknREdJvLsJSq4g8eG51V+M=; b=CBHFp77wpmg4I3K7
 Rg/zPjnBug7Mvz8+cpO95J+3tPdoWdrXTCJTbkEtKa23Lbh6i34cVMmpsY+uOueZ
 Vbuil+bTAuzBVjv8uuJDvYsZvF9EvsuEyzaYAVrwdprCSF3TedQpqZuEzy3LPi2y
 ukmz8jEM0pPXOmp6xDA6zka7gU+Y1H1e1CUVxhhQHJqwDOOAVv9Bm+BbFyXS08ef
 wOiGb52r1BhhhIzWcSfbx9TP/WCYP1WYAdMQkQZgw+X1HURHcVFLerNGVDnnfZQF
 GLq3XzzlftyUytUd/QVBiQ5xMbzCRr5j2wnRSxDPNez/Hx801e/L2AD6IVcQKVa0
 p9O9wg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ejet0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 11:42:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4f1b39d7ed2so35406921cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 03:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766144575; x=1766749375;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kD1ssSCTHDMOR3VnweMegknREdJvLsJSq4g8eG51V+M=;
 b=Ku9lHTmYr/miogjyb3G3Q5r/PPPAAGPbN62bInJTxunUY5iUpjy14wmdupzot6fYsN
 f0V2iwlWFxx1rAwkOowBYGpqMX+ufUf8T/2zIA+eLNto+rS/fceOo/Au9GfXercvYqeW
 d///laax8ZxS96+ZJsRtXcviaaSIfFUPC+eEG164lBRtqNQD/xPRQg+JlBIwe6JFww7a
 7fT6Gj09vpB2p08PQkMm3hiOl4qODX89tk9badSxDQDjvyRmYxmyOJB7Y0hdnlnphd4/
 zjGa1ZHMt8ryVO24iqOH8ScNHH6MuaFzS7fsgHS3JhYTWSIKxcL4bpXvdrtM/gljRfEc
 lz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766144575; x=1766749375;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kD1ssSCTHDMOR3VnweMegknREdJvLsJSq4g8eG51V+M=;
 b=LDV9Dh6uBXk4tNhzWJGb2v1w9uGeWVU2kGccHZ4zfOkSJI2qj5Evy2FCk9LwAxTMDd
 Gtlcu63G3XcZOxmyGFEwo+Iyd4WWrr6M65a8cjOMdvnCRSGaR5gboXJMw+WjavmqjSe7
 +az9xASMZu6Nem6bN5cFSbi32a15jhawLiRokETK8VHndK8hM8Q7KZUlAOsR6DCFfV/h
 fNNJj+xSzlYUQ0FMv4Qg1D1w37Y+Pol8VQE8LoB99gmZgAV+QmQtBDDl47D5Y+e3exuf
 U5XTA+pOp9selr4HpRhIwBSDOFxKdphReMteR8A7EiYQV80CAckGNWiCDmV0X1115QA0
 BHxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv3FEmMwWQF9V8OcPQxBMt8jVURavYNTxDcMIWzMZtp13uE6C4cp92b9P2EABpltHr50HS8+b0XXp9IQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx0+OpZeBZO5UfVTRcN4zdBdtHkzgSKwU2LWOi5W30m1WOFV1g6
 e2WiXl1/ioFTNJk4Uq2ihn22D6KZS4/lxFNjVsTpRUMdUjPGJ9NhbW8skudgjFlkEu1bWRG0+5b
 LNjmrfINel14Pa9CW38ak8cJyczP7N6hyhu4WZ1Vbcicmf3iO5oPhYsbaWhhA+bwaIa3ZBZKfEP
 mAqfRmUTs=
X-Gm-Gg: AY/fxX7GFU44WA8ZiNLNWcEzo61ua0A5FSlz1G99V3BArCrl4wqXdqcFCzKnG5c7AFe
 8ZlamnYMgOk6D7C8zdvjq00+SDm0H855OOu6xhuwPHcMcy5PEvq1aWaD5GpaBf9RriFcn0R2Rik
 2LJQiec102CXk36Zn6OYbNPFfzl8lrF3UL9tA63OYcNxvK7nWf6Ra2jnBaJSlYpAxSd6Vot54wu
 1s11HGlqhljvTbXFKd+/B4vnqXJxYFaXmRaW3RSk+gupyOkaWlWPiVKdhUHlooi6U2slQM6Dou/
 oCy3O2hKw6LQ7zy21CnjIvF1d6FTj14JXxOI5HdMfuQyED9ahOPJSpcHaj2raZu5mvKpWL8KOfC
 /elU8cf6xoXAuzGbIPUNmPD7fW1tJKOD7ru8aIWM=
X-Received: by 2002:a05:622a:198b:b0:4ec:eec7:4850 with SMTP id
 d75a77b69052e-4f4abd8ca70mr31652801cf.44.1766144575435; 
 Fri, 19 Dec 2025 03:42:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXqKhXyGW/sOCylHSqPsU9xZo9abZxVRQYCYTMt6lSiNRCCt2ixMu9EsVynhaWcGrEf/49ww==
X-Received: by 2002:a05:622a:198b:b0:4ec:eec7:4850 with SMTP id
 d75a77b69052e-4f4abd8ca70mr31652031cf.44.1766144574971; 
 Fri, 19 Dec 2025 03:42:54 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d857:5c4e:6d25:707c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm41134425e9.12.2025.12.19.03.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 03:42:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:42:19 +0100
MIME-Version: 1.0
Message-Id: <20251219-qcom-sa8255p-emac-v6-4-487f1082461e@oss.qualcomm.com>
References: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
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
 Swathi K S <swathi.ks@samsung.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3459;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xDKLLZ/nGakVrTmQ+/4MLzBk+KmOo6dAa2oHorRw58A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRTosU5uN+G2JPXQO6N/VK1p008Oy6bofZoKjo
 4TC9E8cTb6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUU6LAAKCRAFnS7L/zaE
 w8KcD/9ZLZTgUdutIP1az4i2m9SlSrbZuBpSxCTk3tVAOh+pTUXnqxh44wcriaptAi7CAdjYTsW
 bvBu0uld9h2v02gfR7d7KST7DXd3WuHxsE0CEWVvEipG5rJeroe12tLfcoLVHhJSkHS+WKFR2j0
 NtOFNStGn6A2142OljZTa1/9PatjKIgBxSTTuFskeqOs3+2IhIH+P1/rOkFDM7nLIUicSRdpDI/
 luhS8I1dCa2N87ZP8osUOpu1J5AuCCed9LJQtnLGDXJRpHHwX7SIqXdB2lEFcWuTyOtBdK4x5to
 /zAzDREVu73NkkoUL9WeaR7LMcCgvujivWWJOzuENtUoJCQi667HIb7ewTqvBJcGf2s63hxySAv
 st7UtHOzFtJZ+1ic90B0fOoFJWEHhiMhljyfNlCHt9htbxgKwLyFbr+ny2zKTdvUF/FFgllMFA3
 m/s0PKyeVehgH84mFxxFScJN7BxGZsxxHgEMPGCX8iJfeMQ+HLuz5pBtLPRGMD+g6MW3oRi2prr
 3MhkAUBFVRYpQAjjL1QYYPX3UhWVkBdxnv4/L6D25Ut2s3PpOX92lI+Vt7zECxME9g3x9xJbW9w
 xSnslNc5kfLfVgheENGgHolGcNe+tosRYeTSnd8MkMX4aCyqXAmez9E/q4e9EzmM7LaHsqEkrYi
 YE8Hk92iOl8+j3g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: GsTcR03WSv6vQ97OPowDP4mFnUf_kNny
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NiBTYWx0ZWRfX/FR6TQbQXTCZ
 01s4gsV/TgWi4Kv/qgsEKJ8qrzNGdqksFd3o+pp3TRXr5EzOrdGE+UtuDPkR/Upx5XuGENbg5Xu
 CJIcCe/2zX5COUSix+xi4yxYbLqS5N2iF7gJhvwRqlpJuOfXU1bfV0t8d7jRMMDSc+IzJsdLZbh
 k7rx/8F5bj6fiRoteYNppczwE1SukpAXUcxzVEw0tRKekWb3iZ3JYucHRBosBdmbFpwWn/8EbYs
 KfaxqxWdwsroqo1ij0Vp979ZueM1cCy/5Y5j1DD22XSL3Mvp0EL1l323GtbtmlR+pYpAgufgtTf
 /mUMJVhiHdPlj8mAVNEQYN9+3h6kaRSUs5Ee/bhLHwpFE4eeeKhEEgyzjVzzhIQW2xHkHclAnKR
 yl87DtXAkishBOKsrtktHZmLIijQnMUMkzqnzNsr+D7Q59qJSc5T4I0rpnFDCi9B01vDmy9npPG
 ARvLlP+BPGNSPuJPhjQ==
X-Proofpoint-ORIG-GUID: GsTcR03WSv6vQ97OPowDP4mFnUf_kNny
X-Authority-Analysis: v=2.4 cv=EabFgfmC c=1 sm=1 tr=0 ts=69453a40 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=fthQcs0maGYz3WdgJrEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190096
X-Mailman-Approved-At: Mon, 05 Jan 2026 07:16:21 +0000
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-mips@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 4/7] net: stmmac: qcom-ethqos: split power
 management fields into a separate structure
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

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e0f0eca94342..54458ff5c910 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -91,14 +91,18 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -303,7 +307,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -324,8 +327,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -744,11 +752,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -796,6 +806,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -803,7 +816,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
