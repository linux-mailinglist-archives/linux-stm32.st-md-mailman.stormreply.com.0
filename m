Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DED082A7E
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2019 06:46:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF310C35E03;
	Tue,  6 Aug 2019 04:46:41 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E506EC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2019 04:46:39 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id w3so3667052pgt.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Aug 2019 21:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=2j7+zajW8YHjJb6vtd6GGK8PfR2IXlyooiMNjhgqda4=;
 b=0WEACkB6+tkSwapaLx3mUtGXDP8tMN+Mw0CtY4oq4TY6eb6BPbFQ03Rq2JZAoM20/u
 FY8yhlRyoAUr2kF8VcVVR4h1UEAzDuwkzsU7nYIJ1qyZPWUMp23JmIfyrAGr3kvvZPrF
 Sdjlj4dm+VQbaqllPiRCeTV7Da9fWHPMaV77IFgzqVJwYBuAK/0TvHPhNfqAJveP7gSq
 6umgH6JcdQoRVJeg1LsHHvrANHxAgrbqwGK/adiCXx9KDqVtIjQOy89BCabkWAd+YMco
 nwsihxmqdAzfW6NyggGtIhUVCR96fStCxpW/zabYpJcYfwuyq0TJWULFKJYpIURYyfDn
 dv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=2j7+zajW8YHjJb6vtd6GGK8PfR2IXlyooiMNjhgqda4=;
 b=FQHZKRZ9kv/WKQ2AHkAcRw7ell5pM32uYHzs2g591F6dF3pD6Evhrhg2O71SUwwJQR
 N+k2aoBH8liNVSeM8kJydy4ZAvi0R22w6KMa5jmSGS2FhcqLIileGnbW/+TX7PoZ37W0
 8F8sEXOD0WWzpiHr5DwIJ9L7PPpR9IpSTcbkQ0McDAWH+V5B2MkwpaFGN5iiOEf3mmz2
 3+LzcNCNLa6JOeVs9y7vGa7MFXtKuh9aIWTRWr7gcs5N3KdrPYlc/QCKMy5ysMznUJSn
 cvcEQkswdZ4aKCo4N8P/Eq8HJm4sGXtmx0N7dVzX5QzdUnXuMbL9eQ3W4ms/EjMmeI1T
 bPHA==
X-Gm-Message-State: APjAAAU4KVOq2X8nNyug2+4ZYb0hmeSwdHzPawGQSymdlmlyoV+9deM7
 1Q+FPfE0BDJ4l1HtjNANxinobA==
X-Google-Smtp-Source: APXvYqxJ1GU+jM362HNbpRUZRKuHn12ZYsRHo95Oyr4gTePUavWdw/B4lZOUiOayXIOV5B07X0OeVQ==
X-Received: by 2002:a17:90a:a489:: with SMTP id
 z9mr1170396pjp.24.1565066798435; 
 Mon, 05 Aug 2019 21:46:38 -0700 (PDT)
Received: from cakuba.netronome.com (c-71-204-185-212.hsd1.ca.comcast.net.
 [71.204.185.212])
 by smtp.gmail.com with ESMTPSA id v18sm85291165pgl.87.2019.08.05.21.46.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 21:46:38 -0700 (PDT)
Date: Mon, 5 Aug 2019 21:46:14 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20190805214600.4c84ccd7@cakuba.netronome.com>
In-Reply-To: <e70981c111ac857a0bac77750bd69a3383d99ee0.1565027782.git.joabreu@synopsys.com>
References: <cover.1565027782.git.joabreu@synopsys.com>
 <e70981c111ac857a0bac77750bd69a3383d99ee0.1565027782.git.joabreu@synopsys.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 06/10] net: stmmac: Implement RSS
 and enable it in XGMAC core
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

On Mon,  5 Aug 2019 20:01:19 +0200, Jose Abreu wrote:
> Implement the RSS functionality and add the corresponding callbacks in
> XGMAC core.
> 
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>
> ---
> Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Jose Abreu <joabreu@synopsys.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: netdev@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> index c4c45402b8f8..9ff9d9ac1a50 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> @@ -254,6 +254,34 @@ static void dwxgmac2_clear(struct dma_desc *p)
>  	p->des3 = 0;
>  }
>  
> +static int dwxgmac2_get_rx_hash(struct dma_desc *p, u32 *hash,
> +				enum pkt_hash_types *type)
> +{
> +	unsigned int rdes3 = le32_to_cpu(p->des3);
> +	u32 ptype;
> +
> +	if (rdes3 & XGMAC_RDES3_RSV) {
> +		ptype = (rdes3 & XGMAC_RDES3_L34T) >> XGMAC_RDES3_L34T_SHIFT;
> +
> +		switch (ptype) {
> +		case 0x1:
> +		case 0x2:
> +		case 0x9:
> +		case 0xA:

nit: it'd be nice to have defines for these constants

> +			*type = PKT_HASH_TYPE_L4;
> +			break;
> +		default:
> +			*type = PKT_HASH_TYPE_L3;
> +			break;
> +		}
> +
> +		*hash = le32_to_cpu(p->des1);
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  const struct stmmac_desc_ops dwxgmac210_desc_ops = {
>  	.tx_status = dwxgmac2_get_tx_status,
>  	.rx_status = dwxgmac2_get_rx_status,

> @@ -4182,7 +4208,7 @@ int stmmac_dvr_probe(struct device *device,
>  	struct net_device *ndev = NULL;
>  	struct stmmac_priv *priv;
>  	u32 queue, maxq;
> -	int ret = 0;
> +	int i, ret = 0;
>  
>  	ndev = devm_alloc_etherdev_mqs(device, sizeof(struct stmmac_priv),
>  				       MTL_MAX_TX_QUEUES, MTL_MAX_RX_QUEUES);
> @@ -4290,6 +4316,14 @@ int stmmac_dvr_probe(struct device *device,
>  #endif
>  	priv->msg_enable = netif_msg_init(debug, default_msg_level);
>  
> +	/* Initialize RSS */
> +	netdev_rss_key_fill(priv->rss.key, sizeof(priv->rss.key));
> +	for (i = 0; i < ARRAY_SIZE(priv->rss.table); i++)
> +		priv->rss.table[i] = i % priv->plat->rx_queues_to_use;

ethtool_rxfh_indir_default() ?

> +	if (priv->dma_cap.rssen && priv->plat->rss_en)
> +		ndev->features |= NETIF_F_RXHASH;
> +
>  	/* MTU range: 46 - hw-specific max */
>  	ndev->min_mtu = ETH_ZLEN - ETH_HLEN;
>  	if ((priv->plat->enh_desc) || (priv->synopsys_id >= DWMAC_CORE_4_00))
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
