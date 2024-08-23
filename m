Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D70795CF72
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 16:21:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F517C71289;
	Fri, 23 Aug 2024 14:21:31 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1056BC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 14:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HfhTAcd3m1L5HJA9yejn7UHuUl2R1wfvxVwgaWJLsos=; b=a22HQPNSHQGY5pRF+CT2WXlT0o
 J04wjqrnAacN3RU3ohkdIg4BOvqfxDRascAyQnsAm64tDKblDlu4ajfIkzw5yMeEyt0YyBAaSb6N7
 +L5P93oAtCwvyi94N0tPaEZXTrweurK0y1eAkkKUbdt2U0yZus2nZdtZHu5XefjvHNuRWcXfuB1Ns
 uP9IBsOUetBGOSkRAYZK82CkUcRfzbWy6FRa6/RpICx44rhpU3jJjQuTmKRtEWZuz/zK7spYDqJgp
 vAdVWG+ya9fkrGWqGq6UfX8FQi+XOLAa8IKZ1ZEIwGsHOHlvXFS359UO0I06wQtQcyiQ4KhiB8Kwt
 W8wlg1Mg==;
Received: from i53875ae2.versanet.de ([83.135.90.226] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1shVAB-0005tA-Ep; Fri, 23 Aug 2024 16:21:15 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Date: Fri, 23 Aug 2024 16:21:58 +0200
Message-ID: <9856424.ag9G3TJQzC@diego>
In-Reply-To: <20240823141318.51201-3-detlev.casanova@collabora.com>
References: <20240823141318.51201-1-detlev.casanova@collabora.com>
 <20240823141318.51201-3-detlev.casanova@collabora.com>
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
Subject: Re: [Linux-stm32] [PATCH v3 2/3] dt-bindings: net: Add support for
	rk3576 dwmac
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

Am Freitag, 23. August 2024, 16:11:14 CEST schrieb Detlev Casanova:
> Add a rockchip,rk3576-gmac compatible for supporting the 2 gmac
> devices on the rk3576.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

>  Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 2 ++
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml     | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> index 6bbe96e352509..f8a576611d6c1 100644
> --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> @@ -25,6 +25,7 @@ select:
>            - rockchip,rk3368-gmac
>            - rockchip,rk3399-gmac
>            - rockchip,rk3568-gmac
> +          - rockchip,rk3576-gmac
>            - rockchip,rk3588-gmac
>            - rockchip,rv1108-gmac
>            - rockchip,rv1126-gmac
> @@ -52,6 +53,7 @@ properties:
>        - items:
>            - enum:
>                - rockchip,rk3568-gmac
> +              - rockchip,rk3576-gmac
>                - rockchip,rk3588-gmac
>                - rockchip,rv1126-gmac
>            - const: snps,dwmac-4.20a
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 3eb65e63fdaec..4e2ba1bf788c9 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -80,6 +80,7 @@ properties:
>          - rockchip,rk3328-gmac
>          - rockchip,rk3366-gmac
>          - rockchip,rk3368-gmac
> +        - rockchip,rk3576-gmac
>          - rockchip,rk3588-gmac
>          - rockchip,rk3399-gmac
>          - rockchip,rv1108-gmac
> 




_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
