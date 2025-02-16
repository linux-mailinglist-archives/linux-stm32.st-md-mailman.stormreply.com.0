Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5635A39509
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 09:21:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4892FC78F97;
	Tue, 18 Feb 2025 08:21:20 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2215C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2025 10:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YGarZozGAl6CKN/wi5UFirJktubp5acuW0QTwj6NYIU=; b=VjJneWTjzD9tIJJu9OCdzjp5c1
 DTEVY9e58W1HB8t9izvBS7heYLqPPXPMYwcd3eoGnSEuCMEgP27GI2LwTL5r19f44QOE151IfsBI/
 KgjCrAzPhLx/4qlklsURPRVW1PhYfPAfrFrDq5zuR+RUm2G1oM6TJufALXEUDZ4wLiilHT1o9I8FH
 aZmS2LrSl64QtyEBjBQ6bP+/292Ez+hcAUknA38hhGZIsNXSMvHqMJQ2I0rTHuY/bMcIG1xodWGaa
 D1u6FNM3B1XdeMPnRKSz3nzwNJv9Aou5u+E/JMRpKmcVfL6+S8mTi2dPW4avcHZIV2fTT2N1A6DMT
 YLZlwSyg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53324)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tjbyS-0002w6-31;
 Sun, 16 Feb 2025 10:34:09 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tjbyE-00058N-0u;
 Sun, 16 Feb 2025 10:33:54 +0000
Date: Sun, 16 Feb 2025 10:33:54 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Yu-Chun Lin <eleanor15x@gmail.com>
Message-ID: <Z7G_EpgKRdaCRKfy@shell.armlinux.org.uk>
References: <20250215164412.2040338-1-eleanor15x@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250215164412.2040338-1-eleanor15x@gmail.com>
X-Mailman-Approved-At: Tue, 18 Feb 2025 08:21:19 +0000
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 netdev@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, visitorckw@gmail.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Use str_enabled_disabled()
	helper
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

On Sun, Feb 16, 2025 at 12:44:12AM +0800, Yu-Chun Lin wrote:
> As kernel test robot reported, the following warning occurs:
> 
> cocci warnings: (new ones prefixed by >>)
> >> drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:582:6-8: opportunity for str_enabled_disabled(on)
> 
> Replace ternary (condition ? "enabled" : "disabled") with
> str_enabled_disabled() from string_choices.h to improve readability,
> maintain uniform string usage, and reduce binary size through linker
> deduplication.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502111616.xnebdSv1-lkp@intel.com/
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>

Patch looks fine to me, but netdev requires that the tree for which the
patch is destined to be specified in the subject line - either:

	[PATCH net] - strictly for fixes only
	[PATCH net-next] - for development/new features

Given that this isn't a user visible bug, net-next would be appropriate.
Please resend with the appropriate tag only after 24 hours have elapsed
after the last interaction with this email thread.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
