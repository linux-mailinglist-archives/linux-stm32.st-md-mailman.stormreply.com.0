Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18686B35A1E
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Aug 2025 12:31:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72EF2C3F930;
	Tue, 26 Aug 2025 10:31:09 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11FC7C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 10:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KF2ObC+OsVZ7or0LZchP/vk8UwZrfHhQgcnlOB8aCz4=; b=jZ6BNJTq2lIQwKfYvco0uRWf8+
 oV5k1oBfbLni7eapsB1h9rcCAp1N6+8fnG8gR5EdVvRlyLx8tx4l9tdvLBB5RjkYf1FEyZZE4GBvV
 d4TvThynTfshIl5sypaefRXA470zgUaMTNnq+e80GQOrHvf9C7YojtO6FUDr29BStnggw8ukriw+3
 BInjVJzkMkOnF5QZsbzLA4ROI8AE75BNQcWnQ3bNw7v9wN74/rFp72E5Ls1vguaXrPbF+AaAnbEBp
 qqIlvPDcA3eta/73J35HFoH+FUG+qe9MTwnF6vlNvi/TVAfSqxhfYX5kw8YsilHSBnG0eiO++PXWk
 G8BuwNgQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45122)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1uqqx5-000000007iq-07K9;
 Tue, 26 Aug 2025 11:30:55 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1uqqx0-000000001Ap-2cp5; Tue, 26 Aug 2025 11:30:50 +0100
Date: Tue, 26 Aug 2025 11:30:50 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Message-ID: <aK2M2j7-CpnydtUh@shell.armlinux.org.uk>
References: <20250826102219.49656-1-alok.a.tiwari@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250826102219.49656-1-alok.a.tiwari@oracle.com>
Cc: horms@kernel.org, jonas@kwiboo.se, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, david.wu@rock-chips.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: rk: remove
 incorrect _DLY_DISABLE bit definition
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

On Tue, Aug 26, 2025 at 03:22:15AM -0700, Alok Tiwari wrote:
> The RK3328 GMAC clock delay macros define enable/disable controls for
> TX and RX clock delay. While the TX definitions are correct, the
> RXCLK_DLY_DISABLE macro incorrectly clears bit 0.
> 
> The macros RK3328_GMAC_TXCLK_DLY_DISABLE and
> RK3328_GMAC_RXCLK_DLY_DISABLE are not referenced anywhere
> in the driver code. Remove them to clean up unused definitions.
> 
> No functional change.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Looks correct to me!

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
