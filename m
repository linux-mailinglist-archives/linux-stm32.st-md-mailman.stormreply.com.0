Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B76BAA168E8
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jan 2025 10:08:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C0B1C78002;
	Mon, 20 Jan 2025 09:08:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D9ECCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2025 09:08:17 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K6gxTe007185;
 Mon, 20 Jan 2025 09:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 h+vNN5xoXznfhtWxbNTpB0BOmc+kHjlUL1TlQ4NcoLk=; b=fAh7oNwBtqeKxsr/
 fAGGaGIlv45aqyoUZ1uuLXsvMK6RLqfuK0MmO+v6SbdHOqcx1APVSidPeZYptY3w
 +VVmvRBKOJpjaB3LKJwz5s9Lp41AQLP0iRLs8cdtfuf4quDBvapyyPVmk7zokJhR
 VAv+66oTnyyGc46nBmVxXdreukpthVekIeQqq+3eE5SCkj5tHYxWs3UxiVLHW22O
 KEofz6aBebzUOuZVQvWlfvuMlkIIsClv4+9HH8PMo+ZALonRKj3+Em8VFaqRTv0+
 eFMgVlCiNS/n2e2FLAHBGFc5W1k5PuNzmzwq/qUIbstcXJ1lP9Mb1ucgBP6HAYtz
 WWcQ6Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449hfb0b61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jan 2025 09:07:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50K97sMP024218
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jan 2025 09:07:54 GMT
Received: from [10.253.35.93] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 Jan
 2025 01:07:48 -0800
Message-ID: <5bc3f4e0-6c3f-412c-a825-54707c70f779@quicinc.com>
Date: Mon, 20 Jan 2025 17:07:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <20241225-support_10m100m-v1-2-4b52ef48b488@quicinc.com>
 <4b4ef1c1-a20b-4b65-ad37-b9aabe074ae1@kernel.org>
 <278de6e8-de8f-458a-a4b9-92b3eb81fa77@quicinc.com>
 <e47f3b5c-9efa-4b71-b854-3a5124af06d7@lunn.ch>
 <87a7729d-ccdd-46f0-bcfd-3915452344fd@quicinc.com>
 <7e046761-7787-4f01-b47b-9374402489ac@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <7e046761-7787-4f01-b47b-9374402489ac@lunn.ch>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NP9eBnT9zEvKqkraLR4B_uiSrrYEmpmo
X-Proofpoint-ORIG-GUID: NP9eBnT9zEvKqkraLR4B_uiSrrYEmpmo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=615 bulkscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200075
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Vinod Koul <vkoul@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/3] net: stmmac: qcom-ethqos: Enable RX
 programmable swap on qcs615
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



On 2025-01-08 21:29, Andrew Lunn wrote:
>>> Why is it specific to this board? Does the board have a PHY which is
>>> broken and requires this property? What we are missing are the details
>>> needed to help you get to the correct way to solve the problem you are
>>> facing.
>>>
>>
>> Let me clarify why this bit is necessary and why it's board-specific. The RX
>> programming swap bit can introduce a time delay of half a clock cycle. This
>> bit, along with the clock delay adjustment functionality, is implemented by
>> a module called 'IO Macro.' This is a Qualcomm-specific hardware design
>> located between the MAC and PHY in the SoC, serving the RGMII interface. The
>> bit works in conjunction with delay adjustment to meet the sampling
>> requirements. The sampling of RX data is also handled by this module.
>>
>> During the board design stage, the RGMII requirements may not have been
>> strictly followed, leading to uncertainty in the relationship between the
>> clock and data waveforms when they reach the IO Macro.
> 
> So this indicates any board might need this feature, not just this one
> board. Putting the board name in the driver then does not scale.
> 

Should I ignore this if I choose to use the following standard properties?

>> This means the time
>> delay introduced by the PC board may not be zero. Therefore, it's necessary
>> for software developers to tune both the RX programming swap bit and the
>> delay to ensure correct sampling.
> 
> O.K. Now look at how other boards tune their delays. There are
> standard properties for this:
> 
>          rx-internal-delay-ps:
>            description:
>              RGMII Receive Clock Delay defined in pico seconds. This is used for
>              controllers that have configurable RX internal delays. If this
>              property is present then the MAC applies the RX delay.
>          tx-internal-delay-ps:
>            description:
>              RGMII Transmit Clock Delay defined in pico seconds. This is used for
>              controllers that have configurable TX internal delays. If this
>              property is present then the MAC applies the TX delay.
> 
> I think you can use these properties, maybe with an additional comment
> in the binding. RGMII running at 1G has a clock of 125MHz. That is a
> period of 8ns. So a half clock cycle delay is then 4ns.
> 
> So an rx-internal-delay-ps of 0-2000 means this clock invert should be
> disabled. A rx-internal-delay-ps of 4000-6000 means the clock invert
> should be enabled.

This board was designed to operate at different speed rates, not a fixed 
speed, and the clock rate varies for each speed. Thus, the delay 
introduced by inverting the clock is not fixed. Additionally, I noticed 
that some vendors apply the same routine for this property across all 
speeds in their driver code. Can this property be used just as a flag, 
regardless of its actual value?

> 
> Now, ideally, you want the PHY to add the RGMII delays, that is what i
> request all MAC/PHY pairs do, so we have a uniform setup across all
> boards. So unless the PHY does not support RGMII delays, you would
> expect rx-internal-delay-ps to be either just a small number of
> picoseconds for fine tuning, or a small number of picoseconds + 4ns
> for fine tuning.

The delay for both TX and RX sides is added by the MAC in the Qualcomm 
driver, which was introduced by the initial patch. I believe there may 
be a refactor in the future to ensure it follows the requirements.

> 
> This scales, since it can be used by an board with poor design, and it
> does not require anything proprietary to Qualcomm, except the extended
> range, and hopefully nobody except Qualcomms broken RDK will require
> it, because obviously you will document the issue with the RDK and
> tell customers how to correctly design their board to be RGMII
> compliant with the clocks.

Yes, I will make a note of it.

> 
> 	Andrew

-- 
Best Regards,
Yijie

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
