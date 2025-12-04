Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB02FCA303D
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Dec 2025 10:35:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5360AC58D77;
	Thu,  4 Dec 2025 09:35:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D90F3C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 09:35:05 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B468aFx491875
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 4 Dec 2025 09:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8frjVnxWUnblyyxLFPIXGUvDDmYFQSMSgpjtFN9Ly8M=; b=n+24TaRmKX91GwTx
 tzgu+YT/FCb6pGv4/4Bnj6ysfFZXuyLJDsum2/sgeHJFjIKdWlXHnKgaMQsVZwZt
 gK5PO4imN5cPGCBPNCXVV6R0a7VLUDwkeTEuQZWWqfMh+rCv7mJAxHMamHPGMw+j
 mSJr5p0KiXW2eBhf0Fp3hPZV20J3v+IoZ8wka1QynMKAaahXFdHO0hGWYAjgNiea
 rarZhkEld6EAeOgC7BhOm47cxjAiSgZk74qRMyp4ZlhYBXICoUWvBd7BSngAJCgS
 CaUmghqP8+j0dwNQdlwhOLiNcd6PsLfR017TBIyGf/h/jzGGjF9WIcK032Wuv4qy
 k7Jyqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmbtkng4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Dec 2025 09:35:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee409f1880so1159531cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Dec 2025 01:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764840903; x=1765445703;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8frjVnxWUnblyyxLFPIXGUvDDmYFQSMSgpjtFN9Ly8M=;
 b=eF7fsSKzh7fbkgjAo0Cp4agHBWzONjhElKC6hxLNZ9ukJDghtGYzenXZSs5zWrmmlB
 g1P/BB/5wd6fkxdOO7/OicsrD6F2n49t2+rcH29RWH1isdlvnQyC7/Q0/UmKBrWFJa5I
 bYF0YRKP7Vld7JxZVvMqYG/m9eUVk+pN+RZ1QmHhLP+oJIZVDUEe+nDOUwEWrqtAj+R8
 PxnmcWWOukyIZhZo1zTlZB0vsaJtHcWfEZ7JA7/j1bMJxg3BbhkmKfSmw8KOFq7RtMHo
 NgiJZxjqTG4ieFhHJzf0y1DDfSYQtLBtMv0e0fpPPQiagCOzKwrEVyFMne9+ojGXrG2+
 NmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764840903; x=1765445703;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8frjVnxWUnblyyxLFPIXGUvDDmYFQSMSgpjtFN9Ly8M=;
 b=rV0JlRwZZ29N6l97V/IUwrCwDLGxpaBdXZ7aiObS38ND7QxHvlowRCebdbsod/hQTC
 ufkyyJkuOjmECMdcmVno/DPEPOtTpFoKzGyaHTzewx0vIP1t8KQIg6MuRcSNWPatskzR
 BGB7enJ2HczrIuFtwl/6SlV5gm54tgyT99r3yrn7hErmcyRVqVc35FHGKxRIrqK7LI0Z
 mVyiaxk9COoOlD4ZhN47mhMY9z65HFkgCiPL+C+FKNsc9P+2lhLMU3dxMqUMGykZHe9u
 rJmCUSvILT08yfyfEArGd9w8UdHFiRix0v1XC3auhCVDqDzGqFTo6cCXrbWBo/kD1t6E
 11tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVogL9e/3A5KvcQ7Q/c6gIqLpsvzMLvLkSRI6GM7Scq9jTabQ5sS4oECSgk5MkIh00leF/5Awvg6YvOHA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwFQTxFZByL4rMFs5F0ShzTfSse2znqmGNzH6EZ9aPKBAg4LlcT
 cyYJx2X6HXSFq+fvOCBTGdwoTuXaAdYqlan5Vl4E1kk/5S1ZBQzy5X+M7mUisMDWppWCqM0wbbc
 bnCx52qFKUlxOSav70vEYTI0XZ1df0NyZaW/5wVL2JLpIPupQO+pmfF08y9CLsLQPEjlRJ7VeVI
 TNQ3vknRc=
X-Gm-Gg: ASbGncuNu5CAbawl1JRyVRQ5YLiirn4+G98f0FgZy6ipihYG5ziyyt8DmBQtQwg9xvg
 /D+eYaacYJLsikiCk8Qehj7uXOZ66rGU7sDB68mtjBxZGw8/Y/wxp7sHnKONrTvFOmnNv+kBJui
 R3dhFqMUPWVdCWWTqDzEPVv69aS3BzcGWI8PlCqIDg/NIaukNnkec+PMU7I2WalmrctB+PIWxZz
 WBzUV9oYF3ycyrdO+8PITSiV8xhk/rEmRnVmfgZotuvmg96deyU6dFfoguSq3oawz0PQrFnG5rO
 Kh1qadHYcXXus0IN9K9SijZs+KuzC9psK27on3KH5Heskz58KknmB7RTYqRwiYDJAw7oRclxz3H
 C57ixwJYqwfg33QkmJ4joZRCukVODRSm1x7OjQTYftPAJfcpp1xmRC/xyNnsAsW6JtA==
X-Received: by 2002:a05:622a:1819:b0:4ed:94e7:97bc with SMTP id
 d75a77b69052e-4f01b0eb165mr45162381cf.3.1764840902675; 
 Thu, 04 Dec 2025 01:35:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHX+v1eNNwOOMBrWUNa6eWsNBTYHiNNTwNLR0pcIGD5JXevK1bZUv6tKavTcr9qRZQ7sGDnFA==
X-Received: by 2002:a05:622a:1819:b0:4ed:94e7:97bc with SMTP id
 d75a77b69052e-4f01b0eb165mr45162071cf.3.1764840902230; 
 Thu, 04 Dec 2025 01:35:02 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b412dec1sm758405a12.30.2025.12.04.01.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 01:35:01 -0800 (PST)
Message-ID: <69f7f357-d328-4559-be8a-81a9df790f0a@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:34:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
 <w3ezxipjucswfswfg2z7b7uyu55bssqatdnbxa6jflii4j7nym@lxsnidrewepu>
 <8d0ec7fc-6eb0-4b71-8e0f-3deaf1f489d6@oss.qualcomm.com>
 <75e53a37-0fd2-41d6-92bc-fb4ad5856829@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <75e53a37-0fd2-41d6-92bc-fb4ad5856829@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KNBXzVFo c=1 sm=1 tr=0 ts=693155c7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gmcpGffKwdJZmXMFCqgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: UyWO5IO6_GFhqsdI1tqNgSwJ8iQ6IqPB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3NyBTYWx0ZWRfX8c2HHDPXgm+i
 z2cU0jV33y82kPNighjux+njUdCsJmc+t10xzQvqEtPCqS9bLfNVNUsVODyF7C0qjDoyA2fBIrH
 BybB974+QkgEA0ZioMe9QxqusVU/SyeiaAbR6pwuzCgBNGJFoU9G54txzKNoKQ1B6PlN87MC6ys
 Hg+Sgj46fr6KDkd7NjFP5m4RGpguVP4S+wDEe+9QRfoeGKIwwiUzPPeVpAXJAFMraXsA7c9Lqut
 T7YmIHMMpPe6kaOwmvB3SJTZpugRu6daVXU7ZNOq7XYuyrUNmogIC8UMns7csGWNxZtVsXE2NHL
 /n3b0g0yKaIKBziKlmScRKGcnybiWd02dYn1GDVJKZc8jDn9lcRUPEZfKngo2C8AQDw6z2kAy/9
 DxPUNB7xqWRVywNI+sfh1VcHWr8x6g==
X-Proofpoint-ORIG-GUID: UyWO5IO6_GFhqsdI1tqNgSwJ8iQ6IqPB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040077
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [Linux-stm32] [PATCH v2 08/11] clk: qcom: dispcc: Add support
 for display clock controller Kaanapali
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

On 12/4/25 8:14 AM, Taniya Das wrote:
> 
> 
> On 12/1/2025 6:50 PM, Konrad Dybcio wrote:
>> On 11/26/25 1:09 AM, Dmitry Baryshkov wrote:
>>> On Tue, Nov 25, 2025 at 11:15:17PM +0530, Taniya Das wrote:
>>>> Support the clock controller driver for Kaanapali to enable display SW to
>>>> be able to control the clocks.
>>>>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> ---
>>
>> [...]
>>
>>>> +/* 257.142858 MHz Configuration */
>>>
>>> This is a bit strange frequency for the boot config.
> 
> The lowest PLL configuration is used as boot config based on the
> MDP_CLK_SRC clock requirement. The PLLs on Kaanapali can support these
> lower frequencies as well.
> 
> 
>> The frequency map lists this odd cookie as the lowest predefined config,
>> perhaps it was pulled from there.
>>
> 
> Correct Konrad.
> 
>> More interestingly, the only consumer of this PLL (MDP_CLK_SRC) makes no
>> effort to use the m/n/d registers, instead relying on the PLL to re-clock
>> for its ratesetting with a fixed divider of 3 (and div1 @ XO rate).
>>
> 
> The m/n is not preferred in the cases where the PLL needs to slew to
> derive a new VCO frequency. That is the reason to keep the divider
> constant as much as possible to derive a particular frequency.

OK this is roughly what I expected, thanks for the explanation.

> 
>> 257.142858 * 3 = 771.428574 over-drives MDP_CLK_SRC, FWIW.
>>
> 
> The lowest frequency requirement is 85.7MHz and the frequency is derived
> using
> 257.142858 (PLL VCO) / 3 (RCG Div) = 85.714286 MHz
> 
> there is no over-drive at RCG of MDP.

Sorry, you're obviously right, I don't know how I got it backwards..

>> Taniya, we've seen something like this in camera too. Is there a reason
>> the frequency is being set this way?
>>
> 
> We start with the lowest frequency to configure the PLL and frequency
> requirements are decided based on usecases.

I meant the rate-change-through-PLL-reclocking, but you've answered
that above

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
