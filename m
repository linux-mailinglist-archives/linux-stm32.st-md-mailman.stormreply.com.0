Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A30FCB293F6
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Aug 2025 18:04:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7584C3087B;
	Sun, 17 Aug 2025 16:04:02 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48107C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Aug 2025 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=zdE0R993uxA9LK/Gcm928RWFPyC6VX59/G/wYy8am1w=; b=XslvMXKX9PoOKnQ672hCHnJ0QD
 PXkmPDbUxNUDI5P4yT/3/8jpgr0KFsAb5Oyx2ihjRrCvKaWlomgGK3XLi0bMQpbFZzLQjPF7+urzx
 pJLMHL3IywQN1RwW4c9lXg/z+oiPo6YbvSOjCPU1XcQ9VnphR8LRyBwLWfGQhklD6eho=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1unfrK-004ybH-2n; Sun, 17 Aug 2025 18:03:50 +0200
Date: Sun, 17 Aug 2025 18:03:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <00b45ff8-b5fa-4453-a389-a7252aa1da6d@lunn.ch>
References: <aJ8avIp8DBAckgMc@shell.armlinux.org.uk>
 <E1umsfK-008vKj-Pw@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1umsfK-008vKj-Pw@rmk-PC.armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 5/7] net: stmmac: use core wake
	IRQ support
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

On Fri, Aug 15, 2025 at 12:32:10PM +0100, Russell King (Oracle) wrote:
> The PM core provides management of wake IRQs along side setting the
> device wake enable state. In order to use this, we need to register
> the interrupt used to wakeup the system using devm_pm_set_wake_irq()
> or dev_pm_set_wake_irq(). The core will then enable or disable IRQ
> wake state on this interrupt as appropriate, depending on the
> device_set_wakeup_enable() state. device_set_wakeup_enable() does not
> care about having balanced enable/disable calls.
> 
> Make use of this functionality, rather than explicitly managing the
> IRQ enable state in the set_wol() ethtool op. This removes the IRQ
> wake state management from stmmac.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
