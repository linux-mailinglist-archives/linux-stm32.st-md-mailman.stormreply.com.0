Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5321D8D3FCE
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2024 22:50:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03239C6C855;
	Wed, 29 May 2024 20:50:45 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB6B3C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 20:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717015839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1G4MuJLfcNe+eQlPR9y6C2DI9izpMDDpafLXltcFND8=;
 b=DO+CR5gfyYIfN6qnNDf5rfoXB7kRcLL3SOL1rFVyUo/aaitsPcL+5yZEMBUz1Y57I0q5wV
 Gmp7iY2SueK2/KhU/nlnO7S4GbLlASBf+E9jqeZcBrrReIDt6lNEcl0RDjy2qCexxgClw1
 XqyKvB16/RXBbas25+r8rWQddal9yyE=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-_aLoO8qyOgibMc6xQF4fxQ-1; Wed, 29 May 2024 16:50:37 -0400
X-MC-Unique: _aLoO8qyOgibMc6xQF4fxQ-1
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-6f8e32f2a14so206864a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 13:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717015832; x=1717620632;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1G4MuJLfcNe+eQlPR9y6C2DI9izpMDDpafLXltcFND8=;
 b=pmX53Jmm3dPncquHaQ/3Eq2D5/ATO6XygqRRBKjGYyQhJfa0/lsZ6AX2G+XP32t47L
 ONIz+YrqFRrCORc2ljisYAAP/+ZVZ4yN/VTYp9BofToQG1jDovkN2K85xEpX6FqS4iB6
 mIqeHe1qs/olV9EC4JPSnP4wd1zU6RMvb+Z55VVwyFIVenNLtqZ2I2R7MP9803bmLqZi
 51dD7NdEB+98w9/xZD3qbugBDjaMCrOsJ3PQdhnPvZPCtdkay+1Xzn6CedmQ+MbakGsi
 alDWg67JJdq+wbT/zJHR1S17VxghJPRE1O3iMwHnNC0S5royaCQvMBB4RsLNOKO33R4A
 7IEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgFcIdMejmxiDuw1Nmkh8kVDz89hziJ4oELcZHxSr2EyBseJV2u9VpwuM+c7ZhgXOlSPfaPtDCX4RuTJnYDX7Ll0jKw4k0mlIhRdsN1QuxgrBL1QmoM7nD
X-Gm-Message-State: AOJu0YyuekRQaQhh/kuamIB9FCaNn5Mhmmvc186RxdVeyeN6bRE+YDdU
 pgLEjfrcpTVn5jtYcn2YUtcSoLuoaDRDZURNVJKAer6K5at/gW/JDQbZPuyw5527TAwECuU/2o7
 rIO7uHpnlAiZWl4EuZltYfawAoTwD3paBSoibEmEPM7iUCrrsAl8KsFBylONNxDDKnH0NIPD0JA
 2Z0Q==
X-Received: by 2002:a05:6808:1ab0:b0:3d1:c187:15d5 with SMTP id
 5614622812f47-3d1dcca93c5mr144678b6e.20.1717015832426; 
 Wed, 29 May 2024 13:50:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsuJSmbdsoQ85Rq/8DqXZY+yAtM9jIMKwB2wvZYK6VBkogsAWKXFSzfzBTS9dp8U90qeTsfA==
X-Received: by 2002:a05:6808:1ab0:b0:3d1:c187:15d5 with SMTP id
 5614622812f47-3d1dcca93c5mr144646b6e.20.1717015831958; 
 Wed, 29 May 2024 13:50:31 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ad8fa000eesm22065026d6.1.2024.05.29.13.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 13:50:31 -0700 (PDT)
Date: Wed, 29 May 2024 15:50:28 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Message-ID: <7w5bibuejmd5kg3ssozaql4urews26kpj57zvsaoq2pva3vrlo@agfxwq5i65pc>
References: <20240529-configure_ethernet_host_dma_width-v1-1-3f2707851adf@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20240529-configure_ethernet_host_dma_width-v1-1-3f2707851adf@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Eric Dumazet <edumazet@google.com>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-qcom-ethqos: Configure
	host DMA width
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

$Subject should be have [PATCH net] since this targets the net tree:

https://docs.kernel.org/process/maintainer-netdev.html

On Wed, May 29, 2024 at 11:39:04AM GMT, Sagar Cheluvegowda wrote:
> Fixes: 070246e4674b ("net: stmmac: Fix for mismatched host/device DMA address width")
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>

Please, always write a commit body, even if its simple. Just inferring
from this patch, I am guessing there is some limitation on CPU's DMA
address width that doesn't match up with the MAC's ability? Paint that
picture for us here please! We want to know the _why_ in this section.

Also, I think the Fixes: here would be for adding support for this SoC
in the driver, not what's listed? Might make more sense after you have a
proper body though.

> ---
> Change-Id: Ifdf3490c6f0dd55afc062974c05acce42d5fb6a7

I know this is under the ---, so its not actually in the commit, but I'd
not include that at all when submitting. Someone will complain about it
looking like this is from / for a downstream fork. At least checkpatch
doesn't warn about it, but a human probably will :P

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index e254b21fdb59..65d7370b47d5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -93,6 +93,7 @@ struct ethqos_emac_driver_data {
>  	bool has_emac_ge_3;
>  	const char *link_clk_name;
>  	bool has_integrated_pcs;
> +	u32 dma_addr_width;
>  	struct dwmac4_addrs dwmac4_addrs;
>  };
>  
> @@ -276,6 +277,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
>  	.has_emac_ge_3 = true,
>  	.link_clk_name = "phyaux",
>  	.has_integrated_pcs = true,
> +	.dma_addr_width = 36,
>  	.dwmac4_addrs = {
>  		.dma_chan = 0x00008100,
>  		.dma_chan_offset = 0x1000,
> @@ -845,6 +847,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
>  	if (data->has_integrated_pcs)
>  		plat_dat->flags |= STMMAC_FLAG_HAS_INTEGRATED_PCS;
> +	if (data->dma_addr_width)
> +		plat_dat->host_dma_width = data->dma_addr_width;
>  
>  	if (ethqos->serdes_phy) {
>  		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
> 
> ---
> base-commit: 1b10b390d945a19747d75b34a6e01035ac7b9155
> change-id: 20240515-configure_ethernet_host_dma_width-c619d552992d
> 
> Best regards,
> -- 
> Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> 
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
