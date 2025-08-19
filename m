Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3873BB2B98F
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 08:36:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDCBEC3F942;
	Tue, 19 Aug 2025 06:36:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66DE9C3F940
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 06:36:50 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J2HW4U010055
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 19 Aug 2025 06:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ld9b/944CjtaKJ4f0GVdMrbvW/5r/vcAN6uf8GN4R0w=; b=SxriH++/O4uXEARY
 InmyMzGsG3soLrLTTxi5nUolDv1QgOL05Falu8ascfpYMwGcrIXNhIN09FazkZW+
 RAZeUFb4rW/0Dvd/u1OWZMjT6a27OcdqsSye2NS3ZKNbxyfRWV3lj7nJBM5U+v5k
 GoZmRDOaFJgLsK5f52TBQEx5oY7gjtlJE4ytHq2kGqpWLamu9p4NMDWnRXZpyRK1
 Ds02flI5hTrxzGLBqi0z+1rhaI+9oFSOZxJ6MKj/FYJWIWidAr7Tu6CfAM/YUTEE
 ucwY0N5MAxumQ+BCjPKeZg1WvOmCGu+u60PSXSdVqXO10KaRF+M891uqucQEqIAQ
 q9Ys4w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagydxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 06:36:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-24458264c5aso51890555ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 23:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755585408; x=1756190208;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ld9b/944CjtaKJ4f0GVdMrbvW/5r/vcAN6uf8GN4R0w=;
 b=l/ojFNNp/gLyD59svU0L5uuZ3QW2xTpsWohw1FKbKX1XB95p9FGrwzpufraB1M+ihb
 2cl8fbSmNYSPL0ZZEsOWuP/541AET8GwoTcrpTK8CGr2FRsMLT9YpcyyYCfFnBw4qCRk
 IrZs3yGD5Oe8t63H8vjxGKCLA40Yg+/urH4/T3EFIRWoo/yu9gVwEm2dry9smsa/T/8A
 ZP+rZLn0+IQJtF5fLHMhLhXT2G8d58HcOhj2uPMBWJXAgiNcXVLPKHSLT8k6/JyNKyiD
 FZWWQQ86l3z2ouQSFK/nBAuTcZOakQH9C0xzIjJM1gLXgeWI1HjZ70crrTqR7Mqh1MUo
 8jeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKY9gckKmhV2sAowGbZ40e49y5d/flAUGlVoKZUzMbBgwdymPx7BJTjlOReFrkVnKdCRogcqass76dNQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxDzHTj+DA5gp5PLzh/YFeQyLWu6UWgfcx4d6gN1Ni3MJl7131b
 Fa8ugexiGcX/+zMoqjTkWjUvO3ONq5ucqVSObZ0GCpzeYdrFB6juFxDehDXA5XMFyiqmBthAptg
 0K3iR2+LzGEx7FfyJjJe+mdlpZEY7QSQczaTecRvG4Piws8X5JqDCV1PAjv1kAcfeSQUnBnb4ff
 6nq9Wa1e8=
X-Gm-Gg: ASbGnctse+a8Uld4RoaIGrivPJ0zehVUEUdUsIAAdhByB17xkbr7rKxc/kr81Mhs+04
 +gvFYPTXayqog8/FGj+MYhuQo4ZhrrLskJQhF/1NqFbI8geUQWanVvE0KQhhaZgBbnHazQXqFIf
 GxaO1gevvvoTLkfJzq5qlc4B2mew1+0rwVCHfrdJOuiA1qQAgyeMMXTlLFX8LW65wtTcG+9iQ64
 6hQ09KaVZy/YJnfTRgVxJdLmSPZdzIR1TuP27xF9UcAuLCu1793RJoMuhE41rI37x+Nb4Dji56T
 is0xVoCknizLfZn4Nm7hCeOqW3XLlkUHMqWOYm3SsXONwHGeAmQ3PONzY6NuDcc1WReneV8NdSM
 KwMJ/NJNSrVthkEMTNTpWnwNWvd7877N5AA==
X-Received: by 2002:a17:902:ec85:b0:242:9bcb:7b92 with SMTP id
 d9443c01a7336-245e04eadeamr18308635ad.54.1755585407772; 
 Mon, 18 Aug 2025 23:36:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOjWML1uqzguCXznXnAu0JqJOKHjx8VTTczeOLxTEHogZ2jjjwiB/QPUxpZhx7gk6jZa+sNw==
X-Received: by 2002:a17:902:ec85:b0:242:9bcb:7b92 with SMTP id
 d9443c01a7336-245e04eadeamr18308195ad.54.1755585407263; 
 Mon, 18 Aug 2025 23:36:47 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d54fe38sm98120455ad.135.2025.08.18.23.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 23:36:47 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:35:57 +0800
MIME-Version: 1.0
Message-Id: <20250819-qcs615_eth-v4-2-5050ed3402cb@oss.qualcomm.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
In-Reply-To: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755585388; l=2354;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=ag43pockrDVtSatmI1WnRHpBp2uI2rmdqCD6gVEQcbQ=;
 b=Fcu73+RjcncqZavOSj+QtxfGgYLFkY5TAdyWRJtMz8D97y7ERiL7+MMw4ItBYEW6ZfIbO3jIv
 G65ah+bKButDKbO2XcT87cRZ+H7HKxJ/fAzmR9/uMZr0AG4GRu1e3tC
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a41b81 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=-JoBx-Ykr0mbciFiY24A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: xcQ0fwKPPjVO9o8qvc1nshUvSRQKDjpE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfXzEDktKGMwz2b
 9/7cuqOnTpSgyhvrsdPoZSr1uL3od85xaXaF6S6/DZ9z4CtshqgnOta9rhV/+OyzhWaemEWqp7n
 OuTL6xq12OMGfGFaoO8CdGUhqyjd5pwBO7+ogqecgd2IA7mWWDZmG3ZsbNgM+NYlXAZea0hTV2r
 XLMw/u6jNSHYIsTdgQWcgN+aqO3sn+0nRj838+v5y3ZKVGw8Lq3nFJ/fT6ouSMQfJMzhJOQfWg1
 KUidAcxbNMOvsb7BH6T+6SfF0t1fvI0I7RcY3PGc7lwoVoV/DPtv/UDEcWezcByNPsIdg7QVxAn
 eX7hOzrPHj+nnYUY+CZX1AdtVLsj70DLPwLKQ3zKJbRN1BxX+xhxqo6Mc/4HtGUbL22UB/V3NBI
 uk8sXQai
X-Proofpoint-GUID: xcQ0fwKPPjVO9o8qvc1nshUvSRQKDjpE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024
Cc: stable+noautosel@kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [Linux-stm32] [PATCH v4 2/6] net: stmmac: Inverse the phy-mode
	definition
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

In the initial device tree submission, the definitions of rgmii and
rgmii-id in the phy-mode property were inverted compared to the
conventions used by the upstream Linux kernel community.

Only QCS-EVB-400 and SA8155-ADP platforms are affected due to the
incorrect PHY mode configuration: 'rgmii' was used instead of the
correct 'rgmii-id'. This change results in an ABI compatibility break,
but it is acceptable as these platforms are not actively used by any
customers, based on current observations.

Qualcomm expects the MAC, not the PHY, to introduce the timing delay,
and the driver is designed accordingly. This is due to specific SoC
hardware that handles delay and sampling internally.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index a4ea72f86ca8..a3e595e3b1e4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -390,14 +390,11 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
-	int phase_shift;
+	int phase_shift = 0;
 	int loopback;
 
 	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
-	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
-	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
-		phase_shift = 0;
-	else
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
 		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
 
 	/* Disable loopback mode */
@@ -803,7 +800,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (!ethqos)
 		return -ENOMEM;
 
+	/* Qualcomm configures the MAC to introduce delay; instruct the
+	 * PHY not to add additional delay.
+	 */
+	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_RGMII_ID)
+		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
+
 	ethqos->phy_mode = plat_dat->phy_interface;
+
 	switch (ethqos->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
