Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 624DF96CC19
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2024 03:12:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 053ACC78018;
	Thu,  5 Sep 2024 01:12:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18189C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2024 01:12:45 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484N6Qp3026158;
 Thu, 5 Sep 2024 01:12:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DaFVzteQcTS91Pzq56hORp/0FM9sIlD3bDOCtoT/f7o=; b=O4u5z8cpHGSKejjg
 nRjWtHAZVWDom9cnYuorz/bOWbf6/aJSawGbg0Ym1iO+TgduOBFXp5uU2S3BpS+r
 Mc5gP61OPYjxR3rtY4Wfqt7q9EXGk5t7ZMgGvZffcu5WkpyX35xNho3sqAVdFCji
 Ek4gzidDoh2FgavW3JVGH2gF6IEYbd9qvGHX9nNuYln8bIhPxC0rb7Jev2EoHyby
 tkqAXqGm/41yLcqIrNcrKJACXoTJ0zzbAo6Zw2XiFYWd0GxGAq+Ph+lJl3i+vw4e
 uHAA3N0qrhTROVdC9Nf8/pf2zCM1+3hnOTVuP2aSRGPWN8jcMZshqwOV+5bJ3e2v
 iNftfw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bt674g60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Sep 2024 01:12:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4851CPeb007961
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 5 Sep 2024 01:12:25 GMT
Received: from [10.110.126.71] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 18:12:22 -0700
Message-ID: <c29ae5b4-fa2f-4dad-b32f-86838d846d35@quicinc.com>
Date: Wed, 4 Sep 2024 18:12:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Abhishek Chauhan <quic_abchauha@quicinc.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>,
 Andrew Halaney <ahalaney@redhat.com>
References: <20240904235456.2663335-1-quic_abchauha@quicinc.com>
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <20240904235456.2663335-1-quic_abchauha@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: lDecve-zp8ecw29PMTebNsli8RAxgHIk
X-Proofpoint-GUID: lDecve-zp8ecw29PMTebNsli8RAxgHIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_22,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050007
Cc: kernel@quicinc.com
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: Programming
 sequence for VLAN packets with split header
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


> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> index e0165358c4ac..dbd1be4e4a92 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> @@ -526,6 +526,17 @@ static void dwmac4_enable_sph(struct stmmac_priv *priv, void __iomem *ioaddr,
>  	value |= GMAC_CONFIG_HDSMS_256; /* Segment max 256 bytes */
>  	writel(value, ioaddr + GMAC_EXT_CONFIG);
>  
> +	/* Additional configuration to handle VLAN tagged packets */
> +	value = readl(ioaddr + GMAC_EXT_CFG1);
> +	value &= ~GMAC_CONFIG1_SPLM;
> +	/* Enable Split mode for header and payload at L2  */
> +	value |= GMAC_CONFIG1_SPLM_L2OFST_EN << GMAC_CONFIG1_SPLM_SHIFT;
> +	value &= ~GMAC_CONFIG1_SAVO;
> +	/* Enables the MAC to distinguish between tagged vs untagged pkts */
> +	value |= 4 << GMAC_CONFIG1_SAVO_SHIFT;
I checked the data book internally and see SAVO bit is used to indicate the
valueof the offset from the beginning of Length/Type field at which the header 
should be split, i see the length/type field remains to be 2bytes even in case
of tagged packets may be you need to keep the value of this field to 2bytes as
it was before but one thing which i am still not able to understand is that even
with the value of this field configured to 4 i don't see any packet corruption
issue, something which needs to be checked with HW folks. 
> +	value |= GMAC_CONFIG1_SAVE_EN;
> +	writel(value, ioaddr + GMAC_EXT_CFG1);
> +
>  	value = readl(ioaddr + DMA_CHAN_CONTROL(dwmac4_addrs, chan));
>  	if (en)
>  		value |= DMA_CONTROL_SPH;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
