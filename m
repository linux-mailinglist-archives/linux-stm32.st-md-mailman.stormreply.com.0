Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIUfBubr12nnUggAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Apr 2026 20:11:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2743CE7EE
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Apr 2026 20:11:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29B0AC87EC6;
	Thu,  9 Apr 2026 18:11:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11E1BC87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Apr 2026 18:11:46 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 639CexTJ2866425
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 9 Apr 2026 18:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 t2hSeCqy3196ZrPyXqAGFPnwN9LeRm2Fe9O2th3jhQA=; b=PAgb7lkp52h2aYe7
 X/q/AUNoT8wFXcENwF2xkHMQdpolfuJRSn3wDifsClUkQSrrf/zlY8GzlBWXEd6C
 7SvU3SDb5KzHJPPb83l5BBzoh9n0peh9a6bL5IjpU4fo0SthbVvtKQfL1fehBYva
 H/M9mnm0jSNxjxaV9U4U15b/3mwzoOByXOQe1IbfZSX9KtNupF6qYNymkSzHBeA7
 +7bkSGm/7xnnft1jUn6clpeEMxdJu59BOhyMwUyFCJwNHe7VN4PZCWYUnxl0XOPq
 Quzs9LMgIs1X1jYeFD59B4dLMq31tO3oF7cMpX/ltWeGczFMSxw4O+gbQZFFr1q4
 lGHE7Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decayha5a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Apr 2026 18:11:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-35da4795b3cso2613432a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Apr 2026 11:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1775758305; x=1776363105;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=t2hSeCqy3196ZrPyXqAGFPnwN9LeRm2Fe9O2th3jhQA=;
 b=jyI05R1DBdewvDKxCSyKjKg86rODXtKykEyBb/98yyIcrdLxcJzkaT9g+8cMaAjI6P
 FurCZ4IXREenkdtsCLoXz622JUA/N6xy3EU8hKauXngjzRz9V5PCYrauYFyE8+z2Aonp
 Z+22qrONEq3UYTjW0vQUdGNQPGe1FLbu0cPHlcKVNrk1knfh1hUcC5eQDyEJ7Z18GyYw
 FF07t3K7m7v9j7z8BhtdSteQqVOs4nZA1XvfKsBk35x1CnVD48X81SD4Fq+mnFp3QHmL
 hAKLDLHq4LoKcsJWmxR5m69+CvQTsqvjzPkBmki6AMRVmhcMOCX5SXhLeM3yGCTeUPhU
 ygww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775758305; x=1776363105;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=t2hSeCqy3196ZrPyXqAGFPnwN9LeRm2Fe9O2th3jhQA=;
 b=KRhYJCkg0F49jpWEa0OEjnw7wHBMS2zIwtqPYAkoJc44GWbMIy0tIOhFWDWEyDJrgT
 xePh1sM3gOJ75VeIbjLa/TNZJmcj8dyd/8+lc0m/UUqIjciVJyXibHpKqJVN+6jOvlZI
 z3pnDuk2O1rjbS33MB4Unz4ETqTaXEYPjx5w03xsA/qypNyfw/29YKF7nEgo2katRU3P
 XNX5l/GCAwXL/e8n8+TpUuieKYrWQ0Ug5o96+n06ADJ823QgqaZxo/58DKZUMPa2GGdS
 dkNyqF5DoCYn3znJyNE/t+Qmb4hB5LgJNCDFPfllrVWYvXYyaoRb+Qgtv7id/gc69L7V
 H3Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTZo9YTRlgJPtC+4ummnB0XwNW+7Oo/e2ucFTXVT72MZMgVB1Ajuus7+O1c4FHDM1IKPovGaWU74oIWw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzuLjJaENIDOYGcnYOOiUAYaHR9fWZ3g9cMaD8jeXfoU/u0pva8
 2WWruWGalGvc50ZxHZ5Tpt4zdWRsC6enRvWNFks4+NMVtpgfIBE+7t6Vbx66/0Ul4RHslKxc6YN
 SQ8mEjjt5Ls+Cc/jKS4ytxm/J3lqXm1nLztYFQG/seJuCRW2mc/8e3Hj9VFteTaHpt08Gt1XD5C
 Fk3sFkrH0=
X-Gm-Gg: AeBDies/DlWT1vAwjeRp1CmkYA1v3ZeH11PyhWhVYB9kfId/rzsR4JMhNVgi0Hz4bM+
 ndAjHXnZmG7Mv/ugQ6KepTj/Ul8D23oDr6mjkiO9Tat34wAwxyBFiHngYoXkrpuyM4cncMlGmmx
 mBFHGvgj9GxxW6kzGPR1EZI4kiIaE4OdSoWdACAM/4GZvy9XCwV8oeYxgwvZ8zPYCKqYd3wDfCL
 4W2tvO5A7UCCk6SOpxlmIH3GqPycf8Xf+do/wz33EJGDyVMwI23nVRrNUyJXpujFNwseba5GzVJ
 59lTTVdoVH/Q82C03nZNeAqkdvXc4khzrmWVnW2KQzpdmjZZgNpbTXKtS/RRFufSojlaXOfXQCl
 Pa83VwDJmgmWh5zXrfM6tchjgnc7rgf/Yp7xe/7oQDXWONg==
X-Received: by 2002:a05:6a21:32a4:b0:39c:4e62:b838 with SMTP id
 adf61e73a8af0-39f2edf5056mr31142008637.17.1775758304820; 
 Thu, 09 Apr 2026 11:11:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a4:b0:39c:4e62:b838 with SMTP id
 adf61e73a8af0-39f2edf5056mr31141967637.17.1775758304218; 
 Thu, 09 Apr 2026 11:11:44 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 11:11:43 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 23:40:48 +0530
MIME-Version: 1.0
Message-Id: <20260409-eliza_mm_cc_v2-v2-7-bc0c6dd77bc5@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d7ebe1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2e1B0ptGhY38lJQULHwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfX1HXtpSdIZYzU
 eiH/RkN8qTuPfSLYYGELByY2jAs74bcfCyRe4Be141MfNyHaiWMJpcSJ4WaFKDyEogodiq+24G8
 QjF5GQeqy9x2oMhJqbZfqRcWzjmJ7WXpUG2yhqgNIqPUavygsZFu96YSNY8X3sjXOggvO6xeIsD
 F8iuWBsWymV9iYIMs2d5WN7jsUNdqCzm12Mw446ixyZ+iM+aLVfcqNIwX69z2kWHIIvEwY7nYAy
 QhRYicp0Wy+NOuBqLYg6ZwsmhG+REQSpaFpTfaqWWYNC/aELW0s4i9FeD3AlPGlgxPQJv3DYfxA
 b35aTxVS+fC8CNtNWGOjpl7732F4a7Q8PNPKC+MnAWNH0UVNIwdOymyzknu1Em2dyY35+V8nxMp
 j3qq6KxOmMBoyXv7R92XIeWh9tx/hYjCa6hyuJCEoD4PJF3vgNxwPgB+Kl7KBTzXRCQTKH3HVN1
 bc5ZIK0Ap/oUfoka/kQ==
X-Proofpoint-GUID: oMViSL5DT8P5dnHd6oclimQ-EAld_AyL
X-Proofpoint-ORIG-GUID: oMViSL5DT8P5dnHd6oclimQ-EAld_AyL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 7/8] arm64: defconfig: Enable clock
 controllers on Qualcomm Eliza SoC
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
	NEURAL_SPAM(0.00)[0.017];
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
X-Rspamd-Queue-Id: AB2743CE7EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the video, camera and gpu clock controllers for their respective
functionalities on the Qualcomm Eliza MTP board.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29bf631d517c38486f6896ffd82dcc9..130e8716e67d69c54cde3f66db09b352f736feaf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1475,9 +1475,12 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_ELIZA_CAMCC=m
 CONFIG_CLK_ELIZA_DISPCC=m
 CONFIG_CLK_ELIZA_GCC=y
+CONFIG_CLK_ELIZA_GPUCC=m
 CONFIG_CLK_ELIZA_TCSRCC=m
+CONFIG_CLK_ELIZA_VIDEOCC=m
 CONFIG_CLK_GLYMUR_DISPCC=m
 CONFIG_CLK_GLYMUR_GCC=y
 CONFIG_CLK_GLYMUR_TCSRCC=m

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
