Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F302A919B38
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 01:39:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABAABC6DD9F;
	Wed, 26 Jun 2024 23:39:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A4ECC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 23:38:57 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QNYtqB006504;
 Wed, 26 Jun 2024 23:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 R6Rs9Fq58P9yRSjGFSFKeaNK0+sOk6d8tymVZUB/39s=; b=gNadM60/l0HV2Jcg
 EQEI0kTh8CqFGUwraMntBUhkxWIOEmnNmSFOfvBbX/nSFcQgZn90qqV/6M60b4/V
 qPGiRTVRfDMtn7gh2WXysh4PC4xbyaskZtzgX+cRd8UWiXD87Oj+IZ8FHlygsfjI
 RXg89PYe0Gy4VZBbt7KUder8oqlyNBNjAQcNzHPQkwQlnJnNCqkZCeRSY8hQa8L5
 /t8tZU0gLX+Gw0TNdxzKwpHlrJdVpnXbRjWCkT61AP3HaM7EBM4jvmmwOKtdkDy4
 hxymkGoYtuXAnFB2yCQeOOKWd/BVZHwrBZhF/KhBI702t2Oe2qDB4i2drmg7if4s
 ViXj/w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnjs2h03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 23:38:38 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45QNcbEQ028270
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 23:38:37 GMT
Received: from [10.110.22.187] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 16:38:34 -0700
Message-ID: <cf6c2526-ba12-4627-b4e9-20ce5b4d175c@quicinc.com>
Date: Wed, 26 Jun 2024 16:38:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Halaney <ahalaney@redhat.com>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-2-eaa7cf9060f0@quicinc.com>
 <owkerbnbenzwtnu2kbbas5brhnak2e37azxtzezmw3hb6mficq@ffpqrqglmp4c>
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <owkerbnbenzwtnu2kbbas5brhnak2e37azxtzezmw3hb6mficq@ffpqrqglmp4c>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MDvqzdLntVUaQnSMAfluN_CWz-SEBwHx
X-Proofpoint-ORIG-GUID: MDvqzdLntVUaQnSMAfluN_CWz-SEBwHx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_15,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260174
Cc: Rob Herring <robh@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub
 Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/3] net: stmmac: Add interconnect
	support
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



On 6/26/2024 7:54 AM, Andrew Halaney wrote:
> On Tue, Jun 25, 2024 at 04:49:29PM GMT, Sagar Cheluvegowda wrote:
>> Add interconnect support to vote for bus bandwidth based
>> on the current speed of the driver.This change adds support
>> for two different paths - one from ethernet to DDR and the
>> other from Apps to ethernet.
> 
> "APPS" is a qualcomm term, since you're trying to go the generic route
> here maybe just say CPU to ethernet?
> 
I can update this in my next patch.

Sagar
>> Vote from each interconnect client is aggregated and the on-chip
>> interconnect hardware is configured to the most appropriate
>> bandwidth profile.
>>
>> Suggested-by: Andrew Halaney <ahalaney@redhat.com>
>> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
>> ---
>>  drivers/net/ethernet/stmicro/stmmac/stmmac.h          |  1 +
>>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     |  8 ++++++++
>>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 12 ++++++++++++
>>  include/linux/stmmac.h                                |  2 ++
>>  4 files changed, 23 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
>> index b23b920eedb1..56a282d2b8cd 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
>> @@ -21,6 +21,7 @@
>>  #include <linux/ptp_clock_kernel.h>
>>  #include <linux/net_tstamp.h>
>>  #include <linux/reset.h>
>> +#include <linux/interconnect.h>
>>  #include <net/page_pool/types.h>
>>  #include <net/xdp.h>
>>  #include <uapi/linux/bpf.h>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index b3afc7cb7d72..ec7c61ee44d4 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -985,6 +985,12 @@ static void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
>>  	}
>>  }
>>  
>> +static void stmmac_set_icc_bw(struct stmmac_priv *priv, unsigned int speed)
>> +{
>> +	icc_set_bw(priv->plat->axi_icc_path, Mbps_to_icc(speed), Mbps_to_icc(speed));
>> +	icc_set_bw(priv->plat->ahb_icc_path, Mbps_to_icc(speed), Mbps_to_icc(speed));
>> +}
>> +
>>  static void stmmac_mac_link_down(struct phylink_config *config,
>>  				 unsigned int mode, phy_interface_t interface)
>>  {
>> @@ -1080,6 +1086,8 @@ static void stmmac_mac_link_up(struct phylink_config *config,
>>  	if (priv->plat->fix_mac_speed)
>>  		priv->plat->fix_mac_speed(priv->plat->bsp_priv, speed, mode);
>>  
>> +	stmmac_set_icc_bw(priv, speed);
>> +
>>  	if (!duplex)
>>  		ctrl &= ~priv->hw->link.duplex;
>>  	else
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> index 54797edc9b38..e46c94b643a3 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> @@ -642,6 +642,18 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>>  		dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
>>  	}
>>  
>> +	plat->axi_icc_path = devm_of_icc_get(&pdev->dev, "axi");
>> +	if (IS_ERR(plat->axi_icc_path)) {
>> +		ret = (void *)plat->axi_icc_path;
>> +		goto error_hw_init;
>> +	}
>> +
>> +	plat->ahb_icc_path = devm_of_icc_get(&pdev->dev, "ahb");
>> +	if (IS_ERR(plat->ahb_icc_path)) {
>> +		ret = (void *)plat->ahb_icc_path;
>> +		goto error_hw_init;
>> +	}
>> +
>>  	plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev,
>>  							   STMMAC_RESOURCE_NAME);
>>  	if (IS_ERR(plat->stmmac_rst)) {
>> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
>> index f92c195c76ed..385f352a0c23 100644
>> --- a/include/linux/stmmac.h
>> +++ b/include/linux/stmmac.h
>> @@ -283,6 +283,8 @@ struct plat_stmmacenet_data {
>>  	struct reset_control *stmmac_rst;
>>  	struct reset_control *stmmac_ahb_rst;
>>  	struct stmmac_axi *axi;
>> +	struct icc_path *axi_icc_path;
>> +	struct icc_path *ahb_icc_path;
>>  	int has_gmac4;
>>  	int rss_en;
>>  	int mac_port_sel_speed;
>>
>> -- 
>> 2.34.1
>>
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
