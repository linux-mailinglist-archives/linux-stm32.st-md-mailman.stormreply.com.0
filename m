Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1039885C882
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Feb 2024 22:22:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B137EC6B45E;
	Tue, 20 Feb 2024 21:22:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11E48C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 21:22:41 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41KJD5hY002449; Tue, 20 Feb 2024 21:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=OdMEj7azN4uCGGFB9DoExghf1hCn72OYfVqg/ygKTi4=; b=F4
 iJGJTvnw88Ez4o1ZtCTy273OpTQnJWq0SO4RMCfiSWfT9NS2iStDfZoYng4YS9Zq
 Lrdg7/hfBdWWZ7MJtDZWBAkKBjwqDrH22Rt/Q1OLXngrcmh76hhqZWDgSWOZKptC
 4NUeQZ76ydWzLo9612rcyFaYa7w7Gp5ZPRuR/5yckjX4/LDCagjHGdDRkLTgNNg/
 kpFJSgd9xULSx5bznnAuz61tiGrmT+2gkXXuso10clRG4FKChfr7QRIhDE2Dtb9i
 CGLQo2O92rA3BRyeugCUu4EFs/ZclhM3GYu1O4T+m8EsoW63WSo9nop3rFuXdZOi
 GmLUafi6cndh5px8FbBg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wd21s089c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 21:22:24 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41KLMNDp025986
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 21:22:23 GMT
Received: from [10.46.19.239] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 20 Feb
 2024 13:22:20 -0800
Message-ID: <e3688f73-2040-4cd2-965a-0ed5482aff2d@quicinc.com>
Date: Tue, 20 Feb 2024 13:22:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sneh Shah <quic_snehshah@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240220050735.29507-1-quic_snehshah@quicinc.com>
Content-Language: en-US
From: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>
In-Reply-To: <20240220050735.29507-1-quic_snehshah@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: oj5a9uhE6Yc3ERR5VRnTqQ-Be2wgTtNV
X-Proofpoint-GUID: oj5a9uhE6Yc3ERR5VRnTqQ-Be2wgTtNV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402200153
Cc: kernel@quicinc.com, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next v5] net: stmmac:
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



On 2/19/2024 9:07 PM, Sneh Shah wrote:
> Serdes phy needs to operate at 2500 mode for 2.5G speed and 1000
> mode for 1G/100M/10M speed.
> Added changes to configure serdes phy and mac based on link speed.
> Changing serdes phy speed involves multiple register writes for
> serdes block. To avoid redundant write operations only update serdes
> phy when new speed is different.
> For 2500 speed MAC PCS autoneg needs to disabled. Added changes to
> disable MAC PCS autoneg if ANE parameter is not set.
> 
> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
Tested-by: Abhishek Chauhan <quic_abchauha@quicinc.com> # sa8775p-ride
Reviewed-by: Abhishek Chauhan <quic_abchauha@quicinc.com>
> ---
> v5 changelog:
> - Updated commit message with more details on MAC PCS autoneg disable
> v4 changelog:
> - Made cosmetic changes
> v3 changelog:
> - updated commit message
> ---
> v2 changelog:
> - updated stmmac_pcs_ane to support autoneg disable
> - Update serdes speed to 1000 for 100M and 10M also---
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 26 +++++++++++++++++++
>  .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  |  2 ++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 31631e3f89d0..6bbdbb7bef44 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -106,6 +106,7 @@ struct qcom_ethqos {
>  	struct clk *link_clk;
>  	struct phy *serdes_phy;
>  	unsigned int speed;
> +	int serdes_speed;
>  	phy_interface_t phy_mode;
>  
>  	const struct ethqos_emac_por *por;
> @@ -606,19 +607,39 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
>   */
>  static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
>  {
> +	struct net_device *dev = platform_get_drvdata(ethqos->pdev);
> +	struct stmmac_priv *priv = netdev_priv(dev);
>  	int val;
>  
>  	val = readl(ethqos->mac_base + MAC_CTRL_REG);
>  
>  	switch (ethqos->speed) {
> +	case SPEED_2500:
> +		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
> +		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> +			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> +			      RGMII_IO_MACRO_CONFIG2);
> +		if (ethqos->serdes_speed != SPEED_2500)
> +			phy_set_speed(ethqos->serdes_phy, SPEED_2500);
> +		ethqos->serdes_speed = SPEED_2500;
> +		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 0, 0, 0);
> +		break;
>  	case SPEED_1000:
>  		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
>  		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
>  			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
>  			      RGMII_IO_MACRO_CONFIG2);
> +		if (ethqos->serdes_speed != SPEED_1000)
> +			phy_set_speed(ethqos->serdes_phy, SPEED_1000);
> +		ethqos->serdes_speed = SPEED_1000;
> +		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
>  		break;
>  	case SPEED_100:
>  		val |= ETHQOS_MAC_CTRL_PORT_SEL | ETHQOS_MAC_CTRL_SPEED_MODE;
> +		if (ethqos->serdes_speed != SPEED_1000)
> +			phy_set_speed(ethqos->serdes_phy, SPEED_1000);
> +		ethqos->serdes_speed = SPEED_1000;
> +		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
>  		break;
>  	case SPEED_10:
>  		val |= ETHQOS_MAC_CTRL_PORT_SEL;
> @@ -627,6 +648,10 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
>  			      FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR,
>  					 SGMII_10M_RX_CLK_DVDR),
>  			      RGMII_IO_MACRO_CONFIG);
> +		if (ethqos->serdes_speed != SPEED_1000)
> +			phy_set_speed(ethqos->serdes_phy, ethqos->speed);
> +		ethqos->serdes_speed = SPEED_1000;
> +		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
>  		break;
>  	}
>  
> @@ -799,6 +824,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  				     "Failed to get serdes phy\n");
>  
>  	ethqos->speed = SPEED_1000;
> +	ethqos->serdes_speed = SPEED_1000;
>  	ethqos_update_link_clk(ethqos, SPEED_1000);
>  	ethqos_set_func_clk_en(ethqos);
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> index aefc121464b5..13a30e6df4c1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> @@ -110,6 +110,8 @@ static inline void dwmac_ctrl_ane(void __iomem *ioaddr, u32 reg, bool ane,
>  	/* Enable and restart the Auto-Negotiation */
>  	if (ane)
>  		value |= GMAC_AN_CTRL_ANE | GMAC_AN_CTRL_RAN;
> +	else
> +		value &= ~GMAC_AN_CTRL_ANE;
>  
>  	/* In case of MAC-2-MAC connection, block is configured to operate
>  	 * according to MAC conf register.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
