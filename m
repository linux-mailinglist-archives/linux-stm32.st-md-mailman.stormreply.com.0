Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCCE80EB36
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Dec 2023 13:05:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C315C6B458;
	Tue, 12 Dec 2023 12:05:04 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDC5EC6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 12:05:02 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BCBagqS002203; Tue, 12 Dec 2023 12:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=RI094VLF8Fa6BPNhKOYXmUsNOQvyIpj/1tTjLTIQObw=; b=ID
 F5p6ZWq5BUWIeVOuS80Q/CVTIcz24B4txIZJ848IwuzBKhpRkCuk1/OEJRkZz6SK
 KkjK5U9/kirBxQLngrJPFyeii00dTRoAppu/ijw3BFWzBKc2k+2cxHAG23I7W/ny
 4C+9Y6BZd+ri8eKchVWOAK5DZs4x9YDmYs3Z08fOmmzitP7GVVx85NsKL1kB661/
 BMH6KniLhbPvS+fiBTGOKwmfHojVOvy+O9TRX0RL6Hsox8WHjKvv0ZJ358p9ELUP
 SqQvP3BMxR+O8yDx1RIu4/Sydh1+v6FyTs9PEQTeVqYy/eJt5Lajk3BEf+8hR3yG
 jllv7+2PfAay6MCCOrlA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxpsu81pn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 12:04:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BCC4nDn000821
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 12:04:49 GMT
Received: from [10.216.62.2] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Dec
 2023 04:04:36 -0800
Message-ID: <94e4e23c-232d-4b7e-84f3-939d32eed944@quicinc.com>
Date: Tue, 12 Dec 2023 17:34:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Halaney <ahalaney@redhat.com>
References: <20231211080153.3005122-1-quic_jsuraj@quicinc.com>
 <20231211080153.3005122-2-quic_jsuraj@quicinc.com>
 <2ihncgvnfxgzj5kfm3eedvj3jvru7fokpno5pdzgtnuuy2mpqf@sfuzuugeuxzh>
From: Suraj Jaiswal <quic_jsuraj@quicinc.com>
In-Reply-To: <2ihncgvnfxgzj5kfm3eedvj3jvru7fokpno5pdzgtnuuy2mpqf@sfuzuugeuxzh>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -UNKWI9FkuYR77fSFCrge7y4B6HaSc8n
X-Proofpoint-ORIG-GUID: -UNKWI9FkuYR77fSFCrge7y4B6HaSc8n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312120096
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 kernel@quicinc.com, Jose Abreu <joabreu@synopsys.com>,
 Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Prasad Sodagudi <psodagud@quicinc.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v5 1/3] dt-bindings: net: qcom,
 ethqos: add binding doc for safety IRQ for sa8775p
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

sure @andrew

Thanks
Suraj

On 12/11/2023 7:22 PM, Andrew Halaney wrote:
> On Mon, Dec 11, 2023 at 01:31:51PM +0530, Suraj Jaiswal wrote:
>> Add binding doc for safety IRQ. The safety IRQ will be
>> triggered for ECC(error correction code), DPP(data path
>> parity), FSM(finite state machine) error.
>>
>> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> 
> Rob gave you his Reviewed-by over here on the last revision:
> 
>     https://lore.kernel.org/netdev/170206782161.2661547.16311911491075108498.robh@kernel.org/
> 
> in the future if someone gives you a tag you should add it to the patch
> for the next revision you send out (assuming you have to send out
> another version, otherwise the maintainers will collect the tags when
> they merge that version of the series). If the patches change a lot then
> it makes sense to remove the tag since it wasn't what they reviewed, but
> in this case you've only expanded a comment in the commit message so it is
> appropriate to be present.
> 
>> ---
>>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 9 ++++++---
>>  Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 6 ++++--
>>  2 files changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> index 7bdb412a0185..93d21389e518 100644
>> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> @@ -37,12 +37,14 @@ properties:
>>      items:
>>        - description: Combined signal for various interrupt events
>>        - description: The interrupt that occurs when Rx exits the LPI state
>> +      - description: The interrupt that occurs when HW safety error triggered
>>  
>>    interrupt-names:
>>      minItems: 1
>>      items:
>>        - const: macirq
>> -      - const: eth_lpi
>> +      - enum: [eth_lpi, safety]
>> +      - const: safety
>>  
>>    clocks:
>>      maxItems: 4
>> @@ -89,8 +91,9 @@ examples:
>>                 <&gcc GCC_ETH_PTP_CLK>,
>>                 <&gcc GCC_ETH_RGMII_CLK>;
>>        interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
>> -                   <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
>> -      interrupt-names = "macirq", "eth_lpi";
>> +                   <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
>> +                   <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
>> +      interrupt-names = "macirq", "eth_lpi", "safety";
>>  
>>        rx-fifo-depth = <4096>;
>>        tx-fifo-depth = <4096>;
>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> index 5c2769dc689a..3b46d69ea97d 100644
>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> @@ -107,13 +107,15 @@ properties:
>>        - description: Combined signal for various interrupt events
>>        - description: The interrupt to manage the remote wake-up packet detection
>>        - description: The interrupt that occurs when Rx exits the LPI state
>> +      - description: The interrupt that occurs when HW safety error triggered
>>  
>>    interrupt-names:
>>      minItems: 1
>>      items:
>>        - const: macirq
>> -      - enum: [eth_wake_irq, eth_lpi]
>> -      - const: eth_lpi
>> +      - enum: [eth_wake_irq, eth_lpi, safety]
>> +      - enum: [eth_wake_irq, eth_lpi, safety]
>> +      - enum: [eth_wake_irq, eth_lpi, safety]
>>  
>>    clocks:
>>      minItems: 1
>> -- 
>> 2.25.1
>>
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
