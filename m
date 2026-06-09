Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gqRZOEUrKGrW/QIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 17:03:33 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0EF6617BF
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 17:03:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=P1k7XNYv;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=NFJEOryJ;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4758C8F292;
	Tue,  9 Jun 2026 15:03:26 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 298D9C8F290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2026 15:03:25 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659CnLJh2668531
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 9 Jun 2026 15:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=; b=P1k7XNYvWkjAlAtm
 n4ayrXTq4wktwI9mgcGcvab+oAlzTpu82qdlvu+oqB2rbm5fKbOKUJ96ylfkKjbM
 ChUEQHmQCb5NNKixFLdOKUBiFRAyQ2zH9NT+m2J3lyfxMAmIFEAi61+XylEodkzu
 sz1pSHctu9SQcT0eJoZljjhFYh1VrQk3zWbC1JKWoA2qjE8A5Eau8oGsRP7gdEXR
 OalDIBkqZo5lfyDdjBh0wfyaRMtYiMJ6sg8oiH4OUYlWBj37H3OaBB60fGYmD7xe
 +XohJakXa6CRYlrDUMjPOdnQkZZKSlA0b1kEbAeUON/AIAv+zEyQiZuNE1UT5jcP
 C+hzCw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25t65d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jun 2026 15:03:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-8422382178bso3803477b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jun 2026 08:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781017403; x=1781622203;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
 b=NFJEOryJ9SKbhMw9yUDdIto9UF+6tWPRv3QIUgMPncyjl8T3VwUo2XNyEusnaj0t42
 V5oCI0hjmrbzqM9iwZhGwKXd87qiACfboILsn6fj6fMuXJvRBN1W7AZA0wuxJO8rL0o5
 GuF/klp6A5G1DBILjtWmMm8EvkvG5e7AcGQYtDNrNZqLgUhLL8GWdEczKCZoJWZCmv89
 cfqY6VLYdB+2LR1v9EEXmaBdZX6d+RmmOfWlrn4A7XeARXrVa4jPO/jG5H5xNwCq89bB
 TCRj2LgkVtTcis3wEb1QqZx7Bfpc5KpTkQXiqz4uv6w+r4CkTsXilK6fW8+YrF0oQOAY
 b5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781017403; x=1781622203;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
 b=IPID3Lv1DV8B4MzV2UNiYxHK4w+C9BUAVBnphEZLHy7ZjPBrfCO/Pgpp11FByfAZg9
 J1sGHqKjbcpfM2hvfHK7iio5vBZYJzl4pHKjxs1gRDjAJom2L0VCk4+0K1EEsleKrj1e
 h224Rqids2OZ3u7CA2ay2r1SILDgzrnH6nyeAdm/U5xBwuzIBzCW0jHVJzFBByeCfUDu
 fr8hh/xZJFljX9KscxbT/GoFYnCvNv7JzR7qe4DKgb/bTRBnMxQILLfXRaTtaTPnYfB+
 ld2fSW/Ni1WxVESR2GUOgZMyLS2lx6b+nyh+Ppk2vlWFrUc4BbA8rKt05xyrXOhPp/Qx
 2+gw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/vbqBUzJ1KwV2bYTXyawsaJzjoatFY1z8bfpyyS+Bp0Mg1LQR3Az7udmV6xKF/cvjt7tqSOz8vivjZTQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwUbB0esdik275TBdBJ0T6ksVF4lqg3axV9VNgeaHTJJu0zoCxz
 SrfnObbr4z9M7O658/REst+8M9ZgLTlIzNNG1/DOd3MRedGEgcosDTXwgbBjUKJIDem/RssVLXa
 0UYx4x+UlVCUVwg2X5snE/957XgMH5Kat/rWtylCaiGrEYpQKqWb5B1YMmoOFbNWFQ55j1iwTvg
 oPVvkuUXw=
X-Gm-Gg: Acq92OFsS77PqrqroQJoo2Ugec6zKY7tptIcBwucQ9jMzZGvr4K3lnB16J4vAh9RPDB
 o3DEYs/5tjy9NqZTxM3R8Z5Oc+Uau1xUDJCZkY7do3EbX8L4an0FeWStrMMWdliwFcB9LVmheNz
 HxMsMxRSn+aQ6Rs7LSfl9ntBOp8bZFauhL/L8qMwyKFLZALy03HfDpd+djY/sgE1eQ1qbYe/tqT
 30xlEJHmSopBUUJqXfalO+6L7MglH7547V2s4Wid2I99Y7YTPYan3mQZYo7wgyyaKd89yBGzgd6
 QHV0gLb94fJDex4wwf+8027iz1XNvOPi1S3UVb0wKcezdKBj2oyf6WFhJPNrUWQ8FbRJQkGzSN3
 WPfyCrWlcitwjHRqjDmS7vhNdBG+V0kj5FCuZnynn2l2pg4ZNU+m73kh+
X-Received: by 2002:a05:6a00:4216:b0:835:41f3:f440 with SMTP id
 d2e1a72fcca58-842b0e5d0ecmr22209066b3a.14.1781017402839; 
 Tue, 09 Jun 2026 08:03:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:4216:b0:835:41f3:f440 with SMTP id
 d2e1a72fcca58-842b0e5d0ecmr22208978b3a.14.1781017402222; 
 Tue, 09 Jun 2026 08:03:22 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-842828d6bd1sm26987659b3a.44.2026.06.09.08.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 08:03:21 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 20:32:53 +0530
MIME-Version: 1.0
Message-Id: <20260609-b4-eliza_mm_cc_v6-v6-2-17df09e5940c@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: _EjpqdO_QUK9iPBrzv3jMLmiqGtvjImG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MyBTYWx0ZWRfX5GL2xqndnoaB
 rMOlqnQx+9ljUxqIE11gRwcRCfKLjB0NimjtdeHcZkYAi1d197H00H56m/iThwwD2Ge6DWryq2V
 2v51q5RB60YzinZSIxNL7T0JLQ16TRGQChtacg7PN9HxWSbLV5aOAgCejbxIzJEnJlaVOIIwhO6
 8ma2NwJgK2Ow2ghEs8Vc8lIIP/kf3jmW3tUcMSu9LOMV3/hJevIoUxMZKbIrtI1p7pbDDKSRkg7
 9cgcOn/ZhHuQwSKFvOo/5H++YC/SM9RF+qeuMbzMHnevJqcmYk4/TW+zCBbf9TAk8upGuWx4PXq
 yzaPmFluY96dhQN3rpFXdaiiCUDBX3QixqmQvHoWB7cDUEJF9EOMkGDK0IQKdigRHhpQewvnDLC
 Dns162PsIPbFmF/fMCNoWSxVgqyOcHgxHi2/uu8h17L5fvQzOpyloL/wZ5WNl9L9dUGlB7m9rsw
 Jdb1sohXfuKpLnTLoOw==
X-Proofpoint-GUID: _EjpqdO_QUK9iPBrzv3jMLmiqGtvjImG
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a282b3b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090143
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 2/7] dt-bindings: clock: qcom: document the
 Eliza GPU Clock Controller
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	ASN_FAIL(0.00)[89.6.209.52.asn.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E0EF6617BF

Add bindings documentation for the Eliza Graphics Clock Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 51 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index fdbdf605ee695637512ce4f98c9b6fcfacb9154f..734bab762a30800bda94c726f48013679f9ec542 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also:
+    include/dt-bindings/clock/qcom,eliza-gpucc.h
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
@@ -30,6 +31,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-gpucc
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
@@ -71,6 +73,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-gpucc
               - qcom,sm8750-gpucc
     then:
       required:
diff --git a/include/dt-bindings/clock/qcom,eliza-gpucc.h b/include/dt-bindings/clock/qcom,eliza-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..c3d9b7827325c5b8db696d1d95b4876e17c01c83
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gpucc.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CRC_AHB_CLK					1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_FF_CLK					3
+#define GPU_CC_CX_GMU_CLK					4
+#define GPU_CC_CXO_AON_CLK					5
+#define GPU_CC_CXO_CLK						6
+#define GPU_CC_DEMET_CLK					7
+#define GPU_CC_DEMET_DIV_CLK_SRC				8
+#define GPU_CC_FF_CLK_SRC					9
+#define GPU_CC_FREQ_MEASURE_CLK					10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				12
+#define GPU_CC_HUB_AON_CLK					13
+#define GPU_CC_HUB_CLK_SRC					14
+#define GPU_CC_HUB_CX_INT_CLK					15
+#define GPU_CC_MEMNOC_GFX_CLK					16
+#define GPU_CC_MND1X_0_GFX3D_CLK				17
+#define GPU_CC_MND1X_1_GFX3D_CLK				18
+#define GPU_CC_PLL0						19
+#define GPU_CC_PLL1						20
+#define GPU_CC_SLEEP_CLK					21
+#define GPU_CC_XO_CLK_SRC					22
+#define GPU_CC_XO_DIV_CLK_SRC					23
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_GX_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_ACD_BCR						0
+#define GPU_CC_CB_BCR						1
+#define GPU_CC_CX_BCR						2
+#define GPU_CC_FAST_HUB_BCR					3
+#define GPU_CC_FF_BCR						4
+#define GPU_CC_GFX3D_AON_BCR					5
+#define GPU_CC_GMU_BCR						6
+#define GPU_CC_GX_BCR						7
+#define GPU_CC_RBCPR_BCR					8
+#define GPU_CC_XO_BCR						9
+
+#endif

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
