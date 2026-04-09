Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJfQJLvr12nnUggAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Apr 2026 20:11:07 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 292B83CE769
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Apr 2026 20:11:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 847E1C87EC5;
	Thu,  9 Apr 2026 18:11:06 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2154DC08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Apr 2026 18:11:04 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 639CxmOs1729915
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 9 Apr 2026 18:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=vYpYuC0n38W0nO+hluOO6j
 DvBMadgq+PwfBPn4EQ3kw=; b=oOv1WGiDKNP8CjOph4FPN5YWeLxm8jl8ZEPeHH
 NxDmx0A+301t04L2xXkKAdJ+5J0BE1bJvrlZPk2oNNcNkl9NdhY5sx96RJW8eDwI
 N0y+WxDQq3PtfXK1KKH+ffWlPPaLsE2aYb79UKSq8E8BrJCyKCb25Fg7w3ws6kHH
 pumfCHyQrszHMnvkp3HMkrA6A4U2X/AtsSiwnjVbolVYINyEdNTcDZoN3ZlN7uah
 D2/1VSFjAeHTtG+/90Xydm0G5cIyJc9/FAjArPJdpOfxBr0IudV6UEsdUdHsn21Y
 mAoa0AtQ6/4npULpXkMuepFBdpHlFC6Nxm85bSSJR9sa25zw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxh5wm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Apr 2026 18:11:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c70ea91bfe1so690378a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Apr 2026 11:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1775758262; x=1776363062;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vYpYuC0n38W0nO+hluOO6jDvBMadgq+PwfBPn4EQ3kw=;
 b=i8v3gQ5j3fuKbJuicGBYrdhB43d3pWelbSQ7mWQ+9kGG+8vx0wltGiRB43gkuIAKjj
 ijjLE5EDEMYVyRcQKepp90xo1Cuadj6HVRB3Pqf+hkqSb237oXXpIRWJhW7fWIRx2eh6
 TV8stZ1Vj/u1ylzDAZyka816C2ZoJawrDS7xH3IIXTg23S9jUoGSdZmklJp5fG24Q3Q9
 SeNqGcQAggWRF2IPoGEiKoTE393WDkz+jEoa4zd4iD5UCyNUfKb15+YWt6Gza5PT0Wwr
 hip6oVE7eIiAGW11qcu2s3U30G6/Xx+tYmVbpdj5/vFCS/6wofrqXJ+VpMvuZV2ArSNU
 XO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775758262; x=1776363062;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vYpYuC0n38W0nO+hluOO6jDvBMadgq+PwfBPn4EQ3kw=;
 b=k+A9Z+an4nSGlu6UVzY+h5x0pR8WD6NYFX67lDwbKP9McAHdTOmbngLrC70Q3YcBk8
 NZVWfGvNWY3wLt0cfvolsQcKFrOybAKZFVgwKZwlmTS74/vdLc6ANNehr2GyBaHgmp76
 rFsHN/OvTAv9xaqvQ4Woe03ueF+dAD+Xbzv8LYVls15shnPGMjtoi0ODwrJIEh9M7ZNq
 dRrftXAPeuBIiIVJXfk+holfBXhQKaSTeztOkE+GCCkKguAr6wWXSaVkUIt0keA1OQB4
 7sr71ptr3aUTzkW6qv0C4X+55qjjM9by/6hB5cZPwG0z/b2JUGooUPJ9Zcr6I1czKHp7
 EROg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJVa0+QqDsI3NvqIQIq4nkK6wk6lDj/khjh7mMGttxgYmWVy5su/LxyyOZ37mdZT42ovUHgm8zAd5g3Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyFKaQmUD120DQe1koUKk3bxK9bqn3dUzoOV/3o5G0yXyHmzl8+
 dC/zEYslrHryboffQDmS0asCN57/7oH17qASfDnCzajrHfh+bUcUvDn37fU6B6m/eJuejwO2YM9
 NaZx96dpRLsYON2MOr76Zwyu+Vu+BUZBpHn6CQObwGnBPGtaHzVdRMhRdx2GK9Pf5myanZBasHJ
 ur9IQRo8k=
X-Gm-Gg: AeBDiesjwYHYW6wIMfBZgMQBYTgv3ZMeprkY1K2a1o3ITToitx8VSvKvRurz6gu1xtq
 YR2f0Nhv4t73kCCFl4OxGGYhCDJSnYNdixQNIgUcRdl+oi0CU14+pQZebrUvrD80cFwHvfNAn0P
 iCf8tjPHu9/wbk8lfDm7zwjx0M+2ONnBNaKtYBoejVdZtJxJWgRgZrKuaCcQARMvx8392pgvR4g
 RYftMDr1e8PkZu2Y5jDyPXR0UK/L5VRv5cphYjvJWEAetL3Wk8C5FX5Oupy04PtIY1SMcTIcNi4
 9T3z+5ggMuYVgKWAxCS8fqoMBUw/PmaF4zEAX5LnxZP2mBwZi0Hs6f2iLjAvdU7q3DnW++AGbjT
 nB7e4w4B6hVebGU8YNvCSEfrCxvgyjpYpb+YpN+ZZ5nR30A==
X-Received: by 2002:a05:6a20:1587:b0:39b:fbb2:5e46 with SMTP id
 adf61e73a8af0-39f2f0968d0mr27843580637.40.1775758262374; 
 Thu, 09 Apr 2026 11:11:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:1587:b0:39b:fbb2:5e46 with SMTP id
 adf61e73a8af0-39f2f0968d0mr27843534637.40.1775758261702; 
 Thu, 09 Apr 2026 11:11:01 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 11:11:01 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 23:40:41 +0530
Message-Id: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKHr12kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNL3dSczKrE+Nzc+OTk+DIjXXMDw2Rjk5SUJHOTVCWgpoKi1LTMCrC
 B0bG1tQCG5W/qYAAAAA==
X-Change-ID: 20260409-eliza_mm_cc_v2-701c34ddb74e
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: -jovIKPzTk91g5scPQzcm5F6mwlmIvJ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfXx4M+nEOmiGmM
 TU+228ZVgd8ecD1pkvrJbr/qCIHEVoIi2MVHyGmjMbQ3PYtVEFa6XZkw+MhjCxu31IzcopIL9Ld
 V4ReVhRABeCpyrUSLK4zrvgK/MeLbfOdAgReXzghGutRHtqa91rm/lNnF8Q1EG615Pc9ndZlFhg
 NcxiDNw4VaG01ro+++GavOWgAGgZWaCPP9/C/Bdhm9Gx+/coNeHCiL1TtFXmEZSo1x77Snj6DpT
 n3jbOBZT4XX9mksIbQ3UTjVlSWlimfFhiYylcXYXhnJIm6YdIhgQpcW9RloiecWnoF+WrIoKd+P
 VT1ESYYIJLixJ3JIBhxv+9Qr9euWpS/mT9dU6TSylHmr2A2+xM8CZg2E6k7uaPZLc8GIr/hJsgJ
 AtzwfZ8aqlZZU9O5X6VgB1PeEaWwHzLwK8bTi2Yam8fa/NEg/kfxC52M3fDaDY5rwNVps+n2NYQ
 eaAe7HdvQRDpZfFHZ8Q==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d7ebb7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O432ggMcIDbDob6sqXIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: -jovIKPzTk91g5scPQzcm5F6mwlmIvJ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1011 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/8] Add support for Video, Camera,
 Graphics clock controllers on Eliza
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:konrad.dybcio@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	NEURAL_SPAM(0.00)[0.143];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 292B83CE769
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (8):
      dt-bindings: clock: qcom: Add video clock controller on Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: defconfig: Enable clock controllers on Qualcomm Eliza SoC
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,eliza-camcc.yaml           |   55 +
 .../bindings/clock/qcom,eliza-videocc.yaml         |   51 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   54 +
 arch/arm64/configs/defconfig                       |    3 +
 drivers/clk/qcom/Kconfig                           |   28 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  621 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  403 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   52 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 15 files changed, 4761 insertions(+)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-eliza_mm_cc_v2-701c34ddb74e

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
