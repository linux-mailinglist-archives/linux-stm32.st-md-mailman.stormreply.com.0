Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CDB953DE9
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2024 01:31:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25DABC7129D;
	Thu, 15 Aug 2024 23:31:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F082C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Aug 2024 23:31:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FKcADN017978;
 Thu, 15 Aug 2024 23:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Xui2spjGje6pCXlMy7bJ20vZUsBjTeOYHBfaMs++FG4=; b=VJVWBe4uzzpmdLcp
 Ixt5Y6/P8L0MrOMviZ6DsB5GhUEcLgnTvL6g92676WJLLJwLblAAWqORwF7i7Y2x
 BprknDC52My8QxKXd1owzgSYZsEadxeB58Kz7R2JNe/eAHIqGvhU2YKBCLFvOrVF
 mh7GsJncoqeDppUS/UD5l1D+1tYA16YPqySZVUx84QFe7f3OFbeElBwpjwdqRtA4
 H2YhlKWxxl4cjmNSdfcXcBZ6zHh7OyWf2kCowR9HhytkqQqqMJmWtQxe1kpGbJx4
 AiUdOjtS0nn1RoFOR2x4TblGB3APo+Ahg7DrsoD0kR4YiRNWlz+mNsgAWtnz/7uZ
 JfhDEQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 411rvr891p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Aug 2024 23:30:42 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47FNUfpX005445
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Aug 2024 23:30:41 GMT
Received: from [10.46.19.239] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 Aug
 2024 16:30:40 -0700
Message-ID: <2ad03012-8a10-49fc-9e80-3b91762b9cc3@quicinc.com>
Date: Thu, 15 Aug 2024 16:30:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <jitendra.vegiraju@broadcom.com>, <netdev@vger.kernel.org>
References: <20240814221818.2612484-1-jitendra.vegiraju@broadcom.com>
 <20240814221818.2612484-2-jitendra.vegiraju@broadcom.com>
Content-Language: en-US
From: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>
In-Reply-To: <20240814221818.2612484-2-jitendra.vegiraju@broadcom.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: D26Z6C0OL0tCkQUExsEuaABgFByfXNjD
X-Proofpoint-ORIG-GUID: D26Z6C0OL0tCkQUExsEuaABgFByfXNjD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_15,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1011 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408150171
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, leong.ching.swee@intel.com,
 edumazet@google.com, Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, ahalaney@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 xiaolei.wang@windriver.com, florian.fainelli@broadcom.com,
 linux-kernel@vger.kernel.org, fancer.lancer@gmail.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, bpf@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [net-next v4 1/5] net: stmmac: Add HDMA mapping
 for dw25gmac support
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



On 8/14/2024 3:18 PM, jitendra.vegiraju@broadcom.com wrote:
> From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> 
> Add hdma configuration support in include/linux/stmmac.h file.
> The hdma configuration includes mapping of virtual DMAs to physical DMAs.
> Define a new data structure stmmac_hdma_cfg to provide the mapping.
> 
> Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> ---
>  include/linux/stmmac.h | 50 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 338991c08f00..1775bd2b7c14 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -89,6 +89,55 @@ struct stmmac_mdio_bus_data {
>  	bool needs_reset;
>  };
>  
> +/* DW25GMAC Hyper-DMA Overview
> + * Hyper-DMA allows support for large number of Virtual DMA(VDMA)
> + * channels using a smaller set of physical DMA channels(PDMA).
> + * This is supported by the  mapping of VDMAs to Traffic Class (TC)
> + * and PDMA to TC in each traffic direction as shown below.
> + *
> + *        VDMAs            Traffic Class      PDMA
> + *       +--------+          +------+         +-----------+
> + *       |VDMA0   |--------->| TC0  |-------->|PDMA0/TXQ0 |
> + *TX     +--------+   |----->+------+         +-----------+
> + *Host=> +--------+   |      +------+         +-----------+ => MAC
> + *SW     |VDMA1   |---+      | TC1  |    +--->|PDMA1/TXQ1 |
> + *       +--------+          +------+    |    +-----------+
> + *       +--------+          +------+----+    +-----------+
> + *       |VDMA2   |--------->| TC2  |-------->|PDMA2/TXQ1 |
> + *       +--------+          +------+         +-----------+
> + *            .                 .                 .
> + *       +--------+          +------+         +-----------+
> + *       |VDMAn-1 |--------->| TCx-1|-------->|PDMAm/TXQm |
> + *       +--------+          +------+         +-----------+
> + *
> + *       +------+          +------+         +------+
> + *       |PDMA0 |--------->| TC0  |-------->|VDMA0 |
> + *       +------+   |----->+------+         +------+
> + *MAC => +------+   |      +------+         +------+
> + *RXQs   |PDMA1 |---+      | TC1  |    +--->|VDMA1 |  => Host
> + *       +------+          +------+    |    +------+
> + *            .                 .                 .
> + */
> +
> +#define STMMAC_DW25GMAC_MAX_NUM_TX_VDMA		128
> +#define STMMAC_DW25GMAC_MAX_NUM_RX_VDMA		128
> +
> +#define STMMAC_DW25GMAC_MAX_NUM_TX_PDMA		8
> +#define STMMAC_DW25GMAC_MAX_NUM_RX_PDMA		10
> +
I have a query here. 

Why do we need to hardcode the number of TX PDMA and RX PDMA to 8 an 10. On some platforms the number of supported TXPDMA and RXPDMA are 11 and 11 respectively ? 

how do we overcome this problem, do we increase the value in such case? 

> +#define STMMAC_DW25GMAC_MAX_TC			8
> +
> +/* Hyper-DMA mapping configuration
> + * Traffic Class associated with each VDMA/PDMA mapping
> + * is stored in corresponding array entry.
> + */
> +struct stmmac_hdma_cfg {
> +	u8 tvdma_tc[STMMAC_DW25GMAC_MAX_NUM_TX_VDMA];
> +	u8 rvdma_tc[STMMAC_DW25GMAC_MAX_NUM_RX_VDMA];
> +	u8 tpdma_tc[STMMAC_DW25GMAC_MAX_NUM_TX_PDMA];
> +	u8 rpdma_tc[STMMAC_DW25GMAC_MAX_NUM_RX_PDMA];
> +};
> +
>  struct stmmac_dma_cfg {
>  	int pbl;
>  	int txpbl;
> @@ -101,6 +150,7 @@ struct stmmac_dma_cfg {
>  	bool multi_msi_en;
>  	bool dche;
>  	bool atds;
> +	struct stmmac_hdma_cfg *hdma_cfg;
>  };
>  
>  #define AXI_BLEN	7
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
