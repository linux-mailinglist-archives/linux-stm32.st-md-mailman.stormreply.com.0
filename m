Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6814995CF70
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 16:21:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 132BBC71289;
	Fri, 23 Aug 2024 14:21:17 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36AFEC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 14:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bQZmzBWz/CL6j0TwrrcEFPo250vjCJnNPzSnDONQR+Q=; b=o7tgunipyF+hYaNzNp7UZ+DjdN
 lr/1wgmFiCtGvzou+9dQ+rFXLkrO0RLyYTg4mrGX9Pt2sMsXtNqFgtfaMBvhdKM0Y9mvjbgD0W5Yu
 Dsd12mO2zfVbIKgjuA1AsPFMaFkNcw3oOB/PHR5YqvIWrTii84c0LgBexCRuCFoPYqUJ27D9WNbIw
 gTr9MVvzkRUnKafxmTAXYK7R67XfS3I6ny2GmucRzWx31oLz2oy9OfsP4dNq9EOLh249XTbhFIcjK
 vnvgJqIk2SG3StOrhSptUZptaESD8rskRpd4Ori6j7VkvT0OYJ70P6E2M6929fyBNlp4aDdqjwjz7
 ROUngT9w==;
Received: from i53875ae2.versanet.de ([83.135.90.226] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1shV9d-0005sc-Qs; Fri, 23 Aug 2024 16:20:41 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Date: Fri, 23 Aug 2024 16:21:25 +0200
Message-ID: <2564871.TLnPLrj5Ze@diego>
In-Reply-To: <20240823141318.51201-2-detlev.casanova@collabora.com>
References: <20240823141318.51201-1-detlev.casanova@collabora.com>
 <20240823141318.51201-2-detlev.casanova@collabora.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@collabora.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Re: [PATCH v3 1/3] ethernet: stmmac: dwmac-rk: Fix
	typo for RK3588 code
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

Am Freitag, 23. August 2024, 16:11:13 CEST schrieb Detlev Casanova:
> Fix SELET -> SELECT in RK3588_GMAC_CLK_SELET_CRU and
> RK3588_GMAC_CLK_SELET_IO
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 7ae04d8d291c8..9cf0aa58d13bf 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1141,8 +1141,8 @@ static const struct rk_gmac_ops rk3568_ops = {
>  #define RK3588_GMAC_CLK_RMII_MODE(id)		GRF_BIT(5 * (id))
>  #define RK3588_GMAC_CLK_RGMII_MODE(id)		GRF_CLR_BIT(5 * (id))
>  
> -#define RK3588_GMAC_CLK_SELET_CRU(id)		GRF_BIT(5 * (id) + 4)
> -#define RK3588_GMAC_CLK_SELET_IO(id)		GRF_CLR_BIT(5 * (id) + 4)
> +#define RK3588_GMAC_CLK_SELECT_CRU(id)		GRF_BIT(5 * (id) + 4)
> +#define RK3588_GMAC_CLK_SELECT_IO(id)		GRF_CLR_BIT(5 * (id) + 4)
>  
>  #define RK3588_GMA_CLK_RMII_DIV2(id)		GRF_BIT(5 * (id) + 2)
>  #define RK3588_GMA_CLK_RMII_DIV20(id)		GRF_CLR_BIT(5 * (id) + 2)
> @@ -1240,8 +1240,8 @@ static void rk3588_set_gmac_speed(struct rk_priv_data *bsp_priv, int speed)
>  static void rk3588_set_clock_selection(struct rk_priv_data *bsp_priv, bool input,
>  				       bool enable)
>  {
> -	unsigned int val = input ? RK3588_GMAC_CLK_SELET_IO(bsp_priv->id) :
> -				   RK3588_GMAC_CLK_SELET_CRU(bsp_priv->id);
> +	unsigned int val = input ? RK3588_GMAC_CLK_SELECT_IO(bsp_priv->id) :
> +				   RK3588_GMAC_CLK_SELECT_CRU(bsp_priv->id);
>  
>  	val |= enable ? RK3588_GMAC_CLK_RMII_NOGATE(bsp_priv->id) :
>  			RK3588_GMAC_CLK_RMII_GATE(bsp_priv->id);
> 




_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
