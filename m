Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5247EC8648F
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Nov 2025 18:45:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20674C60469;
	Tue, 25 Nov 2025 17:45:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BD87C60468
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 17:45:57 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP9woIt2659967
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 25 Nov 2025 17:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wP/vvk3lUXdjw5vi7R1d8wE1w7srUpPc+OYdTaV4T5E=; b=DJXWduiPSDXR7ynv
 HVo691m8duNKs9fvc/l1LfBiOYyKG2i3+2h00JgjaT82AtqXmsJi2El1/PCnn9/B
 EJ22/lDV+BUxg34l/0LERYclYreJRLtktgmGpcGxSWzWPULDpwthffo8eiMNzKUd
 UJrxdf4sqHwvWhfiqig4DazqMqu1akyKO1ZvN+TPrb/DXneKlHKexVj6y2oJAliJ
 LajB1iVZflA0/TXKnweMbbJzvyJCuxtvM4CvL/QUiWPnZYLh6i2LhDp7sVNLkv0H
 1KiuJz9XF5osdqdHcxygoiY6Lce6vuUSThwchW32vzINsZeg0kieBEQAgMsHKZuF
 sLmR2g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ana9x9c87-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 17:45:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-29845b18d1aso115389735ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 09:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764092755; x=1764697555;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wP/vvk3lUXdjw5vi7R1d8wE1w7srUpPc+OYdTaV4T5E=;
 b=hYj/80Dqs0U1BAOUWm8Ec6QWTlcnEHItrUuxbSQjgQo0msnCsCuTXq2/lscMu0iRMR
 fV9nvGE+izpfM8eIjBGvc4QW6B6v06R1PKL5MlM6Z0JIsDRD8ufIETunRr2jEY4BW4Lq
 Q4/EYL1eoNCMa3Buui092z5tf+liy1TQlf+YRWAV6qfZiORpp825p1KuDtoEzIxqvfKc
 tozXJGC4YMzpVLt9rw/UtyCOJd2se6iWBxn351He+NzBlzMy4G7Ip+wYt3nRqCyFX4hS
 JUiRS+8E3GVegjcje2VfTMc1qWRva2iZdAuhYPYxci4i6MB2/eqEY9Zd4Kce+w/13TGg
 HaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764092755; x=1764697555;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wP/vvk3lUXdjw5vi7R1d8wE1w7srUpPc+OYdTaV4T5E=;
 b=ihc3QyHqPxSxbw/VRcI/k+uHjdsJO7RiYQFdMqXgO7CM02mKMAgKaE5oDJ6NOaDH9N
 dGMyzQzaD6O14/rEwvw1r0qOn0b9pPOAN4BQLIceremHMBWOkO8y2JW9TLvXXsUcx/65
 p+W4BcwE+Wn8nCh5RcaOslq6WJiB/DxT73MMRHHWElfDu1CAcNjDHvy7Zk9g+Dq5pYDw
 vYS7grJQm3fk0F+mNQsxzUMw7o0MlaEkDhnxJpsn25eoCrFYKtP1Edgv+8b1yMlYUQLD
 UOSb2EZNn3J0xn28fZsYK6fArzATwaAy0kKstKHhl6w6E0S3sG+TS6jolgCMqKELhMXf
 wf8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6d0BkISjp4QFh4/lM5IB82bcA8GP5bPqNlTlKlhMktBPde528i4688A/vNoKIigk8xAr/bSmy8DGMtg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxfk4q687JJeqi4FC2M6GndB3mKxWD67Q2YuzCjbRH0FSRqHFba
 Sa1s9gSTCbB+AFrcFzaRtNlUhIEHelf7pLmz1bALMf58Un9e3J6AkV/gbOsqtInX14fHftgpGHD
 tr98YHQGxsp4qfeqJgylIwGGAPG77PRn1D97rfo2e3EBkHBygK2WXPbyqf5QKclIGzZ/ZyGTdnV
 em+0UAz7o=
X-Gm-Gg: ASbGncsXoez19H/ksawSYYed+Z3YBzxM/f2rynKimtbk4c5JG3WEHnyxe6hLqbmdyDa
 FJi4DlzozNHBhCch64n+qAnyhfx8RIHf3ju7FFuGTs9oGqrVbOfIYafBjPtVXVyTgXeFpFIdgxr
 InMPGMWKXotACmyyCnHOP3XhDGnNF7DRTHG2bwZrQkUNoeel4t2dsFjcqjH2e3vGoXmjpNjbfS8
 cuNheiexmuLdPXa3apLI6Smh3wl3FyiI5msP5RUJYWT7+Z/W3OTsrtn7g04iTGAiK3rIywzxP2r
 x/8z+Vt2mHL7hHkYp9k3vyWRqE+ffxlgIT9RQvO/Ln2vKFAa3Oi9x8KySFZG1jOVcdduVNCHfzp
 gaXszrpufobMBO9emDvU=
X-Received: by 2002:a17:902:ef4c:b0:297:d741:d28a with SMTP id
 d9443c01a7336-29b6c574f8amr206080025ad.31.1764092754835; 
 Tue, 25 Nov 2025 09:45:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwJZMMyo1SFMKpvCp2G/Hy+xMfLcavH9qYGLQ44GZs6IFwcpYbW9pwkwE7FsldFaUtuMcvbg==
X-Received: by 2002:a17:902:ef4c:b0:297:d741:d28a with SMTP id
 d9443c01a7336-29b6c574f8amr206079725ad.31.1764092754302; 
 Tue, 25 Nov 2025 09:45:54 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 09:45:53 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:15:13 +0530
MIME-Version: 1.0
Message-Id: <20251125-kaanapali-mmcc-v2-v2-4-fb44e78f300b@oss.qualcomm.com>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
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
X-Proofpoint-GUID: NFqjAbZVnr73U9prarsE_BdDfwGlFj68
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0OCBTYWx0ZWRfX8cFbNP2CToHf
 YqQthq8YOzfk1GZAc+TVltlMyhnmJe4LESybmGulUxg0EMZ25B5SML7E8q93QIjC7s80V1WzJf9
 GGLjyfEG5YjedpWmQriRvISB6rL50wz2/Nt6FuY3JlID9T/zmqhDeP0j6MHDKTrGCpF6VClgDRq
 LIEsO165jYbG6dReYt/kbSOoy+bsO5gud768rm2O4ePxVvONYM4xUzNDc3OwS7Wh0aFMpjHgUTq
 8dFLaTo4N9T/vg1WSRB09l9xJn9cS4OOt6/qdxyrBUqTPPb03Jh9ARwgcBWlrJN9j6+wzsAmdQ0
 wKEfS03bHhd+U92qAOcH/9d7fBFxEq06vdKuM4eeqOpJhV5JHiDGaU2Ys2i2vBhwkiveNGmKiA3
 YWTCidlDGldzBRP2ghet59l+BFRflg==
X-Authority-Analysis: v=2.4 cv=Sfj6t/Ru c=1 sm=1 tr=0 ts=6925eb53 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=WNRVERoI0TQAr2DJ1tsA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: NFqjAbZVnr73U9prarsE_BdDfwGlFj68
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250148
Cc: devicetree@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 04/11] dt-bindings: clock: qcom: document
 Kaanapali DISPCC clock controller
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

Document device tree bindings for display clock controller for
Qualcomm Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |   2 +
 include/dt-bindings/clock/qcom,kaanapali-dispcc.h  | 109 +++++++++++++++++++++
 2 files changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
index 30e4b46315752b93754ab2f946c684e13b06ab93..591ce91b8d54dd6f78a66d029882bcd94b53beda 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on SM8550, SM8650, SM8750 and few other platforms.
 
   See also:
+  - include/dt-bindings/clock/qcom,kaanapali-dispcc.h
   - include/dt-bindings/clock/qcom,sm8550-dispcc.h
   - include/dt-bindings/clock/qcom,sm8650-dispcc.h
   - include/dt-bindings/clock/qcom,sm8750-dispcc.h
@@ -23,6 +24,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,kaanapali-dispcc
       - qcom,sar2130p-dispcc
       - qcom,sm8550-dispcc
       - qcom,sm8650-dispcc
diff --git a/include/dt-bindings/clock/qcom,kaanapali-dispcc.h b/include/dt-bindings/clock/qcom,kaanapali-dispcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..05146f9dfe077a0841c253b7fc0b6e76347f8e3a
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kaanapali-dispcc.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_KAANAPALI_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_KAANAPALI_H
+
+/* DISP_CC clocks */
+#define DISP_CC_ESYNC0_CLK					0
+#define DISP_CC_ESYNC0_CLK_SRC					1
+#define DISP_CC_ESYNC1_CLK					2
+#define DISP_CC_ESYNC1_CLK_SRC					3
+#define DISP_CC_MDSS_ACCU_SHIFT_CLK				4
+#define DISP_CC_MDSS_AHB1_CLK					5
+#define DISP_CC_MDSS_AHB_CLK					6
+#define DISP_CC_MDSS_AHB_CLK_SRC				7
+#define DISP_CC_MDSS_AHB_SWI_CLK				8
+#define DISP_CC_MDSS_AHB_SWI_DIV_CLK_SRC			9
+#define DISP_CC_MDSS_BYTE0_CLK					10
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				11
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				12
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				13
+#define DISP_CC_MDSS_BYTE1_CLK					14
+#define DISP_CC_MDSS_BYTE1_CLK_SRC				15
+#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC				16
+#define DISP_CC_MDSS_BYTE1_INTF_CLK				17
+#define DISP_CC_MDSS_DPTX0_AUX_CLK				18
+#define DISP_CC_MDSS_DPTX0_AUX_CLK_SRC				19
+#define DISP_CC_MDSS_DPTX0_CRYPTO_CLK				20
+#define DISP_CC_MDSS_DPTX0_LINK_CLK				21
+#define DISP_CC_MDSS_DPTX0_LINK_CLK_SRC				22
+#define DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC			23
+#define DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			24
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK				25
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			26
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK				27
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			28
+#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK		29
+#define DISP_CC_MDSS_DPTX1_AUX_CLK				30
+#define DISP_CC_MDSS_DPTX1_AUX_CLK_SRC				31
+#define DISP_CC_MDSS_DPTX1_CRYPTO_CLK				32
+#define DISP_CC_MDSS_DPTX1_LINK_CLK				33
+#define DISP_CC_MDSS_DPTX1_LINK_CLK_SRC				34
+#define DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC			35
+#define DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			36
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK				37
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			38
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK				39
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			40
+#define DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK		41
+#define DISP_CC_MDSS_DPTX2_AUX_CLK				42
+#define DISP_CC_MDSS_DPTX2_AUX_CLK_SRC				43
+#define DISP_CC_MDSS_DPTX2_CRYPTO_CLK				44
+#define DISP_CC_MDSS_DPTX2_LINK_CLK				45
+#define DISP_CC_MDSS_DPTX2_LINK_CLK_SRC				46
+#define DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC			47
+#define DISP_CC_MDSS_DPTX2_LINK_INTF_CLK			48
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK				49
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC			50
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK				51
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC			52
+#define DISP_CC_MDSS_DPTX3_AUX_CLK				53
+#define DISP_CC_MDSS_DPTX3_AUX_CLK_SRC				54
+#define DISP_CC_MDSS_DPTX3_CRYPTO_CLK				55
+#define DISP_CC_MDSS_DPTX3_LINK_CLK				56
+#define DISP_CC_MDSS_DPTX3_LINK_CLK_SRC				57
+#define DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC			58
+#define DISP_CC_MDSS_DPTX3_LINK_INTF_CLK			59
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK				60
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC			61
+#define DISP_CC_MDSS_ESC0_CLK					62
+#define DISP_CC_MDSS_ESC0_CLK_SRC				63
+#define DISP_CC_MDSS_ESC1_CLK					64
+#define DISP_CC_MDSS_ESC1_CLK_SRC				65
+#define DISP_CC_MDSS_MDP1_CLK					66
+#define DISP_CC_MDSS_MDP_CLK					67
+#define DISP_CC_MDSS_MDP_CLK_SRC				68
+#define DISP_CC_MDSS_MDP_LUT1_CLK				69
+#define DISP_CC_MDSS_MDP_LUT_CLK				70
+#define DISP_CC_MDSS_MDP_SS_IP_CLK				71
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				72
+#define DISP_CC_MDSS_PCLK0_CLK					73
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				74
+#define DISP_CC_MDSS_PCLK1_CLK					75
+#define DISP_CC_MDSS_PCLK1_CLK_SRC				76
+#define DISP_CC_MDSS_PCLK2_CLK					77
+#define DISP_CC_MDSS_PCLK2_CLK_SRC				78
+#define DISP_CC_MDSS_VSYNC1_CLK					79
+#define DISP_CC_MDSS_VSYNC_CLK					80
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				81
+#define DISP_CC_OSC_CLK						82
+#define DISP_CC_OSC_CLK_SRC					83
+#define DISP_CC_PLL0						84
+#define DISP_CC_PLL1						85
+#define DISP_CC_PLL2						86
+#define DISP_CC_SLEEP_CLK					87
+#define DISP_CC_XO_CLK						88
+
+/* DISP_CC power domains */
+#define DISP_CC_MDSS_CORE_GDSC					0
+#define DISP_CC_MDSS_CORE_INT2_GDSC				1
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_CORE_INT2_BCR				1
+#define DISP_CC_MDSS_RSCC_BCR					2
+
+#endif

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
