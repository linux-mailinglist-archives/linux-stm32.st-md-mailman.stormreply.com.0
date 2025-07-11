Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B6BB01911
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 12:01:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18128C3089F;
	Fri, 11 Jul 2025 10:01:03 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D326CC3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 10:01:01 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1XAG4018452
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 11 Jul 2025 10:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=; b=NgVA7m81R1L9A0Ki
 QNp4kFDi3N8DvO3qx9RAcYjs1jtC9/B+avlbDc1rtVhy9F3stierm1OKhJXjyvGW
 YdJRQ9sJZI2dq1voO32H+V90S5DBNkGEzMB+xaAjR/XUQqiqXKUbmfFIb4pfvmVg
 addsweOBBLqrhC+UeeNjdbg6BndSLotgYWOKAXr9XGGsXN938CxJNVJZZLif9/67
 bTDai8X5rgEivv0G/Ddbk30UzPRe6GPhQK07mI7NvCLN/vavWRbSaFIQIrbwsqW6
 eGBhsOpspzm7+h66u4RlX5bUzXbU/874gi2Q1I2OiV3jDc5IUlMIMm7Q1MkP6jwn
 rNhUlw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47tkf322dj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 10:00:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7de3c682919so17712385a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 03:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752228058; x=1752832858;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=;
 b=fU+B16bjDXOH1FyXZtJpQAcKK9YrgywzarB2D6xAh9fbsq37Aq6oDYasbcNqK+x7IV
 OJyrPjQh/jv7ygrEYOY/W9OJVqFyetOgXGOVumnEXRpPYpVvmSoobxp6JuL2bOrFZ90Z
 Ksuv3AjQPD12sJr6A+x5tEepHZ9DQ83DrSzrwdq6g5chSywVdIovNfYSg5CuXSDdnf8U
 JArPtdyBs7NUWmYUK9FT6reDny6qnSR+1jUBmV58X8cqaSJprQV9T0dZrCrJhRzmINEq
 +3CfWhdgaKgFSWvYoTbA3wJs5yBt/JX8y1dU0FmG9OyLjzRfvKD+jkU1Epww8sJjJfKF
 QBAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLkyPKp7E5mLTx0asZq/AG3KwwmUkcmmBlNJPlipQYCPMthQV1uGjCUetEfa4vHeFkPx3irX7Jq5kKMg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxjfaqhqCZ8zQeGWZC3kiE38VBykvFzinCo/HmIKnNZOW0GnBY3
 NKJPfmCG6HD4jRipUsA6UPB9O9tLxyPDvRKMnRsvzMe3KZrJbpnnxmOrXOGQPz/WIYkvro8gJeF
 je2ALwF5mp3eXbp8k95S4mrzgGmsZpomcLRrEWooiopr5kM+VVN+29ZdCoinPK3lT86Z9Khxvvj
 zeu0aeU3A=
X-Gm-Gg: ASbGncuRhY0DpeOSsLzEu2enLAmjFRMudWQeE9xV139D453Od1fNIcLj9AEjOcrv7mU
 UCP4cSALQWz3z9ayUBjHGgGdV/m5wV+GS/Le2I9sZOMJP33ICeDSj8RI3DQ69/nGYLa3pMK2RKQ
 GWrhWam3pQxLyTYyRpRRfSj0d8ayLJtQv9KnuO6eJ+D3z3JaQ3ujZl9gj6Oq7IUGMc3N3r4SsqK
 ZkpK0BqPLfdBBlRJwGgBmw+/OzstB17fueOsabI3OPO06pzUItRbUYW9PzL+QRZ8veK0FDAkitQ
 poglNgYAfoMn1U/ZwKg63hrTn6iYU4u32miGo8mPb/1wrA4gW1FgiturD2Rvb95R1gXyBRJJbSp
 fKXT81VJJOg/YgN0Rm2s1
X-Received: by 2002:a05:620a:198d:b0:7d3:c69e:e3b with SMTP id
 af79cd13be357-7ddec077b97mr142431285a.12.1752228058109; 
 Fri, 11 Jul 2025 03:00:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLY0/uyOhHuHX1X9pWT4ZRBIdqoYlueRYMn0zZIdfXxI0Ouch9sgLT86MrHZruF7j7b5jRXQ==
X-Received: by 2002:a05:620a:198d:b0:7d3:c69e:e3b with SMTP id
 af79cd13be357-7ddec077b97mr142425885a.12.1752228057424; 
 Fri, 11 Jul 2025 03:00:57 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82645c3sm274825766b.99.2025.07.11.03.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 03:00:43 -0700 (PDT)
Message-ID: <ee4fb01e-4fc4-4082-be96-3be22e1769e3@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 12:00:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MCBTYWx0ZWRfX6qYzoVAdLAzL
 aRLTHmFv26ugRJUKyA8s97Oz5PgP835zxPQJsILlK9gvWV5zTY5z4D+7x8kqp3wrsligraAiaju
 ETC4gVXFskt9SWIFr0AqqpKOsyTLVeJLVAu+2DzJ2ZTZi57CBSv/OpE6TMYLh2CP7C1+1bUmUzv
 IQ9Qlf5ky2FAtuzF73fd9Bg01iXoDw/9hYd0fpRLDOAPjrOJqwxIG0XTEve1IioRi0+A/NzZz3k
 j9LQXEA9S/GpFQsk88KvDqPTQHC0hUWLuhxVcGyxblaebGZpqPSyf8GjBgTiIwGAnEgi73Wj1Pp
 n3GtcwAHYYVbrhyeSHrr8MQztt3g6x+gwVEWiPJV26/SZBYdw5Atr36p8DxRNB7SRQB0LlT3Mz8
 K0pq6ktx5DOXHBXa+F6gLbd96W2GZ+K1MLurym0ey1yOhx5x0DaY57kLl/cMsBbfAgTU/eH1
X-Proofpoint-GUID: 5mwbdGekvlldULg5TiUH3bpFqitCyQN5
X-Authority-Analysis: v=2.4 cv=Xuf6OUF9 c=1 sm=1 tr=0 ts=6870e0db cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=Lh8LEGs6nEvmLzq652MA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 5mwbdGekvlldULg5TiUH3bpFqitCyQN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=624 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110070
Cc: imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/9] drm/msm/hdmi_pll_8960: convert from
 round_rate() to determine_rate()
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

On 7/10/25 7:43 PM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
