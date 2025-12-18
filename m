Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAF6CCBCE2
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Dec 2025 13:36:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2627C5663A;
	Thu, 18 Dec 2025 12:36:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53F1DC01E77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Dec 2025 12:36:52 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BI96txr680765
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 18 Dec 2025 12:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CeX7zdkTKzUgYrUHEXvo1kAjNi9I0TyGt1y+5V+nf5A=; b=i5WubbSa44riyiyl
 9Cr7zftRPg0APa58lJPGyB3kZhakWN8hPhnLrAfeAtESdi12ku0Im9fs5tSHGAcw
 mlypYhdThrD++/Rwkd78eUMroJrwudGs4C3oxvHmJ3urkhwpRDWiVu5Nh98c48/6
 hf9IX2GAGhBClL1nbnmLzTvfjNJE6EvKtHC93nkSwtYikMFH9iILehx+tntQhGRa
 pJHCZ/yxV9Tv0ithUDFwqoPbLGWOz0jM2ChKFP/Pc4noli3JpzrjRmeefdM+hqQn
 EizDmsCzK4RpeRnTxS6JfCmWSXHJ2JLLNRDcyOu6xUCebviJUSpRH+BJYraqR+tU
 6ycJNQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45bhj8ut-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Dec 2025 12:36:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed83a05863so1509021cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Dec 2025 04:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766061410; x=1766666210;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CeX7zdkTKzUgYrUHEXvo1kAjNi9I0TyGt1y+5V+nf5A=;
 b=V3IhrHZJsn0UkEs8Uku+6llqICURqBId6Hn5xGvAk2lCfEsSXEullDtgQ+H66OsW0M
 5qhz/AxsOxVosVqJZ3rcrFEVHK1hXmHoG1xOUF2etM20kggUKmu1+r4af7rCBYfZl57T
 3XkruOTtwgmOLMNRIyoM20lhuaigXTGBooTWgz4usFG9MCNzzj+IdTpm49bXjSPeYQLz
 utlyyJFRx1LgSz9D4eBvLdxYoZmcgtuBi+o5buhnNIk2yOvj1KbpWbgwq1Oie7iZqnnQ
 ucDbtvlq/Y2NMUcKqrwpUQ1hgUdBqDLYvRSo6u9PZuhHk1ZLB15E4t/lxx48nuFm51Xl
 Ef+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766061410; x=1766666210;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CeX7zdkTKzUgYrUHEXvo1kAjNi9I0TyGt1y+5V+nf5A=;
 b=AxVTHcvBwi2WqCg8qo6CxJxrlRII4xQeHogtMeqWKXI6wKsH3B3CbLaFlCFIfmaMuj
 hQCcYeQS5vGZCIlrv8Ml6x7isEUhV1uYmLX+9DT42QxkhUT/HFNEJn7kUKax2IzkoRgU
 kp+LEUfiNfD82LNtDTaunadmNxEtig62PjEptihtCZAnvta+BiqSV0OzU6ejPrBQUUSM
 XRLUxGTYrGNxTAnB4EN3iy9J3zsug0aq/acv4VvbkXfba/deh9aQL/UaNsHvqWOr3p/m
 e67XJzwAPol8qFvk7JsWwVs+j6hw8pMe8zY71oMPc+2gMlwwXUCpnx/5AOpNOa7SS4i9
 zZyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfvAEU3HohMxbFPq83uzyk/3/pVy1oiJUr08o0TpLJuz35umBmJqLTqAgLZs8WBT5lJmMHm858tXf5gw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxM2su0bFsHOg5TfjuRazQKvUSnbirs/SxQzxCMTa2Hq2j3cj3U
 t0En180kGzD7mKMEl14qiqtjxtYw1WkpVBizXYl0bj4RbnF32u6VddTaTkHdbC0A7G5I45x/SqH
 jAWO1MxYpNvIevmy8aXcBTav2jnK8HsXv/1r5dBU4XLs7LThtn74lOr40huJJ5CQ8OkTXXTqrrR
 ko1oyNCfg=
X-Gm-Gg: AY/fxX5kI5KK9eQ3PRTze1bjYZLXPXg/wcHrlJ718l22SNe15cQv/rbMS2mv+KkTaAm
 leIUmEvZA5U8UVg8mpGjE2rL3cimYVahWoLGxKA4E0LFvWuJYmRRJf/jnT9lQeyk/vbNFaUq+8Y
 Lb75FThq9Ch3AEBJjtDUT/S1/RRU42ZYpBKotyANoeWUOYnv0Ey+zDhUxeR0+jedJ+FVJirsytw
 F+z+qsO+JlF5gumuVVwOOpaKnSYG/L54OQzEFZ7HeUT44w9kmy5Ju3CdQEiOm+BPv/vmtdAZV9o
 ekbnLuCji/j1d9GPjB/xhkWV0cF+6nXCU/y6QbVhC15hs5NcmnWMM5oQgnG/3SIwNEgSNSU4k9a
 NpAlx1Sujem5YAD71dZC4pISe3WuglsaZUx22tc4Uupjj6lJXLfNtDGBfhl3XfuLW8Q==
X-Received: by 2002:a05:622a:178f:b0:4ee:1e33:bc45 with SMTP id
 d75a77b69052e-4f36108c9a5mr17884721cf.5.1766061410144; 
 Thu, 18 Dec 2025 04:36:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQu2nnxqGUnQynFrRXz+BuL+HJmQqJQwR9k3URYcUz1hnRgEtf2TKddA/5Dpw/OBBUzx5W4w==
X-Received: by 2002:a05:622a:178f:b0:4ee:1e33:bc45 with SMTP id
 d75a77b69052e-4f36108c9a5mr17884531cf.5.1766061409643; 
 Thu, 18 Dec 2025 04:36:49 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8022f9530fsm223265666b.12.2025.12.18.04.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 04:36:48 -0800 (PST)
Message-ID: <69ac0e2b-82d5-43d2-816d-d3ac31963077@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 13:36:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
 <20251202-sm8750_camcc-v1-3-b3f7ef6723f1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251202-sm8750_camcc-v1-3-b3f7ef6723f1@oss.qualcomm.com>
X-Proofpoint-GUID: hlx66kDHLhUBd5-XanyUVdVYOEmiRUA0
X-Proofpoint-ORIG-GUID: hlx66kDHLhUBd5-XanyUVdVYOEmiRUA0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEwNCBTYWx0ZWRfXx/TXgrAh3abH
 61y1u8sS9DnVoGqoj7v55mYM3RzAS4dKc58E0cvqiQifjDy94Kef2caLGW2ZLl1e2XFUdfmTedx
 avFHHhXd0n4v0JWRmN4HCpJfkvzHNgsqgklGjY+I6ItqMrXdIyubYIAMp55jZlZ4Mz2FvUpT7vA
 w/CtcSS7cuCDqkCbJLwDSVoqe1WuV9433kDcugXG8Wmmb2OKJqoFGzn3wVpceISGrfxd/f6c9K5
 cKw1T3Pxq6xtjAPKxl9GkqVff9cD3ORwYd9K9V0Quho5csQGBESNLmRgOhhVLyhch43dD5NXv2W
 8vJfFizB1SDmA/68XeyUTvS9FoH//tFGVfIZVcYo3rUOapFOxYL+d4f739MF86tqBoyPGk6R/mJ
 LEAgOW7C0b3W6n5HM096+UmAitQUdg==
X-Authority-Analysis: v=2.4 cv=SZr6t/Ru c=1 sm=1 tr=0 ts=6943f562 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_j3VNrtD_Kzz85i8SO4A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180104
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On 12/2/25 11:26 AM, Taniya Das wrote:
> Add support for the Camera Clock Controller (CAMCC) on the SM8750
> platform.
> 
> The CAMCC block on SM8750 includes both the primary camera clock
> controller and the Camera BIST clock controller, which provides the
> functional MCLK required for camera operations.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
