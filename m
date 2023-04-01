Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C17CA6D2E42
	for <lists+linux-stm32@lfdr.de>; Sat,  1 Apr 2023 06:58:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B0ABC69069;
	Sat,  1 Apr 2023 04:58:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADD9EC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  1 Apr 2023 04:58:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84D5D60915;
 Sat,  1 Apr 2023 04:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA93C433D2;
 Sat,  1 Apr 2023 04:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680325098;
 bh=M7NRHgeY9YLXr0tbXa8gzPSJWRgkntHKUQrTaY89fR8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GkSp7WfnFZqe6RFdyi1EpCwdsQoGTaK5STvuHcwCzA7s3Q1fL7Jkc85TPoHcM5tp6
 wzyNTG3cey+KwCmZx5k0CxDvqVLi0ZSBtfIyM+m4lBGbzqxEf0vssAPm04JznywGXs
 8X4RNSdU8+ppCDOPLh491CWy3o5XSQfAhw0sV2USjyN95ruHOMqbNSZbzif1i0fiU9
 guhn9O3tlmfOdCdTs7OSmNsbYUdX1n1D41ce5nxsTHKarUptpT6DBJwWT9NcK/5f62
 fab7lcVQVK0tiKzGaImFZX8R7SMxQR+YxdhwOfUq5wiB7NZFJO/wfx5YDwrkwNaQE6
 WjuatBkdD2nZw==
Date: Fri, 31 Mar 2023 21:58:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <20230331215816.32d5aa35@kernel.org>
In-Reply-To: <20230331212250.103017-1-shenwei.wang@nxp.com>
References: <20230331212250.103017-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Kurt Kanzenbach <kurt@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 Wong Vee Khee <veekhee@apple.com>, Tan Tee Min <tee.min.tan@linux.intel.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 Revanth Kumar Uppala <ruppala@nvidia.com>
Subject: Re: [Linux-stm32] [PATCH v4 1/2] net: stmmac: add support for
 platform specific reset
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

On Fri, 31 Mar 2023 16:22:49 -0500 Shenwei Wang wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index 16a7421715cb..47a68f506c10 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -214,8 +214,6 @@ struct stmmac_dma_ops {
>  	int (*enable_tbs)(void __iomem *ioaddr, bool en, u32 chan);
>  };
> 
> -#define stmmac_reset(__priv, __args...) \
> -	stmmac_do_callback(__priv, dma, reset, __args)
>  #define stmmac_dma_init(__priv, __args...) \
>  	stmmac_do_void_callback(__priv, dma, init, __args)
>  #define stmmac_init_chan(__priv, __args...) \
> @@ -640,6 +638,7 @@ extern const struct stmmac_mmc_ops dwxgmac_mmc_ops;
>  #define GMAC_VERSION		0x00000020	/* GMAC CORE Version */
>  #define GMAC4_VERSION		0x00000110	/* GMAC4+ CORE Version */
> 
> +int stmmac_reset(struct stmmac_priv *priv, void *ioaddr);

sparse reports missing annotation, I think it's this line.
It should have a __iomem tag. Try building with C=1
Also please take a look at:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html

>  int stmmac_hwif_init(struct stmmac_priv *priv);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
