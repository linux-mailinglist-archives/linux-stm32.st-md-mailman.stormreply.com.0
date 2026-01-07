Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3BCCFCEE2
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 10:43:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FF3AC8F281;
	Wed,  7 Jan 2026 09:43:28 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B595CC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 09:43:26 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6079bkx83889018
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 7 Jan 2026 09:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=l6RdcxF0KkuoMThTWV/0U3
 PjiCm3+6V4PEqv1V5VmIM=; b=bVBEMGcww4Vw7b/c9KYdn7pvMqA4Tcdx8irdqG
 mzf1riG3iQ0XlX0ZlwbBzRBQM7ZrRUGp5n+13S86FKN2q4QS6sxTVHuWZUWGAO9r
 9lEUlf5IudA8uVWFSYsUqhbHR2Zy2C51c5PSxb4HwYmQa8jPilcy0SLsFQkVcLno
 xkfkYz49ekF8qo+LXA8+CCBTOJYVuHSm8DyxvtLIanHO5nL8IDBT/3G3jVOfl+gl
 B/VA5iUTeSH/9HhgkVAzuXSNGvotvF+d3QL1ExXYu/aj9g4z8NHQJs4axaeGG4Zq
 HU/SQvdHqdIqfhVlp2FoXgU20BGKsGRcUlDK5IWxxkZH9VGA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh6a0jt25-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 09:43:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-34abd303b4aso4282639a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 01:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767779004; x=1768383804;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l6RdcxF0KkuoMThTWV/0U3PjiCm3+6V4PEqv1V5VmIM=;
 b=iyHy9Uzicx25ai9oww+oKmt1iztuFazhoDtZEmcYebNd9BET/c7tJjTJR9nWNpjbK7
 XLy7gWZstjoL1FJEvJNwCnw1EuETRL7sHLJhU0JvrBIByI4sWdYImBDAxrMV4FMi9QGK
 1eSyp0segVnTApdEB7ddv8OpniFXZ6nfQNOaH0A6kTvtwq//J1G8QvFCJ1feXwygmewa
 I4/QCDcoD/hBkA7MxVl2ulM77KquBMShSnTcEsGRX9K8/6r48m2ywcFLvtiuCNjW+WmY
 dofaN/hqHEp+lu54KUNRAgDqWL3CE2whmiDGGNgx3UKl4GmfP1lm4X8CLbLLV1FKMY7j
 prHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767779004; x=1768383804;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l6RdcxF0KkuoMThTWV/0U3PjiCm3+6V4PEqv1V5VmIM=;
 b=rQYfy3BlRlDWkq53hv4IOlvZdnWjflsxRbPmVJCbH58AiCKTA7lEvt/cI6YxGR5Ng0
 ywChbbjQPNF+mW2PxZQ1sW30kKdo5FbjXu80gY4jiXscHqfoAeQ0TEDVvM89STANT3dK
 ejhFb/wPDxSctcLWCrThySl3p0tA4I6awqDsY8XdXbpMg0TnHyofAPIrtgLmI8g3oc0W
 KYthk6QsWI0IAyh+TEYm2cSIRW5FKaPR+Okc2SLF6eJVQCgquN4OYV8h5dbvCVMG/YRQ
 vYZM6+VtyvamTTGGF53SKhZUGl5KVas5TB31QwARntI6uyHE21K5QLi+NdoXnSxHcUcx
 2MkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLr+2ORn1t6uIWjHoRAFRiwvlJsrtrGaCRrU1P1iRk6Wh0HtRgEXgR2aivql1Gh2sVUOmcBUfXXb7MfQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxFWsdL9mULs3/FAW1gjQmSq9MjAuSNfWFAzDIrLdhuMjmk5mzN
 ufuzfd8JZZwZ57/hGeEcw+EOJ2VhEPqpTz51k+DTwbAnTxnrRrM/vrOwKGbc4vIjk4ZvE1SCQVW
 w8z0ouJ2nEkS70oKJ0ON+sUUebV2OvDTOmIo0bXs8Kh3mjgRDNC58/zg4b1Hvwws9ICQbcHshLT
 64hcvNogU=
X-Gm-Gg: AY/fxX7+6ik0ENWJqEydAehrmWW7kI7gow3Bg7Vz0titrTeSbDM6kiGPNg9GLHKe9Dq
 Eoyi1mPlgVqM70Y9tKnv7JjAJ/1bQt0vF5Yq5JcVtmtVxAvAurBwT3WkW4Ejc7EsdutSmsFJ6Xd
 eiawNRtrXzz05SSE23/J0KIYEcJVC9jbcxB7iliEII6WWz/lx8DuRkt/MF+2rU+JQaI/kR5qIW6
 YlIn/fyDLOHOk27i3yRogvs/nULQPJPpYA2np+PFgqtYBQuMfgd20k/5EhXS6xrXxX19C/6o+ID
 il+VY1ErCn44gSxcwsA/fpdFc4lkN02gSbY1x/EptfpgyH1uvlxKkl1U4QWOgabrWhH271Vi8Nc
 mvGcs8vcZjOOADX87I9/VF1rkraLNRaFBzA==
X-Received: by 2002:a17:90b:4a07:b0:339:ec9c:b275 with SMTP id
 98e67ed59e1d1-34f68c308camr1992730a91.6.1767779003910; 
 Wed, 07 Jan 2026 01:43:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9utHaerxlmRKQBS/EdaJNmJ7bFN1nMsGjL366kf8cZMjULjE7RzNmpNRtkBxRkq0JoaMtcg==
X-Received: by 2002:a17:90b:4a07:b0:339:ec9c:b275 with SMTP id
 98e67ed59e1d1-34f68c308camr1992696a91.6.1767779003444; 
 Wed, 07 Jan 2026 01:43:23 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 01:43:23 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 15:13:03 +0530
Message-Id: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKcqXmkC/x3MMQqAMAxA0atIZgNRsaBXEYfYRg1qlRaKIN7d4
 viG/x+IElQi9MUDQZJGPX1GUxZgV/aLoLpsqKk2VFGLG7Pni3fF47AWU4NuImvIGWfmDnJ3BZn
 1/p/D+L4fuMB+e2MAAAA=
X-Change-ID: 20260105-kaanapali-mmcc-v3-db0c60d6d6f9
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: SZ7EyooQ6UVDUo1ZEWfv62vc8HjZuEZa
X-Proofpoint-GUID: SZ7EyooQ6UVDUo1ZEWfv62vc8HjZuEZa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OCBTYWx0ZWRfX4G0TfK+VsMYl
 5n0qllyUO5pu5I5IDxCag5H/+qRG0Bl3vkgxQVveBm7TVq6vNOssNyDFBLCpLl0WebIb5i6hwsA
 UaAcckIg69cIw98RgLwBO/nyDrQ1EGbbU9eC9GzLpzIj90RLIWXK9DyjMzWCgZ5Pib7lnncN6/a
 rlGSrILSz/UKk0eEi/E6CM1mGskD0VaAxFNxdxDkeczuytvekoSdFpfWFJKfYnygT8kUYi+khcJ
 FJXmUgTex4TtA+39r659FKuhTfOvWj1etvEKhHUXpq9KAO63l5Ez0IUV0H/QDgSZ8YAiLR0r9HW
 oHSRg/Nc4bqCZQKwJlMzYSRB8u4AGzDpxIppmgnvd+yqCPopqkdwqxYQxrH0Hn5Q3QsJxD1Xm2X
 f0wESlHijfFmO1TkW478eqMvOdz4VuQFJILmjEwTMYPnkMuzs+0liXgi5Ui/+JruBBEib68Pt7F
 ZZDSMrXjB1LKyooKhgg==
X-Authority-Analysis: v=2.4 cv=MtdfKmae c=1 sm=1 tr=0 ts=695e2abc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=AqjRrIuq8FlCCJD4mHwA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070078
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 devicetree@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 00/11] Add support for Multimedia Clock
 controllers for Kaanapali
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

Add support for Display clock controller, Video, Camera and GPU
clock controller for the Qualcomm Kaanapali SoC.

Changes in v3:
 - Add RB tag for CAMCC dt-bindings [Krzysztof]
 - Add more description, commit message for the newly added GX Clock controller
   for GPUCC dt-bindings. Update the complete region for the controller. [Krzysztof]
 - Add RB tag for display clock controller [Konrad]
 - Fix the below for the Video clock controller
	- use lowercase for mem_enable/mem_ack reg.
	- use GENMASK for mem_enable_ack_mask.
	- fix the indentation issue.
	- update to use regmap_set_bits().
 - Fix the below for gx clock controller
	- update offset for gdsc as per new mapping
	- update regmap_config as per new mapping
 - Link to v2: https://lore.kernel.org/lkml/20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com/

Changes in v2:
 - bring in the PLL related code from https://lore.kernel.org/all/20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com/
   to this series.
 - Add RB tag for DISPCC dt-bindings [Krzysztof]
 - Remove the patch 'Remove sc8280xp camcc to from sm8450 camcc' as this
   series has no functional dependency.
 - Add RB tag for VIDEOCC dt-bindings [Krzysztof , Bryan D]
 - Add RB tag for GPUCC dt-bindings [Bryan D]
 - Fix the commit log for camera cc driver and add RB tag [Byran D]
 - Add comment for using 'ACCU_CFG_MASK' in video cc driver [Bryan D]
 - Describe GXCLKCTL the newly introduced clock controller in the commit
   log [Bjorn]
 - Move the 'gx_clkctl' driver from subsys initlevel to module.
 - Link to v1: https://lore.kernel.org/lkml/20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (11):
      clk: qcom: clk-alpha-pll: Update the PLL support for cal_l
      clk: qcom: clk-alpha-pll: Add support for controlling Pongo EKO_T PLL
      clk: qcom: clk-alpha-pll: Add support for controlling Rivian PLL
      dt-bindings: clock: qcom: document Kaanapali DISPCC clock controller
      dt-bindings: clock: qcom: Add support for CAMCC for Kaanapali
      dt-bindings: clock: qcom: Add Kaanapali video clock controller
      dt-bindings: clock: qcom: document the Kaanapali GPU Clock Controller
      clk: qcom: dispcc: Add support for display clock controller Kaanapali
      clk: qcom: camcc: Add support for camera clock controller for Kaanapali
      clk: qcom: Add support for VideoCC driver for Kaanapali
      clk: qcom: Add support for GPUCC and GXCLK for Kaanapali

 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   63 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |    6 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    3 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    2 +
 drivers/clk/qcom/Kconfig                           |   38 +
 drivers/clk/qcom/Makefile                          |    4 +
 drivers/clk/qcom/cambistmclkcc-kaanapali.c         |  437 ++++
 drivers/clk/qcom/camcc-kaanapali.c                 | 2661 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   20 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    7 +
 drivers/clk/qcom/dispcc-kaanapali.c                | 1956 ++++++++++++++
 drivers/clk/qcom/gpucc-kaanapali.c                 |  482 ++++
 drivers/clk/qcom/gxclkctl-kaanapali.c              |   76 +
 drivers/clk/qcom/videocc-kaanapali.c               |  821 ++++++
 .../clock/qcom,kaanapali-cambistmclkcc.h           |   33 +
 include/dt-bindings/clock/qcom,kaanapali-camcc.h   |  147 ++
 include/dt-bindings/clock/qcom,kaanapali-dispcc.h  |  109 +
 include/dt-bindings/clock/qcom,kaanapali-gpucc.h   |   47 +
 .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    |   13 +
 include/dt-bindings/clock/qcom,kaanapali-videocc.h |   58 +
 21 files changed, 6984 insertions(+), 1 deletion(-)
---
base-commit: f8f97927abf7c12382dddc93a144fc9df7919b77
change-id: 20260105-kaanapali-mmcc-v3-db0c60d6d6f9

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
