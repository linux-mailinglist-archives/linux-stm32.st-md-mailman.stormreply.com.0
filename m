Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLceIJcuemlq3wEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 16:43:19 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB1CA4497
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 16:43:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CCD1C56612;
	Wed, 28 Jan 2026 15:43:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 140EAC56603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 15:43:16 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60SFecNv590974
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 28 Jan 2026 15:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=z3yfVqchQWMJHTTJ91dDeCW7/cxzdTD+XvS
 cNCLq/go=; b=pI5MwmJIgCsNpLQMgIKMm77mkOWsaYQ8K1qX8GIeyLq7rkfQ8lp
 WC2zilQEJ8qk07yht+8SPVwfGZSt54mO0wC9cc7nPbR+Jy9FJtgrCTA06CdiYyLU
 lozTWufwmQBAatB9iXrXZBMkIdJI2xQ4RZPakz9i2izUURmKOmP3X2yawMkALrVd
 YGCec5XpK9Wk5QuK9o+t3Tk/Cft092gofZptDFguVgkabJnPxysFaNocv9r1mJYl
 Xyg2NP23edokFNyxLAYu4FPi2UHimGlLf0yv1BlnwM4tEutYWpE2q62tme1Wfpnd
 lObeRG77Sdi5XW2FzKzUnxXtHEAUxTuascA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byna7g0d1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 15:43:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c71500f274so620385a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 07:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769614995; x=1770219795;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z3yfVqchQWMJHTTJ91dDeCW7/cxzdTD+XvScNCLq/go=;
 b=g3gnsLf8J9U0cCsGGE1BnMGK91r2yczQz6igN32RqILi72BmbY5L6xYF6HVbD4lIq1
 p/5u61QRKHEWctiDHGvA1vv6kFBzvrkgR5CcVScKIlIVzGSBHylPA+nRne8+bpbKjS5X
 /SA5F5IhAkZLaSdPsgXzwsosFnfNyZExDOjKaFswgvsHFkF7qtLkZgKBQRxcWC0ET5RE
 CcJQlOUvqMf7K3xUox/rAvc+a4RMiD4U9F8pe6LFz7tFIDnYaalZ1GRPCq1uWl97CJbM
 PhWYmEwMo7+BKVRrwSKC0i0/nQ/77MK8ahKcyNM4EhMH/QFP8TQjv+Og6Tk1DcX19HrO
 /JNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769614995; x=1770219795;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z3yfVqchQWMJHTTJ91dDeCW7/cxzdTD+XvScNCLq/go=;
 b=Bnsl6ShuZr94ndJFmiE7qq0Fyp8VNxti+irXQbYLNpIzvzsixfBaKSOEwFf2PyDh4g
 1bFLK1/TIRgsBS96HPISAY232A4qx8hgkuHfqPfHjOp2/eD2V41ZQvB24OdWuALVoSIR
 /KsZXG4Ow2T5z3SQnYgJfwpF+E0QnmQ3quJNbdKSPy419C6D0xYqMakQ6rpYw30+KaKE
 fb/GkBVgeUkkg5q5HZx4apZlp28wH1545iJAggzsov/Sv3kqGs5QzQ1XxrT02ecOMMHO
 I6o3enpUxlYr2OerOnS7f5oPEBjfjaIk3gH3OLFamRnPvfU8LKXQFmYtwukB55An5gZC
 oWTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3BO7Cn/Qw71S38FzERVH4ZO0t/vUN77gB6dlDMH+4cfmaDgwae7dNESOJzVhlVAl+SbQboHY/RZR0TQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxtouBEhaJeJL/A3dP++OW2lANSHzwr/4kTR2UZ0xf8EGl7zPJo
 YmQHFMye965XXo/lF01Nj7cZsiWerLZqBK3oQXYbPbuULtgVGIEPtAuFgHYCkUOYM3ATMktD6RD
 eNDXkD8ARlS9zBxpgge97M0RTqpYsAWtTKYE57nfzr6Jp0Ejyla7A7DNPBoQTHf/ShzsHz3V2ev
 wrf2J3Lx4=
X-Gm-Gg: AZuq6aKoDjvNuJBUR6rEWzNPt/88o+8gdmrFJ+Jgrqq2fO8KgoF0MA8mf4W9niU22ST
 PW/WISJSzTPR0ELBr3yLyIhbAcTqhSvuaGiDwzgFwRimmWmhEfPxpiDZqRAWYd2oydwqiclCQY7
 /17Zi5+phMHy3GNi5VuCrbDFsyyzky/qidGP4Cz/jwFYwlANXki+SCvamKxcVMIL/a6EwAvgXH5
 CDXCCOFc3eyiEcPxm9oIzYmExvoG4ZNclOoUImOUZtFX6lx6wEBmOBiVVD9j/JhS+UQwoIHzrVT
 6YtVKWzyrS9iVTV409fKQXGQIoQXGV910geZ5nvMH8Vg++vi5RLNElYDHY850eFwYQ7E3h8SPWv
 yhssxs2GAoRquREPDAddGqwU1Tg==
X-Received: by 2002:a05:620a:f10:b0:8c1:ab1c:f2da with SMTP id
 af79cd13be357-8c70b90f77dmr676222985a.70.1769614993378; 
 Wed, 28 Jan 2026 07:43:13 -0800 (PST)
X-Received: by 2002:a05:620a:f10:b0:8c1:ab1c:f2da with SMTP id
 af79cd13be357-8c70b90f77dmr676206585a.70.1769614991262; 
 Wed, 28 Jan 2026 07:43:11 -0800 (PST)
Received: from quoll ([178.197.218.229]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1354205sm8003551f8f.41.2026.01.28.07.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 07:43:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 28 Jan 2026 16:43:07 +0100
Message-ID: <20260128154306.133047-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1670;
 i=krzysztof.kozlowski@oss.qualcomm.com; 
 h=from:subject; bh=uAdUi2PcEKOUBFsGcYGabugs1F7YktxD7G4E6g/mjeY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpei6K6nwUOJpgDl7kWWIEgfjSRExvZiycp4pGw
 WfIx5JujLyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaXouigAKCRDBN2bmhouD
 11PBD/0ZygzFDBZ9XPkkHolSm/vx7daUl7dBNJxgRosngJmB203l5VWqsZXQ/g4yv8v8/rB/H7I
 VzabTmmP4kzKBzfVQ0WL1ww92RpfDkZ29rJea7Zq6MC7UiMnO+b8O0mkszoghxJdjwCo/uvLUWW
 aRW1oP8QlTD9XP2xUfeNqLjOt95WzAq6zjCqwYrJz/GltGbgdTr7K1rtjfnafvsE1w86wiL60Xf
 MCN4atase69g18LHCtU1Br4YP5BxluqTT8XlUhd2L9Xvbq5Cg4GMno/uBXfuSdIDWUATz4Ay1Xl
 gnPF6WAC0UdsktUYcxUEH/XrXekTzCOWOvTl0cy0VaGXQc3tkmM145rLWPptxIW3vKpbRu+v2TC
 NFsCbL2RW9IAeCfVF0kQcFBldmWdoNNDS1/Xr59vg09eRR/LqhFkpIez1Q8OBLV7VqtJgJE201F
 z8KXLnIuWLhu65H8X39TBy88FsfNjUxu0pHucFIOq8sy8sLVokM1xSd7ibHNvUevoF2vb7lSBUy
 sl5q8WWctr/ZkbRaxh/UukLybUgKnNbn+0nYc2ErpR0cKQWrNMJZ4IjpmOoRH6wipwqIn4MSb1M
 wiYvnA7e2dQ2yLa1nuMuKQEAVPytnLnrNaZGisqLxoiKMF2u6vVPr5En5bihzfrwyQOQbu34kmN
 kSoH2O7xd0PyLwA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Ui9nuOiT8VXKrgMlLbZ8xjvyCVyQcgRN
X-Authority-Analysis: v=2.4 cv=J72nLQnS c=1 sm=1 tr=0 ts=697a2e93 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=euIjOI2ikgTaeCi9kv0A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Ui9nuOiT8VXKrgMlLbZ8xjvyCVyQcgRN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEzMCBTYWx0ZWRfX3V3PbG58OTiA
 59nw8WoxUPZ570xNKyuqzNYhgfbrk83X7H+EW1IghrnNffqDFLVlTtBJcb6FPDfOG+Smxfk+Joc
 bqrPCJCRhQoHGmxlrZQCxKhb3H1ZAh9PkhVHNulDSwWfkAeTQj7xHvFiEgzlZQKRS9UCoMVZFGO
 SBhdPTm0W8oT5xvx9WstHiZ4i6dU8RkfAUBi/VZYbZP22h/21aX+jsekPkplhaoRYOwE66yJ3mG
 zcWE/8vNSo3TI5g6dfKWorrciMRrkztsoLV+A4ryIOV9Vh+ephejruIDkXYw/YZ9bH7StCScxqi
 EtdV4kQvrm4XA+5gx+/9o24cD3jYeoGTV+V0gIRXMpoSLffit6pWHzBrjIlMjuBE4TibNYRxBRG
 nTbK/piNK1AfRzBhwaJ8ipO6499OJF2xkeWb+l7pZSk5UViqYJboTIG1HY21S0Nwvph3lS5EzEq
 xDxi4cL9/0k+W2mz/8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280130
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [Linux-stm32] [PATCH] clk: qcom: sm8750: Constify 'qcom_cc_desc' in
	SM8750 camcc
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 0AB1CA4497
X-Rspamd-Action: add header
X-Spam: Yes

'struct qcom_cc_desc' is passed to qcom_cc_map() and
qcom_cc_really_probe() only as pointer to const, so make the memory
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/cambistmclkcc-sm8750.c | 2 +-
 drivers/clk/qcom/camcc-sm8750.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/cambistmclkcc-sm8750.c b/drivers/clk/qcom/cambistmclkcc-sm8750.c
index 952581f86db5..d889a8f6561d 100644
--- a/drivers/clk/qcom/cambistmclkcc-sm8750.c
+++ b/drivers/clk/qcom/cambistmclkcc-sm8750.c
@@ -421,7 +421,7 @@ static struct qcom_cc_driver_data cam_bist_mclk_cc_sm8750_driver_data = {
 	.num_clk_cbcrs = ARRAY_SIZE(cam_bist_mclk_cc_sm8750_critical_cbcrs),
 };
 
-static struct qcom_cc_desc cam_bist_mclk_cc_sm8750_desc = {
+static const struct qcom_cc_desc cam_bist_mclk_cc_sm8750_desc = {
 	.config = &cam_bist_mclk_cc_sm8750_regmap_config,
 	.clks = cam_bist_mclk_cc_sm8750_clocks,
 	.num_clks = ARRAY_SIZE(cam_bist_mclk_cc_sm8750_clocks),
diff --git a/drivers/clk/qcom/camcc-sm8750.c b/drivers/clk/qcom/camcc-sm8750.c
index c09fa75be457..a797b783d4a9 100644
--- a/drivers/clk/qcom/camcc-sm8750.c
+++ b/drivers/clk/qcom/camcc-sm8750.c
@@ -2673,7 +2673,7 @@ static struct qcom_cc_driver_data cam_cc_sm8750_driver_data = {
 	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_sm8750_critical_cbcrs),
 };
 
-static struct qcom_cc_desc cam_cc_sm8750_desc = {
+static const struct qcom_cc_desc cam_cc_sm8750_desc = {
 	.config = &cam_cc_sm8750_regmap_config,
 	.clks = cam_cc_sm8750_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_sm8750_clocks),
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
