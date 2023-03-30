Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A24A26CFEF0
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Mar 2023 10:48:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AEF1C6A5E7;
	Thu, 30 Mar 2023 08:48:58 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79352C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Mar 2023 08:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DeoOfJL7K3GiaKcfJFMtzEsEv1I6MZwA6BRk3bNkuzo=; b=JGQ5zvhVGHb6PnmUfHz26YdCdI
 Q0jblHgYA8Ba6VeYMYomKYccVYenAppAY1ABeKiTIEJNaHKvfbWPkmRBvm3KTVsf2HgYPVgCrYWYS
 reuKnGxaoDBXoqrGfPaMfUSnfqRqxThg+lVgc6FxlVq49LnQfWsWy/ohJ1ctYvWIe/t0f3qHHuNqc
 lYXpuvU8xA8+0sNB0wWv9LLomocgb5QFhM8gymEqNJZoy66FoS5Xo7odCLB6v/g85NhUTdTJm1p9m
 VIgEwoeIuMQUGaOxGU+hLPYzBCT0+LWB0zm03X00+beN8y24EkNOjAfpLttekHkU8VUO9aXVacSpK
 N0BgcFeg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37588)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1phnxR-0001y4-3E; Thu, 30 Mar 2023 09:48:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1phnxN-0008Pd-GB; Thu, 30 Mar 2023 09:48:29 +0100
Date: Thu, 30 Mar 2023 09:48:29 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Message-ID: <ZCVM3c+Pk38pv6vs@shell.armlinux.org.uk>
References: <20230330084000.3292487-1-michael.wei.hong.sit@intel.com>
 <20230330084000.3292487-2-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230330084000.3292487-2-michael.wei.hong.sit@intel.com>
Cc: andrew@lunn.ch, linux-kernel@vger.kernel.org,
 Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net v4 1/3] net: phylink: add
	phylink_expects_phy() method
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

On Thu, Mar 30, 2023 at 04:39:58PM +0800, Michael Sit Wei Hong wrote:
> Provide phylink_expects_phy() to allow MAC drivers to check if it
> is expecting a PHY to attach to. Since fixed-linked setups do not
> need to attach to a PHY.
> 
> Provides a boolean value as to if the MAC should expect a PHY.
> returns true if a PHY is expected.
> 
> Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> ---
>  drivers/net/phy/phylink.c | 17 +++++++++++++++++
>  include/linux/phylink.h   |  1 +
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 1a2f074685fa..4c080656e280 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -1586,6 +1586,23 @@ void phylink_destroy(struct phylink *pl)
>  }
>  EXPORT_SYMBOL_GPL(phylink_destroy);
>  
> +/**
> + * phylink_expects_phy() - Determine if phylink expects a phy to be attached
> + * @pl: a pointer to a &struct phylink returned from phylink_create()
> + *
> + * Fixed-link mode does not need a PHY, returns a boolean value to check if
> + * phylink will be expecting a PHY to attach.

This description could be clearer (for example, it isn't just about
fixed-link mode), but apart from that, it's good. I don't think that's
a reason to delay this any further, but please follow-up with a patch
to improve this description.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
