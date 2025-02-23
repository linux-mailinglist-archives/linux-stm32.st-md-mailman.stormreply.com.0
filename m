Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A10A40E67
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Feb 2025 12:40:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2C6EC7A844;
	Sun, 23 Feb 2025 11:40:37 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15568C7A843
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Feb 2025 11:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NgBWyniUF/OIJUlHK2K7BrSpGMn7fltVSGcDSX0c/GY=; b=FIAYQaLjg14eiUynjgEta+jcV6
 ncxKfDn7c5vT5jHvjLpNKBzxSR2LuYPX5WP+/lc2+LAqfFPlpt7Qs4BD2AwPzTyEXn/UpwVRDUZB3
 /MRe/uM63FmDNZdf5bVjldLKiOO1nIkxngExo/E4aGlwssrsJ5oRcJc73KZviwtFnlzarbFIpvB7p
 6AltjBZbgtnoHheNlX2hixabQQ3/c4pvYzicE+QOJ/cthdCVawlAKTjsC0HSNUB8kgr1FexuYxrVE
 tvEw6B+danCezT63cQdu8rdfSQ/T23RYTBcHT9sAi6W1Hp8G/z8cU5awaH0e5pWTXn66r9afrOw1U
 y05zJiOw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54522)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tmALM-0002rw-1T;
 Sun, 23 Feb 2025 11:40:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tmALG-0003y2-2N;
 Sun, 23 Feb 2025 11:40:14 +0000
Date: Sun, 23 Feb 2025 11:40:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Joe Perches <joe@perches.com>
Message-ID: <Z7sJHuiqbr4GU05c@shell.armlinux.org.uk>
References: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, Drew Fustini <drew@pdp7.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-riscv@lists.infradead.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: thead: clean up
 clock rate setting
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

Adding Joe Perches.

On Fri, Feb 21, 2025 at 02:15:17PM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> This series cleans up the thead clock rate setting to use the
> rgmii_clock() helper function added to phylib.
> 
> The first patch switches over to using the rgmii_clock() helper,
> and the second patch cleans up the verification that the desired
> clock rate is achievable, allowing the private clock rate
> definitions to be removed.
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c | 28 ++++++++---------------
>  1 file changed, 9 insertions(+), 19 deletions(-)

I've been investigating why the NIPA bot complains about maintainers
not being Cc'd, such as for patch 1 of this series:

https://netdev.bots.linux.dev/static/nipa/936447/13985595/cc_maintainers/stdout

I think this is a bug in either get_maintainers.pl or the NIPA bot.

On the bare patch without any Cc: header added:

$ scripts/get_maintainer.pl 0001-net-stmmac-thead-use-rgmii_clock-for-RGMII-clock-rat.patch
Drew Fustini <drew@pdp7.com> (maintainer:RISC-V THEAD SoC SUPPORT)
Guo Ren <guoren@kernel.org> (maintainer:RISC-V THEAD SoC SUPPORT)
Fu Wei <wefu@redhat.com> (maintainer:RISC-V THEAD SoC SUPPORT)
Andrew Lunn <andrew+netdev@lunn.ch> (maintainer:NETWORKING DRIVERS)
"David S. Miller" <davem@davemloft.net> (maintainer:NETWORKING DRIVERS)
Eric Dumazet <edumazet@google.com> (maintainer:NETWORKING DRIVERS)
Jakub Kicinski <kuba@kernel.org> (maintainer:NETWORKING DRIVERS)
Paolo Abeni <pabeni@redhat.com> (maintainer:NETWORKING DRIVERS)
Maxime Coquelin <mcoquelin.stm32@gmail.com> (maintainer:ARM/STM32 ARCHITECTURE)
Alexandre Torgue <alexandre.torgue@foss.st.com> (maintainer:ARM/STM32 ARCHITECTURE)
linux-riscv@lists.infradead.org (open list:RISC-V THEAD SoC SUPPORT)
netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER)
linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE)
linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)

If I add those maintainers to a Cc header in the patch file (as it would
be if NIPA runs on the unmodified received email), and then re-run
get_maintainer.pl, then:

$ scripts/get_maintainer.pl 0001-net-stmmac-thead-use-rgmii_clock-for-RGMII-clock-rat.patch
Drew Fustini <drew@pdp7.com> (maintainer:RISC-V THEAD SoC SUPPORT)
Guo Ren <guoren@kernel.org> (maintainer:RISC-V THEAD SoC SUPPORT)
Fu Wei <wefu@redhat.com> (maintainer:RISC-V THEAD SoC SUPPORT)
Andrew Lunn <andrew+netdev@lunn.ch> (maintainer:NETWORKING DRIVERS)
"David S. Miller" <davem@davemloft.net> (maintainer:NETWORKING DRIVERS)
Eric Dumazet <edumazet@google.com> (maintainer:NETWORKING DRIVERS)
Jakub Kicinski <kuba@kernel.org> (maintainer:NETWORKING DRIVERS)
Paolo Abeni <pabeni@redhat.com> (maintainer:NETWORKING DRIVERS)
Maxime Coquelin <mcoquelin.stm32@gmail.com> (maintainer:ARM/STM32 ARCHITECTURE)
Alexandre Torgue <alexandre.torgue@foss.st.com> (maintainer:ARM/STM32 ARCHITECTURE)
Paul Walmsley <paul.walmsley@sifive.com> (supporter:RISC-V ARCHITECTURE:Keyword:riscv)
Palmer Dabbelt <palmer@dabbelt.com> (supporter:RISC-V ARCHITECTURE:Keyword:riscv)
Albert Ou <aou@eecs.berkeley.edu> (supporter:RISC-V ARCHITECTURE:Keyword:riscv)
linux-riscv@lists.infradead.org (open list:RISC-V THEAD SoC SUPPORT)
netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER)
linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE)
linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
linux-kernel@vger.kernel.org (open list)

Note the addition of Paul Walmsley, Palmer Dabbelt and Albert Ou that
was not in the original.

It seems that K: is fed everything in the file, including all headers.
In the second run, the addition of the linux-riscv@lists.infradead.org
mailing list in the headers then causes a subseqent run of
get_maintainer.pl (and nipa's run of get_maintainer.pl) to then match
using K: riscv in the "RISC-V ARCHITECTURE" entry.

So, it seems running get_maintainer.pl on an email received from
mailing lists without first stripping many of the email headers can
lead to false K: matches.

This makes NIPA's cc_maintainers test unreliable.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
