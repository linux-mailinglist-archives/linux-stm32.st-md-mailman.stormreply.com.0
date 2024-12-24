Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A97229FB99E
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Dec 2024 07:03:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5343FC78F67;
	Tue, 24 Dec 2024 06:03:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06325C78037
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Dec 2024 06:03:21 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNJsFHF029564;
 Tue, 24 Dec 2024 06:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FXGwN3B4CatXIc79rUG8DB695XnToJE0LbzpQoCZtRo=; b=mHI5ck+X5Bh1CJfr
 i+B8jXvlNF7b5vHmjadu6oBDBTuqJOxmJHnOn6uUgDCujHP3qgDiFYwAXiR440bj
 /Kpj4d9jpcXxMRrVdC4PXstxAo8ouBhRQIneaqEWFyQJtH+TZh5OGF5dOcKH8z93
 yEmlykA9flL5F1O8MCDb0mOj3628oISq7nHUIeq9hTe3vaLkThVetmrqmWg7dG2J
 iJBnLW/uuIwBeqXOaZpFFXgxs9M+0lXR12xgtKCWr9F3sGDGkqw+MQEEHSorn/a8
 aPFwwb1BtSNXjItHjJA/149MhQUKcjyjOV8kTQERePBPDbjM8Y6DiJMQX/Np8HcJ
 71G+dg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qee0hd72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Dec 2024 06:03:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BO633s2029146
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Dec 2024 06:03:03 GMT
Received: from [10.253.36.144] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 22:02:57 -0800
Message-ID: <6cb92d11-eb5a-418b-ab9b-7c6be168fd06@quicinc.com>
Date: Tue, 24 Dec 2024 14:02:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <t7q7szqjd475kao2bp6lzfrgbueq3niy5lonkfvbcotz5heepi@tqdiiwalhgtg>
 <c57a18aa-6606-4a3a-b508-8e335fda3e31@quicinc.com>
 <CAA8EJpoSUepFZgXHmozdPwWdtrjYiMa4bDsozuEr=tec1wj_Gw@mail.gmail.com>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <CAA8EJpoSUepFZgXHmozdPwWdtrjYiMa4bDsozuEr=tec1wj_Gw@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: nv834TXd3nvFwaEYRt9Ap8MwSHnDP0i2
X-Proofpoint-GUID: nv834TXd3nvFwaEYRt9Ap8MwSHnDP0i2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=741 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240047
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/3] Add standalone ethernet MAC
	entries for qcs615
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



On 2024-12-24 13:53, Dmitry Baryshkov wrote:
> On Tue, 24 Dec 2024 at 07:47, Yijie Yang <quic_yijiyang@quicinc.com> wrote:
>>
>>
>>
>> On 2024-12-24 12:16, Dmitry Baryshkov wrote:
>>> On Tue, Dec 24, 2024 at 11:07:00AM +0800, Yijie Yang wrote:
>>>> Add separate EMAC entries for qcs615 since its core version is 2.3.1,
>>>> compared to sm8150's 2.1.2.
>>>>
>>>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>>>> ---
>>>> Changes in v2:
>>>> - Update the subject for the first patch.
>>>> - Link to v1: https://lore.kernel.org/r/20241118-schema-v1-0-11b7c1583c0c@quicinc.com
>>>>
>>>> ---
>>>> Yijie Yang (3):
>>>>         dt-bindings: net: qcom,ethqos: Drop fallback compatible for qcom,qcs615-ethqos
>>>>         dt-bindings: net: snps,dwmac: add description for qcs615
>>>>         net: stmmac: dwmac-qcom-ethqos: add support for EMAC on qcs615 platforms
>>>>
>>>>    Documentation/devicetree/bindings/net/qcom,ethqos.yaml  |  5 +----
>>>>    Documentation/devicetree/bindings/net/snps,dwmac.yaml   |  2 ++
>>>>    drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
>>>>    3 files changed, 20 insertions(+), 4 deletions(-)
>>>> ---
>>>> base-commit: 3664e6c4f4d07fa51834cd59d94b42b7f803e79b
>>>
>>> Which commit is it? I can't find it in linux-next
>>
>> It's a tag next-20241108, titled 'Add linux-next specific files for
>> 20241108'.
> 
> Nearly two months old? okay...

I will provide an update in the next version.

> 

-- 
Best Regards,
Yijie

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
