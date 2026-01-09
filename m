Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DB7D0ADA4
	for <lists+linux-stm32@lfdr.de>; Fri, 09 Jan 2026 16:20:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31C1BC8F292;
	Fri,  9 Jan 2026 15:20:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E4EBC8F291
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jan 2026 15:20:31 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6098T2IJ3729572
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 9 Jan 2026 15:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 49tXLgJm9KB8UQ6tr2ES8NVrNO8u4KMgkHOdrGNgtn0=; b=KxPoJCGMd2q3ygLU
 Hq8LIjz4xl5PNqjiQ5vpUjELOg4YFU0Galj1+LDodqf1jmHCZyBHtpXc0zsWDQHq
 AOnk6oLA6TWcPSkliboJhzvpqJqSi+P8fIRapAv3PpEVjUkuBLYM2bq2JSm3t3LX
 mixYHafZqiZQmE5Xbph8rV1OkitED2NJGLwjSRoGw3DRMCWs56awEQYiRrtCVKoq
 3/HUzuiYfRnUL8DUErBdscKxUBEwLSOGvYYuYLW2zURUcBqQ2Z9lcqOAPGwt7tp7
 vlPzObkiYa/JfA4PDQb8kYaUu3rObLeJRAylvPJDpxR+xVuPrdMTiE61ynlbtaY7
 hINskA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjpmkjgh3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Jan 2026 15:20:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b24a25cff5so1286871985a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Jan 2026 07:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767972028; x=1768576828;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=49tXLgJm9KB8UQ6tr2ES8NVrNO8u4KMgkHOdrGNgtn0=;
 b=D5Tf+yoEN5Gou5W4X6QLnJQp4Kj7RCln8EeNiJe6Q9NANWofg6UHPjAI5LeVSsz2dT
 n0v16pi5hrO2cqWlMl77yGCHsdQitxtjw2gdtaRM4T+m8PPrOM2Sc0kwmumXcmu0xLo+
 XTxJG2ALjyf0PuhwTo2ibPKOqbMNEGPkb0zcAwGKp7CGieeBHZ5meks5jW7Imo6DnlLe
 240lEm8J/RDGd+x+vFg6Ml/5I1Bpn+RqcRjGJ2L8CBE9YKbsFIEoKJv8YwiUCPjjcj2p
 Pzzp+ECSmMn81IdEooP4Oli8aRcJ2iuFvj7W6jeh0I6ezO7OEzmviSKx0cbPvyTgGN5v
 nFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767972028; x=1768576828;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=49tXLgJm9KB8UQ6tr2ES8NVrNO8u4KMgkHOdrGNgtn0=;
 b=rQJIfcU860a/wa9tl2EbPqZX87M/hs8ciY0DRWc1F4vvm8rKUijyycMouDLWUq2C0+
 0M42MeggweqllUOa1N+SFFQWtPauOJADWK9WL+2yvMdNCQSrMbzikSyBaDm/hFfkzs0r
 vKvNy1adfkh7VjClxnuPkhvv35/T/NFZcIMmdxAK2lx3zt7/MMJa65Sm5WsmfVyP2TAc
 Une34hMTC6tWkjQpVlFhZMM/twpkf6nGYVNl7NPoGCCBWoGToxPNQbmxU8YoQWkXFQ2V
 XgSaCy0g1oLqgD8SfBQsX33nbDwoFD5uA+QDM8bGbUh0AvVx99IjDewUTuOpY+j463a1
 +98w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVuO8VpknbArDv0QYl95IcNmKRE2lpqW3C9roVG58x5HO/TqzFFjyBeiWOs+BlzZYxw2gNJul2e1WGAQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzavgLB87FDZLBe3CwS7k7K3Iq2g4K6XymQWf4Ya5HSm5Mv9XnW
 uuG+rwFwQCX9TrAAtHQ5YpmyauynHPjQSIF0inpoL2ImOhgfPZ3P1RBkOc8/djByzDV9tXH6MyU
 8nKUPsR8Faz7yHFnezVKuqd570S1nORc6b4CogqgymSpNXT0VBQi3j1G0O48nH6b66KvAoJu40i
 PrIXFZ9lI=
X-Gm-Gg: AY/fxX4Of9whjZedNddywtERDhBfssqSMCwjIV3rfWfMAt3WYOfroyCW0LhOB0+nwt8
 63HYGw5mKnq7NKILp5N02D+fljGhdoNhlo2XbXUM79WrS1FHs9JatM4rOSu5rNJEs9Wu2FFDSE8
 BGgrhtOGeAoeHt4j//iIzDhOWASeTsh632GiqcIlFMUtvPosXXt2vlyXFYMstHwKqgHrtmRL5qt
 ucoSAliS/DBohS43YG2+XsQjDEhoZbLPCqy9rlGkF1EMJpocWR2ZqBVSJguASCOLMX2MEBXrmor
 qGjmgu6hGyoT/qQ5XeZwh/yUgNQ4M4zQO1I6qv+o8kr7t2mJYEu5R+xmhi7ukEvuMAD31Ue+xyw
 ybmw7w3W+hpPhXV+fCG+zaWkYnRapalcGUTS0pw==
X-Received: by 2002:a05:620a:191b:b0:8b2:e8a0:f4e with SMTP id
 af79cd13be357-8c389411a4emr1096205285a.77.1767972028255; 
 Fri, 09 Jan 2026 07:20:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4T7EpPkz3EWkla3fr6+RN+eZME331kblvXjFVWSsrchwbSfgu8tBxJVnkAZJ/PMc9qkoTFg==
X-Received: by 2002:a05:620a:191b:b0:8b2:e8a0:f4e with SMTP id
 af79cd13be357-8c389411a4emr1096199885a.77.1767972027621; 
 Fri, 09 Jan 2026 07:20:27 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f6ef885sm209365935e9.9.2026.01.09.07.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 07:20:27 -0800 (PST)
Message-ID: <955e5ed7-6469-4f17-9e8c-3ee06f5dc3bc@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 16:20:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260105143657.383621-6-krzysztof.kozlowski@oss.qualcomm.com>
 <fe8bdea9-4bd2-4200-8b7c-3c231dc6dcb2@foss.st.com>
 <ccebe9a6-34e7-4699-a4ff-1ee925f9c150@oss.qualcomm.com>
 <cd8fc344-37a0-4281-b3c0-29514b97f5f3@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <cd8fc344-37a0-4281-b3c0-29514b97f5f3@foss.st.com>
X-Authority-Analysis: v=2.4 cv=YNiSCBGx c=1 sm=1 tr=0 ts=69611cbd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=xCSfWrHGVKLGKJWD7hwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: CCffnAo9LPvKh_cArFjWucyycQBpXNcu
X-Proofpoint-ORIG-GUID: CCffnAo9LPvKh_cArFjWucyycQBpXNcu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExNCBTYWx0ZWRfX+alDAUMzQ3bx
 oauQywLsQkr3xz+RmpMupV8/w7FyOb/YwI/NXjvuL2PD/tdBKWHr/DBnIL7MpM5/GmMOUUqkA18
 Q7SCEzrnA0CNGPmFrVpQKuKcbU8Lw8gFKswcbx/PlEGwsjBJ5vuIE4bQhD66jkfZIsrfSDIMTJn
 5jmscEVfBPFz5rcPzh3cA2dlbiKL5HOdSs2VZwlrXz9Emcd5NTBq+D3IfXAp2iWq+wP/DB7HvF8
 rpgViMLdxf/KZUMiz4AEp7JD//VJlBvUAithKTAin9cA15iOxBGYueK92Qu9VnrJLoNq+/S3njW
 GM4cL5OlOS/c+5jtyjRz/wTHaDMQF87uSIdUV47y/yJqfO6XKl2cfEtHOcT/P21zIe2K2L1jXXW
 M850iFr9PH63iIWK5tdXPrKvBV5xqRiHi3Cj6mkdCxpOL/DntAzck7vyJboyzUIr8LRwXIqklqw
 WCd3j2yDy1vgL00FXaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090114
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [Linux-stm32] [PATCH v2 3/3] bus: stm32_firewall: Use scoped
 allocation to simplify cleanup
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

On 09/01/2026 13:34, Gatien CHEVALLIER wrote:
> 
> 
> On 1/9/26 12:55, Krzysztof Kozlowski wrote:
>> On 09/01/2026 11:37, Gatien CHEVALLIER wrote:
>>> On 1/5/26 15:37, Krzysztof Kozlowski wrote:
>>>> Allocate the memory with scoped/cleanup.h to reduce error handling and
>>>> make the code a bit simpler.
>>>>
>>>> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> 1. New patch
>>>> ---
>>>>    drivers/bus/stm32_firewall.c | 10 +++-------
>>>>    1 file changed, 3 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
>>>> index fae881cea9a0..92414a4c7bb1 100644
>>>> --- a/drivers/bus/stm32_firewall.c
>>>> +++ b/drivers/bus/stm32_firewall.c
>>>> @@ -240,7 +240,6 @@ EXPORT_SYMBOL_GPL(stm32_firewall_controller_unregister);
>>>>    
>>>>    int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
>>>>    {
>>>> -	struct stm32_firewall *firewalls;
>>>>    	struct device *parent;
>>>>    	unsigned int i;
>>>>    	int len;
>>>> @@ -257,15 +256,14 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
>>>>    		if (len <= 0)
>>>>    			return -EINVAL;
>>>>    
>>>> -		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
>>>> +		struct stm32_firewall *firewalls __free(kfree) =
>>>> +			kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
>>>
>>> Hello,
>>>
>>> I'd prefer to keep declarations separated.
>>
>> Separated how? This is the coding style of cleanup (which is quite
>> explicit around other styles)? Or you meant one line without wrapping?
>>
> 
> I found odd to declare and assign a variable mid-loop but I found
> multiple occurrences of the same kind of cleanup.
> 
> You can drop my comment, I'm fine with how it is. Thanks for the
> cleanup.
> 

Sure, just to let you know - it is fair to reject cleanup.h entirely for
code you maintain (like netdev did). I only disagree with sort of
semi-cleanup.h without following its declaration and initialization
rules, because it is more error-prone, leads to bugs and often does not
make the code easier to read/simpler.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
