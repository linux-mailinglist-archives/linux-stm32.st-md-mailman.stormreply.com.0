Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EB4B01909
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 12:00:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC55AC3089F;
	Fri, 11 Jul 2025 10:00:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2791EC3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 10:00:21 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B3GH05016058
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 11 Jul 2025 10:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=; b=axw5SR9uMFk3cf5O
 c65Nu/hMWRZOrxPT5SbOCqJIjVKnOvBhRE8X0fQ6i0KGuZLwsJI0EMBLgz44VhIW
 WcVUXjWHyNwtSFfylk/BbF+Eaf/rUfoS1cG536ujCumN/i+ut4Zxunksp+PYpzh7
 9T05vbaYGayHfh2hWaTcUL5KISKFpUwpRwKtAn9d9LconQakq9FBerVWsIjzrkET
 twVdqZ98NXYE937d6Lqi2sragbZoGI3siTh6HPt3YfEY+J9hwAYplrs+on2CVKB8
 qWsm/cZD23v+ESTat3Gkt/SyuF/AK3Lr8QaRKSrvAKbwTUDr9l5tbRMmg66stqP7
 Qqv/kQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ttj9s0mt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 10:00:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7dfd0470485so12237185a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 03:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752228020; x=1752832820;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=;
 b=xIV6bGuihFO4x2Ka46lZ3DCbIRANr5xrj78kmhzxPoCea/JMrEKGiytlH0OB2OE4Uv
 zjTF2e+FNOmPRmyyoQYMjp0yj08O0nJEwHq1clF1XC8gN1JMz14X5EmFQPmNvH8WWRzQ
 fhrR7DWY4ri6tNonQ1tZnCADolXM8nbWS86QKJuwr5abvzhAfI+wLlvwRkFDovfDEBal
 P0B5o5i1YqeaQf9Y4tnovMtPvVmOAV/JMK+IdYC4FJZ14yCs0PjCqT8soEicrsI73dFM
 hirKFJ9oOFfB/h6r43OPSKy4cUAWLVMNxc37M9b2RdYyqeT3CR/LJXIoFk9qeZeAgVvk
 9R2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz1tQ4rvk1+0g2j7CtTb0zDe7Cwu/03XnviiGKfU6lt7V7EhV95tpYO1M9J+oWYFA13bAbeZLdTg/Mmw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxVXAX7JDriX6HdXABvsEapfYFHri7ATscTT8jTEUHIdrAcApD/
 LxWioJyf5PGHZP9oLoWp8WcDO6oZH02JCy+NGGJEQA85b/1jllOLwIJV65sT9yLeVcAAVxc4HYU
 dktnI1ggCHKExDLjdeYYZ1Qd0I1OvHaVWBZjfKANZQoYz2IAjXhXV/2AitvAHrcD9QAYoTuYnEG
 DjIOJVLQY=
X-Gm-Gg: ASbGnctI1qfjqlqVo6bBJEWYEEu2Kmy0yefbR9P/lLZPP1xXkGh3aKuxLtWj9IQzGrS
 Az2V0E7FI4nOZ9MLcRLHUyo8M22EsK7c+Z2a9hhZiMNWlw4M3ynSG+R3jj6EtpDiKcQFvWVadsw
 y/+cIcvkhUCRaNq7B79F24NKtXLRPqz8ZwqPE6p8zgunphohUU62qi/lrCBASvqOZFuLm2ze5Eq
 1Y9lDfN72L/AsRney94i+k4ylfmFdx2FrRl8N7dbv7ywOTVSUEDtzIgcys1Q4nTwEs8YOFE3YO7
 5PepxqggLznUgAq5+wxgOvVu5w4pvk1chjL1GFyjiDHt3ITcP/VYSYiX0gfskTk3q0zGk35O0Um
 ws7eji0qBqySLJVlb5g7z
X-Received: by 2002:a05:620a:1791:b0:7d4:4353:880 with SMTP id
 af79cd13be357-7de97c2cee7mr101575685a.6.1752228019696; 
 Fri, 11 Jul 2025 03:00:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlhPKclj6Yn0L7q+F2xj0Xt2MfgZll0J2UP/WxG5I7gSC0cNE/OxkTsOoKzfyHayBKXzvFZg==
X-Received: by 2002:a05:620a:1791:b0:7d4:4353:880 with SMTP id
 af79cd13be357-7de97c2cee7mr101571885a.6.1752228019106; 
 Fri, 11 Jul 2025 03:00:19 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e907c7sm276215566b.17.2025.07.11.03.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 03:00:15 -0700 (PDT)
Message-ID: <9b1c3318-7d89-4fcf-99ea-3b446793a758@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 12:00:10 +0200
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
 <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MCBTYWx0ZWRfX80TT8Rjmtrv6
 x3wmCETWJM1jrAiazs/6Vv2cm4tvEJsNa5UQjjl7woC2Y6ITywSRCZ1UCKpeYqGcORjm6mL1vBq
 m5sn0nT5Is0HhBoWTrGlrGwpHviUpU0wDVVfrrvh34ik1keO+sHTxdZXalLcTop/qWc41Ne+TrJ
 np+3Jwj4k2I0Tzh0cBq897SqShp0w0cRCa7MYdPsmg/XQC/1RxoaKJQPbzCloLh+rThdcVR0lRM
 HlCZSKAYGLNPUt4T69CXT8i63vmPXoDT7i2p+x4nq15BD4EUQV5MsEldiwR5K/RXiHnv7G13h7g
 ovsbNuVaUCqr3oqxf/18HXAYNFSXydIbFcqT6cg4GiINgwDTaIefaKR8jF1UCDATNmnXMNMm82W
 CSpLAKqWUTrRVs0Cbyhc4Sc4YXA2ye+3HVX+JvUeMS4+lNPdC5PkBr202f15gozUwbbSVKXy
X-Proofpoint-ORIG-GUID: HFLruaiwpiq4-S23osO9wJfjqPj5_Q4y
X-Authority-Analysis: v=2.4 cv=Gu1C+l1C c=1 sm=1 tr=0 ts=6870e0b4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=Lh8LEGs6nEvmLzq652MA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: HFLruaiwpiq4-S23osO9wJfjqPj5_Q4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 mlxlogscore=689 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110070
Cc: imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll:
 convert from round_rate() to determine_rate()
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
