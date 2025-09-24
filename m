Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D664EB9D86E
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 08:07:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CB7BC3F959;
	Thu, 25 Sep 2025 06:07:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09761C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 23:56:56 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONqWdQ023856
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 24 Sep 2025 23:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=0HNP1gFppPHSf0xqi+qP+S
 k49znPKJdoy6R6/U+ZjdY=; b=VYGsU6/HFqzRsGWtkNv/AU8zPPvoBJdwgerQmD
 k+6h/w6Dg5vjO0QocRdME6RB8oq7dt0nOu2jkihi5eKUExqdInu40wwqrOmnU/Hr
 GcJpfRo4FNSOC2KH3L51FE+ObsWE0qK9qlefKWjr4VRQ3zmB+bO+rrBfqelJOZuC
 VECkrAtMzT9cXrjSW/522DF8N4VV6G9fjC5pxwS2pI+JL8OyyscMmgwVKc4338Y3
 OOHUt9Tm86wd7kY9zekn1NEICcG3fMdXk1MkbYb2hKxXQ/tynhnXIIw9xUDvtpPm
 V2eKaQcQPaEMf9Hx9uvkhCCq+ATaPZG9f/CJ/lZYfcboQuww==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0d4ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 23:56:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-26985173d8eso5333325ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 16:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758758214; x=1759363014;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0HNP1gFppPHSf0xqi+qP+Sk49znPKJdoy6R6/U+ZjdY=;
 b=iYEXfR9hXjJhppWopBNkdj9Dd2ALm7kJv1FVhQD0N668lKFxiQPBUyCqpN6/5fu5Bn
 B/MlL5mPxXPgevrTTY/ImXipr3xpd4uW7CrOD+WhI+/Uc0zn1kVDxno9pzVy11rMqAQo
 y2VfV/5WwSawG7KsR1Q+tgvAi0uOg0gdeqiRYYrmcZgAGBaPfkTUSBln0diXtZciovM3
 D8d4IqjiWdHMXmF2VvO03EPIfqkNjaAcNWuvMOJJlmICzdcdW9OMEkeYEthv76yhyIEi
 vOjOqwaIRLun+UDOMNSvd750Qqbe4BOOEmMGVgpDdQnrMvL3BvAYrXrl47I4hy3ukXEU
 H8rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZM0xSo0XQKsD+xqmOAJivJW8JxTQBN7S4kqmmJy/22rXwIALhPuSgq5JK7QfCyHjupUDe4yH6tTeAGw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YztV9/EI9MK1bHKKmxpHT9vOBrQYoer0XO8pprAg9tyknS9xHnT
 njIDKVdA2/NxZ1jDjcufXECMapWkXC8PceBp0YnIbA2b/z39etsSagQjGK1NwFGPAN+ChI7ijsu
 z4XOpYPqR80shc0m1M3+1Sfg1lJ3eARenpwmNA1BGYqm4CRyD0lvX6Vr0qsh/7aL1n78Ca+pzxt
 4+xmPvqTQ=
X-Gm-Gg: ASbGncuaJtMDd5RM6iqlOnsnM3FgMPeTbWqWWHw05e+ajFw5eYJbRKBnoTYe1zQ9Zse
 O3UI7QtPRh56J3H5pHLG6H1kaHAKDxIkKNMMG153KLZLf1nhLrmz7BYwSwuRFzmpXO+DNtvBPLh
 ERb9nSQnrW18IxqKpYH2GCOgtf1snfhHLNL2hpb+1pafhjAh6obS3eDJm1qqmGxOU/QfLo2PbLs
 KhqLFFmSeYYHegRO7m5OqamyDo3tn+YM1PNkhgoA5VAwD5bkRrUXRX90a1BHnpqn21jNQ1oIhd6
 6Q8gt/ES0jBbcp7ptkSBL9La+vdH98vIhLTAg/TTN/PNydensc9brw5Y0RDgRZESobtRRP/3zM1
 j0CT6aYOgsaOHcIE=
X-Received: by 2002:a17:902:db01:b0:264:8a8d:92dd with SMTP id
 d9443c01a7336-27ed49deb24mr18743485ad.20.1758758214132; 
 Wed, 24 Sep 2025 16:56:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuXpQ87PpiUVqxhBpphiYJD8lJPb8xabQqGHfuiSSPYt/ISD0gfkaw01Z386R6Y3IXmgxA7Q==
X-Received: by 2002:a17:902:db01:b0:264:8a8d:92dd with SMTP id
 d9443c01a7336-27ed49deb24mr18742945ad.20.1758758213684; 
 Wed, 24 Sep 2025 16:56:53 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6881fd6sm4557185ad.87.2025.09.24.16.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 16:56:53 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:56:41 -0700
Message-Id: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADqF1GgC/y2NQQ6DIBAAv2I4lwTXIOJXGg8LLJVY1IJtmhj/X
 lp7nGQys7NMKVBmfbWzRK+QwzIXqC8VsyPON+LBFWYgQApdd3yaVx6jvU9cewtKSQKPkhV/TeT
 D+9e6DoUNZuIm4WzHbyFi3ij9xUSPZ3ltp32qdokxbH2FBA6EKEPVOuh0Qxa9B+lM4xR5XWuBV
 piWDcfxAXEoDAzAAAAA
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758212; l=2526;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=zuun76wqTxfr0E9KMvOfXXE9WAPE5crgdVIf0Pmi2yA=;
 b=htJ6K9g7jj5V9bOvCfCGRKnlr3PiOUcrSOdXlT5I0+7V9VD5wCueNm3RniYGdPvwohf1716Fo
 IAKl0lsQs40D9KXhUkLe7pO1vS81ndR/4Py/o8wjsJVE2UJqY/oWjA/
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d48547 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=0ZJa7YLzid_87pQeuMgA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: -OR31mNuABPBd_rcIKksb2tdX507BdrR
X-Proofpoint-ORIG-GUID: -OR31mNuABPBd_rcIKksb2tdX507BdrR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX1DuFcL/70TBs
 /bqMDFheRORMje0kjtRaUVAt7VDVeg5gnAcDQXLV54QFfWIupBdU0SOMfymj7Ug16IjfKpmQD4Y
 TTNFoNOmP+N8CaskJhiqw7S3JE/ELLqU1+TPkpgugSOfK3kQu07/3SA8tcSndVuYVpKuwZAxCsB
 IXjToGaHc3qgD5yTOFpuGE6eH7AFuwKQvjM4qMRVNILaUKZyczQHfzmUH0c+MZt3EX3EEe410if
 SLzA9A1pK+je/Vd/RG5knZjrGNht1RQhxtpQvcdRID30FoXOaZm1RmhcooFeNxx9nUuARUbvT9R
 NWftlJOa9Foj1tpQU49UzJuT6tqM8aGUZqU7+PDCwzuCjEAl9yy2AedxcDSk+dsmUU7fvcWea9C
 f8aFzgun
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1011 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138
X-Mailman-Approved-At: Thu, 25 Sep 2025 06:07:35 +0000
Cc: devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 trilok.soni@oss.qualcomm.com
Subject: [Linux-stm32] [PATCH 0/9] Add support for Multimedia Clock
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

dependency: https://lore.kernel.org/lkml/20250829-sm8750-videocc-v2-v2-1-4517a5300e41@oss.qualcomm.com/
context dependency: https://lore.kernel.org/all/20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com/

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Taniya Das (9):
      dt-bindings: clock: qcom: document Kaanapali DISPCC clock controller
      dt-bindings: clock: sm8450-camcc: Remove sc8280xp camcc to from sm8450 camcc
      dt-bindings: clock: qcom: Add support for CAMCC for Kaanapali
      dt-bindings: clock: qcom: Add Kaanapali video clock controller
      dt-bindings: clock: qcom: document the Kaanapali GPU Clock Controller
      clk: qcom: dispcc: Add support for display clock controller Kaanapali
      clk: qcom: camcc: Add support for camera clock controller for Kaanapali
      clk: qcom: Add support for VideoCC driver for Kaanapali
      drivers: clk: qcom: Add support for GPUCC and GFXCLK for Kaanapali

 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   63 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |    9 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    3 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    2 +
 drivers/clk/qcom/Kconfig                           |   38 +
 drivers/clk/qcom/Makefile                          |    4 +
 drivers/clk/qcom/cambistmclkcc-kaanapali.c         |  437 ++++
 drivers/clk/qcom/camcc-kaanapali.c                 | 2661 ++++++++++++++++++++
 drivers/clk/qcom/dispcc-kaanapali.c                | 1956 ++++++++++++++
 drivers/clk/qcom/gpucc-kaanapali.c                 |  494 ++++
 drivers/clk/qcom/gxclkctl-kaanapali.c              |   86 +
 drivers/clk/qcom/videocc-kaanapali.c               |  824 ++++++
 .../clock/qcom,kaanapali-cambistmclkcc.h           |   33 +
 include/dt-bindings/clock/qcom,kaanapali-camcc.h   |  147 ++
 include/dt-bindings/clock/qcom,kaanapali-dispcc.h  |  109 +
 include/dt-bindings/clock/qcom,kaanapali-gpucc.h   |   47 +
 .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    |   12 +
 include/dt-bindings/clock/qcom,kaanapali-videocc.h |   58 +
 19 files changed, 6983 insertions(+), 2 deletions(-)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250918-knp-mmclk-9fc2775e2fa5

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
