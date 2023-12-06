Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9CD806E68
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Dec 2023 12:48:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A363C6C855;
	Wed,  6 Dec 2023 11:48:44 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1600C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Dec 2023 11:48:42 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B6ASh92021416; Wed, 6 Dec 2023 11:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=i/AKFSSfnBuhU1k9dGXdGPic9GfGYHJhpTGcMfynM8w=;
 b=PJSVzEFL+NDlG3tEvn4GOXdDbzSh2OuYHvAYz9OeJU3CHSqQ0tCEs7mum62+0otk4o8d
 WL+VZK3Xll7T1mN0itr3VjOf6TiTyGXuSkSl/g/rZojAibnTwZTlh1LuzjbzKAoL+1JQ
 UOkHku2AthZ2ixW/PLJ9atJC7iPB6F2FN4BE81QM5e4eACK1ldQN8Ce2/DMTRZl0przZ
 +tma1kkahi/y3EvNi6PJII8CRCmsTpezcl9phj7JCxxWeRGQS1DNEkuavVoBvzNY8HLz
 jnaVirdz9TG4zp1v7jn55g3qiv71f/CQP/CU3lBtHID50msjhIDUWYMgZP1Hy1qWV+9G yA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3utd5nhhd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Dec 2023 11:48:16 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B6BmFK1013080
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 6 Dec 2023 11:48:15 GMT
Received: from [10.216.47.147] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 03:47:29 -0800
Message-ID: <5d5f3955-fc30-428c-99f4-42f9b7580a84@quicinc.com>
Date: Wed, 6 Dec 2023 17:17:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20231204084854.31543-1-quic_snehshah@quicinc.com>
 <3e4a1b9c-ed0f-466e-ba11-fc5b7ef308a1@lunn.ch>
From: Sneh Shah <quic_snehshah@quicinc.com>
In-Reply-To: <3e4a1b9c-ed0f-466e-ba11-fc5b7ef308a1@lunn.ch>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: hZ9NNN9k50p4_qLz5sJ2DEbMAxBD1qip
X-Proofpoint-GUID: hZ9NNN9k50p4_qLz5sJ2DEbMAxBD1qip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_09,2023-12-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 clxscore=1011 mlxscore=0 mlxlogscore=727
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312060098
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: qcom-ethqos: Add
 sysfs nodes for qcom ethqos
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



On 12/5/2023 8:38 PM, Andrew Lunn wrote:
> On Mon, Dec 04, 2023 at 02:18:54PM +0530, Sneh Shah wrote:
>> Add sysfs nodes to conifigure routing of specific vlan id to GVM queue.
>> GVM queue is not exposed to PVM stmmac, so TC ops can't configure routing.
> 
> Adding files in /sysfs has ~0 chance of being accepted.
> 
> As requested, please explain what all these different hardware blocks
> are, and what you are trying to achieve. We can then recommend the
> correct interface.
> 
>     Andrew
> 
> ---
> pw-bot: cr

We have multiVM Architecture here. PVM  will have stmmac running with 4 Rx Tx queues. stmmac in PVM is responsible to configure whole ethernet HW MAC/DMA/MTL ( including clocks, regulators and other core bsp elements).
In GVM we have thin Ethernet driver, which is responsible to configure and manage only 1 Rx/TX queue, i.e 5th Rx/Tx ethernet queue. GVM can't access any other resisters apart from this 5th queue specific MTL and DMA registers.

We need to route vlan traffic of a specific Priority to GVM Queue (Ethernet queue 5) via programming a MAC register. The MAC register is not accessible in GVM and has to be programmed from PVM. stmmac already has TC OPS to program this routing via vlan priority. However, as PVM has only 4 queues enabled, TC tool will not take 5th queue as input. Hence, these nodes were added to conifure the MAC register to route specific vlan packets to 5th queue in GVM.

Note: The queues mentioned above are HW MTL Queues and DMA Channels. The routing can be done in the HW itself based on vlan pcp before the packets reach to driver.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
