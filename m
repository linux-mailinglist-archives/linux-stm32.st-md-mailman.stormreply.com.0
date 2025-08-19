Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16339B2B98D
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 08:36:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF943C3F942;
	Tue, 19 Aug 2025 06:36:45 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98753C3F940
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 06:36:44 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ILfLjt024492
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 19 Aug 2025 06:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jWZPw+Dpps6jokruu2kK5mo0seIUmSLFHBR/QVxbsPI=; b=ZW++GaR6r2FuhTkw
 9b5wRt5o8NYv2lIEhyRloLp1OufW5ndt4sDKqW6IbiUGfuJghLP/y8yObQhdQ8BV
 JLidfzkhERA4FNb3mqGOzKEwnG2JacuY9azj6mMDlZrfyHn+5LXWcecpvhZw3CYf
 6Kejwh9NwHSRnLAcxlnFY2vedyVkCdvC4ZFkd2w+cX++mpSqJok9c0pZKqr8RKxy
 Jn6VM2NoDbkvOuHKM8hH7CAGA+QEF2AT7MKelyp8dRkZ0VYmlLcVYcKqxJgCsJVL
 ksmBWCgKDWd+uRZr75vwdgdbHX+B7i7M5oqIdALqfEZANG6g9ao/66Bal86onM5O
 DsGPYw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48mca5h58s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 06:36:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-32326779c67so4696133a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 23:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755585402; x=1756190202;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jWZPw+Dpps6jokruu2kK5mo0seIUmSLFHBR/QVxbsPI=;
 b=JIFsz5kHh9DY0UvlgxFZmVMzmMnPTHMRyeV4Pdg4zVtMalPtFVdbroR4I1HvxUDzzw
 yQ5zbm8aR6PC9mkSfyYtfTJuZR/Xet5uiKcDUyImKbAuSV+iT9bwB7z8a8nNxn1S/XMz
 +eiBA08CArKUH4lPwglbC4+nO7XGPcw1u0Hx7zVpGRWNTH8Srz08oqkfSEzN5dAw7jVa
 2Z35uXMfRPx6x5G5ZvIvy+tum5krrK0bjlcua+0Thd53E3+yUrI/2xBub+oIXJGqX/0F
 pWykJwrSEW866ZL4TraXL/AjRkeDijZ+2XpFTPzxZjNf/YRKscKEWDHcHHgTKSQEPDFM
 74AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1gTOb4bW7Oe+ghPBDuUaiimIu6TOLTdNeWd4lJzPvoqNq0HsW7ziSA4ZNfZ+34UDVM+fgEnA0oq3z0g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywmo1hM0S/I1DpEDjfsFl0Ux4dKeLC9CShuD8lgmV6SKjp9152Q
 xEs8byegWltvB9I7oMxLBXjeOGLnAfkbmfk5eGaaRN444jw2yBOB12iK0SRYK3TVBJP0MknlQzG
 vMq/2oTnp30icIGCao4H+k74qTQjgg3q1TPipwIlSnoacwPkTA4dUS7/6QVquXr/OD97wGgLjHy
 O6X4S599E=
X-Gm-Gg: ASbGncubhZZfi/Ero9KvZMEaDK6nXY4qMm23wo6vTXyWjudUItz8wq/uokr3Y5awZEo
 ILzXkioUR53KAYDPtMHFU9McfTgpPzkgB96YvN5UdAeXIbnqU8zlXWMno4kd6pVXU+Ssm08Grvi
 OoZ4Bj+T34CaFpplL7gvDWabtRODunUndoJBOtqTFES80kQkNPEISb13mWhs7Wt/UJ0IQgLQcqS
 EbMevN3AZZFi8A7QsDLy/4axD7r/HHImKZIwR9/oLliwBOso+7f//9LiyWK2JB8V6wG/QuPdaDY
 h0m4B8Asm1J6YRAfuXEUrbOMs+FBMG2J4uqFAskOpWxw6m3jR0uFAeWfhQXgZzCEzeiGLO1A4EY
 4SaT8u3I9d5D46javVFclPH8UFayNVr7eug==
X-Received: by 2002:a17:903:234c:b0:234:cf24:3be8 with SMTP id
 d9443c01a7336-245e0541d6dmr14369175ad.28.1755585402158; 
 Mon, 18 Aug 2025 23:36:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl/lNABQK/kpg0X2OhEKp4HNBmGeNVvVA1WkA/paFD5ccWwopJ2tFxVPde1x3VdbYJUHJCYg==
X-Received: by 2002:a17:903:234c:b0:234:cf24:3be8 with SMTP id
 d9443c01a7336-245e0541d6dmr14368825ad.28.1755585401656; 
 Mon, 18 Aug 2025 23:36:41 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d54fe38sm98120455ad.135.2025.08.18.23.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 23:36:41 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:35:56 +0800
MIME-Version: 1.0
Message-Id: <20250819-qcs615_eth-v4-1-5050ed3402cb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755585388; l=1721;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=rgkE1DP1easYS6YslKYK9Bbq9OWK3nty3gdcQhkYooc=;
 b=lAzLbqBZgwScoYObFRiDqWfMrCAW8S5NgGjq7r08AjwHO1jUwef1A+841LP3ckCJ1R1EY5YEH
 4cuvivCRLNeDSw954otmMxHK0W9KcjsGR/NaRz4uxt+wTDkP5NVaIVl
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=FdU3xI+6 c=1 sm=1 tr=0 ts=68a41b7b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VHUZ9mhHZOqmV8q2ncwA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 13CjUuNmnuVkAeQdzzXwC69PWRKONa9u
X-Proofpoint-GUID: 13CjUuNmnuVkAeQdzzXwC69PWRKONa9u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDIwMiBTYWx0ZWRfXwf07WoEpHi0U
 2/x9QH17xMmlxZbj2Qf1epV3vqErvH5Yhj/LkwYotn5+zX+DwIJblXIgNP4MJRVufyek0XrZw+e
 3w3espQqFfn4eTgt/R56yymooNrd8dxnY4EioUQ5iSiQQAxUeXqHFNUF7BAmSijNtgs3WMAM+pc
 9e6GN1KwKWZJkPKnHmcZRk9ppGdLosTBAoiFg4HRVJUGsabwaUgQxURArsGlBfhW3/hO1E5VJHK
 E56BxanNLpABn/duUAUveHNLUS9U1iVzoOM9eorxSTodtzoNTa4YKoF4JYDd+AWMBtGMkIOS2Hb
 dikdeZKIFugwnOrp15DSXtlygf2Dg4T8XlAmz/Y0Kfe/7rEUQKBDKsjR1ANQxO7nUy5yW6nvUb2
 1tOPMc/b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180202
Cc: stable+noautosel@kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [Linux-stm32] [PATCH v4 1/6] net: stmmac: Add support for 10 Mbps
 and 100 Mbps Ethernet speeds
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

The DLL is a Qualcomm-specific hardware component integrated within the
MAC and should be configured in bypass mode for 10 Mbps and 100 Mbps
speeds. If not bypassed, the timing delay will be incorrectly applied,
which will disrupt signal sampling.

Fixes: a7c30e62d4b8 ("net: stmmac: Add driver for Qualcomm ethqos")
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d8fd4d8f6ced..a4ea72f86ca8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -64,6 +64,9 @@
 #define SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SW	BIT(1)
 #define SDCC_DLL_CONFIG2_DDR_CAL_EN		BIT(0)
 
+/* SDCC_USR_CTL fields */
+#define SDCC_USR_CTL_DLL_BYPASS			BIT(30)
+
 /* SDC4_STATUS bits */
 #define SDC4_STATUS_DLL_LOCK			BIT(7)
 
@@ -609,6 +612,17 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	if (speed == SPEED_1000)
 		ethqos_dll_configure(ethqos);
 
+	/* The DLL (Delay Locked Loop) aligns the clock and samples data
+	 * in RGMII interfaces. It should be bypassed for 10 Mbps and
+	 * 100 Mbps speeds.
+	 */
+	if (speed == SPEED_10 || speed == SPEED_100) {
+		rgmii_updatel(ethqos, SDCC_DLL_CONFIG_PDN, SDCC_DLL_CONFIG_PDN,
+			      SDCC_HC_REG_DLL_CONFIG);
+		rgmii_updatel(ethqos, SDCC_USR_CTL_DLL_BYPASS,
+			      SDCC_USR_CTL_DLL_BYPASS, SDCC_USR_CTL);
+	}
+
 	ethqos_rgmii_macro_init(ethqos, speed);
 
 	return 0;

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
