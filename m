Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A99B8A83AC6
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Apr 2025 09:19:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6147AC7A84B;
	Thu, 10 Apr 2025 07:19:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC838C7A82D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 01:34:11 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HkNJ6024945
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 10 Apr 2025 01:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Y+3FfrSNBC0
 rnW/pbZ1shOcvb9E0aupV7QcxaMUAHKc=; b=paeU4x0rLxrFhPoGJrczRk4OJ2y
 Pkw0tFRnIMmEg5h/98A/+VlOhzFrX52SRBH18x5nchp3RFQ2B6ceiKBxxrkBq3bv
 mBNbC/10Fbx6Y57QLE6fggGW7O3fEZVrunIUVkCI8+H/VIOTaKGrRv0Eq5W8JVqt
 ifqzInGkFFmSsVlArb3+7HNHrH7NlDrN4EzoquEdTTSonuwXqeARbbP7+yC6kQKW
 zuk6e/EsrtRLEx1Kf1ZnntZAF54mag1bU0er2pGZXcXPHDqiWWVlM5AXkinFuts0
 hvRMU8amlUKkS/qs/G6ZByeg5ax9+DBHa21vRRCLcnU02boa0P7HvJtWOOQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkn325-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 01:34:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b00e4358a34so224566a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Apr 2025 18:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744248849; x=1744853649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y+3FfrSNBC0rnW/pbZ1shOcvb9E0aupV7QcxaMUAHKc=;
 b=SX1Ek+UCJCTccQgXkzzC62D3djZm0K/vf5/5ekOLxDDj7lrqEerwoYx+75AbVoE1NT
 y6iOs69NL0Zq1TJU8wEUzAKMMBuVIvj5XSEDCr4xrAogaPP7qA+TK9auCwlxB4mRlkl2
 Qb0dLCzJmujzhtj1OlXYSuV6S9jvAsvcNiMr7GGNQrnZjLDzoLxOrfXhAvTXGf3bqOpP
 dnI2RKUtD2hNgENWm8LuTOuP2DT4rzT6jq+/gpvubazxh6pWErUBqA/f1tARZ7Lletuw
 J43R1Xtbn9CWHPp7xunX1Ok5CGjno50acasYOAc+7oAipuEfZ1pJHX0fhjalSOM8NQh/
 zfcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHboghPPCX4Hg221zDRWCsfslSQtDzzMVn0efn7w/C773dXnSBk5wkMzkbb8IUKLbhcuiiq0JOcScCFA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyYCE0+hie3IbBcFyWpJZo+UnLIrG1K6JhTko+lRZlNqWoJV27q
 HRdFyt/xuFRWeXJ5aS7+tqfu2W2UjdtH7nBGjTEgWiLU15db8qp0O5rkAOifFyC8w8a43rNjdu8
 YQTlS2H4qu9zkccp7cVJKHf7pxXroT6xXgNxBck6eN+HJwkqySwjn6sPJ8IewshyB5E2KL+NZ+6
 3A9vk=
X-Gm-Gg: ASbGncv2WYJz3BX5dVvg5dwyyXxsH8x+g3h7lmlTxl7E0XpfYlFf4SUUnnYGlJ5E5w9
 XiGTkCn/b/Xs4DcBa5eaJNWaN4suwXLCWSF4S+kzUkJdyM0mGoye9Z7sDs7RfvTG4NRBciksXxm
 pqYvm8dc6tZbmp5tN98rSTyqEL37y+3BuArEsOV2gR6cQt0A8FmaxNVu9TfqLr8nbA6LbfEWyv/
 w3QtaDDdHrGLmabP2rBZ8NwNN3WoQ6GV5OmP3NoA0afcnX5lEW8+oOykpoVe1S2sRTgKGa5zEEu
 A8YUfVEMRvhu5jw6QsleMsWc8EM7+Pigd2dyI8FxWqc+szZlvNFPje1VNcxGIpHtkjZFDdw=
X-Received: by 2002:a17:90b:270b:b0:2ee:d7d3:3019 with SMTP id
 98e67ed59e1d1-307e5972f0fmr1174650a91.12.1744248849115; 
 Wed, 09 Apr 2025 18:34:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7MCKoesf/io0c1ClAVPtM1es5MKBzBPeISdJZK2T+emvkEbwBgOvPufDeyPNVn4pVjc0MKg==
X-Received: by 2002:a17:90b:270b:b0:2ee:d7d3:3019 with SMTP id
 98e67ed59e1d1-307e5972f0fmr1174618a91.12.1744248848735; 
 Wed, 09 Apr 2025 18:34:08 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7ccb596sm18801815ad.220.2025.04.09.18.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 18:34:08 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 10 Apr 2025 09:33:30 +0800
Message-Id: <20250410013330.3609482-6-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: cGIIqAmBAn8V96Wn4pUJCA1-_DfZmMJV
X-Proofpoint-ORIG-GUID: cGIIqAmBAn8V96Wn4pUJCA1-_DfZmMJV
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f72012 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=wB5yJZRArZ6K3lEFQq8A:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1011 spamscore=0 mlxlogscore=657 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100010
X-Mailman-Approved-At: Thu, 10 Apr 2025 07:19:28 +0000
Cc: devicetree@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 5/5] arm64: dts: qcom: sa8775p: Add
	interrupts to CTCU device
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

Add interrupts to enable byte-cntr function for TMC ETR devices.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index a904960359d7..b091e941aa21 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2427,6 +2427,11 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "etr0",
+					  "etr1";
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
