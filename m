Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0F0786574
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Aug 2023 04:35:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46D18C6B44C;
	Thu, 24 Aug 2023 02:35:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 427CAC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 02:35:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 07B1E6575F;
 Thu, 24 Aug 2023 02:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE55C433C7;
 Thu, 24 Aug 2023 02:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692844499;
 bh=XjxrkSsQ/Ror3FyVT2R08gl6DNDs2DU+FO1FT6wHawE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qlEkFLwG6Wa+uMJh8Gi2q8otS75ifb24FveBqIEZAL5hJLk0oMF9P9qgBagCrZVfo
 PUIrtDyjWo6P8rkyvFK9VYy0JvpROzhTZLGD0KmLHDTcUFzh0jAaAAlzkvkErIsjfv
 hABDGKjDFVKq9iH65hrG6lq5D/gg0ZLeIziYV5q63s3/Fo2uwKTIx8iURNw/l2b4U4
 Qj1e2oaqVaZR0/UUTz20OUTnCOmMvSDw1R6zUmiPSBoYarLdW9cNlA6AMOZAc3rzKq
 dPBRdCeJ8FwY+ZFMSforxAH0qM7eHIGbFgVTJAG+B0vR0v5f9inNepjOywASLOf8cR
 tKY1TIBAruxxA==
Date: Wed, 23 Aug 2023 19:34:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20230823193457.35052bf8@kernel.org>
In-Reply-To: <E1qYWSO-005fXx-6w@rmk-PC.armlinux.org.uk>
References: <ZOUDRkBXzY884SJ1@shell.armlinux.org.uk>
 <E1qYWSO-005fXx-6w@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 5/9] net: stmmac: use
	phylink_limit_mac_speed()
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

On Tue, 22 Aug 2023 19:50:24 +0100 Russell King (Oracle) wrote:
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index b51cf92392d2..0d7354955d62 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -440,7 +440,7 @@ void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed)
>  
>  	for (i = 0; i < ARRAY_SIZE(phylink_caps_params) &&
>  		    phylink_caps_params[i].speed > max_speed; i++)
> -		config->mac_speed &= ~phylink_caps_params.mask;
> +		config->mac_capabilities &= ~phylink_caps_params[i].mask;
>  }
>  EXPORT_SYMBOL_GPL(phylink_limit_mac_speed);

This chunk belongs to patch 1?
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
