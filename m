Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D12E8559E5
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Feb 2024 05:48:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3860C62EFE;
	Thu, 15 Feb 2024 04:48:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7ED3CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 04:48:15 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41F4MMq5010025; Thu, 15 Feb 2024 04:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=57EHGLJUekwB27YpA6QFEIQ+R7ja+si5OreIJSovoWE=; b=I6
 L9U/aWMxUFIONiViC/rPMptUXOIMM1RhOQJyZW2FDRKY6inCPze0mh3VDlNmPdVd
 6nwnhL6I3Rn0R76S8bkxwaHfe0owUcrwF25poFgD6o/InKuSy/TbEWOnLRV21icO
 sPdJs2+BmNNHLivcFR+nP2oKxCMCrzv8nmgNQUyArobj1eNo8Q0DWk7Vr/J/DJi6
 cq764ZBP4dRnVd9+fxW+mD6hvLXamQ9h+q3d+wSjDoTbsKTzTPxTVKVuFsAmA693
 WN3AnmKitgWwQ6Zj3IY4+Jf/XxqbsnCGuLlR7Q0SR2bUpWWUDvpMVzKiiKByhdof
 it/93PSOMC25fRxzmB1g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9bfs01h0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Feb 2024 04:47:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41F4lqGO019041
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Feb 2024 04:47:52 GMT
Received: from [10.216.17.27] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 14 Feb
 2024 20:47:44 -0800
Message-ID: <7a567b50-66f1-4737-ae6c-0dabd1d39bcf@quicinc.com>
Date: Thu, 15 Feb 2024 10:17:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
References: <20240208111714.11456-1-quic_snehshah@quicinc.com>
 <20240212173015.0341f0ee@kernel.org>
From: Sneh Shah <quic_snehshah@quicinc.com>
In-Reply-To: <20240212173015.0341f0ee@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 3RXFTHEoRYOKGGlv-yqGshlNz6ajAfjq
X-Proofpoint-GUID: 3RXFTHEoRYOKGGlv-yqGshlNz6ajAfjq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_04,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 adultscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402150033
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4] net: stmmac:
 dwmac-qcom-ethqos: Add support for 2.5G SGMII
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



On 2/13/2024 7:00 AM, Jakub Kicinski wrote:
> On Thu,  8 Feb 2024 16:47:14 +0530 Sneh Shah wrote:
>> Serdes phy needs to operate at 2500 mode for 2.5G speed and 1000
>> mode for 1G/100M/10M speed.
>> Added changes to configure serdes phy and mac based on link speed.
>> Changing serdes phy speed involves multiple register writes for
>> serdes block. To avoid redundant write operations only update serdes
>> phy when new speed is different.
> 
> Sounds like 2 separate changes in one patch, please split the
> optimization of not writing the registers multiple times and
> the 2.5G support.
> 

Optimization is part of 2.5G support change only. with introduction of
2.5G speed support we need to update reconfigure serdes phy. there are
2 different serdes configs.
1. config for 2.5G
2. common config 1G/100M/10M

The change here is not to reconfigure serdes phy among
1G/100M/10M speeds and only reconfigure if it switches to 2.5G.

>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>> index 31631e3f89d0..6bbdbb7bef44 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>> @@ -106,6 +106,7 @@ struct qcom_ethqos {
>>  	struct clk *link_clk;
>>  	struct phy *serdes_phy;
>>  	unsigned int speed;
>> +	int serdes_speed;
> 
> Why signed if speed itself is unsigned?

In stmmac speed can be assigned as SPEED_UNKNOWN which will be -1.
I will fix speed being unsigned int in a separate patch.

> 
>>  	/* Enable and restart the Auto-Negotiation */
>>  	if (ane)
>>  		value |= GMAC_AN_CTRL_ANE | GMAC_AN_CTRL_RAN;
>> +	else
>> +		value &= ~GMAC_AN_CTRL_ANE;
> 
> That looks unrelated. Either a separate patch or please explain in the
> commit msg why.

For 2.5G speed support MAC PCS autoneg needs to be disabled.
This adds the change to disable PCS autoneg. I will update commit
message to add more dtails
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
