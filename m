Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 151E8C86471
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Nov 2025 18:45:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BECAFC57B72;
	Tue, 25 Nov 2025 17:45:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEF9BC56611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 17:45:32 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APGgHuh3587283
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 25 Nov 2025 17:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=BLB/dgVhe3BEdpj5a0hsuy
 Dq7Jx3wTKbCXCAOZWt9d4=; b=hACGw8Mc7aY7u017oxdLcJkj9dcYd6NSMsYLx4
 xrMiLYHKiUz8Po21hEjoAu3JakrHxUNPbZ/sS4O97Fm0HM+zFUeV2YuqkwL7sKnp
 +TgPiI8yBZWEWGKOoyp9UF+/ate4TR6FlwdYR6F1SW2z4RMU6nxXprE77FESVW4d
 DWybg/+0skKxZaSq/mGy8W9FuDxIWZnAAEQeDucICxmsIm/o7J589ObFx7p1xJBz
 NcT6K5/refG3HvOUzRgFCU2+elwPT0Dv0RNu9Y7GykiyKbm5B5OvsD6f+gU2BzCW
 rASXdGHwi8oAz2vbv5GHVO+67/2VfLa25vgg9ZoVK+GSclSg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ang7906e1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 17:45:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2982b47ce35so61371205ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 09:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764092730; x=1764697530;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BLB/dgVhe3BEdpj5a0hsuyDq7Jx3wTKbCXCAOZWt9d4=;
 b=CJfy09+ZJihRgQpSjaheMVFEED6ltkndTuLlC55wp95kv61yGyd5s89X0TLsxM5vdw
 Ln/0oUVpSWrXKUU1/ofB08/zxIgt86W+mOYm2s0jRxxn39lCmGaR453rW5ZLeJy3Loon
 xF/aTyV6+m5eZ6MuRMm1S9c2KwHZ669wJ+u/3Xa8TsMhmxReUctp7AnqeMHnwAaWQT6i
 dAsdVHGESb/zN1MDSrLL0S7E1rWAF4/5Gb1NvmBqwi4EyvzjK/Xiik6uZ1uXc2oj5Uu8
 1OBv9gYvbHTq8W4ySbmqwbClfaJcoMXn1q2YwMw2hGlWW9fG6AsWyCtYo1uo0gTEnFIS
 fV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764092730; x=1764697530;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BLB/dgVhe3BEdpj5a0hsuyDq7Jx3wTKbCXCAOZWt9d4=;
 b=hdT6euqZOZg2ujbfeH/2nK7eCjSo7Tm0ZTANAHiLpIRe0Q24bAgRocTpzCiEnOP6Rc
 c4d98l+LZhqVkwKVEWKfbeaM6IZSgAm5Y7HKmjwUnWe7tsVlXGM7zlmVf3jWc03DuSBo
 fjxDrqBoUmvqlMdEiseAKJClQxv60aXVPXvGnuWfPeSLxN9P2mknaUgXrLmJm8wo+mI8
 NDXtpz52sEjeb0XmAgGeQaMQIWR9xbzbDDEPe5n0xdcJhHXfnXlgEEbdKYB8TvTfQ9PH
 7CX5hLxW7vvbtyNO/OcQR35Fb6iu4hzedszDwEC/F6U0YS0VrWbaiwnrN8VWGiZzncKA
 Efxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZzg2u13KHX/Lng6JqiT18eo++ST5F4VJfZbWWkNmxK65/aLiNkrbWt9k9QHmNa7m9bZgF7GEYf4dReg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy03+2NalfEKwfOIJIgLnZPYdfhDbs5+J4MFKUlV73C+eE4AYkC
 zc7+udLa9U61IsMR64QQLOaD4IKaZFl849ADUXAYNmyOW0VQlUD7JiYcblsBO5+ki4ugKpGN+jQ
 hcHdwmB5Vy1KYeNfbBz0o+icusOUgTBsjhYCPTvKLgWnk/GIUPgCcG6ATA5rQCSOxYn1Y8x58BC
 U8PM92Zj4=
X-Gm-Gg: ASbGncu7OG23Q2Yk+PCIjqZiFQLt6fiAyg4Btt5RbXcWslC7hoV18rQfOZlYRnzRTwY
 e5dWWukb6LVrq2jWv6WReY73StdiqGBYbAdFF8HpdVnT5lhLToapAu/UZLt6r0PZLKGJB75kvbX
 u0lFkwVOOPkV1+ACOlI6Lhoxzpnvrgo1HeBgnkSo0EyjPwBA7cPY32qFTBwQvVDHymZ/b9SmVGc
 wvAxr/GFEU1wOcm3rdZFbX4GdRue7fzjkbI10dejyGGM0ci8R+zoDQZgDZfe8XohoOvny69ckpM
 wOIy1KJuRrZe8MRtOjq8wMUivm3b/0FdcWrlbAxBjyPUEJvJtIkl8ix5K+4hPlO16kO9lHWn5wV
 hpgmdic8RAaRwpMRljLc=
X-Received: by 2002:a17:903:b4f:b0:295:5613:c19f with SMTP id
 d9443c01a7336-29b6c68d7dfmr203097465ad.42.1764092730247; 
 Tue, 25 Nov 2025 09:45:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfgOyK3bt2O6uanwsFHJxsoyo9esFMOv6LtZKMFgNWt+4F89Wuduzs1jP5jU4DJqm9YWhHUA==
X-Received: by 2002:a17:903:b4f:b0:295:5613:c19f with SMTP id
 d9443c01a7336-29b6c68d7dfmr203096895ad.42.1764092729738; 
 Tue, 25 Nov 2025 09:45:29 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 09:45:29 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:15:09 +0530
Message-Id: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACbrJWkC/y3MQQqDMBCF4avIrDtghgahVxEX02SsgzVqoiKId
 2/QLr8H7z8gSVRJ8CoOiLJp0jFk0KMA13H4CKrPBirJGkMWe+bAE38Vh8E53AjL1liyz6ry8ob
 8m6K0ul/NurkdZV5zevmP5/kDqNS03HgAAAA=
X-Change-ID: 20251125-kaanapali-mmcc-v2-0f1525477deb
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=P9Q3RyAu c=1 sm=1 tr=0 ts=6925eb3b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=b2bYCZbHhW0TxhAsxsEA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: PUaf0BBkISnIQUYvrEVsvI8LRRM1na-U
X-Proofpoint-ORIG-GUID: PUaf0BBkISnIQUYvrEVsvI8LRRM1na-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0NyBTYWx0ZWRfX0a2Gk8gJ2eAg
 OgKyFOhewt3eOIf+jcYBxfKVWKPj03hZGVIjOFMzBIL/Owuw9DAhAhHK9I6mj7E4A0+4sgBKpsD
 wtOnfJ8RbihbPzKuFH9I7pkxtaqK40KhwldYvLdXjUjEQn9YUrSI8hoDJ3739Tp5JyaLq6lzvwg
 9mieN63gKd0DVz//3K1xBDvF1EFVyA55cldya6acU+w+5BLU1mbJj0wJ3DLh3ibSLjCZERL/cTs
 /i5YLgxNkzVQRPR9gjMFTlsCMbbgIJJEHTRkwdUIxnLxExdMKGYES9gyf2r5jI03V8nMVbXOmE+
 G31dihNiEsjB77o8xTLtniz4k3YFURtqwtOcHsUcf3CPiZchxezUC3sl62FwBDTiiHBNWf6NFD+
 Tcj8UoSq88hG4V66f9wzKamc1/UTNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250147
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 devicetree@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 00/11] Add support for Multimedia Clock
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

context dependency: https://lore.kernel.org/lkml/20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com/

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
 drivers/clk/qcom/gpucc-kaanapali.c                 |  494 ++++
 drivers/clk/qcom/gxclkctl-kaanapali.c              |   76 +
 drivers/clk/qcom/videocc-kaanapali.c               |  821 ++++++
 .../clock/qcom,kaanapali-cambistmclkcc.h           |   33 +
 include/dt-bindings/clock/qcom,kaanapali-camcc.h   |  147 ++
 include/dt-bindings/clock/qcom,kaanapali-dispcc.h  |  109 +
 include/dt-bindings/clock/qcom,kaanapali-gpucc.h   |   47 +
 .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    |   12 +
 include/dt-bindings/clock/qcom,kaanapali-videocc.h |   58 +
 21 files changed, 6995 insertions(+), 1 deletion(-)
---
base-commit: 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
change-id: 20251125-kaanapali-mmcc-v2-0f1525477deb

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
