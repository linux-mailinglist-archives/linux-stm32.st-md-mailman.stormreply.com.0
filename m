Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7916B2E5A3
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Aug 2025 21:32:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F6A3C3F951;
	Wed, 20 Aug 2025 19:32:28 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1C25C3F94F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 19:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=7duyyjL7eYovEeoZ4YzNo/SB6xtDvS5WqrIt7qC1jQ0=; b=u4qjFpqIUgyumgF6BnzgxABWO6
 QWbN3awJajqV4n40RyGBvYM0bWw09frD6OcC6XpoOp+1cpe96Rjdlnt9BMzJs4nh+y1l1jUkz+DaT
 qXZzCSzYp/bkygHk6RB7TyDRLDgUkKxDQBS9MZzpX73k3cxZvQoflIj2sUi5ohaFWQW8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uooXe-005MOs-63; Wed, 20 Aug 2025 21:32:14 +0200
Date: Wed, 20 Aug 2025 21:32:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <1a60fe65-2ab1-45ff-817e-afe4571f6821@lunn.ch>
References: <E1uojpo-00BMoL-4W@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1uojpo-00BMoL-4W@rmk-PC.armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: fix
 stmmac_simple_pm_ops build errors
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

On Wed, Aug 20, 2025 at 03:30:40PM +0100, Russell King (Oracle) wrote:
> The kernel test robot reports that various drivers have an undefined
> reference to stmmac_simple_pm_ops. This is caused by
> EXPORT_SYMBOL_GPL_SIMPLE_DEV_PM_OPS() defining the struct as static
> and omitting the export when CONFIG_PM=n, unlike DEFINE_SIMPLE_PM_OPS()
> which still defines the struct non-static.
> 
> Switch to using DEFINE_SIMPLE_PM_OPS() + EXPORT_SYMBOL_GPL(), which
> means we always define stmmac_simple_pm_ops, and it will always be
> visible for dwmac-* to reference whether modular or built-in.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508132051.a7hJXkrd-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202508132158.dEwQdick-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202508140029.V6tDuUxc-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202508161406.RwQuZBkA-lkp@intel.com/
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
