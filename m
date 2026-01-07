Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B1BCFCEEC
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 10:43:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AEC4C8F283;
	Wed,  7 Jan 2026 09:43:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8608C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 09:43:38 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6079RDRd4136987
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 7 Jan 2026 09:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=; b=eWCp5y3QiYa/iNJs
 Xuco9jDBKf78KOPp57OjunFmWI2m2ZSuPAGlwDhEuqL8qo4k+zb4Z5TXkRUOllSa
 BigaLHXPvqnKwMmb2KrJMPT0wWSgsMBCVBCBk436eAuvRCmRNwn4bn40iEE1biE+
 sPyHVfFVTb70fq4LJi7MU9oZBeTVL+ekh+tqLUqRREqijoAgzhOfe345gBXPKMNe
 4j8ucnbwTSYW3GuQDSVi0yumCnICsOMl88TqSJKc26NeVNzmWVAKQy/QHZq64bPw
 FODULmhOgcxzSRwEyTGgxO0t72W7Kv1jkyhhnJJOIRh657hL5kRVTVVH+20iaCu9
 swI8Vg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e2sqb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 09:43:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7d481452732so2668873b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 01:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767779017; x=1768383817;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=;
 b=Tegc+6YB3QxxLwZq+Gou6lunfx2pmual/i/PvfLFTBlsi+DpABY9jcVO9rbupX3OHk
 PBfGbYb5SspuVZj2vD3DXyjchXUAV+jT5c0MXkSA1w98GnKA2hnZTvitm5xHhOLQ5pUm
 8DKakDJGo33XvBou8eB4XeXxbOQPku0ysMC5ATmc945oizB71CYT44AcZMFWu3iJ2/3p
 4bIZvvUy28DNkGdQgwBTWTwfoNVBIpYRO/3St60pm1NRqatRbgBzME5VvQ/RIMIdLTxN
 2jQUKYk0cx8LjX65GfFRksmp31rwoWlJPtt7qqOqLrCrLvaBsuvXgZuZlI8B9Nhn44sa
 Qp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767779017; x=1768383817;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=;
 b=CQFq0zSigiw7vV/OgAPmXE32Vn7UM5sTqQkYsUfNB/2Q2nJPUKTpd+qYGMqsGWjf+i
 DJ8hivuwiwfuQrZ5JfVACre3dpSF438b6Qv/wd6AglADwo5XqsxI60VFFQwEBDc7RBhP
 /tePshCIxH1lf+vuErQwjB1CUO0m768ambeNCQp9iW21e27oQf3HGPlavyslwRmau/pd
 MfuaHZiQ+QwafVFaQiAs+uMhaawSLulTU8G3aED4Qsn3owR97bRxXT8cpuR5mhrBvME3
 vHAaTMpyDR4hZr4RHxa/OjSHY//O8OUeairNHD48qWtfi/kK/8DxL2LrPyjXA6FwD7zZ
 rD2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFB8NCFixvIwYhIArsE3BrxSAiKloNUaSvGLwqrxY8ugZXiUlTQFUgn6dt05WmzzPv/ZxJ+79ARBC9AA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzLtoZ64TuP4I1Dykq9gkokrwolrpPH6QHEHOdEUVS8nY8YieJb
 Oky+UOzf6fp45Ara0sptbVsQbUmu5sbKWx2/joCFV6iI3cYMo1t3uB1IDfCv62ND/JKx/TVxiT2
 6+Uc9v0NbwYuwM1AtHzrZMSuHSFWrwq9AcLVLNRxdb8oN2o8OOdirfuU1H4sVMldX2tV3GC2YdJ
 MyjE9Q9tQ=
X-Gm-Gg: AY/fxX4Crrlnxy/3o3gEJnRm1zZt+GWirYtGqIK8/dGl5vPST4z1MJmWKBXj+t/+T1S
 Unfx/o9YP+362CLK3WwQKrcmXM3D1BByJQ8N17SwNcusPlW8h+5ish/k24cBgFYmlDslRHFz+X8
 h1//5hzXpv0D3kIMtpSdx4HE81ZfxzK5MtvslvFkmHKBHXUunLgzHaZPKQIs4SoOA3MViqRAD1g
 3r6ZQucJodSLzh28dRkJ+UWT8hvnG5Bg71yaB+zdEVeyRmqUlfPZzmK/ChI+lDtls+8EPe0FyMU
 A7uOoBoJUFTrk2H0ttT5nw+EED8w4N/NqI4gjbKsqGAN8winJ7ruC6G2uSjO9vtwUNUQUQnVBxb
 0ffSgQBs4sGKBpeabxAo9okCQ/RqiEB4NHQ==
X-Received: by 2002:a05:6a00:908b:b0:7e8:450c:61b9 with SMTP id
 d2e1a72fcca58-81b806c99f9mr1789472b3a.41.1767779016698; 
 Wed, 07 Jan 2026 01:43:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOWDHAkqPtCZbyeZOE5BJsu/fKSrpRyXFy9kFumozQWK84Dh8TlS6n/YwBzyrzffHXHc0jGQ==
X-Received: by 2002:a05:6a00:908b:b0:7e8:450c:61b9 with SMTP id
 d2e1a72fcca58-81b806c99f9mr1789452b3a.41.1767779016235; 
 Wed, 07 Jan 2026 01:43:36 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 01:43:35 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 15:13:05 +0530
MIME-Version: 1.0
Message-Id: <20260107-kaanapali-mmcc-v3-v3-2-8e10adc236a8@oss.qualcomm.com>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OCBTYWx0ZWRfX4+D8ZqRL86EC
 Tu7elP39BYRXoZvz/PqgtSGcUgIQ4BVowpMPksW89vdrmFhXCCkLu19HeEImhG4Dpab4ZL5z4An
 dyMTSIvINFHA7j6VwDVZzgshbB8ZOhdDtlI+IeZO1ihmT18IAoxCN8+afW3a1CFtm9112LQvNAx
 B5JCFu30LcoVXbGfGxbAbItYDs4JAjCXWE7y2CZdX2f/wSEt2haJx5eb/Zu/wo/1Gg4hDAGLdxO
 NKSGPfU+EUWC3kFB72QaxB9P6qpBEuQuSwpAQ2/X+xw1pw2NXV8GeaQwrENKfQite4aIght2Bec
 XCznG5GRgGTz5pU9DcRKzCs13U/Vg/lQ3LEOCpNAPmRg8o3U7iGmiJ1764A/l8RivAXVNBAXs/Z
 2gQaVnVD5mq50yNmEnsTmz9wCOiO5YFXCKMf20tr8Jmxzt5W/zqX04v3ToHyz2teFHtIF0gL5Nn
 0r9WsJ8vKs2MqV/yZlw==
X-Proofpoint-GUID: KYT_4GYPJE2zEVqEWkaC6-8qFmYcG0Uq
X-Proofpoint-ORIG-GUID: KYT_4GYPJE2zEVqEWkaC6-8qFmYcG0Uq
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695e2ac9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rVs2PR1jS8wsPJa1_kIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070078
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 02/11] clk: qcom: clk-alpha-pll: Add
 support for controlling Pongo EKO_T PLL
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

Add clock ops for Pongo EKO_T PLL, add the pll ops for supporting
the PLL.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index ec5b4e4810300fa787420356bb073c24bb05da62..fc55a42fac2ffe589ba270010eb47c0816832ca7 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -28,6 +28,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_LUCID_EVO,
 	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
 	CLK_ALPHA_PLL_TYPE_PONGO_ELU,
+	CLK_ALPHA_PLL_TYPE_PONGO_EKO_T = CLK_ALPHA_PLL_TYPE_PONGO_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
@@ -207,6 +208,7 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_taycan_eko_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
+#define clk_alpha_pll_pongo_eko_t_ops clk_alpha_pll_pongo_elu_ops
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
 

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
