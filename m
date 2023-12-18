Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0571C8173A0
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 15:33:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E1BFC6DD70;
	Mon, 18 Dec 2023 14:33:35 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07148C6DD6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Dec 2023 14:33:33 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BICKfws024358; Mon, 18 Dec 2023 14:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=puoFa3yLTYW107D/vW65vbmYC2kIEd07nOsLiYZz1CU=; b=QJ
 BOxDO6UKjh//EXJd/XbSDkjdNT52ubgNs3nbXWSymtYWv9EsOPdJLj7WumBXItb5
 VKBQkHeU5rG1KUnIGCtulRcphymWRlZ1dqL/rSBcMgQ1DSl1B7hadekO+8w9q6yY
 tVWU5Ohiz6zPgjUVYLGLPTXU5yReKZiVjaemwjA9D7BPCAzJoXb2In65F/7UJ0rx
 hx5bVvojDa+gkM5c7Ur/7VjSTDUbaUQBPJGqGuyTXKrSWiHvlc2dIp3je3PHZ88L
 IcTsQD+dWwIA2Btkh+amfQklEa4bYYeJ0X2se/cmxolBtxWYImZOmqAb4oNRZXO4
 d0K2N4aHyCBenSAPu/dA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v2n178e5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Dec 2023 14:33:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BIEXAeD011655
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Dec 2023 14:33:10 GMT
Received: from [10.216.38.106] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Dec
 2023 06:33:02 -0800
Message-ID: <edfb87b5-504e-467d-9119-66b59727cc21@quicinc.com>
Date: Mon, 18 Dec 2023 20:02:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
References: <20231218071118.21879-1-quic_snehshah@quicinc.com>
 <20231218152112.4adc5961@device-28.home>
From: Sneh Shah <quic_snehshah@quicinc.com>
In-Reply-To: <20231218152112.4adc5961@device-28.home>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: r4LEj6Q7sAtbhhkWp8JygyP8bKFV1Ssg
X-Proofpoint-GUID: r4LEj6Q7sAtbhhkWp8JygyP8bKFV1Ssg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312180106
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac-qcom-ethqos:
 Add support for 2.5G SGMII
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

Hi,

On 12/18/2023 7:51 PM, Maxime Chevallier wrote:
> Hi,
> 
> On Mon, 18 Dec 2023 12:41:18 +0530
> Sneh Shah <quic_snehshah@quicinc.com> wrote:
> 
>> Serdes phy needs to operate at 2500 mode for 2.5G speed and 1000
>> mode for 1G/100M/10M speed.
>> Added changes to configure serdes phy and mac based on link speed.
>>
>> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
>> ---
>>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 31 +++++++++++++++++--
>>  1 file changed, 29 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>> index d3bf42d0fceb..b3a28dc19161 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>> @@ -21,6 +21,7 @@
>>  #define RGMII_IO_MACRO_CONFIG2		0x1C
>>  #define RGMII_IO_MACRO_DEBUG1		0x20
>>  #define EMAC_SYSTEM_LOW_POWER_DEBUG	0x28
>> +#define ETHQOS_MAC_AN_CTRL		0xE0
>>  
>>  /* RGMII_IO_MACRO_CONFIG fields */
>>  #define RGMII_CONFIG_FUNC_CLK_EN		BIT(30)
>> @@ -78,6 +79,10 @@
>>  #define ETHQOS_MAC_CTRL_SPEED_MODE		BIT(14)
>>  #define ETHQOS_MAC_CTRL_PORT_SEL		BIT(15)
>>  
>> +/*ETHQOS_MAC_AN_CTRL bits */
>> +#define ETHQOS_MAC_AN_CTRL_RAN			BIT(9)
>> +#define ETHQOS_MAC_AN_CTRL_ANE			BIT(12)
>> +
>>  struct ethqos_emac_por {
>>  	unsigned int offset;
>>  	unsigned int value;
>> @@ -109,6 +114,7 @@ struct qcom_ethqos {
>>  	unsigned int num_por;
>>  	bool rgmii_config_loopback_en;
>>  	bool has_emac_ge_3;
>> +	unsigned int serdes_speed;
> 
> Looks like you are storing SPEED_XXX definitions here, which can be
> negative in case of SPEED_UNKNOWN, so this should be an int.
Agree, will update this in next patch.
> 
>>  };
>>  
>>  static int rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
>> @@ -600,27 +606,47 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
>>  
>>  static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
>>  {
>> -	int val;
>> -
>> +	int val, mac_an_value;
>>  	val = readl(ethqos->mac_base + MAC_CTRL_REG);
>> +	mac_an_value = readl(ethqos->mac_base + ETHQOS_MAC_AN_CTRL);
>>  
>>  	switch (ethqos->speed) {
>> +	case SPEED_2500:
>> +		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
>> +		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
>> +			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
>> +			      RGMII_IO_MACRO_CONFIG2);
>> +		if (ethqos->serdes_speed != SPEED_2500)
>> +			phy_set_speed(ethqos->serdes_phy, ethqos->speed);
>> +		mac_an_value &= ~ETHQOS_MAC_AN_CTRL_ANE;
>> +		break;
>>  	case SPEED_1000:
>>  		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
>>  		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
>>  			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
>>  			      RGMII_IO_MACRO_CONFIG2);
>> +		if (ethqos->serdes_speed != SPEED_1000)
>> +			phy_set_speed(ethqos->serdes_phy, ethqos->speed);
>> +		mac_an_value |= ETHQOS_MAC_AN_CTRL_RAN | ETHQOS_MAC_AN_CTRL_ANE;
>>  		break;
>>  	case SPEED_100:
>>  		val |= ETHQOS_MAC_CTRL_PORT_SEL | ETHQOS_MAC_CTRL_SPEED_MODE;
>> +		if (ethqos->serdes_speed != SPEED_1000)
>> +			phy_set_speed(ethqos->serdes_phy, ethqos->speed);
> 
> I understand that SGMII's serdes always runs at 1000 / 2500, but this
> check doesn't make much sense then, if the speed isn't 1000, then you
> set the serdes PHY's speed to 100, and the assignment that comes after
> that switch-case will also set the serdes speed to 100.
> 
> Also, if the serdes PHY really needs to be configured differently for
> 10/100/1000, then switching from speed 1000 to speed 100 for example
> won't trigger a serdes PHY reconfiguration here.
> 
> My guess is that you want something like :
> 
> 	phy_set_speed(ethqos->serdes_phy, SPEED_1000)
> 
> and the assignment at the end of the switch-case should be
> SPEED_1000/SPEED_2500 only (see the comment bellow).

Good point, we have only serdes speed of 1000 and 2500. So for 1000/100/10 we should set ethqos_serdes to speed_1000 and pass speed_1000 to phy_set_speed in case of 1000/100/10. Will update this in next patch.
> 
>> +		mac_an_value |= ETHQOS_MAC_AN_CTRL_RAN | ETHQOS_MAC_AN_CTRL_ANE;
>>  		break;
>>  	case SPEED_10:
>>  		val |= ETHQOS_MAC_CTRL_PORT_SEL;
>>  		val &= ~ETHQOS_MAC_CTRL_SPEED_MODE;
>> +		if (ethqos->serdes_speed != SPEED_1000)
>> +			phy_set_speed(ethqos->serdes_phy, ethqos->speed);
> 
> Same remark here
> 
>> +		mac_an_value |= ETHQOS_MAC_AN_CTRL_RAN | ETHQOS_MAC_AN_CTRL_ANE;
>>  		break;
>>  	}
>>  
>>  	writel(val, ethqos->mac_base + MAC_CTRL_REG);
>> +	writel(mac_an_value, ethqos->mac_base + ETHQOS_MAC_AN_CTRL);
>> +	ethqos->serdes_speed = ethqos->speed;
> 
> Although the code will behave the same, as you are storing the true
> serdes speed here, shouldn't it be either SPEED_1000 or SPEED_2500 ?
> 
> You'll end-up storing SPEED_10 / SPEED_100 should the link use these
> speeds, which doesn't represent the true serdes speed.
> 
> This would spare serdes reconfigurations when alternating between
> 10/100/1000M speeds.
> 
>>  	return val;
>>  }
>> @@ -789,6 +815,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>>  				     "Failed to get serdes phy\n");
>>  
>>  	ethqos->speed = SPEED_1000;
>> +	ethqos->serdes_speed = SPEED_1000;
>>  	ethqos_update_link_clk(ethqos, SPEED_1000);
>>  	ethqos_set_func_clk_en(ethqos);
>>  
> 
> Thanks,
> 
> Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
