Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 192FDC9B212
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Dec 2025 11:26:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60850C5C842;
	Tue,  2 Dec 2025 10:26:47 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3C54C58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Dec 2025 10:26:45 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B24fNpU1688802
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 2 Dec 2025 10:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=VrUz8PGW2KF5hQpyTzA1xT
 f3mo1AjxCZZSaanbzdKYI=; b=Dd5RfVCognEcboKe8lyMiN/Xwm+gtb21hXd2S3
 CettWgI1R8CpOnDC8q5dSOv0JdvF0hRBOUooCagXTcF1L7iGaOQjw5IHsjAV4qlk
 AIcZfMllxeGUMJSwYPkx35b48gkMB+L+cgqgi3QKJp5AB52+zNBNYOSDtwsbRSoK
 4BHhVVY5pu8/C7qjhnzF6ga1ZDLMrowENFNUucyvUrPqR994t597ALSEnjvq/ImY
 aZe2CHtJ3k/b6g9e5rwjs0K0ashcXUtds8zXvViT5dvQuFLlxmwuvkPiXgpypIHC
 SjYxLdbcKvNr2WapMwwNofu8JKKyFS0IYJHYHZR1fFskPORQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asgxetnd2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Dec 2025 10:26:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7b89ee2c1a4so7806734b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Dec 2025 02:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764671203; x=1765276003;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VrUz8PGW2KF5hQpyTzA1xTf3mo1AjxCZZSaanbzdKYI=;
 b=TMBrgsedGBqRhS54Qgg0b2flZabs+NffpxbJHjegyBbn4odFL6SvTZ5FXXurkdfaFT
 4uLKvvf2Rc7WpufaeMXUtSlzDEj+Y8cpIBlJZDsTua8MKrqnn8CCYDiP+mpvNTitfc0O
 IStZti0uKPZMFQFe8sVUG9slYO2hy2jRly4NGFgiQoJynr7wJcRzTIPO3pq2Fn8ocTF9
 z93i0lqk9TPWXBrvVilL/rPOXxOa4vbW3AMJB9f96PgmqQQlCqOJu3TcYq0F7sB9Kma0
 4/GvVBiMlg41sgPeLeDimb5Alxf+vZDzcEuK4OLPLopX4MHBungOtvS8ATdXAdsBBkMl
 XsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764671203; x=1765276003;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VrUz8PGW2KF5hQpyTzA1xTf3mo1AjxCZZSaanbzdKYI=;
 b=cil60QH34Nc+zDVmd9OUkhTrEbkrAHgXIu+AAd0K7uEdm1myftOa6r6IwUMXf4pFeJ
 srTVOE4eCYjgWuuQ1ZDYl3z/bwQDRtrP00vUf3le2PpOZD5U13CcUZ0loxItuEzDvG3u
 hQovm3fgjuDYoTwb7h8i0tYDpk1HiszpvimRtIS5TnB0KS/DEcCopuiDHgesM1IJZmGh
 /wRZaheYsDK7lQQzZKOHyxCqw/xWqJ/kD1EqwimmErnLFT2UdkgBQ1p8pt/2Fpqa7w0y
 tKb5iEUE0Hecc5P7K+j/ETHz8Yxoe6cKynNiDj3ut3sPOEDbPfoV7sf9sph2n3o6f+mP
 K9zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn1BnIJ/AP3iEhxdKFMk/Niw4omsDwIgKflmbdqaobELPYsnvgaSScoxNCNE+JC6BA+JhUcn72BnMniA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxbkGAbibHQcQPvTWvV5SJruAo852wAwMoNmpPfT6yWGpZ/zugg
 vVovHB+O8unXtla89R0dgiMJosTclTmLVuP2o/r9UliIHVwnbIzJy5959VioZHuwQ7tHPtXIxxC
 db2IZfYGL7YTZo1xv8vx9zsW5DKKMLa/Ggdko1Hz29vuPta5ylhx7Zh/vXTuJnUg8T+JjK0j7ed
 qF5HwWkj4=
X-Gm-Gg: ASbGnct4NeQoQtm+3bP9fqgUpqajwomwALuqb6RwCTjgIInuealKgYZebOFJOtwT2yx
 Vbc+vKxyHDvIl1hwoE7V9fSQq32zyGPGT2NkjB5GR4SCUDfxaXlmaouqTOZdJTKv6fTAc3TxpzC
 +VGrEkzBK1QBgA+iCvGgdnGuQmfhIwgctmrFfHRFVD2BaNpmyz8kdt0SIJ0sLLZUJMDh7EJ5kF6
 oTy7q65aSuAAx2wLFDAWDX5tPgfQvxxvJHB8IwyZW7NYPoFYlcDev/50Z++knfrkxIjtzkhk0bx
 PJjFf6QFqdrrmpr9bTAKCNTDJrbUq+H6+95GsEJJWRmCaM+328O9G35OHj7WJLs9Dzc3w1CTVBN
 NMbeTi1WB+cXHQ4CLJEIK6KwE/akX4/SnAw==
X-Received: by 2002:a05:6a20:7285:b0:340:6b9c:8a6d with SMTP id
 adf61e73a8af0-36150e2b4edmr46198294637.3.1764671203419; 
 Tue, 02 Dec 2025 02:26:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqbxAi6x2C16q6RSb0ek1+DoOM9LaefMRtdRnCp29pa73Jqf77f/0+GtRe+Jn5R0eGnnhL3w==
X-Received: by 2002:a05:6a20:7285:b0:340:6b9c:8a6d with SMTP id
 adf61e73a8af0-36150e2b4edmr46198272637.3.1764671202970; 
 Tue, 02 Dec 2025 02:26:42 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7d151ad4d6esm16379511b3a.26.2025.12.02.02.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 02:26:42 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 02 Dec 2025 15:56:24 +0530
Message-Id: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANC+LmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIKFbnGthbmoQn5yYm5ysa2RqmWRkbJRiYWpmoATUUlCUmpZZATYuOra
 2FgCGaOyxXgAAAA==
X-Change-ID: 20251202-sm8750_camcc-259b232d8560
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: 6UpQDmBN_wTlxQHOMuCdBcuV-EdldH4A
X-Proofpoint-ORIG-GUID: 6UpQDmBN_wTlxQHOMuCdBcuV-EdldH4A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA4MyBTYWx0ZWRfX5yi1LA1Zzt01
 s4WGT7nU+NVZrS4EjcYLl9mxc7bzVUcWvpVfD1ZvsaBLavTnGAKAiZBaWtwkh+Q7CwW9X/LnTX1
 VvWDyAna9aNC+JYMTmttQMiCxIhFKWk8rfZz10qA4dDsiojdxqwlFVS+Gv+vcIwobEImsNDTo6G
 KXjtXDS9zIYjjP/XxpOiTSGDWH7ikUYtRpfIBN06DrzHufg7UpJHpF/Tu2XOoKF0Kio/KXDpWvl
 He4C7iTkls+GZGmHJfvwtTVFECxHyX5Qh2kNubaSdqafvy4qoxcLQ1MvajapzNAeb+ehMO9rN1j
 FXrZCSlH5Ro/N/VsIHP8tfxcCc+OsP940m7tqXs4Qk/89NVSDXwrJRU9QT84KiEq93ujNHtdyHP
 8yd/hyToTZfqu0Nk3G7oR4hn+2KdZg==
X-Authority-Analysis: v=2.4 cv=A8Zh/qWG c=1 sm=1 tr=0 ts=692ebee4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=V3dEWrsxhXhpuwuaMIQA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020083
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/3] Add the support for SM8750 Camera clock
	controller
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

Support the Camera clock controller for SM8750 Qualcomm SoC.
 - The camera MCLK BIST clock controller, which is required
   for functional MCLKs.
 - The camera CC (clock controller) for managing camera-related
    clocks.
  - Additionally, the Rivian ELU PLL is utilized within the
    SM8750 clock controller, so support for this PLL is also added.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (3):
      clk: qcom: clk-alpha-pll: Add support for Rivian ELU PLL
      dt-bindings: clock: qcom: Add camera clock controller for SM8750 SoC
      clk: qcom: camcc: Add camera clock controller driver for SM8750 SoC

 .../bindings/clock/qcom,sm8450-camcc.yaml          |    5 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/cambistmclkcc-sm8750.c            |  454 ++++
 drivers/clk/qcom/camcc-sm8750.c                    | 2710 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   14 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    2 +
 .../dt-bindings/clock/qcom,sm8750-cambistmclkcc.h  |   30 +
 include/dt-bindings/clock/qcom,sm8750-camcc.h      |  151 ++
 9 files changed, 3377 insertions(+)
---
base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
change-id: 20251202-sm8750_camcc-259b232d8560

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
