Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BF1A59016
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Mar 2025 10:46:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53351C78F99;
	Mon, 10 Mar 2025 09:46:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34508C78F96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 09:46:16 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A8xoRS012672
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 10 Mar 2025 09:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ih4+jHDjFRiA69gnHwzJvT/5UWdEO8jOvDrfGXowHW8=; b=Ur26tFllRqWg3bp8
 zrTPDYoFq4wRonBIXz9aJTZx4kZLz+AGWI8lOIj26/WN0knnfyVT3JpAEJRAb32e
 6v62GwAn3rBZI0VT0PtsY/frrnlua1QrAK9ZCewEE1VEg0Y1qgaW8ms57o4o+PwE
 mNK88HHL+6jHFrISjByy+w9u6PWr6sm2+XhdgzrtxHD8G6NLYNvvU/DzMPJmF+8a
 cikikbdqkTX4XnxIOt+kwYsy69rgeco0u1e5/JHB7VC4bY868a7V8xpnIt/YdxLG
 mH22jH6KXLdm4uySxxn34xLLWFKTgtL8TRYkcQIPunhlWNDvklPZkjU39RHYolN1
 TzZ8bg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ex0ve0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 09:46:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c552802e9fso4003085a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 02:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741599974; x=1742204774;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ih4+jHDjFRiA69gnHwzJvT/5UWdEO8jOvDrfGXowHW8=;
 b=sf3V7axibxmU/EOwo0AVjrTPX8HQIzMe4ifm+vg8TLDudB1UuPF9x2cEkkN5xjjxFb
 rsFin0vYx0a1qKjwBzNgJXGzRQqujVh+ZQYDTy2oW0hzTVZPgR6VnqXvtcAUnAF1YSey
 ceTO8b7vMHSQu6FAqBQRsH77/0AiYFLdxfsR1pQDvUyTfU3TQH/eTqMY/AKd4aMmgeZ+
 qCsPD4HX+9/O8MHQICTMeGcKsX1zeyFd92q/EdpoMT5Zcrt6VFQliji2NpzkgeM3ofpu
 B4OJBYTD9XK87QEUhdZi3Y2EpT86VVoAaaMKa+2QHNp1/KKbXYcPDzAyIv4yvsE+wlmo
 ODhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJEqZBSnE7Sd6QptUAL27rnZFH8UWWObpxLg7Ra/1Nx9+tLeSNjjq+Zm1pTBGz1r3C+nctxBqQ/B1koQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx50t9/aWn+wrNZ+zspLbAd9zmEF4kjriIJRJSUrbGGVIL925Mm
 8yS4dunKuD5rqepZguN6N09PoXLTAKYnntdxsZOuAUQN2C35a5B/Sa1LPti2wakbsUiFp/DPQqM
 uF6VzNCX0yrHh0PDxCpvNoriCK/vvV8B662s7pARU35ZIjVMKnsvB/YBSXlt1X9kLpwK3rYM1dh
 Puhrc=
X-Gm-Gg: ASbGncsOikOTnCSEgGujl3cwb391ltaS+7XD6/+DyFaT9KW9eD1DsXPLOR3/PLxIA1A
 nMGatwegoO/7Bztkq3K1lf3YbNaH27VKHCWayRdKQLHQJlplIzQq1d7FMWlUVOwb9jgg2tZifY3
 3ibolWQkoKU5K+ikfPe7VtFZWvKMmrc1YUPmPKDg7bi6drrRfOO7LhYvCIjv+jb3PPAs8nEwzCN
 fWIE2EnZRAWK/0ph1KqysjoXffvYN+84G5RPxCGv4BeBJ4E/g5+6kXEL+RbGpq7wpn+BFNl3mOE
 gI2X9SbTrCpvxr0rOBTj2aTfLdZ6Rb5zj8ORjAAUCa8juH2p4LWm/MI9RKgyDIA/VsiBmA==
X-Received: by 2002:a05:620a:2612:b0:7c5:18b7:4f25 with SMTP id
 af79cd13be357-7c53e1c4375mr521303885a.9.1741599974089; 
 Mon, 10 Mar 2025 02:46:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7YuheYHS6PGU9dToJsmdjfNsj9OapzQsAAm6IkqoYz7wDIJ4He+ANVKbuM5AnL8AZiUxVHw==
X-Received: by 2002:a05:620a:2612:b0:7c5:18b7:4f25 with SMTP id
 af79cd13be357-7c53e1c4375mr521302185a.9.1741599973726; 
 Mon, 10 Mar 2025 02:46:13 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac2394826absm747393566b.55.2025.03.10.02.46.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 02:46:13 -0700 (PDT)
Message-ID: <dcbdeb90-d274-4914-84d3-24bd1d6e826e@oss.qualcomm.com>
Date: Mon, 10 Mar 2025 10:46:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <quic_jiegan@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
 <20250303032931.2500935-11-quic_jiegan@quicinc.com>
 <0be31ecd-4386-4eb6-ad6f-a4409a3fc6ad@arm.com>
 <942d0b2f-c3c1-466d-b894-9dd32ec4e6a1@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <942d0b2f-c3c1-466d-b894-9dd32ec4e6a1@quicinc.com>
X-Proofpoint-ORIG-GUID: CeF20M1n-srJAgJe5WDXo7VaCR5CJIxY
X-Authority-Analysis: v=2.4 cv=f/qyBPyM c=1 sm=1 tr=0 ts=67ceb4e6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=7CQSdrXTAAAA:8 a=YlNZv3wqyhfgsvI1z0IA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: CeF20M1n-srJAgJe5WDXo7VaCR5CJIxY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=571 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100076
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v15 10/10] arm64: dts: qcom: sa8775p: Add
 CTCU and ETR nodes
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

On 10.03.2025 3:57 AM, Jie Gan wrote:
> 
> 
> On 3/4/2025 8:28 PM, Suzuki K Poulose wrote:
>> On 03/03/2025 03:29, Jie Gan wrote:
>>> Add CTCU and ETR nodes in DT to enable related functionalities.
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>
>> Assuming this goes via the soc tree,
>>
>> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Hi Bjorn, Konrad
> 
> Gentle ping.
> 
> The driver part has applied. BTW, I found this patch has a conflict on tag next-20250307, do you need me to send a new rebased patch?

Yes, please resend this just this one, rebased on next/master

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
