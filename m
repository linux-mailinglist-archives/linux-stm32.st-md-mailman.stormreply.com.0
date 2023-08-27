Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2056E78A0B9
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Aug 2023 19:57:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEF82C6A613;
	Sun, 27 Aug 2023 17:57:33 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1691DC65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Aug 2023 17:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3bcqGb8c9MJdTQ6tWNLuuoF9D7rQzI8cfAXINlj2RDI=; b=XXdQMLUmFZOx4/OSGyjOKjkXQO
 6NMQdjFHsIPxoVX1hyRgrdHuXR63gKElQ/cNdJIl2uZ3gy5+NGINuxF7oWPDqxBA9ThHOW+f3osK7
 p+fDlQ90EEK5mC2Z0A9LTYzcEvDFtEWGrAEELsbthQkpWFt5pbHF6I79rRBECnHF5zE6WfQFZxTxe
 SNGGsfVnpxQ8IzqYH+8qz4BvRZq4a1jv/K2SiW2oxuazQccAMje6MBWTRnsnR2pwmUP9y5sj1s0qT
 eUwkURqWTczX0h8KVf+nROL0UQy/zYNAMEcVjXJOPYf2Q07tNq47i/ekqDZG8/uE+Ci8IsnFrinC1
 vlLHV+KQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51984)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qaK0f-00076U-35;
 Sun, 27 Aug 2023 18:57:14 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qaK0c-0002it-AX; Sun, 27 Aug 2023 18:57:10 +0100
Date: Sun, 27 Aug 2023 18:57:10 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Emil Renner Berthing <kernel@esmil.dk>
Message-ID: <ZOuOdt2/y5mKuuv0@shell.armlinux.org.uk>
References: <20230827134150.2918-1-jszhang@kernel.org>
 <20230827134150.2918-3-jszhang@kernel.org>
 <CANBLGcwFW_Y4PC1hxJ7OQN-h025e5wwoCNwnk8OXh3ALFQPcXg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANBLGcwFW_Y4PC1hxJ7OQN-h025e5wwoCNwnk8OXh3ALFQPcXg@mail.gmail.com>
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Samin Guo <samin.guo@starfivetech.com>, Jisheng Zhang <jszhang@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: dwmac-starfive:
 remove unnecessary clk_get_rate()
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

On Sun, Aug 27, 2023 at 07:33:10PM +0200, Emil Renner Berthing wrote:
> On Sun, 27 Aug 2023 at 15:53, Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > In starfive_dwmac_fix_mac_speed(), the rate gotten by clk_get_rate()
> > is not necessary, remove the clk_get_rate() calling.
> 
> Thanks. I suggested this change during the initial review, but someone
> wanted the code as it is. I must admit I don't understand why, so
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

The code in starfive_dwmac_fix_mac_speed() is a repeated pattern amongst
many drivers, and having each platform driver re-implement this is not
sane. Those who know me will know that I have a patch that cleans this
all up - moving basically the guts of this to a library function which
platform drivers can make use of.

It's not like the clock rates are somehow special - they're standard for
10M/100M/1G speeds on a GMII-family interface, and the 10M/100M also
share the clock rates with MII.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
