Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DB2CCFF2B
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Dec 2025 14:02:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3FF9C87EDF;
	Fri, 19 Dec 2025 13:02:11 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DE0FC87EDE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 13:02:10 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BJBXckF091384
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 19 Dec 2025 13:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SZXL63hhjyW+1jMgBiewMjiLdhPV4CzHI9+MzSuzuiY=; b=FIvZ7eah4EyNSe0M
 k0GSK5z2lLWta2ZF42Yp+1A42yc6PC2oSiM/4Z2q6NCOwcT2DjwPmht2wszW6NLd
 7QxVx25gTSBOFkZnTmJf0yiOKFXqV8cpHe2pJbx5ACWoBkkHItdpqwSG6E51h4qg
 O0cBE7VnIgDSMCMmuULcrqvBwtBHpqpxLfCscj3yI/6XGa26iIBIssgG+p6wbgTD
 mfoe1fTAjLusa1cZXFa9ZwwiW/Y2E3xbeMol6QTlaa/foqlypubAZKvS1Rq6OR5n
 Iv1mlMC1QfVWH+0e8JCDfR+CeTiO0Lhd9wHh490/MAFYOObSAg6U4P+0eF54s9Ok
 eZQ8Ig==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2eaq87-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 13:02:08 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-93f4f5e8574so201832241.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 05:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766149328; x=1766754128;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SZXL63hhjyW+1jMgBiewMjiLdhPV4CzHI9+MzSuzuiY=;
 b=FScNU4fdU8JIOpMDW1xJLPvtcvF2QXzv6IR+6i5lQLgpRp17hutYhDNSlEl806gKeK
 YHMEpfQxS8xSbWls5yXbPWPle+Pn4jXDWnSE0g6vJ/vznQsSnoVr5VNHMmWI5IGMdoBU
 ucGgsTBJA0VCqPyuGXOG6JPYdkHvNmoWeG/U0d2vuG3f7SjvMLnDjd6yd8KX0xEYJLVO
 pqNyUiafJXIZ7ZDUwm8N1J4vDbqQBdAS0LsLuUgnWZ5puYQEkxIubmv3Jqh371Vdbv2l
 77kTYJaPgHxYtzwFGfPq9Esp3xLE94JuuKOYbgZ4JbZQnzyPK4dILSbtSnkiQlvKVWIS
 a0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766149328; x=1766754128;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SZXL63hhjyW+1jMgBiewMjiLdhPV4CzHI9+MzSuzuiY=;
 b=R7ytkvCo4wusdVOvMDKyy1sCtfHietPaZSaxEVLSNUHEqkvfWb/LLy0cgDEQF7w/mT
 uVT9oZPST/9KMUy4IOgc5iwIp7UsKUC6ZuU82+yo3qqD5i52FaEPdPDlqjk1Wp6SXPAP
 LoG2/iPtMkb7OTUSIpLR6K6B7fnlMbooJsfEnexOkq9apQAx1XaVhIQizyGBdjWOEoRi
 YNEm5x7zmwkQcJ65GhqsgNuTNGzDHzTSR3UPu2EQVBbntmsFwPay78VHBWQ/7a2cIGWM
 091ebp6G2uYtiWqtAWhGQWWXjlvcVILR+7jmJmTs10N6B5n8/+8kLeGKvZWEjip6F0Vd
 20VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUspMMp1GmQqRLR2700Le5FWjKZSPcQig/E2VLkA3CvMhMJNDVeeJ/ADk05xLx/ySfKqgkDDY1u7+lipQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzxpCYeitRsOPRAGCFpVipTG1sEVo/wpV+bJSVvjMjEm13JVLz3
 hn1U/YjJqCVbZcDuUhT9tmHO/iBPia3W6VmtZub+QQvUf+i4zN+uy0HApdoQp4u7DcP+s2CM+f1
 l7QVD55pjTqcINWNHFhkYSmfTFI3zdInjRmYofDshX4PuDUyNapwzccFw4grQasu4LPj5xAi6Vc
 /9hH5XQlQ=
X-Gm-Gg: AY/fxX7ZzHG4T21WyCASUg6gESrVTN4u04EmbVicq2TU1S25esgbypNu5L9jyKO60r5
 wzyPnzgHqv3zcu3sbbICDlWhP1+sPD0s9r6XQK8qDlnDAXHR5KOaQB6VUpWjL2MkU9tKyI7j14e
 Rzn2oAzrH3lSURH9OP1ExfWzGP4lQAwD61oK5gHFvDT3c5F3XUJmOl3ZVkQ649wZ6Qbl9cYMxRr
 MoF1msFCEh8TffMuZhrxASmKO9mFN+EFo6QLHcEzPxLSOEsKzn9kuSsLDJCWhhGb+NNB25l8AF4
 RaeP89AHgZ2Gh/iIIt7CmkbM6jtq8u3b7uLuesb3Ans41CnsGwFerXeZV9NriZdSXOaq5beD5v0
 P2VJnEUWzpc6JtIACkROLNr33pv1WmH4SUL3FBxTwQ3532r4qXJbTwPE2LwQjHWvm9Q==
X-Received: by 2002:a05:6122:104c:b0:559:9663:bfb1 with SMTP id
 71dfb90a1353d-5615bc2dae2mr435798e0c.0.1766149327871; 
 Fri, 19 Dec 2025 05:02:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXeDGSy1uF22rzogOY11+L7dou3cJ6USkw1y5Af2xvx2Z79MJW104nHs4Qxm7QUPKa2C4w3w==
X-Received: by 2002:a05:6122:104c:b0:559:9663:bfb1 with SMTP id
 71dfb90a1353d-5615bc2dae2mr435755e0c.0.1766149327079; 
 Fri, 19 Dec 2025 05:02:07 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b9159a6d0sm2136497a12.28.2025.12.19.05.02.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 05:02:05 -0800 (PST)
Message-ID: <701a7b2f-848a-4cc0-8924-ec72155d93a7@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 14:02:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Taniya Das <taniya.das@oss.qualcomm.com>
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
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3e8128f4-3cba-4c13-a846-e5f1638a1e0f@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwNiBTYWx0ZWRfX/dPQHYuuvC4u
 P0cO593ggP1UHnGJDKFl5qiMO1QwV9HHRF/+TGxWOR5SEbKAixui37cnDzFGu0kYz1/tRNABa7i
 cChZNHh5VV7UOTPh0XyVwdDCzHY8cB1PywiHhxP1eUbYc540OaWv/AmZAiCeuXSu8BHQPEHLtyl
 zV5LjR8vGsNTW0bObrwYDnyTjM5j1grfGMragfRADNpTlIhxp3r4vcHkOmt4YROXOisKwpUmeCI
 6wj/Dc1qVsJHXWYk1YGmchoITBimk0gF1zS+6hh7Uojzhu7DEIajyve4qvedAMlFHrGjPvpeFKI
 7m9NRFXrgXhsSN4ag/UckukNUO/YW1FTrUJPdiZvq5yFYYmNwCl+LSDy27K6MK+yZhxoWGV4vER
 ysCVb3ZNvh4g9P/RbeccWqIbKV0/FsEoLJMpRbBoJVi7FeoPPenWrw76uF04U22jPvwPDYEkEqS
 u0ezVyl5XaQzI3kLLZg==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=69454cd0 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bZysObWQuULb7_ZgAGEA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 4udSZIfGzE5X-UjInTs1EMW_6ec6XiI2
X-Proofpoint-GUID: 4udSZIfGzE5X-UjInTs1EMW_6ec6XiI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190106
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

On 12/17/25 2:54 PM, Krzysztof Kozlowski wrote:
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

Right, you omitted the part where I answered your comment from the
context, so I'll re-add it:

"""
This block provides more than one GDSC - although again, not all of them
need/should be accessed by Linux. I suppose just enumerating the "extra"
ones in bindings will be a good enough compromise?
"""

TLDR: cells=1 makes sense as per usual

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
