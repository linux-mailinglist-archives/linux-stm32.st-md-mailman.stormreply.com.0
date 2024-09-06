Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F8796FE5F
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Sep 2024 01:18:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BFBCC78013;
	Fri,  6 Sep 2024 23:18:35 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB11AC6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 23:18:27 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 486La20Q021851;
 Fri, 6 Sep 2024 23:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8hUy3HkO73n8a8kkpNa8JB3SE4UQn54cODui1RapG3E=; b=gPjr+MT7wInQfINa
 RTmVGsvD5ouyNMbUcb//XbEFNDNR5h6d/CWaTAj04NEoY5Lb0n71/Sf0McS/Lcs9
 WogDGji8t1UNn1CqfjETXQ2GXu+qmhGqccJTAaFZbhFlEBO8XI/RA25uP4FaaeDl
 1SKgo65aCUZpgAVw3fRYo9R6MgHyCDgRaHs0iY03cNYh2w1DkkXqXXltFR5OPIrX
 dPoPhXVHMS/B/VPsXJjAJJF94zb/zoDBTNz9uZ4sazWl3KCAvXe286t8Ll2Qhln0
 SirwxnbuluhuuabVeymAlYxmmsvn8EsAPCRuT165kpRGBcF9miv/iypqjSNhM8LX
 GOLf8g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhws3k06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Sep 2024 23:17:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486NHXB8019247
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Sep 2024 23:17:34 GMT
Received: from [10.111.181.108] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Sep 2024
 16:17:32 -0700
Message-ID: <6f3f79f2-5755-4286-98f6-9950e7e994c8@quicinc.com>
Date: Fri, 6 Sep 2024 16:17:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Li Zetao <lizetao1@huawei.com>, <florian.fainelli@broadcom.com>,
 <andrew@lunn.ch>, <olteanv@gmail.com>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
 <heiko@sntech.de>, <yisen.zhuang@huawei.com>, <salil.mehta@huawei.com>,
 <hauke@hauke-m.de>, <alexandre.torgue@foss.st.com>,
 <joabreu@synopsys.com>, <mcoquelin.stm32@gmail.com>,
 <wellslutw@gmail.com>, <radhey.shyam.pandey@amd.com>,
 <michal.simek@amd.com>, <ajay.kathat@microchip.com>,
 <claudiu.beznea@tuxon.dev>, <kvalo@kernel.org>,
 <u.kleine-koenig@pengutronix.de>, <jacky_chou@aspeedtech.com>
References: <20240831021334.1907921-1-lizetao1@huawei.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240831021334.1907921-1-lizetao1@huawei.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: U38JrxGFfwZBLXAiBMSQPWd5WdbUh_11
X-Proofpoint-GUID: U38JrxGFfwZBLXAiBMSQPWd5WdbUh_11
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_08,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 impostorscore=0 mlxlogscore=849 adultscore=0 bulkscore=0 clxscore=1011
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409060173
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 00/12] net: Convert using
 devm_clk_get_enabled()/devm_clk_get_optional_enabled()
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

On 8/30/2024 7:13 PM, Li Zetao wrote:
> There are many examples[1][2] of clk resource leakage in LTS. The
> reason is that developers need to maintain the allocation and release
> of clk resources themselves, but this will increase the burden on
> developers. Using the API related to devm_clk_get_*_enable ensures
> that the life cycle of clk is consistent with that of the device,
> reducing the risk of unreleased resources like clk.
> 
> Several other developers are also working on converting to more
> secure interfaces, and this patch set is in principle the same as
> theirs.

...

>  drivers/net/dsa/bcm_sf2.c                     | 28 ++----
>  drivers/net/ethernet/allwinner/sun4i-emac.c   | 13 +--
>  drivers/net/ethernet/arc/emac_rockchip.c      | 34 ++-----
>  drivers/net/ethernet/ethoc.c                  | 18 ++--
>  drivers/net/ethernet/faraday/ftgmac100.c      | 27 ++---
>  drivers/net/ethernet/hisilicon/hisi_femac.c   | 17 +---
>  drivers/net/ethernet/lantiq_xrx200.c          | 17 +---
>  .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 98 ++++---------------
>  drivers/net/ethernet/sunplus/spl2sw_driver.c  | 18 +---
>  .../net/ethernet/xilinx/xilinx_axienet_main.c | 15 +--
>  .../net/wireless/microchip/wilc1000/sdio.c    | 10 +-
>  drivers/net/wireless/microchip/wilc1000/spi.c |  5 +-

note the wifi driver changes go through the wireless tree and not the net tree
so those should be split out separately

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
