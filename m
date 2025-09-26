Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECCFBA29EC
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Sep 2025 09:06:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54B5DC3FAC8;
	Fri, 26 Sep 2025 07:06:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC5D0C3FAC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 07:06:39 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q71Axk000853
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 26 Sep 2025 07:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VfsAs5yiAxaYFB0ndDb5atfCwLOCQ2a0n9K8ajWXJTQ=; b=VdeGhIFrddl8aPhy
 qwsCpJ0VEXQf1zHy+ga7hXD6MLL/w6G4dRe6p7UminlE04zS6DC6yTcxT3v12YRE
 87lKfuGlSqUUy02HNh1b9G4IyIwdscIAjXsuWqZW//RycZpSMHjYyn+Adm1a9ofW
 TNuVzuUJrkO+h/lQjCmdCU2xwdrXxpEtP10ftclb0jcpQ9kZfnG2zGDWEPgq/I04
 hIKva8agjYhyqIUiiI3Weyi8f1JfymXvOdGaJ2hCQu0SWImyU/IlZrtRp1mqiZVQ
 SOyDWo6Ec5S4X2UXU1YJkHM3PqObcitwJ5t6NnzJPXMbbHo3JQUAjBQq1ObVCaIk
 8EQ9vA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0tssp4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 07:06:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-268141f759aso18990955ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 00:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758870397; x=1759475197;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VfsAs5yiAxaYFB0ndDb5atfCwLOCQ2a0n9K8ajWXJTQ=;
 b=azHvBerqx42OQ+HAn7U3Yvhn4kvkkmX9lDXwZGFKn0z2JScwSVNFUvQ86a1hL/Z2Em
 n8uI3GASbDTPo/FXau8pFUlHJ5e679iWIPXkYgWAubqbTWB5c9yiL6CvBng3qG6knXbA
 ggcSeU6hmrkH+9reOR7e+OVJgzX5u4l1B2EOcDmPwnYSn18I6apDJfgorBlr4SAYPXqs
 g8RnhUDHTQfJp2h0To+AF7LLyJzSCx28J00JgTOQ39FXhtGnlnoVPggP6vFuGPz36HKa
 es0zB0WSo5EDtL8D8QchnyF0UtBSoJGiBYERVrtEoNsbsB62WIQt9fDg8vSugfPk2QHm
 9EcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKLxk1+YYwEjsGb70eugUQF+w6fig/Izlq61DU0QIUf2ngH6trmWMmkfXIA9z1cYem0pxaIe4Djwm92A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyXmdIlimrEhbVm7pb7BI1mJVdlJk/FQKFY3Gwzy3A6E0ifpsmH
 phnRa56uXsFBR0bi1AN1JIBJkVt7WXIjQ3Lpuu94aJWB1CAK9tbEqhGH7hT4GBvvDjFCcWzmUMs
 DlcQy6/6FcG7oCDcu0C2RRIUqfPHq6X8NbEQRxeBtP/XO//CsT1wy4cJsQ+uQPE9ZvV4+TrTWxm
 51peql/Z8=
X-Gm-Gg: ASbGncsHpLTq988H+BzSpAqgAylCCeg6DwrsLxNq3PtWvtkEGp7H5N8mCUEaeZXdhRz
 p8ID+NHMIEk0v3e6R2oT3jvD/vDfOT2eHBTm5mt9mR+J20f3uaR5ttJLIbVhS42O7C1Jxp+Vwlx
 m827ltgs7vll5niNJUPvQNFhHWmpdRX9rx+8met1G8J9gv8rSKP+A1QUWnRWdq+GbnuGJaZ9zFV
 4MCaPGnLVKNvvwZoKLfBrdEwI2hP6GvvtYcoIsPgCCjmhzXMDFNo0RLwpLJzOg5qshn7iimHS78
 wVFxHMmK06/IUKF70O1MeXSNWHOH2Dg0aAp+/nUWEouqZuO7GOF5F/OmEpfCNACodUKy
X-Received: by 2002:a17:902:f611:b0:271:fead:9930 with SMTP id
 d9443c01a7336-27ed4a78d72mr67605245ad.59.1758870397175; 
 Fri, 26 Sep 2025 00:06:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkrMZxqylZt6nJiE1ocYHpxscY4Q1brp546AbBdNAbAkmq0vd5XGrBNZjqUvbPQf9USLOYyw==
X-Received: by 2002:a17:902:f611:b0:271:fead:9930 with SMTP id
 d9443c01a7336-27ed4a78d72mr67604775ad.59.1758870396700; 
 Fri, 26 Sep 2025 00:06:36 -0700 (PDT)
Received: from [10.217.216.188] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed68821desm45499775ad.91.2025.09.26.00.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 00:06:36 -0700 (PDT)
Message-ID: <5aa92e19-bb80-4628-baf8-887199ba2ec1@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 12:36:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
 <34esqueoush5gnawnzl7hmnpwr77vip2iqf2w7eiac7jqyghvl@nquuefkyjive>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <34esqueoush5gnawnzl7hmnpwr77vip2iqf2w7eiac7jqyghvl@nquuefkyjive>
X-Authority-Analysis: v=2.4 cv=I9Vohdgg c=1 sm=1 tr=0 ts=68d63b7e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=0pmg7TuxG_D_0s_mfB8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: gk-EqEnH78ENXcr813hobhxItqw5M-4B
X-Proofpoint-ORIG-GUID: gk-EqEnH78ENXcr813hobhxItqw5M-4B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX5iegirmeo/h5
 IQdNrQq42KjMdwrIlH7kf1QlpOTCKwWcghRSYXaYfJq2i5ktxp585b0EU3OsmMkKSjRfXWRIvha
 iWSc7FrQiT79I0pnM0nzMcp9tu7DtvTi3CZUJoBjL9AQn+6Ns2KITtaPOwLX9wHLMdNaaWArWdP
 F2263P38l+qclT4+XMyTGFKoLqDjdEi8Ca6SBembYvO17rm2M9T+3nVHLIFxCpZ8k1pxYPmSf+w
 HWWBnvY1VJrH73/WLOYH4Dt6PvKS31KEJQwCRo5boRZyDAgB/C39AzfuY6SB/8IqtHqZoU2tmAY
 xLh710mY0HOb5aSqhbcllOsKk63VQdCSaU0MXYbYyy1xCyarizKdRHtxrcd2czs22tyntwjdLoz
 T7JKWviEbX4vITUNHhdLcjA87IGs2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, yijie.yang@oss.qualcomm.com,
 Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, aiqun.yu@oss.qualcomm.com,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 trilok.soni@oss.qualcomm.com
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: clock: sm8450-camcc:
 Remove sc8280xp camcc to from sm8450 camcc
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



On 9/26/2025 2:50 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 04:56:43PM -0700, Jingyi Wang wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
>> which now supports both MMCX and MXC power domains. Hence move SC8280XP
>> camcc from SM8450.
> 
> The commit message needs to be change to describe this change instead of
> the generic facts about SC8280XP and SM8450.
> 
>>

Sure, Dmitry, I will update it.

>> Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc")
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> index c1e06f39431e..dbfcc399f10b 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> @@ -63,7 +63,6 @@ allOf:
>>          compatible:
>>            contains:
>>              enum:
>> -              - qcom,sc8280xp-camcc
>>                - qcom,sm8450-camcc
>>                - qcom,sm8550-camcc
>>      then:
>>
>> -- 
>> 2.25.1
>>
> 

-- 
Thanks,
Taniya Das

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
