Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 782499FC73A
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Dec 2024 02:13:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38A0DC78F66;
	Thu, 26 Dec 2024 01:13:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52246C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Dec 2024 01:13:34 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BPNxnFT000561;
 Thu, 26 Dec 2024 01:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ex0xZqZ0k83RfTjakfiVSjrcogOZMcDKwtDMSk/NpAU=; b=f7BSTIsphjx/sWzJ
 eXuQG/MKC7y4CSxuVwfdGxv+mdkILFdKibWW3U1nA0xAUAafc44nuLeVS/OTMfUc
 YkkDclTpC1x/MN14GCb7bO27K1fQLgNhoL70VJiSTS54KFI2D2nUYgiRYSs8Lghk
 VeOACgLYmcooq0aDt7g5gyLGkSnNmfmGj0hWalpItYKR5hGu6gHaDupij3knpUwD
 BJVTpAmyJtNCG19iTAx+QFjS4RXVXyQiQPWl5XRgB+HoOZ7H7a2hc3s2ZmVq7qIA
 gD8RqI6tHmpUBq8jsL7SvHNyFHlpKEmcb/X05eSrYkXv1ftfok9zXY/vF67/YGBT
 fsL9Fg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rqm4919v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Dec 2024 01:13:17 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQ1DG4G032253
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Dec 2024 01:13:16 GMT
Received: from [10.253.74.39] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Dec
 2024 17:13:10 -0800
Message-ID: <b0a079e8-943c-41cf-8d07-71087d08356c@quicinc.com>
Date: Thu, 26 Dec 2024 09:13:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <20241224-schema-v2-1-000ea9044c49@quicinc.com>
 <7813f2b0-e76a-463c-91f9-c0bd50da1f0a@linaro.org>
 <f68524de-7a56-4cc6-a9ab-13dbae0ee0e5@quicinc.com>
 <c0bcf78f-409c-4992-99de-5e91a8f134e5@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <c0bcf78f-409c-4992-99de-5e91a8f134e5@lunn.ch>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _FgBTisBsoUT2T2pCE7PWbSBH3s23ulI
X-Proofpoint-ORIG-GUID: _FgBTisBsoUT2T2pCE7PWbSBH3s23ulI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260007
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Eric Dumazet <edumazet@google.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: net: qcom,
 ethqos: Drop fallback compatible for qcom, qcs615-ethqos
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



On 2024-12-26 00:17, Andrew Lunn wrote:
> On Wed, Dec 25, 2024 at 04:58:20PM +0800, Yijie Yang wrote:
>>
>>
>> On 2024-12-24 17:02, Krzysztof Kozlowski wrote:
>>> On 24/12/2024 04:07, Yijie Yang wrote:
>>>> The core version of EMAC on qcs615 has minor differences compared to that
>>>> on sm8150. During the bring-up routine, the loopback bit needs to be set,
>>>> and the Power-On Reset (POR) status of the registers isn't entirely
>>>> consistent with sm8150 either.
>>>> Therefore, it should be treated as a separate entity rather than a
>>>> fallback option.
>>>
>>> ... and explanation of ABI impact? You were asked about this last time,
>>> so this is supposed to end up here.
>>
>> I actually replied to this query last time, but maybe it wasn't clear.
>> Firstly, no one is using Ethernet on this platform yet. Secondly, the
>> previous fallback to sm8150 is incorrect and causes packet loss. Instead, it
>> should fall back to qcs404.
> 
> One of the purposes of the commit message is to answer questions
> reviews might have. You were even asked this question, so that should
> of been a clue to include the answer in the commit message.
> 

I will include it in the commit message in the next version.

> 	Andrew

-- 
Best Regards,
Yijie

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
