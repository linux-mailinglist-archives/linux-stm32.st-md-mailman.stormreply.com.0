Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5205FCC6CE1
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Dec 2025 10:32:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1261C58D7A;
	Wed, 17 Dec 2025 09:32:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25057C01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Dec 2025 09:32:17 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BH3FMqD1281810
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 17 Dec 2025 09:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 k5eSqAi+UmVzEQJzPdvYOyZ8r83jZpTMhH6t4IKjvyc=; b=W94gv6xWyx61wULt
 Ek1YjlEgwrMYRchM8lepWXGvncaTCf0L5BwyIPWatQ/g6dGbx2XEvGmhcQcIYVBo
 KsXcUGNe7ZiOAkckuVJtN3anaiQUw25cnP336Ey51ctNlSxxpBYke9O8AhxUSCSO
 qZbG2N6+DVOrSSLPMVkbqvWsmxM375FhNbIIclSVfu/xnCcX/mq7LFQWlXAJUli2
 xRmoE0T8E9LbOtZFJtdat1WMezMqQXmY9mYbpaW2tJ6b2RbYsAkqfq5z2fH98nZw
 8ehJU3EC2T9vfybnwZ5ECuwlcblQVGdpusc5JppVI9sjYe+r6aviOl3C1nVLfAX/
 b06H9Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fe29uq5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Dec 2025 09:32:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-34c48a76e75so8322500a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Dec 2025 01:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765963935; x=1766568735;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k5eSqAi+UmVzEQJzPdvYOyZ8r83jZpTMhH6t4IKjvyc=;
 b=kpcfZotnLH8Evkzb0WLoGF13S/HRzzov0xqqotDLc5+E4ty1iMZioriIkZsZolW1sB
 RttNsl5fp3EvhgjcaDisz7Otb1V0vLy2v6/8iL1+kdQ8WgtcXDvMjBM1Tzo0K+f0GvQ6
 RinJvdsqsirk7NKvM5sm7K3Aklrm4yjRM+DSOgREXIXijr/Nb4QGK6TXaRuTo326zFeQ
 4oHMUIIJp0vWI7O1hr2lNqkUPLdDjtwE5iDlmJ9WxXwNDeBdAk/Ris+ODIF1opDRSQ/T
 jiwCZZPYvNcOMBQnu+H5u0fcC6hiZQ+X2J9F0tLUQs5nqlETJ8PCJbbDAqtY2SRCLp2M
 dVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765963935; x=1766568735;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k5eSqAi+UmVzEQJzPdvYOyZ8r83jZpTMhH6t4IKjvyc=;
 b=Ry3kk2edpTf7nblMrX8Z5TDpMUUTd68RgBtRIY3lst2h9dUETaAJ36Cx2ZuqkLh4Vs
 qsnu2RUr39Tta+UQegmhoL7DtXQpUgoVU+5knFvW3Sf5g9eomMgviP2gkXw7gAwXgxN6
 V9WK/Pp3CEr7XZh8/quVIiFPP8Uqv3kF1+gr3TMvc0sKFvhADwB97H7mfuQA0mck9Pt4
 iScYI2V2gZulxBhyEJNxUyOnvVvwU/trvJSYQ9tqsekhuk94bcGokAfmF7hHMJnUM1zO
 ixii35xspHZWOYPUjNY9KMrOLPBeRednMRerSBtA7hoCg4PjGrDPCCdGuoP9R1aLU+ie
 Jogw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSySrt87+8nMJNc4GEz+s6gof99pGBVFeAiF4vBC8A2aKTIrnpmlJqG4GsoW6dhHDTDA2f07OouoXTrg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyXV63AbIkLYx9ZEpv+O8dAeoeFn8vP+a0SjPrsnTLp1NPon3GR
 Ri1fpVE3DP48rtCIUpuFeCICyQd3JPZZaQ0k9oLxC5Eh9O7v4H4we6X1URy+1QR3oCfZLdEDGUn
 5moD+YKey2GoHpbs7FQMM88FcGAmwikGFby1WVUvD/9I/EY1m/WuymYcfObL1nXDhQorlCgKraS
 JvHgqgd9U=
X-Gm-Gg: AY/fxX7A15KpNt2M8QghvbYsywCURJb3zseXzODl3bsEsH9cc1QNJOWwTYQExG22+mV
 l6XV5V9pxXAiuDtp0dXWp5J1abvTzXmrs7hk1lWCaFstULS1lMdpwgsQ80sgAxy1MVdnlCmE8yL
 b7mIUFILdhaLhuv4cVqKJIoDamVnH0yJZDj8gxJIeqq14h6AruqpoDIzYalPNiStKdqgmggVkl+
 v8AnUNg/bSuz2ZtgNRuNU15ouyc6pCgKAH7vQWVbtOLtzgEo8LruNXCEydn0eOXzXwdStXHtor9
 We1nkJA4lIy7fYxcFWFQWVj7dqS3pGPfTBxVh3E5jcwcJ9td2btWbaiuqMhI/SRpitb92LQYt8C
 PUFOHCysDFnsY4viRkDUS4p91kry8sR1KS9L0
X-Received: by 2002:a17:90b:37c5:b0:341:2b78:61b8 with SMTP id
 98e67ed59e1d1-34abd75b84cmr16118269a91.20.1765963935256; 
 Wed, 17 Dec 2025 01:32:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2IAzyeAsxmbkCnxnu4u0xxCDf9pVYnBNLb9NM9pOCNAkCdEN4BEa2l81OARdkqZ8OLtxezA==
X-Received: by 2002:a17:90b:37c5:b0:341:2b78:61b8 with SMTP id
 98e67ed59e1d1-34abd75b84cmr16118239a91.20.1765963934714; 
 Wed, 17 Dec 2025 01:32:14 -0800 (PST)
Received: from [10.218.35.249] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34cfdc607c0sm1774392a91.12.2025.12.17.01.32.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 01:32:14 -0800 (PST)
Message-ID: <503f445e-0d12-407d-bc77-f48ad335639b@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 15:02:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-7-fb44e78f300b@oss.qualcomm.com>
 <20251126-elated-stoic-scorpion-25b630@kuoka>
 <de44560d-4ed8-41fe-be7b-56412b933a8c@oss.qualcomm.com>
 <fbe39eac-7c92-4a08-bafb-31e5c51a0613@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <fbe39eac-7c92-4a08-bafb-31e5c51a0613@kernel.org>
X-Proofpoint-GUID: OaSbUCjQQe2kyHKJoesve_uq3RFNAnPS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3NSBTYWx0ZWRfX86YHjJEhnIQv
 uixPHQohREs4dJqLH7mKZBOupfXBAcR8eTACMJ+g00UBrSXBCDab7OTLBWID6o1JYRFnNeqWUPu
 ScCjVLPcLQyeuGZG/SHVZd4fKkwHg/kuSds40dPS+MxsZOLGh1yyoPT6D7Z5mPkkK2RosPVtAOV
 VFMcHo4oghwYWujR+wroB4S8ANwI/OdjmRQXx7YkJ4NXu9MJfzbCK0Rn0u+Vd41hfOkH8vBy6Ds
 IORF43IrgaZ+y7+6ilr/ovWkgKt5q+MKXOaOkbM8yyX5aVKcttNaFdGV5NyUlyX1jh6SLbhQ9ov
 WCNmMTMzH+SABEBUOC2SJV/D2TKI/UnirPrlw3lbsvLnvCbDvUQSKUcNiXC1gQ6MyDts+MKdoIc
 bbR8cZMn6FCl4B5NxBlwniD+gqPf7A==
X-Proofpoint-ORIG-GUID: OaSbUCjQQe2kyHKJoesve_uq3RFNAnPS
X-Authority-Analysis: v=2.4 cv=HpN72kTS c=1 sm=1 tr=0 ts=694278a0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EdL18t7L_n9XgEVTQngA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170075
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



On 12/16/2025 2:21 PM, Krzysztof Kozlowski wrote:
> On 04/12/2025 07:49, Taniya Das wrote:
>>>> +  power-domains:
>>>> +    description:
>>>> +      Power domains required for the clock controller to operate
>>>> +    items:
>>>> +      - description: GFX power domain
>>>> +      - description: GMXC power domain
>>>> +      - description: GPUCC(CX) power domain
>>>> +
>>>> +  '#power-domain-cells':
>>>
>>> Power domain controllers do not belong to clocks, so this is:
>>> 1. Misplaced - wrong folder
>>> 2. Probably wrongly named. gxclkctl sounds like clock controller, but
>>> this is domain controller?
>>>
>>
>> The GFXCLKCTL is actually a clock controller which has PLLs, clocks and
>> Power domains (GDSC), but the requirement here is to use the GDSC from
>> the clock controller to recover the GPU firmware in case of any
>> failure/hangs. The rest of the resources of the clock controller are
>> being used by the firmware of GPU. The GDSC is a clock controller
>> resource and modeled from the clock controller drivers across chipsets.
> 
> This should be somewhere explained.

I will capture it in the binding description in the next patch set.

> 
>>
>>>> +    const: 1
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - power-domains
>>>> +  - '#power-domain-cells'
>>>> +
>>>> +unevaluatedProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>>>> +    soc {
>>>> +        #address-cells = <2>;
>>>> +        #size-cells = <2>;
>>>> +
>>>> +        clock-controller@3d68024 {
>>>> +            compatible = "qcom,kaanapali-gxclkctl";
>>>> +            reg = <0 0x3d68024 0x0 0x8>;
>>>
>>> Keep consistent hex, so first 0 -> 0x0.
>>
>> Sure, will fix this.
>>
>>> But the problem is that you defined a device for two registers,
>>> basically one domain. I have doubts now whether this is complete and
>>> real device.
>>>
>>
>> As the Linux GPU driver requires only the GDSC, I have mapped the region
>> which is required by the clock controller driver. If required, the
>> entire region can be mapped as well.
> 
> Required is to properly describe the hardware, please read writing
> bindings doc.
> 

Sure, will map the entire region to be describe the entire hardware.

>>
>>>> +            power-domains = <&rpmhpd RPMHPD_GFX>,
>>>> +                            <&rpmhpd RPMHPD_GMXC>,
>>>> +                            <&gpucc 0>;
>>>> +            #power-domain-cells = <1>;
>>>
>>> And cells 1 makes no sense in such case.
>>>
>>
>> We would like to leverage the existing common clock driver(GDSC) code to
> 
> Fix the driver code if it cannot handle other cells. Your drivers do not
> matter for choices made in bindings.
> 

As it is still a clock controller from hardware design and in SW I will
be map the entire hardware region and this way this clock controller
will also be aligned to the existing clock controllers and keep the
#power-domain-cells = <1> as other CCs.

>> register the power-domains and also maintain uniformity across chipsets
>> and consistency in consumer GDSC phandle usage.
> 
> There is no such consistency rule. Don't make up your own rules.
> 
-- 
Thanks,
Taniya Das

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
