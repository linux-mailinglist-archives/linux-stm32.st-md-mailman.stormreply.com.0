Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB59C08DB8
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Oct 2025 10:03:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D9B3C5A4C4;
	Sat, 25 Oct 2025 08:03:00 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 933C3C06933
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Oct 2025 08:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DiTcJgJML7VPWotE97Q4MxQQlpiwpQepFZOTkMMNb1w=; b=l1fpE7eNDN2Pio1MCdPSCLkAQq
 IqiddzouUUi+vK/4ATK6jSRXOuBhK4+IxdbhyjzslRPAOc5MrxM5kBBrK2IKdBJXX9CV1i58mxy0F
 mJQAddngLfempOQS1thJHdfCr3LPasqIvdT2EmI19meX+dMAd3Pm1xvLge6sg2LSjhmuEm+bGnAjc
 x5Q0IRoumx6GNBj6hJhIN6N9WAtch3jgY9jw0fGUtxYN4Gs3Av9NclVjzsPZytRW6AzbQKYIxvmGo
 JuIEDi4KXIKsKKK0o5ONByXkO/3Go4Kby0H5Gtqld5zDiqjDCMHh2tUDUSvWY0LeTP+NWwtlGODqr
 wU7Bo2Ig==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47732)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vCZEh-000000008P1-2JUj;
 Sat, 25 Oct 2025 09:02:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vCZEe-000000003Vi-1fyn; Sat, 25 Oct 2025 09:02:48 +0100
Date: Sat, 25 Oct 2025 09:02:48 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <aPyEKGCeXwnsn4OC@shell.armlinux.org.uk>
References: <aPn5YVeUcWo4CW3c@shell.armlinux.org.uk>
 <E1vBrtk-0000000BMYm-3CV5@rmk-PC.armlinux.org.uk>
 <20251024190159.60f897e5@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251024190159.60f897e5@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: add
	stmmac_mac_irq_modify()
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

On Fri, Oct 24, 2025 at 07:01:59PM -0700, Jakub Kicinski wrote:
> On Thu, 23 Oct 2025 10:46:20 +0100 Russell King (Oracle) wrote:
> > Add a function to allow interrupts to be enabled and disabled in a
> > core independent manner.
> 
> Sorry for a general question but I'm curious why stick to the callback
> format this driver insists on. Looks like we could get away with
> parameterizing the code with the register offset via the priv structure.

Not quite - some cores, it's a mask (bits need to be set to be disabled).
Other cores, it's an enable (bits need to be set to enable). So one
can't get away with just "this is where the register is", it would need
three pieces of information - register offset, type of regster (mask or
enable) and then a core specific bitmask.

> Mostly curious. Personally, I'm always annoyed having to dig thru the
> indirections in this driver.

Me too, especially when it's not obvious what is an indirection and
what is not. There's the fun that a lot of the PTP-related indirection
actually has no difference. For example, at the bottom of
stmmac_hwtstamp.c, the struct stmmac_hwtimestamp initialisers have
almost all of the methods pointing at the same implementation
with the exeption of .get_ptptime, .timestamp_interrupt and
.hwtstamp_correct_latency.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
