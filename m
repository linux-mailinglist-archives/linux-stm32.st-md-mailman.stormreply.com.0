Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJBYMnqYBGpiLwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 17:27:54 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECD1536139
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 17:27:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 002CBC87EC6;
	Wed, 13 May 2026 15:27:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D9F9C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 15:27:51 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64DAW7XB2338896
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 13 May 2026 15:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=PLRVRXYe5uxCYuxI2XGDi5
 MFd0LhFIIf1w7B7feNGuY=; b=SvpdaSqDEuf58NMSIVLGrh34lNxh9ggqfW0V08
 eCMylx2jLky9u1WwsE14Pr2E+uXUSDkZoF2A4dumhbT5RQ5jlQhmq/KnIpz46Fvw
 welp096pKenb0K2VikdluhG3C7oOi20KC4FF/BU+YLPaBy9QxTtq20kcYNJfLngt
 i6iXfv9R1QC+pEr60/jV+YWCQFXm94wg9kiSUjYARn1Ril2jdzqnNTXFr0Ous9+K
 mWotc6Wnvb+r2j6XTz5s7DhpTPANGFUD269YjCLaCrIK7a6VjEfq5CHrSVz0tdej
 vWb6s2hVa0xjypgDGJ/p1/iE5uY8ITRfojaucXR95ZK+VdUQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxc5mq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 15:27:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2b9a3c3c4eeso75240565ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 08:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778686069; x=1779290869;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PLRVRXYe5uxCYuxI2XGDi5MFd0LhFIIf1w7B7feNGuY=;
 b=TAlIRb7lbfIGmhrZd2LVOPENNh7xAsl9piKNibV6cUPw4Wsjjad3cjA10S2gRHLi+j
 nNMpMIjUVsZ6y3FtLIVsnrUL5cy43DXbn95DGxFLGClZH8Lymff9j6VL7n4oTHvKdAmL
 rb3IOKwXYuVNbxcSLUqNVRCItgvuXrv3x7K/oamOnw3m0pgq8mYtriLJEn5g83IdqQvx
 1tnPRKa0AMiG5vOY+jmsu2qe8i+OPhyyOXfRykVIYPPyCfT4yrrOwsxAS25SrvKhW9PB
 cVmf6l7K4WK08yauBjtYCcP/LT19QnH06QxTLhmV8D5n+3AjzEpMTf7njW7fACrFRLe3
 3rhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778686069; x=1779290869;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PLRVRXYe5uxCYuxI2XGDi5MFd0LhFIIf1w7B7feNGuY=;
 b=CtXw7/g/GcKObKblgWziIZdapuYzPDHOppcBE1js7yb0MOHoAUHGAlHa1sdBBLaa1Z
 dhvi9RbQHCRSBJtYbubV7+BDjMiiuJ+tr6H0Dx2GDUqriSWq9RdLAt/mTGj/VA3bOq+S
 WmK1KxikxAT0dx8LKDLzvOalpYUrjTrf0+d2pusmFl1oUsihnjkTDmDuVXCl7qo2fKPb
 ol0WcuCUFthFdjpyPpQd3Lm3pS3QEVbnrcfwGyvsNLFY6OusmPFgoJGgvCK8iddFWfVo
 VNXAnd8P7+KVHMlnCfC6NaoKyUAove0q8A0UJwsWHRwhz3mA52tOtkTfcUChf/U58jJr
 PL1Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8A+Mf1PNQtgTZbs6YFfItEARRQDyLCGAX/SMrqPCzTpLR/7lchA5ji+2p201EHISitfUomEuZgwmxrdg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz4aZmAZwcICk/wl/Rsku2eWyUZwMZ/VzOmWx3/XhrodAEhj9iH
 REfZY8PWiBaLW8wu0JWJacEOXm1NlRkNj9BFB6gROKRr8xWFOAqP8lJnWcxgwng7clc1DJFAbb+
 ZiHRDninDp+l7bIAOag4ijUTdH/P0AjMOpIpalIHClS8svPH4a8uCIF7OI80CfTgQVCEzsvz0Zx
 LMNzyqJG4=
X-Gm-Gg: Acq92OGXm21qbKGyzhv1AZGgQS1jVUAuMyq9/XNU80XCtV61A5UxIdrrzD17TLtRNWd
 iBNh2rEujSmrnSghK6SixYFECedVfxsZVNHEX5o+LPImccnO6L18JSuuUFimaM1Y64dpA6oihw8
 Xq5LmmW1qLUUoLhfGA1FK/tNWdXSvjUDDjjR0tPt+gndemYCC7yj4XyrXjlPstHSBKYvxNtcp/b
 0HJDaHGRIEFDq8PsxAltpxBHwLvpqNcNDxLkqgJyFtx70epNjLKrijogTNPQVAG307zpLgltXz6
 1VX1QC9uStxdXH00m82emqNPFOIo/Ak9wSr9Yb95OmnXFY/fxz1M2ipX0YX3vQks4x5gJy0Pgrp
 iDD2Cew/LIpERQ8SMy87hRgitp9FZiBTuHXCwsdh8Kw2OgA==
X-Received: by 2002:a17:903:22c7:b0:2ba:4086:ecb9 with SMTP id
 d9443c01a7336-2bd3032f9a5mr37432255ad.36.1778686069435; 
 Wed, 13 May 2026 08:27:49 -0700 (PDT)
X-Received: by 2002:a17:903:22c7:b0:2ba:4086:ecb9 with SMTP id
 d9443c01a7336-2bd3032f9a5mr37431695ad.36.1778686068872; 
 Wed, 13 May 2026 08:27:48 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1eafa62sm185042375ad.74.2026.05.13.08.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 08:27:48 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:57:35 +0530
Message-Id: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGeYBGoC/3XMUQuCMBDA8a8ie24yt+myp75HhOht5YFztdWox
 O/e9KWHCo6D/8H9JhKMRxPILpuINxEDujGF3GQE+nY8G4o6NeGMV0yympoBX21jbQPQRE4VK0B
 IrTslDUlPF29O+FjBwzF1j+Hm/HP1I1+uf6k0jHbAoNJaqQ7KvQshv97bAZy1eVpkEaP4KGUhv
 hSxKGUNQjENfFv8UOZ5fgOZ6B+O+QAAAA==
X-Change-ID: 20260409-eliza_mm_cc_v2-701c34ddb74e
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: KYRrLN9Se1W7mXzI90ohq286lQjeYSN3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfX4RiLDXatdZcW
 YqXguUl0WLw8H3XGoliarrJ6y/9jVe3UT25ih5hko9EtXfMzTnCeWjF3bzSt7HRbJ2GuIudT36s
 5WO1mpgayGjaExJfVDxtPbndV+A/8RiAMUoQW94owlNP9zH2WAazkB3iW1xABQEtNfcf8mqBPnL
 qqUtyI4Ms0EJAVRkU7zBvd69dKbYwQltnGzwky/swgjbNevoY/OSQzOj+28UHJ6AimMaCBUoa/x
 06q/RnxSdNASnuQmZyJqzuHIVdleguqcls6j548fI7Z8Y+nDYZF+Yh7+jHiw6HTLSukGJ9HQHUk
 yZZiiwc7D7rAd/ma6mD6O2KYrXRRGosOhKNCjKuC6ul51p00TXbdX6CGlIRS4qlu+nLEnvpuKqM
 8OfArmaFy6ahn4PyKYQaBq+Fj7HEYKB7HASWHOcmYfSQDNPp9hTt/VlyTXvxqUrfPasu/3qkM6a
 JtjboWycO+fMRfGdsBA==
X-Proofpoint-GUID: KYRrLN9Se1W7mXzI90ohq286lQjeYSN3
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a049876 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8HYrQF7E7KXWYYjJzRwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130158
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/7] Add support for Video, Camera,
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
X-Rspamd-Queue-Id: 5ECD1536139
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:luca.weiss@fairphone.com,m:konrad.dybcio@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.704];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:email,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Since CX and MX rails are already ON when APPS
is active, explicit power-domain voting is not required similar to Milos.
Hence extended the Milos camcc & videocc documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v4:
- Update the clock ordering for camcc and cambistmclkcc in milos.dtsi.
- Link to v3: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com

Changes in v3:
- Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
- Dropped the defconfig patch and included the drivers as m from Kconfig itself.
- Update the header inclusion in the milos.dtsi.
- Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (7):
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,milos-camcc.yaml           |   11 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |    9 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   59 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  621 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   52 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 14 files changed, 4677 insertions(+), 4 deletions(-)
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
