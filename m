Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B7E924C2E
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 01:39:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE692C71282;
	Tue,  2 Jul 2024 23:39:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5777C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jul 2024 23:39:14 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462HA2a8026187;
 Tue, 2 Jul 2024 23:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 a9QKQLFDVHH7M2yZELH6J8W3bzlpa8FwEYoxmvRJ3Cc=; b=LuR9WHgh+LA2qTcV
 i/0WCieOpJaEu1gmw3+TJfjWYHEwq2sXMAzq0rp0uDz0uknStjmYmAyOz4e8Z92R
 xm0ozpwBGmhGRqkr3R7IHmQoUAbwHU7vQrEv2+4ZrxtCTuQZGNb9oEvIusxq+qjo
 eTvMEfItsvzJqsCNtfoy7biQpSb9aVFfUIr9Fvd+phCDCZce5uoVifZWwEXvzjT3
 kJs5CGlTCE9j/43qz8s8sP1RmXeEpl+6yz22MStklrZGH84xuWqufbie+c4lsrU3
 88221o8dnWSRPlvWyMk7+IfGr3HEBHTBuW0cc3VWx9Y3p7532xfk6/nQfkCl4H5g
 r/Vh/Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402abtq6tx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jul 2024 23:38:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 462Ncpqk031705
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 2 Jul 2024 23:38:51 GMT
Received: from [10.110.54.196] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 2 Jul 2024
 16:38:47 -0700
Message-ID: <02dbe022-b45d-43eb-8769-bcf2a92e7c6f@quicinc.com>
Date: Tue, 2 Jul 2024 16:38:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-3-eaa7cf9060f0@quicinc.com>
 <Zn82VaTQBe0LkhSa@shell.armlinux.org.uk>
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <Zn82VaTQBe0LkhSa@shell.armlinux.org.uk>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KZYOA__XQ6LuL0KP4BYDvMtVwsvrjhxq
X-Proofpoint-ORIG-GUID: KZYOA__XQ6LuL0KP4BYDvMtVwsvrjhxq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_16,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=822 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407020174
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@quicinc.com, linux-kernel@vger.kernel.org, Bhupesh
 Sharma <bhupesh.sharma@linaro.org>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Jakub
 Kicinski <kuba@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v2 3/3] net: stmmac: Bring down the clocks
 to lower frequencies when mac link goes down
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



On 6/28/2024 3:16 PM, Russell King (Oracle) wrote:
> On Tue, Jun 25, 2024 at 04:49:30PM -0700, Sagar Cheluvegowda wrote:
>> When mac link goes down we don't need to mainitain the clocks to operate
>> at higher frequencies, as an optimized solution to save power when
>> the link goes down we are trying to bring down the clocks to the
>> frequencies corresponding to the lowest speed possible.
> 
> I thought I had already commented on a similar patch, but I can't find
> anything in my mailboxes to suggest I had.
> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index ec7c61ee44d4..f0166f0bc25f 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -996,6 +996,9 @@ static void stmmac_mac_link_down(struct phylink_config *config,
>>  {
>>  	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
>>  
>> +	if (priv->plat->fix_mac_speed)
>> +		priv->plat->fix_mac_speed(priv->plat->bsp_priv, SPEED_10, mode);
>> +
>>  	stmmac_mac_set(priv, priv->ioaddr, false);
>>  	priv->eee_active = false;
>>  	priv->tx_lpi_enabled = false;
>> @@ -1004,6 +1007,11 @@ static void stmmac_mac_link_down(struct phylink_config *config,
>>  
>>  	if (priv->dma_cap.fpesel)
>>  		stmmac_fpe_link_state_handle(priv, false);
>> +
>> +	stmmac_set_icc_bw(priv, SPEED_10);
>> +
>> +	if (priv->plat->fix_mac_speed)
>> +		priv->plat->fix_mac_speed(priv->plat->bsp_priv, SPEED_10, mode);
> 
> Two things here:
> 
> 1) Why do we need to call fix_mac_speed() at the start and end of this
>    stmmac_mac_link_down()?
This was a typo, i will remove this.
> 
> 2) What if the MAC doesn't support 10M operation? For example, dwxgmac2
>    and dwxlgmac2 do not support anything below 1G. It feels that this
>    is storing up a problem for the future, where a platform that uses
>    e.g. xlgmac2 also implements fix_mac_speed() and then gets a
>    surprise when it's called with SPEED_10.
> 
> Personally, I don't like "fix_mac_speed", and I don't like it even more
> with this change. I would prefer to see link_up/link_down style
> operations so that platforms can do whatever they need to on those
> events, rather than being told what to do by a single call that may
> look identical irrespective of whether the link came up or went down.
> 
I will drop this patch[3/3] from this series now and i will do some analysis
on platform level link up and link down functions and post the changes as a
new series altogether.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
