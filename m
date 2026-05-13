Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Ny5SKYCYBGqILwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 17:28:00 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6423053615A
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 17:28:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FB22C87EC6;
	Wed, 13 May 2026 15:28:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2ED32C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 15:27:58 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64DF5OBe4159945
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 13 May 2026 15:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=; b=oWAJH0gGoeGqe/Py
 fAD/C3e8SbEle4ssf6zo+mvxdSdzpNfH7oHhbgyZY7wyk4N8fyALr9ziwv74uCVQ
 iPSCl2vxel3ZrKhW2MODSopZ5GWcUB9cKMb4UGKohtThZmPpoYbXOan8M/mPWSlE
 jhJzdU5aaaEFaYDUZk0qphJWHZEPW67VXeowqw3pqOa0VN9Xbxzfga6YtjHZBBof
 WO95rbqud1VtfkBXHcw4YOX5MlKtTnK/5qETGfRcHNCGe/D9doV0b+0m9q69t/73
 UXo5XNqazeGD8/aqTW2/zeDJXl8MGzDYAWi3L4Odf9P7P/q2So62g9kVqsS8Lvig
 NMnjIA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91shf1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 15:27:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2ba86e35aa1so107591235ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 08:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778686076; x=1779290876;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=;
 b=eupIoVZtdXROMzuyUx7u3gphRnwfOtOAJG0WoTY7UnvGihBuVfsFWBvzLlPEes+tP+
 9B9vkIGEsmeR84pr+Nh+8VGgLzoeYpSeCP6p/VyImhOKn5Mlu2so2Q0KEI5UAekseW7U
 CEjl5wTUaRtG+sIhillngwGKty6KTgUG8kuIHjfNQfZ/m4YsGE+QfSlSpl72FOzVsCmB
 PSa7nP//CAxo8g0aBA2gSzoiACa3C/8KzKZjjezufcLfgmQnoIQDunz9rrhjChXHIBv5
 2irqQW8nAC87opDjRSDj9YjEHpvpLusHBrjFQcBx6wchTmE/WGtY0zMeeSNoNQjPF0gA
 +fTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778686076; x=1779290876;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=;
 b=UBWUaKXsoLpg5LeboqBAJFw8tWRBuRuxKCutQszO6cywGwksLIQ203gJuC5FGgmmHP
 bhgeXbsmmloQxm0nGXSQjt0xTUk6VzCz7IRBhYGzpuCt2dAPOtm813UP6BDSqp0tPJ10
 lw0NGpWeFaW25dJToc1GQFfdK/PhIz0sMTRpln0WipaPYRr6FYvPY+RbeBbJ2oW4ZC81
 oLBxEHK68NA7l8U9rokG39UBfaB+5tmQ0JqjnabHGbN6EyBPcmVpicc83DJIWhsdmhUM
 JU8QVYFPRqaZ0hz9a05BwWaom2ud2SBz10Ugm12PvBOlNa01Oq0JRowTfaVY5qfFdtrG
 zrIA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+rBuMKCjNWI/ppsRqVmmgRFzw29bKQWWCqSMwLVhZ4RPgykr8PcMgo0sE350RZqbBPK6aXlNpogxMoeQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw0Ljr0aKZERCVfBr+4fD+dFNjGg8NPy4mGTUlsc6+6+Qtv+bwY
 mWVzAzJmPK9BwyFLCGVg73CLopusgQ/ycYj1MgJLiueiloAERI5U0gIzE35Mmu2dXQto76WGVHJ
 /ykNOsf9PIVpREfckrD/j0+uRsAtW/pMeioAf/0h2eKy41D56aSS+Usd9DD3XeEeGqVsUG8oV2e
 O/Cjdf3Z0=
X-Gm-Gg: Acq92OG2zeBlbCLgnWnWR1DC/Yh1qor+eiTogK5Eri9H0/wc0knTVWGz4AYyUKL0K/a
 tyUFCvRpdiemd5VqD+T6dTBg8qm7bPlAx05i437kbpQXetEDPMe9HfHK8Hjj+0C091Mwy6tZ+Dc
 BgmBHfnc2dFPRmiwT9KHQeJCHCyxCFkJefw7KPKzV4qv7IPDF76vXyRyh/xvIUZIOOY9oo2DKd3
 WNO6CB86w61BD5jY5haRVWjObN/e/yMbDHOgRhg0kbryrqSVXqBjHzPDPhvwSDM1bdWGdyZK1JS
 JV9c63lchDaYeCsfBz9AQDUnlT5p15TPcC+yXkv86gwE/fYuBgAgFLp1BYwpCZOgz371KOl3+OF
 wzqggLdnPYrDXLrvoe/iAshlJfYxUbz5EyV/tYAq0CN+R4g==
X-Received: by 2002:a17:902:e545:b0:2bc:7c62:187 with SMTP id
 d9443c01a7336-2bd276e6e53mr46132305ad.29.1778686075615; 
 Wed, 13 May 2026 08:27:55 -0700 (PDT)
X-Received: by 2002:a17:902:e545:b0:2bc:7c62:187 with SMTP id
 d9443c01a7336-2bd276e6e53mr46131805ad.29.1778686074996; 
 Wed, 13 May 2026 08:27:54 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1eafa62sm185042375ad.74.2026.05.13.08.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 08:27:54 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:57:36 +0530
MIME-Version: 1.0
Message-Id: <20260513-eliza_mm_cc_v2-v4-1-e61b5434e8d9@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: AA-MQQO1CintXtAYX-usycWFDIDOvkAe
X-Proofpoint-GUID: AA-MQQO1CintXtAYX-usycWFDIDOvkAe
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a04987c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=YkJq1ijSw-fIvXJVljYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfX2UqihMeNy36A
 G12RqlKgB97LxmdZLTMoa14GUEJahHQ73PfPglMpKfq3Pg17hV0rQdmj1R1uTreBEE1VXel56LW
 wnZXJEXHd0bnx0iiwPbYZ7fg4Pb56jj/XJcZ3ZQLDZlCFLRUvoC0aHgbZZFYmd1JlJhu/rftKIy
 ZFnIg7KYqsersgu3W7Dvs/Y2k6OihTd+czPuPzRkH6lxKmPAOHkkT/0sOhAZLVGjB7+e4ZBibos
 ZuoqBB3hec7k4W+yETavSmQHhJB+3M/T5LgsJRw0e6QvkYonnYA0KbMN8Z18oIDKmhw39rvTyom
 cBiCULkmBgqtp37P6vGyGiQhdTs2RcwV11H3MU+2ThxNlS7RyiAaWRNn3zZ7eI4dBO5o7nghTD5
 afOTKnohmd7zLpCbxsGlEzutHDbpFc0PSx4MIaghq3VrM09e9PguyexJkPlLisfEjjZBsKy4k7q
 sOiuwhgfIcQcO+plcQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130158
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 1/7] dt-bindings: clock: qcom: Add video
 clock controller on Qualcomm Eliza SoC
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
X-Rspamd-Queue-Id: 6423053615A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:luca.weiss@fairphone.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	NEURAL_HAM(-0.00)[-0.898];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,qualcomm.com:email,stormreply.com:email,stormreply.com:url,oss.qualcomm.com:mid,fairphone.com:email]
X-Rspamd-Action: no action

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         |  9 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..6e3e4424af78a93f6366378a66f2944a3bfdccee 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Video Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-videocc.h
+    include/dt-bindings/clock/qcom,milos-videocc.h
 
 properties:
   compatible:
-    const: qcom,milos-videocc
+    enum:
+      - qcom,eliza-videocc
+      - qcom,milos-videocc
 
   clocks:
     items:
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
