Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 349CA7F5EAB
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 13:04:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D894DC6B479;
	Thu, 23 Nov 2023 12:04:36 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8675BC6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 12:04:35 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AN4cOUq014422; Thu, 23 Nov 2023 12:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=mM8Bjpkm0Igg82YtDU28k9o+BPgvFhrCWPwlePqNs7Y=;
 b=VmqBmSAXvYiSqb+dQnhY5XfTnP6+Y3Q7cQbU7dIyWDIiFs/vof4hr2Peyf3QROWxpL76
 +O12bO68tqs71TzjMmLJVwZGZybrFnxphVz4Nq2tZDJRT65TFiAi3Rl7SAsBGLDzndaP
 W6fK1a8V508fXsHzCnxzOGAYn69OPUsgyseX3HnXYPU2eXNmMRMBIac5CC2ODoQXGlwC
 t/5eFSPIugrcxv+8eCdZPA/WYvLRpXy7VWVSKTAOyp1WtCsZYOdDeCKDY7snLPf36B2K
 jVuoGPcH6FEO+NlnmFQ+B5jkLkqzJq6m0VmobGd+DbeGnmqsYt3kVrkp8AEOPRCSy+MN tg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uhey5b6r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Nov 2023 12:04:24 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ANC4NP9006336
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Nov 2023 12:04:23 GMT
Received: from [10.216.9.56] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 23 Nov
 2023 04:04:12 -0800
Message-ID: <55b46fef-6bfa-42da-b101-e338bfc93a66@quicinc.com>
Date: Thu, 23 Nov 2023 17:34:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 Prasad Sodagudi <psodagud@quicinc.com>,
 Andrew Halaney <ahalaney@redhat.com>
References: <cover.1700737841.git.quic_jsuraj@quicinc.com>
 <ff458955a24c0cb4ba41158b8b53fbef00c8237d.1700737841.git.quic_jsuraj@quicinc.com>
From: Suraj Jaiswal <quic_jsuraj@quicinc.com>
In-Reply-To: <ff458955a24c0cb4ba41158b8b53fbef00c8237d.1700737841.git.quic_jsuraj@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: frO3nQXIW7342wIkeKI8wcv6sdrqgqpB
X-Proofpoint-GUID: frO3nQXIW7342wIkeKI8wcv6sdrqgqpB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_10,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=998
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311230085
Cc: kernel@quicinc.com
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/3] dt-bindings: net: qcom,
 ethqos: add binding doc for fault IRQ for sa8775p
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

@Andrew getting warning as part of below check . Need to explore more why this is coming .
below warning is coming becuase of " interrupt-names = "macirq", "eth_lpi", "safety";" safety added here . If I remove safety they warning gone.
Looks like we have to define property "safety" somewhere else as well . I have already added safety in "interrupt-names:" list but still no help .


# make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=net/qcom,ethqos.yaml dt_binding_check
  LINT    Documentation/devicetree/bindings
invalid config: unknown option "required" for rule "quoted-strings"
xargs: /usr/bin/yamllint: exited with status 255; aborting
  CHKDT   Documentation/devicetree/bindings/processed-schema.json
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  DTEX    Documentation/devicetree/bindings/net/qcom,ethqos.example.dts
  DTC_CHK Documentation/devicetree/bindings/net/qcom,ethqos.example.dtb
/local/mnt/workspace/andrew/linux-next/Documentation/devicetree/bindings/net/qcom,ethqos.example.dtb: ethernet@7a80000: interrupt-names:2: 'eth_lpi' was expected
        from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
/local/mnt/workspace/andrew/linux-next/Documentation/devicetree/bindings/net/qcom,ethqos.example.dtb: ethernet@7a80000: Unevaluated properties are not allowed ('mdio', 'phy-handle', 'phy-mode', 'rx-fifo-depth', 'snps,reset-active-low', 'snps,reset-delays-us', 'snps,reset-gpio', 'snps,tso', 'tx-fifo-depth' were unexpected)
        from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#

On 11/23/2023 5:23 PM, Suraj Jaiswal wrote:
> Add binding doc for fault IRQ. The fault IRQ will be
> triggered for ECC, DPP, FSM error.
> 
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> ---
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 7bdb412a0185..e013cb51fb07 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -37,12 +37,14 @@ properties:
>      items:
>        - description: Combined signal for various interrupt events
>        - description: The interrupt that occurs when Rx exits the LPI state
> +      - description: The interrupt that occurs when HW fault occurs
>  
>    interrupt-names:
>      minItems: 1
>      items:
>        - const: macirq
>        - const: eth_lpi
> +      - const: safety
>  
>    clocks:
>      maxItems: 4
> @@ -89,8 +91,9 @@ examples:
>                 <&gcc GCC_ETH_PTP_CLK>,
>                 <&gcc GCC_ETH_RGMII_CLK>;
>        interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
> -                   <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> -      interrupt-names = "macirq", "eth_lpi";
> +                   <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
> +      interrupt-names = "macirq", "eth_lpi", "safety";
>  
>        rx-fifo-depth = <4096>;
>        tx-fifo-depth = <4096>;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
