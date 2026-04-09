Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oM3lGsHr12nnUggAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Apr 2026 20:11:13 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA663CE779
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Apr 2026 20:11:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 924D8C87EC5;
	Thu,  9 Apr 2026 18:11:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A25BBC08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Apr 2026 18:11:10 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 639CZNEb779509
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 9 Apr 2026 18:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LsdYNRKM7gJvG9sWEFYTczXbszVaCSCTuz9faLmMR/A=; b=XKvrJSQDAgXU8sK3
 xbOjc8eraxv+LNeSD8Eq9ob7R9xjRHIl6mnk/g5ngqdG4Sw4eTrnsf6lYhK8nXbV
 ZJnswpX7BKqcdN7CrMQzv91IJhIE2exj/5WnzYMrMqdVEBfECnIdmsGp4nR6iQZY
 IHITAuUgU0HDbIywHv6QQg1E7nd2/0VDlL7va2iN4++fTRAULc+plre7OWbCPhV5
 Zl7bNSYS2iFNujDhIYuLDgh/TEsTkL3HCgdyl1rSif8LHaMuz7sBtHSX3ZXkqXcs
 awVH1bllaa9171wbpCMBBuPtD/BMjEOGP3VUSaQmsH2RBgsZ5P756+tsgQP3BaPA
 bGJRBw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec8hsd4b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Apr 2026 18:11:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c76b0e04285so699867a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Apr 2026 11:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1775758268; x=1776363068;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LsdYNRKM7gJvG9sWEFYTczXbszVaCSCTuz9faLmMR/A=;
 b=fwIRUmFGEJ0rQr603U3s0BdAYw3I+uAs8Lo5U71wok6U1ajzLvUufzjcyEkDj0zqLi
 dvt3tyZ/TI9ymW/HKgnUxD+OmmGpftoChBBh/BpDDfPd8ieshN1tyvcEkwPy7D0Sz9Rq
 NvcFLNjDdtpFRrUNVnGMy2VLUq1ERNbG/lSaWVE2IIENp4s7IY0BuBgkzZ9QwaDVdN4g
 7ofBU0OP5U6b67iDGvSsiSBvZ72Ew3r82GgFRL1FfM5fTwDf/3D7b6waHtVCCX85eFi0
 mZsPDLbJ9RtFQlU9qWhCieXyBvJCcpvk55jvROzLgnwsY3mvVYNq6n8AZOubMiOPrpU1
 Wfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775758268; x=1776363068;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LsdYNRKM7gJvG9sWEFYTczXbszVaCSCTuz9faLmMR/A=;
 b=kqdUbI4cR0w/zbwt65LkaZfjTYXnVyOYVNQjUli6CH4f+k10YKxWbi3tsYy2wyV33E
 c4sqRRlHVC/+WUOSmq2FVxXgeOnsxQKARibiN1ElBxiVs8Ey0N1P5tjXCZ97pEtFLsZB
 hNnmvkkSOeip64iMR/LrmMYf4Hhs4MdLRkylksPnirk0Sex4jzShaxx9nz8VPjmLy9m6
 gws8/6IU2F7gzdNEEfB7U+CQrTITGHr7aZJOW6oYI3NIBAhM4XC4WLfia/eu9ExrUN4N
 0FcopErOWkcoD/R44inBEtGJ6X95KPqzrWm+VcaEyUQKDRgLGmgoGN9RqMrpxMLXQAlP
 gidw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuHCCm9eERPCRjyhhcX/bsrDkqjShgPsVnfSp8UtJOg5JZHNWHjs256C/RrXSKwfIv2G1SPDLlPlG8BQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx7ei7CIOM+8IGvZ8pxERLsafsTwzw/AH4jrak33ZNjlE7t6xCq
 JJF2AfAiyaq9R+klpMPJYgFvqYP4LPPKF2wGiEY6oi1Z1ek8vR2c9axLb6aUEaNEV1azeKCUj8a
 76ag4oS5M07cpPm9GhbQRnbnMkrnqIiLcGQJpblo7Y8zo8ziK+pZDRjqNt4mGYFpUHpkWc9jj1+
 gAHAUXaDQ=
X-Gm-Gg: AeBDievjQOfDYyxWWvuoXpraS5zfcaWM6pozvb6/tAPY1qafnjgNpEkU4kpes/0KHys
 qNug517fqEmoM0HMWM89PiLjuS7wNTjI58lgiKQvWjCvGk56AOW4YDH/QQCjddH3TKcdFo0j4OE
 FsGKmdFyqi6XpRoCfkxBLra3XfERGw4WGD61UuDQcTioVuWPZx9uLrRqaDFhGp7qp6J7gxV1yKM
 LJYhaIEfcrpKuhHNBBlHjc4T83+WyoJHNXx/GFmFKIYhHZghgqu4yrszFrY7WZKni62pgBoazDe
 HPaH+l7wEEqZ9nYtiwoP0aSDEcMe6D7OHq57Vl8sMhUi9P+67JHnqYUIA4KoHd885f5nLE5wQYi
 26TvNdUZl8Z7vZ/dvnf7l8MgIOqJhSNLxBNEZTJf7sv7BJQ==
X-Received: by 2002:a05:6a20:3d0d:b0:39f:2b71:d79c with SMTP id
 adf61e73a8af0-39f2f2f733emr26752536637.60.1775758268186; 
 Thu, 09 Apr 2026 11:11:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d0d:b0:39f:2b71:d79c with SMTP id
 adf61e73a8af0-39f2f2f733emr26752500637.60.1775758267599; 
 Thu, 09 Apr 2026 11:11:07 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 11:11:07 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 23:40:42 +0530
MIME-Version: 1.0
Message-Id: <20260409-eliza_mm_cc_v2-v2-1-bc0c6dd77bc5@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=PMM/P/qC c=1 sm=1 tr=0 ts=69d7ebbc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=O5AFsRJ8ltlpu4YWMHwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: QqDTULuSVjI3qakvK-NNkHXQe4zD1olM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfX7dAVHTTD2VF7
 TpazgIz55o2Zpmyl+zDzzkfRyWgYaGbjLBmv0oU/APkY028ErbzWTEkm5L35gW+arBOgIPzhZkE
 ybaYVAj6yXtQNkSYKa6/Oh10hcTS8eyHBjG8Mx3iA8ABHY+Oi2cfHMldmNQ5y7X+qSr/hognuzq
 VfGAnPJkxvhZi5ohUWnBR464bxG7pH3Z00mCsww7R3Witz9QPeb8RLOi6NbsPBIBbORJuFZM7u5
 XsHqZxilcLCMgU/Q2TaiqUK+Bly7smOc5y4PSiYWekMhqp+JPsMgVdgfJqEMLCWJY3Dz1S6nXqt
 ElXQ1pla81dq1GO/xp++9mDu5P2IP2JTmE9hiq9l4GbfjwKX5wT6EwD/1kOZawGF3MQ2rcPQYPy
 /PXWzX7W78e70i/DBUxz2Orkmo03UYgMurb7jJl5fGYjv8n51TmFKVxMmkht7jwZkwfOVUbgsnY
 dVM0xa38Z7nTw3ggKpA==
X-Proofpoint-GUID: QqDTULuSVjI3qakvK-NNkHXQe4zD1olM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1011 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/8] dt-bindings: clock: qcom: Add video
 clock controller on Eliza SoC
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	NEURAL_SPAM(0.00)[0.002];
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
X-Rspamd-Queue-Id: 1EA663CE779
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatible string for Eliza video clock controller and the bindings
for Eliza Qualcomm SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,eliza-videocc.yaml         | 51 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,eliza-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,eliza-videocc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..26a0c85f26b13ca8e7a4f5f418e8c98235f10558
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,eliza-videocc.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,eliza-videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller on Eliza
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm video clock control module provides the clocks, resets and power
+  domains on Eliza.
+
+  See also: include/dt-bindings/clock/qcom,eliza-videocc.h
+
+properties:
+  compatible:
+    const: qcom,eliza-videocc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: Video AHB clock from GCC
+
+required:
+  - compatible
+  - clocks
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,eliza-gcc.h>
+    clock-controller@aaf0000 {
+        compatible = "qcom,eliza-videocc";
+        reg = <0x0aaf0000 0x10000>;
+        clocks = <&bi_tcxo_div2>,
+                 <&sleep_clk>,
+                 <&gcc GCC_VIDEO_AHB_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,eliza-videocc.h b/include/dt-bindings/clock/qcom,eliza-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e922250a7fae77f5c996208d50ff372b252aa51
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-videocc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_SHIFT_CLK				8
+#define VIDEO_CC_PLL0						9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_CLK_ARES					1
+#define VIDEO_CC_MVS0_BCR					2
+#define VIDEO_CC_MVS0C_CLK_ARES					3
+#define VIDEO_CC_MVS0C_BCR					4
+#define VIDEO_CC_XO_CLK_ARES					5
+
+#endif

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
