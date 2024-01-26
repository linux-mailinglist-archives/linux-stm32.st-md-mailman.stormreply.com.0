Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C9B83E083
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jan 2024 18:39:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21DE3C6DD6F;
	Fri, 26 Jan 2024 17:39:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4467C6DD6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 17:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706290774; x=1737826774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0I2/Kn+FW5P/KKPj6mUmkJMaL/ErP8cdilIPuLRdXFU=;
 b=VvoJFI8evKmWIcFyZj2e+IA+MWLpxLlv5Ov7c0IoMZ4HdcpJbU6kfate
 wyP7Wa3I+pA/lzeZYNCltKZFoQLzBQub1egvJraEpMpDHu0pOZPBcBenl
 Atmq9BIDat3AGS0eVvLAGTpsosZ9lxB4HKGVf9R4SKFqFFtywdvGUCoIi
 v66TnQwhABbTpbXqXh9/+i/IlUK0hi6N9H5+pbrxw+PAWNDvXkLliuabg
 0K5tVqxQXndhval/msKuhz673DiCp3taaAGLIW68n+xe3NGNpf01ylz7k
 Ichn3CWq1LbKB3r0P6AbJjviBoIEMYMxDywqRq2Y8FwdXxOwxXZyDRBXj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="399686987"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="399686987"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 09:39:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="1118313677"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="1118313677"
Received: from ppglcf2090.png.intel.com ([10.126.160.96])
 by fmsmga005.fm.intel.com with ESMTP; 26 Jan 2024 09:39:27 -0800
From: rohan.g.thomas@intel.com
To: esben@geanix.com
Date: Sat, 27 Jan 2024 01:39:25 +0800
Message-Id: <20240126173925.16794-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <87v87g4hmy.fsf@geanix.com>
References: <87v87g4hmy.fsf@geanix.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 edumazet@google.com, joabreu@synopsys.com, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, kuba@kernel.org, rohan.g.thomas@intel.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: TBS support for
	platform driver
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

From: Rohan G Thomas <rohan.g.thomas@intel.com>

On Fri, 26 Jan 2024 09:35:01 +0100, Esben Haabendal wrote:
Hi Esben,

Thanks for your comments. Please find my reply inline.

> > +	/* If TBS feature is supported(i.e. tbssel is true), then at least 1 Tx
> > +	 * DMA channel supports TBS. So if tbs_ch_num is 0 and tbssel is true,
> > +	 * assume all Tx DMA channels support TBS. TBS_CH field, which gives
> > +	 * number of Tx DMA channels with TBS support is only available only
> for
> > +	 * DW xGMAC IP. For other DWMAC IPs all Tx DMA channels can
> support TBS.
> 
> The Ethernet QOS controllers found in various i.MX socs does not support TBS
> on TX queue 0. I believe this patch would break the dwmac driver for these
> platforms.

AFAIU from Synopsys DWMAC5 Databook, all queues support TBS. But TBS
cannot coexist with TSO. So all glue drivers enabling TBS feature are
avoiding queue 0 to support TSO. Also packets requesting TSO are
always directed to queue 0 by stmmac driver.

> 
> > +	 */
> > +	if (priv->dma_cap.tbssel && !priv->dma_cap.tbs_ch_num)
> > +		priv->dma_cap.tbs_ch_num = priv-
> >dma_cap.number_tx_channel;
> > +

I don't think updating tbs_ch_num with number_tx_channel would break
the dwmac driver for i.MX socs. tbs_ch_num is used by 'Earlier check
for TBS' loop to set tbs flag. 

> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -3773,12 +3773,18 @@ stmmac_setup_dma_desc(struct stmmac_priv
> *priv, unsigned int mtu)
> >  		dma_conf->dma_rx_size = DMA_DEFAULT_RX_SIZE;
> >
> >  	/* Earlier check for TBS */
> > -	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++) {
> > -		struct stmmac_tx_queue *tx_q = &dma_conf-
> >tx_queue[chan];
> > -		int tbs_en = priv->plat->tx_queues_cfg[chan].tbs_en;
> > +	if (priv->dma_cap.tbssel) {
> > +		/* TBS is available only for tbs_ch_num of Tx DMA channels,
> > +		 * starting from the highest Tx DMA channel.
> > +		 */
> > +		chan = priv->dma_cap.number_tx_channel - priv-
> >dma_cap.tbs_ch_num;

For IPs which don't have tbs_ch_num, this loop goes from 0 to
number_tx_channel to check if tbs_enable is set by glue driver.
Existing logic is also the same. Unless you set tbs_en flag of
queue 0 from the glue driver or dts configuration this patch doesn't
set tbs flag for queue 0. This is a sanity check to avoid wrong
configuration for IPs which support tbs only in a few number of
queues.

> > +		for (; chan < priv->plat->tx_queues_to_use; chan++) {
> > +			struct stmmac_tx_queue *tx_q = &dma_conf-
> >tx_queue[chan];
> > +			int tbs_en = priv->plat->tx_queues_cfg[chan].tbs_en;
> >
> > -		/* Setup per-TXQ tbs flag before TX descriptor alloc */
> > -		tx_q->tbs |= tbs_en ? STMMAC_TBS_AVAIL : 0;
> > +			/* Setup per-TXQ tbs flag before TX descriptor alloc
> */
> > +			tx_q->tbs |= tbs_en ? STMMAC_TBS_AVAIL : 0;
> > +		}
> >  	}

Please correct me if I've misstated anything.

BR,
Rohan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
