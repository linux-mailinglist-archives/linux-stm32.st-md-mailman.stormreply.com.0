Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC62CCF69C
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Dec 2025 11:39:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E9F1C1A97F;
	Fri, 19 Dec 2025 10:39:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D43DC0693F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 10:39:29 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BJ4c8Cu3559086
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 19 Dec 2025 10:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2DKR9AVeR0G3xfx3EGv4Fd4mJGH4v4vlNnGmLfHUTiE=; b=aa9J8c0Q+s4A6fxi
 RpB373kzsso7Q4DLJJAahDc6UK1L8+3B/dd30QFSYPUNyd11k60pNBjPqqI9B3Yq
 k9hh1cYboVg8HxEOx+SHQxG+7aCtLGwD69FHnHSBaae7Nr1830F4ORaQumyakOci
 fHNg1tao98C6RYYEwl8Gg36E9Dym4oGvnhDBk+auUrBBx1URKZUvFDqLSNQkpqLo
 yO1/RnyvPBp/mV9CL3v+LfhtYy3U011LGADnFG5GAxi4HttPfqUBM3zaBL7p7KTd
 YOlN3fw7o83aej3k+KIo/67qlXOS1n/Pyz5Ial4QDyws2HkLIYBgFnoaOK9ySDrL
 YMfb7g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2cac85-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 10:39:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-29f1f79d6afso25292495ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 02:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766140767; x=1766745567;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2DKR9AVeR0G3xfx3EGv4Fd4mJGH4v4vlNnGmLfHUTiE=;
 b=UiYF7ACW+HN9Gbhe3C1CfzJTGTWyUNkXvTRHBTYQ63xQ1Yt6+UFk/OZ4cZhTQBDKNO
 14nl+WN/iZK+hLWZ/HoRMN+suAtd/X/xX5zsHNDh4kmgd6m8sk9o62Ko2Fop7s+Z9jBB
 ivCjHfpQ+GC2kA1srCO57ogh+su0OuhHGVy4DdfqQeu9RXZ2HQFHBVskyUCJwEYFR5G1
 LtWKyGd5mlie2Eb0Nn/WF9+skI6XAljyA2Q5cfiLoiFH//ni8wwp8W5tMFMZd97prt+X
 OyIKh/L5XLHC4cbg9dB/dfWa1ljk2xR2U73VuE8+CNWP5Z5wekwLYgYb11CVCC3IBOLq
 zo6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766140767; x=1766745567;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2DKR9AVeR0G3xfx3EGv4Fd4mJGH4v4vlNnGmLfHUTiE=;
 b=U53dYXTQ/YeuHUTagXkunVTYXywMZ0fZ9ji7CZLPl6S4XxDS/4g62aSJJG7EliDv27
 xHK6/+2M5KMF+9TpB9Lp9eayTY4zqW+Nczv6MJgochrrM3uoGdZrhJlorcDoqBQ99nQ6
 5aIWZWXPAiV3nt1ARzM6y5YFTlaXZpfOfmwwCUuI+h5aPaBybXN6rgOpt/yOfvi07JGn
 mXwrJIbh5r3UDXcEif3nmwiTAgXfXcUDeN+m/7Qc/sLWSan41irqMPqV/6++qa2wuGdw
 Y8u64vCWTALkcs6AQwXopYMJYaVzIclvtJRNxdc3r3IJKYuzRJRAaZC+iKhnKm19gIuh
 27Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHtSlpKZHAyBkGMvfFq2nArFIN2jN2XMARs6ubyAGhOJVEty4oqJpXqMlTTDIxdTSWrF1IgEVC/RMLAQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzaI/Dik9h1ZV4tiDlEzJwVvl/0XAVq4QcI+TsKujRz8SvOkRjp
 M7n+ROroi4865mGTd+0weSPq7Kv1k0Pc3pO1Y7M9pxLYN4yRlNzG11sBgXGbKwjFfjDh4hw0q1j
 J2etjuCMikzudPsuMX4Im4olxxE/OlJpmF5l/ni4MF8B6JatcGdJRSwylrllHAZmyntpjlNipIr
 DXO7uR6/g=
X-Gm-Gg: AY/fxX6rjEr9SDzXi0pFJlKsBQfvZ37BxRb4sqpl9I3M5K946DN3/TN+2bP4VTvwZIZ
 kgccStHeCdrOpo7b9WPi55sxH+5zkTVcmPCAerIOb+95E+/W88RTIfAy6aVTJSXZQbNGaNCuTRr
 atUqLZC6Jwr2hDg/3ZsP+GP4xXTmu3G1lIKTaQhtLxOZFCvfAXJrMPzDXg+p9rvItg7oKB+dxq9
 JKAEPWEgHvnS7I4IWfS9aNUXO2cP9arVQCL7KooHYWWRNkqcJOcDJW0ao6rTCj4SzN6VKMq7c1o
 KJRP1IlFHR1GOlCEs2imWjlvJYTdb2NkzsJH4DuNnXcG9XF2CoRUPFZpmaIsuhvpQkALYtW8Wn2
 jrwQNPZnIa4wUvOkeV+1hLXarXVdHpYUwWVLjlA==
X-Received: by 2002:a17:902:e884:b0:2a0:b467:a7ce with SMTP id
 d9443c01a7336-2a2f27352a7mr27092995ad.36.1766140767109; 
 Fri, 19 Dec 2025 02:39:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHjjNmZyZL1M8MmrxLZpRtoEvO3hbj9TdfoS3U+i8ntekOrSW1gOPRLwiSGrbGBtNeQBc0kQ==
X-Received: by 2002:a17:902:e884:b0:2a0:b467:a7ce with SMTP id
 d9443c01a7336-2a2f27352a7mr27092615ad.36.1766140766585; 
 Fri, 19 Dec 2025 02:39:26 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c66472sm19494225ad.13.2025.12.19.02.39.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 02:39:26 -0800 (PST)
Message-ID: <57ab2d5d-5aaa-4f9c-83ae-0f7ebc1e648b@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 16:09:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-7-fb44e78f300b@oss.qualcomm.com>
 <20251126-elated-stoic-scorpion-25b630@kuoka>
 <de44560d-4ed8-41fe-be7b-56412b933a8c@oss.qualcomm.com>
 <fbe39eac-7c92-4a08-bafb-31e5c51a0613@kernel.org>
 <503f445e-0d12-407d-bc77-f48ad335639b@oss.qualcomm.com>
 <e8bdb176-b6fb-4dd2-8b5b-9da8073fa915@kernel.org>
 <ca118faf-3451-4b83-9074-82bc5e1f731e@oss.qualcomm.com>
 <3e8128f4-3cba-4c13-a846-e5f1638a1e0f@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <3e8128f4-3cba-4c13-a846-e5f1638a1e0f@kernel.org>
X-Authority-Analysis: v=2.4 cv=cpSWUl4i c=1 sm=1 tr=0 ts=69452b5f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bZysObWQuULb7_ZgAGEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NyBTYWx0ZWRfX7IgAtuabYdRe
 h9H8V6PeYVxx4Q/uGuOMbkOlyveGZsY20fiiDFsGnlfD64ZN0q8TyyaY6vZhFilEWsNOFJ4Wp2C
 G0VfEUosccf7RJRTeAzigoGuwnaCOP4oYQ3Jo7R0utfDL4TGvqWaBp1gMo/12WUkjwhvV39OSi9
 ey/rkKcDu06jqgu9VzWq1GFS3Xvr/iunfXki5xlKfY7QeAnh9nGCDZXcWNubL7SBQylLXRYVVJh
 njfkJQZ4vQK/n1Uuh/RAF6uionVardZ0rCyWCWYXbjNR7CxuctFHo4TThA5UTrhyFAC34llBO5a
 xhyEZh3O6kkELzKZUIf2z6bKv/NTkPfku3u7W5pbRBXDdEUK3Ca559trgNlT0DgRUQiz1YdlbY/
 Tpi9lGk8qyvob93KkAIqbvSa/EmvvRaA42T5fkEhiiinRnW84LVFseiebDW4K8Sc7FRJh7U99RE
 CL4TXWPbKESRkYbfPaA==
X-Proofpoint-GUID: Bu3oWhGtFQf9n6xYf8sr__vRtk7XHy7x
X-Proofpoint-ORIG-GUID: Bu3oWhGtFQf9n6xYf8sr__vRtk7XHy7x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190087
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 07/11] dt-bindings: clock: qcom:
 document the Kaanapali GPU Clock Controller
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



On 12/17/2025 7:24 PM, Krzysztof Kozlowski wrote:
> On 17/12/2025 14:21, Konrad Dybcio wrote:
>> On 12/17/25 11:09 AM, Krzysztof Kozlowski wrote:
>>> On 17/12/2025 10:32, Taniya Das wrote:
>>>>>>
>>>>>> We would like to leverage the existing common clock driver(GDSC) code to
>>>>>
>>>>> Fix the driver code if it cannot handle other cells. Your drivers do not
>>>>> matter for choices made in bindings.
>>>>>
>>>>
>>>> As it is still a clock controller from hardware design and in SW I will
>>>> be map the entire hardware region and this way this clock controller
>>>> will also be aligned to the existing clock controllers and keep the
>>>> #power-domain-cells = <1> as other CCs.
>>>
>>> I don't see how this resolves my comment.
>>
>> Spanning the entire 0x6000-long block will remove your worry about this
>> description only being 2-register-wide
> 
> But that was not the comment here. Taniya replied under comment about
> cells. We are not discussing here some other things...
> 

I will review and add support for handling #power-domain-cells = <0> in
our common code of clock & gdsc. However, the initial intent was to keep
the GDSC phandle uniform across chipsets as this is a clock controller
by hardware design, which is why #power-domain-cells was originally set
to <1>.

-- 
Thanks,
Taniya Das

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
