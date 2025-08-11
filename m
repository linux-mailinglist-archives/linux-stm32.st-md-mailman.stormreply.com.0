Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD03B208DE
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 14:36:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D351C32E8D;
	Mon, 11 Aug 2025 12:36:48 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06925C349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 12:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=akg1VPYncJQYtJga7vyBFrDG32QQSfTrI/1dhFFl3BU=; b=o4MPdHMwnmCiOadxyyWvcFCZo0
 D5kqPdZu1Dvty7VJewOzG62G1zaeIh+Z7ulAfFaKPVV9fcSfUXcJwzZ1wCe4Wl3kS1G89ImbjHAHk
 IckHFPeVP6RNr/RG2sf5Adaz4aN4oOHldJvWad0OPNG85bkfc8sJOnnoUhVZCYoQN2a8a21kdVNL+
 BXtZeoNHXFGtlQErARdOwNuNqx9ANkWt96a4IxVH+UwBByFNsME5MFjZtm12U1u7slPFJ6j4qhTNH
 OWvYevGBGT/BmP1YFAAZtZoVU7qN/r10xuuf5zhfx4jsH93FMoJClbo9o73SEoKViTksc3SfpnY6f
 Gu+DQDTA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33394)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1ulRlV-0002vA-1L;
 Mon, 11 Aug 2025 13:36:37 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1ulRlR-0003hh-1q;
 Mon, 11 Aug 2025 13:36:33 +0100
Date: Mon, 11 Aug 2025 13:36:33 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Colin Ian King <colin.i.king@gmail.com>
Message-ID: <aJnj0e8P8ttlRf1r@shell.armlinux.org.uk>
References: <20250811111211.1646600-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811111211.1646600-1-colin.i.king@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: make variable data a u32
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

On Mon, Aug 11, 2025 at 12:12:11PM +0100, Colin Ian King wrote:
> Make data a u32 instead of an unsigned long, this way it is
> explicitly the same width as the operations performed on it
> and the same width as a writel store, and it cleans up sign
> extention warnings when 64 bit static analysis is performed
> on the code.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
