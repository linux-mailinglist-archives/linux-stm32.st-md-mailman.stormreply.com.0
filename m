Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 049EA92CBE1
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jul 2024 09:27:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8932C6DD72;
	Wed, 10 Jul 2024 07:27:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDC91C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jul 2024 07:27:34 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469N0RR7028932;
 Wed, 10 Jul 2024 07:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uUn4O9+FJSSsRdFYECw9WOpbBUlBbK+8/cW3aBPGcJk=; b=In9zdp5CvpqgUYDG
 DUQ+zD6uSroL2h4JGFEJpDsKpin1/0+JGNwH1QOaY1OyrsavrAh/V6ngDuIS6Ip3
 o74hlvSHqCzyCXNQGvUwV4S6eyRyfAF0cXEAGS9n1Qk3OefQLVBI8BAag1VQaRcM
 YFhWjm0LX/M+nLMJXf16UM1WRjDxHIqUSU/unGO/QTslVtOoLbekUJJ84YV3Dbj7
 /ibcvsPN4h5HQyxkpfu6jc+o9PfwKKdPt3ZrQYSJ8vhnDYgonVS0CJyGLmDXBqgZ
 c2JkKOH8mILf3tXAFbeyTK4BuyqqKe+nnTezIaIhwQMurOB4LA8hwwi8JGTlFO6R
 FNZzAg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x518s2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jul 2024 07:27:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46A7REsk028037
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jul 2024 07:27:15 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Jul
 2024 00:27:07 -0700
Message-ID: <c07b8f08-a8ce-427b-81f1-4f5399913fc1@quicinc.com>
Date: Wed, 10 Jul 2024 15:27:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Simon Horman <horms@kernel.org>
References: <20240709-add_qcs9100_ethqos_compatible-v2-0-ba22d1a970ff@quicinc.com>
 <20240709174212.GM346094@kernel.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <20240709174212.GM346094@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VcH8fqJyF1PQ6HhPvk_vasHIEKK-COYs
X-Proofpoint-ORIG-GUID: VcH8fqJyF1PQ6HhPvk_vasHIEKK-COYs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407100052
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@quicinc.com, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/2] net: stmmac: dwmac-qcom-ethqos:
 Add QCS9100 ethqos compatible
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



On 7/10/2024 1:42 AM, Simon Horman wrote:
> On Tue, Jul 09, 2024 at 10:13:16PM +0800, Tengfei Fan wrote:
>> Introduce support for the QCS9100 SoC device tree (DTSI) and the
>> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
>> While the QCS9100 platform is still in the early design stage, the
>> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
>> mounts the QCS9100 SoC instead of the SA8775p SoC.
>>
>> The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
>> all the compatible strings will be updated from "SA8775p" to "QCS9100".
>> The QCS9100 device tree patches will be pushed after all the device tree
>> bindings and device driver patches are reviewed.
>>
>> The final dtsi will like:
>> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/
>>
>> The detailed cover letter reference:
>> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>> Changes in v2:
>>    - Split huge patch series into different patch series according to
>>      subsytems
>>    - Update patch commit message
>>
>> prevous disscussion here:
>> [1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
>>
>> ---
>> Tengfei Fan (2):
>>        dt-bindings: net: qcom,ethqos: add description for qcs9100
>>        net: stmmac: dwmac-qcom-ethqos: add support for emac4 on qcs9100 platforms
>>
>>   Documentation/devicetree/bindings/net/qcom,ethqos.yaml  | 1 +
>>   Documentation/devicetree/bindings/net/snps,dwmac.yaml   | 2 ++
>>   drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
>>   3 files changed, 4 insertions(+)
>> ---
>> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
> 
> I'm assuming that this is a patch for net-next.
> But the commit above is not present in net-next,
> and this series doesn't apply to net-next.
> 
> Please rebase when preparing v3.
> And please designate the target tree in the subject.
> 
> 	Subject: [PATCH net-next v3] ...
> 
> Thanks!

I willmake the correspinding modifications according to your suggestion 
in the V3 patch series.

-- 
Thx and BRs,
Tengfei Fan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
