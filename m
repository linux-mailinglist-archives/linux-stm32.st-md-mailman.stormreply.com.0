Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 019C080C374
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Dec 2023 09:41:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5980C6B479;
	Mon, 11 Dec 2023 08:41:25 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E1BEC6B475
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 08:41:24 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BB5e83k028548; Mon, 11 Dec 2023 08:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=OloedqYYUwZtP1M5Bxe8DI7g155sUm6orY/Vc0ddjpQ=; b=S0
 7VF9zuMN40gCdvHqZEoX31bTBTiH6yAPJRNo3yN0WZK62FAyZW4NYpZBJRqomyJB
 berLXW7aag42QXv1pkJNxX7ka1pRJsHjqIid2BBBYm3CYrwiD9aeMoFT4FK8YqYF
 +pAh6TtWrycQUzlRxjML2k+fhkp73QKJvTwL7OE2vaIP5vNInoSE+KFiKDYd8IJc
 jN+AWwJZIwnNrPS03EB3Oqhh5Ajx07QT5/bEz7dCWDf3nfPzMZYkKagGF+qMREwx
 WW75AR3S2+dpSBmr2eQEEurk5q4xvup3zMJquTdj9dlsuALiepRC6gjxzEodzKej
 OA+8cxjnnWlldENNjioQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uvnhdtq45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Dec 2023 08:41:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BB8f5J6018074
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Dec 2023 08:41:05 GMT
Received: from [10.217.91.61] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Dec
 2023 00:40:57 -0800
Message-ID: <9d8250a9-8e00-4233-8bd9-9e49bd15fac5@quicinc.com>
Date: Mon, 11 Dec 2023 14:10:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>
References: <20231208062502.13124-1-quic_snehshah@quicinc.com>
 <5luxwdjyzkg5o6w27mqixggr65ebosnn53vaqrbtsclfudet4v@kse23pgyj7ld>
From: Sneh Shah <quic_snehshah@quicinc.com>
In-Reply-To: <5luxwdjyzkg5o6w27mqixggr65ebosnn53vaqrbtsclfudet4v@kse23pgyj7ld>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: wRHaFD2ugsi6Wj-ZGlreTuhfCFad-N5a
X-Proofpoint-ORIG-GUID: wRHaFD2ugsi6Wj-ZGlreTuhfCFad-N5a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312110073
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: update Rx clk divider
	for 10M SGMII
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



On 12/9/2023 9:54 AM, Bjorn Andersson wrote:
> On Fri, Dec 08, 2023 at 11:55:02AM +0530, Sneh Shah wrote:
>> SGMII 10MBPS mode needs RX clock divider to avoid drops in Rx.
>> Update configure SGMII function with rx clk divider programming.
> 
> Are you trying saying that the RX clock is completely wrong in 10MBps
> mode? Or is the RX clock good, but without some division of some other
> clock signal you loose some packets now and then?

Without the divider, Rx clock is completely wrong. All the packets will dropped.  
> 
> Please write your commit message such that it describe the actual
> problem you're having. This will help others to know if this fix is
> applicable to some issue they are seeing on their hardware, now and in
> the future.
> 
Rx clock divider is must for 10M SGMII to work for my hardware. Hence, It was mentioned that SGMII needs Rx clock divider for 10MBPS to work.
Will update the commit message to emphasize on how rx clock is completely wrong without this.
>>
>> Fixes: 463120c31c58 ("net: stmmac: dwmac-qcom-ethqos: add support for SGMII")
>> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
>> ---
>> v3 changelog:
>> - Added comment to explain why MAC needs to be reconfigured for SGMII
>> v2 changelog:
>> - Use FIELD_PREP to prepare bifield values in place of GENMASK
>> - Add fixes tag
>> ---
>>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>> index d3bf42d0fceb..ab2245995bc6 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>> @@ -34,6 +34,7 @@
>>  #define RGMII_CONFIG_LOOPBACK_EN		BIT(2)
>>  #define RGMII_CONFIG_PROG_SWAP			BIT(1)
>>  #define RGMII_CONFIG_DDR_MODE			BIT(0)
>> +#define RGMII_CONFIG_SGMII_CLK_DVDR		GENMASK(18, 10)
> 
> This new bitfield overlaps with existing fields, is it the same
> register? Did the fields move? Is it applicable to all versions?
> 
It is same register but bitfield is moved for new SGMII based HW version. Not applicable to older version. few bitfields of older HW version's RGMII register are repurposed in the new hw version for SGMII config.

> What will existing writes to RGMII_IO_MACRO_CONFIG do to this new
> layout? What will the new write do to hardware with the existing field
> layout?
> 
we have two functions to configure MAC IOMACRO interface.
1. ethqos_configure_sgmii( this used this new bifield) 2. ethqos_configure_rgmii ( this used old layout)
Old HW version uses ethqos_configure_rgmii only. New HW version used ethqos_configure_sgmii only.

Old HW version is not going to use this new layout. New HW version is not going to use old layout configuration.

>>  
>>  /* SDCC_HC_REG_DLL_CONFIG fields */
>>  #define SDCC_DLL_CONFIG_DLL_RST			BIT(30)
>> @@ -598,6 +599,9 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
>>  	return 0;
>>  }
>>  
>> +/* On interface toggle MAC registetrs gets reset.
>> + * Configure MAC block for SGMII on ethernet phy link up
>> + */
>>  static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
>>  {
>>  	int val;
>> @@ -617,6 +621,9 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
>>  	case SPEED_10:
>>  		val |= ETHQOS_MAC_CTRL_PORT_SEL;
>>  		val &= ~ETHQOS_MAC_CTRL_SPEED_MODE;
>> +		rgmii_updatel(ethqos, RGMII_CONFIG_SGMII_CLK_DVDR,
>> +			      FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR, 0x31),
> 
> Is this just a magic constant, or does 0x31 of some convenient unit?
> Could we give it name/define?
> 
It is just a constant based on programming guide of HW.  Will add a #define for it.
> Regards,
> Bjorn
> 
>> +			      RGMII_IO_MACRO_CONFIG);
>>  		break;
>>  	}
>>  
>> -- 
>> 2.17.1
>>
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
