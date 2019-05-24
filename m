Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A749C29101
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 08:33:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66E5CC56619
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 06:33:54 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F7D6C56611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 06:33:51 +0000 (UTC)
X-UUID: 1ca43289ce1842bc97bfe905dd60c1aa-20190524
X-UUID: 1ca43289ce1842bc97bfe905dd60c1aa-20190524
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 676178434; Fri, 24 May 2019 14:33:40 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs01n1.mediatek.inc
 (172.21.101.68) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 24 May 2019 14:33:39 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 24 May 2019 14:33:37 +0800
Message-ID: <1558679617.24897.43.camel@mhfsdcap03>
From: biao huang <biao.huang@mediatek.com>
To: Jose Abreu <joabreu@synopsys.com>
Date: Fri, 24 May 2019 14:33:37 +0800
In-Reply-To: <1557802843-31718-2-git-send-email-biao.huang@mediatek.com>
References: <1557802843-31718-1-git-send-email-biao.huang@mediatek.com>
 <1557802843-31718-2-git-send-email-biao.huang@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
Cc: jianguo.zhang@mediatek.comi, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 yt.shen@mediatek.com, linux-mediatek@lists.infradead.org,
 boon.leong.ong@intel.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v2,
 PATCH] net: stmmac: add support for hash table size 128/256 in
 dwmac4
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

Dear All,
any comments about this patch?
Thanks.
On Tue, 2019-05-14 at 11:00 +0800, Biao Huang wrote:
> 1. get hash table size in hw feature reigster, and add support
> for taller hash table(128/256) in dwmac4.
> 2. only clear PR/HMC/PM bits of GMAC_PACKET_FILTER, to avoid
> side effect to functions of other bits.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h      |    7 +--
>  drivers/net/ethernet/stmicro/stmmac/dwmac4.h      |    4 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c |   50 ++++++++++++---------
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c  |    1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |    4 ++
>  5 files changed, 40 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 272b9ca6..709dcec 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -335,6 +335,7 @@ struct dma_features {
>  	/* 802.3az - Energy-Efficient Ethernet (EEE) */
>  	unsigned int eee;
>  	unsigned int av;
> +	unsigned int hash_tb_sz;
>  	unsigned int tsoen;
>  	/* TX and RX csum */
>  	unsigned int tx_coe;
> @@ -427,9 +428,9 @@ struct mac_device_info {
>  	struct mii_regs mii;	/* MII register Addresses */
>  	struct mac_link link;
>  	void __iomem *pcsr;     /* vpointer to device CSRs */
> -	int multicast_filter_bins;
> -	int unicast_filter_entries;
> -	int mcast_bits_log2;
> +	unsigned int multicast_filter_bins;
> +	unsigned int unicast_filter_entries;
> +	unsigned int mcast_bits_log2;
>  	unsigned int rx_csum;
>  	unsigned int pcs;
>  	unsigned int pmt;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
> index eb013d5..a5eb7df 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
> @@ -18,8 +18,7 @@
>  /*  MAC registers */
>  #define GMAC_CONFIG			0x00000000
>  #define GMAC_PACKET_FILTER		0x00000008
> -#define GMAC_HASH_TAB_0_31		0x00000010
> -#define GMAC_HASH_TAB_32_63		0x00000014
> +#define GMAC_HASH_TAB(x)		(0x10 + x * 4)
>  #define GMAC_RX_FLOW_CTRL		0x00000090
>  #define GMAC_QX_TX_FLOW_CTRL(x)		(0x70 + x * 4)
>  #define GMAC_TXQ_PRTY_MAP0		0x98
> @@ -181,6 +180,7 @@ enum power_event {
>  #define GMAC_HW_FEAT_MIISEL		BIT(0)
>  
>  /* MAC HW features1 bitmap */
> +#define GMAC_HW_HASH_TB_SZ		GENMASK(25, 24)
>  #define GMAC_HW_FEAT_AVSEL		BIT(20)
>  #define GMAC_HW_TSOEN			BIT(18)
>  #define GMAC_HW_TXFIFOSIZE		GENMASK(10, 6)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> index 7e5d5db..1f682ec 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> @@ -401,41 +401,49 @@ static void dwmac4_set_filter(struct mac_device_info *hw,
>  			      struct net_device *dev)
>  {
>  	void __iomem *ioaddr = (void __iomem *)dev->base_addr;
> -	unsigned int value = 0;
> +	unsigned int value;
> +	int numhashregs = (hw->multicast_filter_bins >> 5);
> +	int mcbitslog2 = hw->mcast_bits_log2;
> +	int i;
> +
> +	value = readl(ioaddr + GMAC_PACKET_FILTER);
> +	value &= ~GMAC_PACKET_FILTER_PR;
> +	value &= ~GMAC_PACKET_FILTER_HMC;
> +	value &= ~GMAC_PACKET_FILTER_PM;
>  
>  	if (dev->flags & IFF_PROMISC) {
> -		value = GMAC_PACKET_FILTER_PR;
> +		value |= GMAC_PACKET_FILTER_PR;
>  	} else if ((dev->flags & IFF_ALLMULTI) ||
> -			(netdev_mc_count(dev) > HASH_TABLE_SIZE)) {
> +		   (netdev_mc_count(dev) > hw->multicast_filter_bins)) {
>  		/* Pass all multi */
> -		value = GMAC_PACKET_FILTER_PM;
> -		/* Set the 64 bits of the HASH tab. To be updated if taller
> -		 * hash table is used
> -		 */
> -		writel(0xffffffff, ioaddr + GMAC_HASH_TAB_0_31);
> -		writel(0xffffffff, ioaddr + GMAC_HASH_TAB_32_63);
> +		value |= GMAC_PACKET_FILTER_PM;
> +		/* Set all the bits of the HASH tab */
> +		for (i = 0; i < numhashregs; i++)
> +			writel(0xffffffff, ioaddr + GMAC_HASH_TAB(i));
>  	} else if (!netdev_mc_empty(dev)) {
> -		u32 mc_filter[2];
> +		u32 mc_filter[8];
>  		struct netdev_hw_addr *ha;
>  
>  		/* Hash filter for multicast */
> -		value = GMAC_PACKET_FILTER_HMC;
> +		value |= GMAC_PACKET_FILTER_HMC;
>  
>  		memset(mc_filter, 0, sizeof(mc_filter));
>  		netdev_for_each_mc_addr(ha, dev) {
> -			/* The upper 6 bits of the calculated CRC are used to
> -			 * index the content of the Hash Table Reg 0 and 1.
> +			/* The upper n bits of the calculated CRC are used to
> +			 * index the contents of the hash table. The number of
> +			 * bits used depends on the hardware configuration
> +			 * selected at core configuration time.
>  			 */
> -			int bit_nr =
> -				(bitrev32(~crc32_le(~0, ha->addr, 6)) >> 26);
> -			/* The most significant bit determines the register
> -			 * to use while the other 5 bits determines the bit
> -			 * within the selected register
> +			int bit_nr = bitrev32(~crc32_le(~0, ha->addr,
> +					ETH_ALEN)) >> (32 - mcbitslog2);
> +			/* The most significant bit determines the register to
> +			 * use (H/L) while the other 5 bits determine the bit
> +			 * within the register.
>  			 */
> -			mc_filter[bit_nr >> 5] |= (1 << (bit_nr & 0x1F));
> +			mc_filter[bit_nr >> 5] |= (1 << (bit_nr & 0x1f));
>  		}
> -		writel(mc_filter[0], ioaddr + GMAC_HASH_TAB_0_31);
> -		writel(mc_filter[1], ioaddr + GMAC_HASH_TAB_32_63);
> +		for (i = 0; i < numhashregs; i++)
> +			writel(mc_filter[i], ioaddr + GMAC_HASH_TAB(i));
>  	}
>  
>  	/* Handle multiple unicast addresses */
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> index edb6053..59afb53 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> @@ -354,6 +354,7 @@ static void dwmac4_get_hw_feature(void __iomem *ioaddr,
>  
>  	/* MAC HW feature1 */
>  	hw_cap = readl(ioaddr + GMAC_HW_FEATURE1);
> +	dma_cap->hash_tb_sz = (hw_cap & GMAC_HW_HASH_TB_SZ) >> 24;
>  	dma_cap->av = (hw_cap & GMAC_HW_FEAT_AVSEL) >> 20;
>  	dma_cap->tsoen = (hw_cap & GMAC_HW_TSOEN) >> 18;
>  	/* RX and TX FIFO sizes are encoded as log2(n / 128). Undo that by
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 97c5e1a..1971f9f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4159,6 +4159,10 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
>  		priv->plat->enh_desc = priv->dma_cap.enh_desc;
>  		priv->plat->pmt = priv->dma_cap.pmt_remote_wake_up;
>  		priv->hw->pmt = priv->plat->pmt;
> +		if (priv->dma_cap.hash_tb_sz) {
> +			priv->hw->multicast_filter_bins = BIT(priv->dma_cap.hash_tb_sz) * 32;
> +			priv->hw->mcast_bits_log2 = ilog2(priv->hw->multicast_filter_bins);
> +		}
>  
>  		/* TXCOE doesn't work in thresh DMA mode */
>  		if (priv->plat->force_thresh_dma_mode)


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
