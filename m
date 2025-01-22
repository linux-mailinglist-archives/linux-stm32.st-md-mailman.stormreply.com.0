Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5F8A18E13
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Jan 2025 10:07:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A440C78F75;
	Wed, 22 Jan 2025 09:07:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE269C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2025 09:07:09 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M4XT7N029449;
 Wed, 22 Jan 2025 09:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vkQFLh6xLHsI2CxC96/YoRHNzOH+kkMYSIC+Pxqdhdo=; b=gWKUQ/2Dgnv+3NBj
 bXUOHQoWyh0NWIf05dH/A2uxKuFboNcQdeFT0sCXEj6ni/E0LVU6snwIAwNbPNnG
 /8BOLtUFHDTTqOStsec7bthFNZwLjLPaddT85QbpfgITIwAUQbvcsRe9a13K5FB6
 kb5O1uUYVxX6ed/33Ab/0mbrhEtY76zGyr1azLKfbiBYwZuUOEbRo8c/z919K3N3
 Lu7u/G5JtJ26jMKRnjtFcy+WUkWPeg0XTTQHB92Oeaqq2WcfMzYus6aqVI9ulJkl
 R4fmhgzQTN374C0TdetaS1x2KY4HhkrwryIeDyfX2QCpPlln5HrJjody6upi9tlt
 BhTTQg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44asrnrks3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2025 09:06:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50M96j4X013601
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2025 09:06:45 GMT
Received: from [10.253.35.93] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 01:06:28 -0800
Message-ID: <fad78436-8263-46af-b669-3bcd75f036a4@quicinc.com>
Date: Wed, 22 Jan 2025 17:06:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Krzysztof Kozlowski
 <krzk@kernel.org>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
 <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
 <Z4-Z0CKtiHWCC3TM@shell.armlinux.org.uk>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <Z4-Z0CKtiHWCC3TM@shell.armlinux.org.uk>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: odx1Rgb5QmadLm_bSlJHMe-MZJhxbKP0
X-Proofpoint-ORIG-GUID: odx1Rgb5QmadLm_bSlJHMe-MZJhxbKP0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220065
Cc: Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Vinod Koul <vkoul@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos:
 Mask PHY mode if configured with rgmii-id
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



On 2025-01-21 20:57, Russell King (Oracle) wrote:
> On Tue, Jan 21, 2025 at 01:47:55PM +0100, Krzysztof Kozlowski wrote:
>> On 21/01/2025 08:54, Yijie Yang wrote:
>>> The Qualcomm board always chooses the MAC to provide the delay instead of
>>> the PHY, which is completely opposite to the suggestion of the Linux
>>> kernel.
> 
> You still need to explain why it's preferable to match this in the mainline
> kernel. Does it not work when you use the phylib maintainers suggestion
> (if that is so, you need to state as much.)

Okay, I will include that explanation in the next version.

> 
>> How does the Linux kernel suggest it?
> 
> It's what phylib maintainers prefer, as documented in many emails from
> Andrew Lunn and in Documentation/networking/phy.rst:
> 
> "Whenever possible, use the PHY side RGMII delay for these reasons:
> 
> * PHY devices may offer sub-nanosecond granularity in how they allow a
>    receiver/transmitter side delay (e.g: 0.5, 1.0, 1.5ns) to be specified. Such
>    precision may be required to account for differences in PCB trace lengths
> 
> * PHY devices are typically qualified for a large range of applications
>    (industrial, medical, automotive...), and they provide a constant and
>    reliable delay across temperature/pressure/voltage ranges
> 
> * PHY device drivers in PHYLIB being reusable by nature, being able to
>    configure correctly a specified delay enables more designs with similar delay
>    requirements to be operated correctly
> "
> 
>>> The usage of phy-mode in legacy DTS was also incorrect. Change the
>>> phy_mode passed from the DTS to the driver from PHY_INTERFACE_MODE_RGMII_ID
>>> to PHY_INTERFACE_MODE_RGMII to ensure correct operation and adherence to
>>> the definition.
> 
> If the delays dependent on the phy-mode are going to be implemented at
> the MAC end, then changing the PHY mode indicated to phylink and phylib
> to PHY_INTERFACE_MODE_RGMII is the right thing to be doing. However,
> as mentioned in the documentation and by Andrew, this is discouraged.
> 
Adding delay by the MAC side is generally discouraged, but the current 
driver configuration sequence was designed to do so. We need to follow 
this approach until we can rewrite it, correct?

-- 
Best Regards,
Yijie

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
