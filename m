Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC0F9D5707
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Nov 2024 02:21:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF53DC7A839;
	Fri, 22 Nov 2024 01:21:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E68EC7A838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Nov 2024 01:21:12 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALKxwOE002369;
 Fri, 22 Nov 2024 01:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mJY+C2OrUNq8Cv/RftLal0ztMq2TbuzpXQ7+SdQmAU4=; b=CTc6EXIKke9fSPk7
 mcmffX4yJhwHbTI1K7gXt59cXgLZ4DFcRqS6aLyP5DItJ02+V5Gam/067tg+Rf2l
 LKbi/5n4f88FOTmotPeEllpLpNIRVKoUUyQCVtvCoBrpg6JE1J9igZDcgb95DING
 YxzK0+76mXPzM/PdFSSoO9PrpsiCuoNIYKid4IET26kNLQtfrvtXgMW5Sk4nbRO7
 Ax1IR3AhTdhram6z7UtmTs+Cwzu/POGjzH1t7irzh/p9hKi51oB6JMajm1eVKl4D
 JvJfPBXgVNV5ElO+wBi5nyKRTLyPYI9g4iDD1IslADgsH7q8Mkb3+v1OK99tO7L3
 NulYBw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ea75cwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Nov 2024 01:20:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM1KrKK021474
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Nov 2024 01:20:53 GMT
Received: from [10.253.13.126] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 17:20:46 -0800
Message-ID: <32eb38dd-1176-4356-b36c-00aa34a07040@quicinc.com>
Date: Fri, 22 Nov 2024 09:20:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, "Andrew
 Lunn" <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20241118-schema-v1-0-11b7c1583c0c@quicinc.com>
 <3cfc2e90-c9b4-425d-80f4-ddace9aff021@redhat.com>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <3cfc2e90-c9b4-425d-80f4-ddace9aff021@redhat.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: dYuuCkmnewuO-08MOeB_S_9jO_bMNVm_
X-Proofpoint-ORIG-GUID: dYuuCkmnewuO-08MOeB_S_9jO_bMNVm_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=587
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220009
Cc: quic_jsuraj@quicinc.com, devicetree@vger.kernel.org,
 quic_tengfan@quicinc.com, netdev@vger.kernel.org, quic_tingweiz@quicinc.com,
 quic_jiegan@quicinc.com, linux-kernel@vger.kernel.org, quic_aiquny@quicinc.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, quic_jingyw@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] Add standalone ethernet MAC entries
	for qcs615
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



On 2024-11-19 19:18, Paolo Abeni wrote:
> On 11/18/24 07:16, Yijie Yang wrote:
>> Add separate EMAC entries for qcs615 since its core version is 2.3.1,
>> compared to sm8150's 2.1.2.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ## Form letter - net-next-closed
> 
> The merge window for v6.13 has begun and net-next is closed for new
> drivers, features, code refactoring and optimizations. We are currently
> accepting bug fixes only.
> 
> Please repost when net-next reopens after Dec 2nd.
> 
> RFC patches sent for review only are welcome at any time.
> 
> See:
> https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
> 

Thank you for the reminder.

> 

-- 
Best Regards,
Yijie

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
