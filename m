Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FD4CAA03B
	for <lists+linux-stm32@lfdr.de>; Sat, 06 Dec 2025 05:02:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00D46C5F1D9;
	Sat,  6 Dec 2025 04:02:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACF4CC5F1D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Dec 2025 04:02:46 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B63Yjmp2038237
 for <linux-stm32@st-md-mailman.stormreply.com>; Sat, 6 Dec 2025 04:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3P8RhC3cRbNOP0rl/IbzhEB9
 y9tPULpHaaL6+mDsxHs=; b=QvNBqC0KzNzVPRU95PJPr/+qVS+YGanOuwTiCMlh
 oNdhNbqndg49Ir+MILtlOUzbpIhlCMEcU2YYd7MUtwRzPz0N3yYfFeefna6JWCHn
 kRbr0KCY13Ry0ypW1ZfqBIwq/DQQt4DmbbRUBCd89MrlxnS2LoLRGQwE9rCI7+l1
 MohM4M3qnwoV+m+Tu6eZl8nKCDjmQ09XDy6kFelvGxdcWWtLhLP66zbkVKu7L8FR
 AoNIbJfm84kO8y9a63fiZi/pqFVs1aw973SwL+cmPgXnrL8swf1HLDkYo8lN7mul
 3/nKlOUpjyyA8lBo9gimL9fhB+0MUymrSqQYYCtwQD5jYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcq3017y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 06 Dec 2025 04:02:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b24a25cff5so589511385a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Dec 2025 20:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764993764; x=1765598564;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3P8RhC3cRbNOP0rl/IbzhEB9y9tPULpHaaL6+mDsxHs=;
 b=OS1QZAO7Yl2XHZrD2FMiHxoHqMtV3/o/UqZjutWGWee131SxBY4qnzqhYmmOB8Clct
 isOH7gdxFFH7HWkdAAU+PhEv+T2eoClT3NbwvoIMR5Wv9p4pTba2sLgGgzuT8OE1CJLp
 +jCjkdiAXVMNtuwx1DVXbzhnuVTNM4ATg94vXrlRykGE64LklVW/2ZHbVbs+SRUYCGKP
 HdFIdKF0ZRe46nJ6XHsDN0YBrKeZF5b3IFLqajsxsF7NUvCDCOu3n1CZq1BjMhxFvW6Q
 DVdhhjGVoYmVTlSsBFlhx1YcUFnRk3P36kKZSTQwVpvpD1ZGEo+upz16d9Aaqjjlvl94
 rMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764993764; x=1765598564;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3P8RhC3cRbNOP0rl/IbzhEB9y9tPULpHaaL6+mDsxHs=;
 b=isStzUZxFxtm2U6TMvI/wrcGGNHGAvnXQ6QD38ycy1jhUDz0SiEWQXRICP+EOyuK0W
 +EXOJdgO5Eq05VCgVpXxnE82TENJkIN/DRnG/5Ke9Sqt41ea3OIAtDijmXRt9BsJy8KR
 b4C0gnT98rhCdmjql401R3Qr5OZnO1CAgkc9IeWTY2rwLIfkxQbw0/IzjbyajwGCXmtM
 leFRV16v1hDWTMHU1nB97a6ZtFlXLh7tSWKDMckbtZRDMIby2KTTNAwPkW6Yk3fZ1Rsj
 oF56HVWlFtpTtiN5QqqQJfc4gvJ+Bcuzin790YCF3X1dZMNZLX8Oi4BAbr/lqRWgoFf5
 /9zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtPMfhn7ZN0BIIVmH+xRpMop6GF30ujQyrv+wkkMmmEuGDefMDxXJB77ZmT7EEhQYFFtU2QnuzexcnRQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzkuNBM6Afu9c8rK6IlhBli80nKEy6q1wY72a1z8CtAKzay/+gn
 k5Y+yJPLai9mNGC9j7aPJsyVqktO0n7c1tvIyNu4pOFDYtFoeBwWla+NAa/iXePhgY4OVDcQJp6
 VNAnqVdJyceUny1D0JpmnMhuTaIOEUI4u2V6bLgblnv2zqrPKvZ54YKreYQExJwOj3Nx0nzIDOV
 IcbiwEpwY=
X-Gm-Gg: ASbGncuty+VosHyBGri8ZeVBup2dgpr+Tb3UeXG9EdoZT+0J1G0Yycj3cOdt8OtRF3Y
 LvMB77L+XHd+G7HTtGOT6GdsSvkf9DOU6iyx0f9SModxYdYHjeuRN0je4EAIzH5OcMY8hoFCVUj
 RFnLfiBoUEMblPH8jp4Hp+7xLmvtuC4DMD4w5L9yigHPPjPI9DIMS2c93O/2rmQg2x8Bg2au9o4
 u3Lx5h8GKfeMCjVKfZnoAqtiN+a3U/PpXQllYIReGgi0psqa74o9uF/OVrUzy22KrJVrJAio8is
 HC3vuHWwIAH+/ye2aE4oDsy73FL4t8IIEClSpWuppQV/Ka/yeTdBpsvwO/19OkoomvnXivtnqX2
 KLFAaOT8yNvHGGmY5GYblgPYwdPbytinw/j1g3QAeRpM9rlDXklQfpFTGiGt2z8WQ4otj0Q+nkT
 9QxADgx/RyJFWmOqzGi8hHFrA=
X-Received: by 2002:a05:620a:4726:b0:8b2:7777:f662 with SMTP id
 af79cd13be357-8b6a2589ac8mr201824085a.64.1764993763772; 
 Fri, 05 Dec 2025 20:02:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtdPTmuravVRhlZz8xV1WEVwbBUkAkyhjwHvpt7kRJcvSdxAlEvy5G47mBX7coj0tQB1w6+A==
X-Received: by 2002:a05:620a:4726:b0:8b2:7777:f662 with SMTP id
 af79cd13be357-8b6a2589ac8mr201821985a.64.1764993763272; 
 Fri, 05 Dec 2025 20:02:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37e6fe6bb67sm19293071fa.6.2025.12.05.20.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 20:02:41 -0800 (PST)
Date: Sat, 6 Dec 2025 06:02:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Message-ID: <mcvwms5logao4sz2o4h5yfyi7kloj7pkx5qzq7byvtcmhbymnk@ynegs32kkxyw>
References: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
 <20251202-sm8750_camcc-v1-3-b3f7ef6723f1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251202-sm8750_camcc-v1-3-b3f7ef6723f1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyOSBTYWx0ZWRfX2LQDoAVvheC6
 fk1b9e1jvWVvAv8Wxk8TaAIROLT991pKlZVuHDYDH+07Ze6KgZFduwzrzVZJCi7WPjXE4PZON8k
 ngqlRJDLo0Fl57MvuKFgZ23KJQCtobekdcrZvkp8F8d0esLuLIEyUBVmd6wcjiHbMkdqg4t5bi/
 1TnrGkI0eBKaXWpRDhPZYJaeGaCsV3WA+1wQeER6jR278Lne4phGLp0yZge6/KhiDoeoGQXtUWk
 lsrqPG0pvS7MakoguUwHbiga/ZSXzrpIaxu/yfvl/3s+FOmTlcW5MzTUKwTL5taTS92acJYBRsM
 sAWb/OZOFbw9D0Rq0F0BJDncLpj+Ujqe2yycAPH/3kCavXx0eAU6w5Uj8zRhIErWY+uoG6FkQiB
 y0f0642DzkrXAv6rPU99D9eqCgI2QA==
X-Authority-Analysis: v=2.4 cv=as+/yCZV c=1 sm=1 tr=0 ts=6933aae4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_j3VNrtD_Kzz85i8SO4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: b18_iWez9F6xgkX6dXtxMIOeULV3EE3Z
X-Proofpoint-GUID: b18_iWez9F6xgkX6dXtxMIOeULV3EE3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060029
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [Linux-stm32] [PATCH 3/3] clk: qcom: camcc: Add camera clock
 controller driver for SM8750 SoC
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

On Tue, Dec 02, 2025 at 03:56:27PM +0530, Taniya Das wrote:
> Add support for the Camera Clock Controller (CAMCC) on the SM8750
> platform.
> 
> The CAMCC block on SM8750 includes both the primary camera clock
> controller and the Camera BIST clock controller, which provides the
> functional MCLK required for camera operations.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig                |   10 +
>  drivers/clk/qcom/Makefile               |    1 +
>  drivers/clk/qcom/cambistmclkcc-sm8750.c |  454 ++++++
>  drivers/clk/qcom/camcc-sm8750.c         | 2710 +++++++++++++++++++++++++++++++
>  4 files changed, 3175 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
