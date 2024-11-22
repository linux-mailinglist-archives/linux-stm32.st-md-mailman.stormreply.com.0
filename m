Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D41279D5700
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Nov 2024 02:18:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC91BC7A839;
	Fri, 22 Nov 2024 01:18:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DACEC7A838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Nov 2024 01:18:00 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALLpqPE025682;
 Fri, 22 Nov 2024 01:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AMMWxQ4o4pGQfV+n7NM8+4Dhggh4FK+HGrIOyuR8t2E=; b=QhCYiUum1FQiL+0u
 A6KGA1RfpXO7YNmQqpxv7JmEQnjQpMpbXrfx03E81cGB1snUVcjHa1P3QLcF1+lj
 1KK+QJkylha7/NXs5t1OZjEYKxYqJDfMkAgqPpDTnob/LYvDbjgcQZ3dTijHFKA0
 caUwzyNXT4b27PIXZqBeTNLLKkU6tqjkX/hjwGz6Wpl+WDM0KtqBSWLecbwWxodo
 ZCt3Ui1Qg+hNYnSiJc5aep8c7gBdVod6uMCZLgUJ43cV3qQau0+kQajxWUrtbtS9
 cp+j2mwuOSbJORDM0JEwqI3PZeeYgR/GvWQJezKKwCIvihjiC64hQkZd3hn+4ImX
 RJTaoQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432d5b0c7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Nov 2024 01:17:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM1HeMe006525
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Nov 2024 01:17:40 GMT
Received: from [10.253.13.126] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 17:17:33 -0800
Message-ID: <3a7d9e71-bc2f-49c1-a12f-b9c860493c25@quicinc.com>
Date: Fri, 22 Nov 2024 09:17:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20241118-schema-v1-0-11b7c1583c0c@quicinc.com>
 <20241118-schema-v1-1-11b7c1583c0c@quicinc.com>
 <20241119174156.GA1862978-robh@kernel.org>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <20241119174156.GA1862978-robh@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VPtJT21gOif71Q4xsJj9Yehuzcvm0Drd
X-Proofpoint-ORIG-GUID: VPtJT21gOif71Q4xsJj9Yehuzcvm0Drd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220009
Cc: quic_jsuraj@quicinc.com, quic_tengfan@quicinc.com,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 quic_tingweiz@quicinc.com, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, quic_jiegan@quicinc.com, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Bhupesh
 Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org,
 quic_jingyw@quicinc.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David
 S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, quic_aiquny@quicinc.com
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: net: qcom,
 ethqos: revise description for qcs615
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 2024-11-20 01:41, Rob Herring wrote:
> On Mon, Nov 18, 2024 at 02:16:50PM +0800, Yijie Yang wrote:
>> The core version of EMAC on qcs615 has minor differences compared to that
>> on sm8150. During the bring-up routine, the loopback bit needs to be set,
>> and the Power-On Reset (POR) status of the registers isn't entirely
>> consistent with sm8150 either.
>> Therefore, it should be treated as a separate entity rather than a
>> fallback option.
> 
> 'revise description' is not very specific. 'Drop fallback compatible for
> qcom,qcs615-ethqos' would be better.

I will fix it.

> 
> However, this is an ABI change. You could leave the binding/dts alone
> and only change the kernel driver to match on qcom,qcs615-ethqos to
> achieve what you need. If there's a reason why the ABI change is okay,
> then you need to detail that. Did the driver never work? Are there no
> users yet?
> 

Firstly, this patch addresses a correction to my earlier update on the 
dts schema, which can be found here: 
https://lore.kernel.org/all/20241017-schema-v2-1-2320f68dc126@quicinc.com/.
As detailed in the description, the EMAC version present in qcs615 
diverges from that in sm8150, leading me to conclude that the schema 
should not fallback to sm8150, despite successful driver probing. 
Lastly, there are currently no users for qcs615 yet.

>>
>> Fixes: 32535b9410b8 ("dt-bindings: net: qcom,ethqos: add description for qcs615")
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> index 0bcd593a7bd093d4475908d82585c36dd6b3a284..576a52742ff45d4984388bbc0fcc91fa91bab677 100644
>> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> @@ -23,12 +23,9 @@ properties:
>>             - enum:
>>                 - qcom,qcs8300-ethqos
>>             - const: qcom,sa8775p-ethqos
>> -      - items:
>> -          - enum:
>> -              - qcom,qcs615-ethqos
>> -          - const: qcom,sm8150-ethqos
>>         - enum:
>>             - qcom,qcs404-ethqos
>> +          - qcom,qcs615-ethqos
>>             - qcom,sa8775p-ethqos
>>             - qcom,sc8280xp-ethqos
>>             - qcom,sm8150-ethqos
>>
>> -- 
>> 2.34.1
>>

-- 
Best Regards,
Yijie

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
