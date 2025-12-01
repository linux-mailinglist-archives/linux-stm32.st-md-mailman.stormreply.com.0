Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FCCC978E8
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Dec 2025 14:20:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66CA7C628D3;
	Mon,  1 Dec 2025 13:20:52 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B58ABC628D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Dec 2025 13:20:50 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B19Zwd2451749
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 1 Dec 2025 13:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1fT675E24P9j3zF3eg0gznwK8e2IPPsnLcZjagbqO88=; b=bwEwruD/t1+yGKKt
 3ZHxIuHSVeOF5ji03VlJy6Jw3cWxIytOR1+f+gz2Rl40FHq8w5XzH7KNMq/MC9Bg
 /1bgWW573qIlr3SIweCbbMyPaAdVHxEXVOUe3YJK/APZflOqcGsrngL5jMSeEcld
 f4tYxij89hShYJcvNNlTEfwnEm+pDdaUdHdr8PX2ex/y2VJwbiUUGHmEka9miSIr
 IgJZA5E3euiz8yCDeKcWroSn2xjafc/TAy/xlZ6T3zQOsvG2sX6FmzARY338LTYq
 Cw0UoTU6zQC44Nm2zLsAYmCzYSKSBmJ9D4Jg/MVi7YSPv57hzCeZo9kRWHYOnAIY
 zs2hUg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as8herkhx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Dec 2025 13:20:49 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-5dfb8e7d182so507262137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Dec 2025 05:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764595248; x=1765200048;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1fT675E24P9j3zF3eg0gznwK8e2IPPsnLcZjagbqO88=;
 b=hQfxc2Ka537/nuoTC5J6nB6Nch38HhtdjYAz6gh7xqSwiRQwCYYRjWMIwOHJ8jSv4d
 61V47eF0UQXk+zsaCJHmr2VLR0scp/SVjRtNi0xERAr3LBMnfdgovVSGaDVlQTxRvRB7
 7traCM0nwmi5VZtWrUXhI/vhvEAiuyzO/bVfNMT8tJSGVFgUTRiY45URtxHXLgmpXUEY
 07hf+NPwP/qqIcJtJK1VIfvQuHr1L1pRPnltwMItv+/xuit9R/YzQwpB3YhRHH25FI9z
 7ddvwcYNsVXc1lZmpqz9zkEUjbwJ6Rs8C1RJ3dTP+rLRK2jJF+qCl1cTQKgbXO3FmyGw
 fomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764595248; x=1765200048;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1fT675E24P9j3zF3eg0gznwK8e2IPPsnLcZjagbqO88=;
 b=waRJNtrDpJCciWXSwlDzh8Lgvnrk4MimMq2aklLtT81SEysnMWgnH+ag1vcdH9U4h5
 xHHczLPlcCZLGd/18RhhSzJYy3MuTjplgNGDhdsSS3JW2WjLTRvC3YdJns0w2U6eMxoW
 P4RMwakqXSnlsxNGPrdvlp70svzvJ4f95RdmbjwS+cD0HZSykiKsR94bUOro7URZn16c
 r0HXH7zyXw4XATwy7cmKBCpIDSHDctU9w6tl+vhTHmIk7TzQYqh9p3U9+3sImX9+MOec
 HpZSpCOCHaPyGI8G4OS1b8aj5vEGRP0I8YKS7JyCXyIb7jY9qwY/R8XiB+aJxr4/BiC9
 VHaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXzhjisDCyGoX9HMXHTSLddI+IH4IRsQXbSH76Oet/njRc7qbUcS1qIQZNIJ0ivXlNYj9eyjGPajf03w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxlPV3rF9gPxbQ8/zT0NyBpT9/cvRejwPZPUd8LcJvhhaj8Kb9B
 SvY9tYIXvpqaUioN9JA+R69R035mmQ7WT4wAUMjtkLXdmm4g+KZL2avSCBp6Mf7j3QY2RfjcG3i
 asyncCT5eBKcj/HCXKh36Z/XXZNEGOVP57a/gNKwNuHVwbiaSNjXRkIpmK4TEnn/uI6Qfh3E9++
 isyvewcUg=
X-Gm-Gg: ASbGncvdWNODAxxarQUs2rUFOwJyzjVFEWIps3m4FJRPI5w8ylSN1RxA5TjIL8FYLGq
 hQUiiFulvlLuvojMxUCKpN/Sp0rFZQG8zu0xN/Ctqs05B6hyM+9qBtZsFcGVrEoME+rIt8qWzrZ
 EIrFerOxZ0A2BamAGt4Qh6wD34q3h7e7kJ+ST3Nhnh4JgfYaI560PWGkDQxyCh8UAm96OGSvLF0
 6hsTyIYgxu8gISMVmcg7Fj2YUcSJsbwNg7clxFrg4upw1Gie7mumsrURiZNWJPyZZJejkqmQy39
 envU6P60Ro1JfI2T+ZIa0Oox9TZCiLlxho9jeYJcI3CJcY5jmCg0kAgM3MneTJ5ChO31hQJaP6W
 fPbVLnLZYSX1yZ8nSc29yNQ8MrBbK958QNcAYMazXQat5o29+/qfwbcoMzkU2zsXy8jo=
X-Received: by 2002:a05:6102:dd2:b0:5dd:c3ec:b76 with SMTP id
 ada2fe7eead31-5e1e66f4505mr7907307137.1.1764595248354; 
 Mon, 01 Dec 2025 05:20:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJer9mBVBtbELIfrNvmv1HkEBNnwK7vOpXOPYANlc3/9Cr+1NOG/fhoTmkAz9sJEK87Be98Q==
X-Received: by 2002:a05:6102:dd2:b0:5dd:c3ec:b76 with SMTP id
 ada2fe7eead31-5e1e66f4505mr7907275137.1.1764595247937; 
 Mon, 01 Dec 2025 05:20:47 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64751035b75sm13571646a12.20.2025.12.01.05.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 05:20:46 -0800 (PST)
Message-ID: <8d0ec7fc-6eb0-4b71-8e0f-3deaf1f489d6@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:20:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
 <w3ezxipjucswfswfg2z7b7uyu55bssqatdnbxa6jflii4j7nym@lxsnidrewepu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <w3ezxipjucswfswfg2z7b7uyu55bssqatdnbxa6jflii4j7nym@lxsnidrewepu>
X-Authority-Analysis: v=2.4 cv=LewxKzfi c=1 sm=1 tr=0 ts=692d9631 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yXmZhl0dwuD8hoocJaoA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: mLdW0GGRrgcdDMd5nvc8tS1YeiNgzTVF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwOSBTYWx0ZWRfX5t1b3RBbvcXv
 GK+EX0C8Htqw4ItGCGaK05t5kczvNSRMfT0hM7UPyuRwAGp7eLx5aJR5Jhw7IK8gAIcILgKuRpd
 GXh6eOaPbz3iD8DBzWSCf19Q+V3atBmu5s/PECbFCVF8ptDGW+vVT9zqzHWApiEKwbB7jP5KNba
 +c1Q3gxk07d3zt02sDxFLluBYDRVgtrQeuPvGb/qU7N2+qbPmm679QNHkHzccisWmyghbl3W2n7
 BRQKORNB4vaWH4wDHjbFKyWoMq/AsDWJ40dl4Y7vaK/KPKMuvNUi8g7pg5PY6PT6X9sEgANSRsC
 vj68+HCf12j3lwE5bAHP3qbP9KxYFv3QU0ZJBWhFyxr3tYWIMaoJheY/Tse436W4eA7I9u1TJqG
 GhWmzGKVAqldp7LM6mqhbpyPyBIXqA==
X-Proofpoint-ORIG-GUID: mLdW0GGRrgcdDMd5nvc8tS1YeiNgzTVF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010109
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

On 11/26/25 1:09 AM, Dmitry Baryshkov wrote:
> On Tue, Nov 25, 2025 at 11:15:17PM +0530, Taniya Das wrote:
>> Support the clock controller driver for Kaanapali to enable display SW to
>> be able to control the clocks.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---

[...]

>> +/* 257.142858 MHz Configuration */
> 
> This is a bit strange frequency for the boot config.

The frequency map lists this odd cookie as the lowest predefined config,
perhaps it was pulled from there.

More interestingly, the only consumer of this PLL (MDP_CLK_SRC) makes no
effort to use the m/n/d registers, instead relying on the PLL to re-clock
for its ratesetting with a fixed divider of 3 (and div1 @ XO rate).

257.142858 * 3 = 771.428574 over-drives MDP_CLK_SRC, FWIW.

Taniya, we've seen something like this in camera too. Is there a reason
the frequency is being set this way?

Konrad

> 
>> +static const struct alpha_pll_config disp_cc_pll0_config = {
>> +	.l = 0xd,
>> +	.cal_l = 0x48,
>> +	.alpha = 0x6492,
>> +	.config_ctl_val = 0x25c400e7,
>> +	.config_ctl_hi_val = 0x0a8062e0,
>> +	.config_ctl_hi1_val = 0xf51dea20,
>> +	.user_ctl_val = 0x00000008,
>> +	.user_ctl_hi_val = 0x00000002,
>> +};
>> +
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
