Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGHpBXsoFGrfKAcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 12:46:19 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9839F5C95A7
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 12:46:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2B3DC1A979;
	Mon, 25 May 2026 10:46:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 812F6C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 10:46:16 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64P8f3254156310
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 25 May 2026 10:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=RrAk3Qchsl9HTYYm+whnBS
 rxmWERJEvxM4jVWJl2EWg=; b=mZqfAbTEnRpaIWs5d8tduMEw+NTdHXNbZfILfL
 PLgonA7oeyGfQKdlwL/7MxAasB9hjFNrpCeRUnB/Z1dMtN5PRjCskRWU4q40Ibk+
 n0j6TQMtlzRQUwtQVgEfuiZsbWmB/e3FxaFgtvCPx/y40HLaTAn/IJbwpibYuJ3m
 2VATpCLG0IUave2AI2v09FKzuH2/+L1nA6RxspFDAJGeY08DwFGCC0O31cjMV/yW
 VxJE4/0pNJ+X9P+zw39ZeIiUBAkVfGXcAWo7oCCc5V6raHaTmdyPlqP9dCMoHh5b
 i6KSZ8Ysv7r+FiDqv1sGbryg9tku2wBUYngJfxvaiYYL0HOg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7p9xe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 10:46:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2bd6cc53fd6so97290865ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 03:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779705974; x=1780310774;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RrAk3Qchsl9HTYYm+whnBSrxmWERJEvxM4jVWJl2EWg=;
 b=HnzJ7N5xRsrk2QREtMqv+QR/mM0kAc74tFUeXVQ2MHV7aIiwooQ8EK5G4wUogZLgQM
 Ko9oIK6dsJYqeJpmnHwZdoFuqmguGNocXg7pY1/sDXzUFtLKYIWPNvB/eQoJ9AVSIaHi
 2kwkDcYEoHBuOh/Ve7z7YbNdDST5RyovF/wBv+eRtE8BFY1pNKuRSX3VDvVHd+YMf22c
 4yMcHC+zOIdJkj2S9MO5aYXXQfgdEPWyyVntzUj5pVpme+qgpGyiaq9kfxmBMJZODXnY
 txuzmq/ttEyiolLuWLtMOwdkxQp9HIDYZ0HsuHeKpsSTKKr3H+neTWaQNfJJdHzc/KiT
 VBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779705974; x=1780310774;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RrAk3Qchsl9HTYYm+whnBSrxmWERJEvxM4jVWJl2EWg=;
 b=k7TG7iz8AB/4lphvc+ShDRP13bMv8MS6gpjHfAjk5gsFXHXc4870zQn5iOJOLLAIIf
 ZdqgU3TFa4g6nbRGHyia2eIiFrhfkDqKtZ8S2zlt+dfTOoOzG/aAlzjaetbHv+3+CP0k
 JWUiuE6HToxV13CplrzI7Nt+YyatKLtOTcqSa1Z82aOJExGRHUuSyQn1CX3GEUbVn8gS
 YCxk6LvEgQUW8WHUhBPXlThQiw0xo71arstln68XVCZkVUYi6k18oNt0UQpGx5SRumBe
 OhIvCBL12VO3j8B2JMzP1SBXMhWNjSo5ME8TCoS/j+BJkSUW/IES8XBMEyQazak2mK/e
 i4/Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8cjZC2YyHWF0DKK6CrqtKuFkrVL3zgjJ1oz6kw31z6FQPQJsZypu9Em7yT2X/aeXddvzY+w1yOoMOleg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyWPuqloYH490R2EWFwbvGK9ArNE1RKOHWlI0UMpqPJIFfRpGKX
 l5ZNb19Rwzd4ZxCdswpKIFtHLY++CO/nGD90J9AmWOB+cCPgMgH8SMICgLA5NOkY5Y2rqTHoYar
 Vvv2/Y9zh38MOhM4HZt4x/gyZuBo2apvAaCc+TB0MFtIbVWDFg5NTlMau432J9f6rFEZBo7Szye
 1F3cpl9E5wHAee8/Y=
X-Gm-Gg: Acq92OGx1Up5CFXUXJbeLzugh6+3FQRL6BT5Ms5Nl3XkhHF+Wvvp5K4fOhrR6hY+mCD
 0+1ho6dc1UsBf22ZsW19GVOND6VuHuqmMu5h2HA6IMelecHWIeAqPckYoyEG3a/gQQCrdbrPjgJ
 TwONRcMQCz4mZrvSfq8KOey5KC+3MOsHqSMaaCYCNdJsMzJJhEs8qDogz6NhJy7uTcRHYFVN+3f
 Q38rRG6scBtDiQ57k1VqMtsELUWwXMWmHylCOo4zJcMcHjva/iyx11GSjm5dRqcZrrisO5grPfK
 Kdmmm2cvQFVzKyRhZzCoIXpDNYOxwWFaWr8nJgCzSe4qNU11FXEuWWjXjw/QLMsvKDYcWxw2f37
 +OE2dmOndAyTEnC1pufkIxDuQ49kZXQxkhCvwvB6UXqo10A==
X-Received: by 2002:a17:903:2f8d:b0:2b2:be01:5532 with SMTP id
 d9443c01a7336-2beb0841de5mr148146275ad.35.1779705974074; 
 Mon, 25 May 2026 03:46:14 -0700 (PDT)
X-Received: by 2002:a17:903:2f8d:b0:2b2:be01:5532 with SMTP id
 d9443c01a7336-2beb0841de5mr148145745ad.35.1779705973407; 
 Mon, 25 May 2026 03:46:13 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb591f63dsm118666175ad.83.2026.05.25.03.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 03:46:12 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:16:02 +0530
Message-Id: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGooFGoC/33MSw6CMBCA4auQri0pfVBw5T2MITAdpYlQbZWoh
 Ltb2LhQTCaT/JPMN5KA3mIg22QkHgcbrOtjqE1CoK37E1JrYhPOeM4kKyme7auuuq4CqAZONct
 ASGMaLZHEp4vHo30s4P4Qu7Xh5vxz8Qc+X1epOIw2wCA3RusG1M6FkF7v9Rlc16VxkVkcxEdRm
 fhSxKyoEoRmBniRrSjyvyKjgnnWKCkkFqb8oUzT9AZZ8FIqPwEAAA==
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
X-Proofpoint-GUID: 83UX3esDAc5p8J7TIN8JVjPzu5gn3BYx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOSBTYWx0ZWRfX6WKi9GD87XRc
 qG+ip8cv7Es142R1Ma1t2f0W09Lct+mrH0PHKj9X7ifKBhR0otrZkjKbfSVSeLZ42kNcqHVpIOU
 acayBBmALb6OtBTsYFzhU54ZVSHsiP+D+cBgP8lHsLzVdgT31B0l49BPx0+wBDg44Y3H6CWVXaJ
 vJhaHhl38eJ/+cAYnjbfYrdL0GW1vzZb8nBhPoNtDA6swtTAEmRbXJtbUHYBMdB2cXRcNrzHEN6
 WKZv52CbB/LguGPw4lkM3d7dvQbfDUkDcZQD15ZO6jaSmY7r4VgC2lsqo+N0Tj3drjY3HPq9bGo
 qF2gcfY8eyR8MGdIAwm6YjASoR51XFQP05Ff57Lo1FjXID73SY68Y4NB7D0i5CSWPrW/8sp6TLJ
 Dk9htSHFw3zMD6B8kSxzxHdGJgfMo4qJveCOZ3m6authGnuc9AGz4O3cPEe+HU5XPY7DVDpcm7t
 4If4SoJCtiC1kJPSN4A==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a142877 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8HYrQF7E7KXWYYjJzRwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 83UX3esDAc5p8J7TIN8JVjPzu5gn3BYx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250109
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 0/7] Add support for Video, Camera,
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
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:luca.weiss@fairphone.com,m:konrad.dybcio@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.492];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 9839F5C95A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Since CX and MX rails are already ON when APPS
is active, explicit power-domain voting is not required similar to Milos.
Hence extended the Milos camcc & videocc documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v5:
- Taken care of comments from v3, v4.
- Update milos-videocc and milos-camcc bindings to add '#power-domain-cells'
  as required property in bindings.
- Remove duplicate clock 'gpu_cc_gpu_smmu_vote_clk' from driver and
  bindings.
- Add '#power-domain-cells' for 'camcc' and 'cambistmclkcc' device node.
- Link to v4: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com

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

 .../bindings/clock/qcom,milos-camcc.yaml           |   12 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |   10 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   61 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  607 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 14 files changed, 4666 insertions(+), 4 deletions(-)
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
