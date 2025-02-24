Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9081DA4183D
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2025 10:09:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D483C78F97;
	Mon, 24 Feb 2025 09:09:39 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18E66C7803B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 09:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pTALlKbSKJ0pfCW0bKggFYFpg7EFYynYFxwssKh+C9Q=; b=k2mfxxUsJMg20o414L508A20Sz
 IsMmCXwHj9Pve7EakuteAeW2Mijmx7tgNQvJFjEMhorcIp13CSNZUzKt7Sw/+drbSmQypPhFIjkzH
 zSL/HW3fMprv+bGoQucs7FWZUZLr/RMkNONqdbRoDhV5EI89H9aB0fCgWH5dUQcANxgEmiOVsLKAz
 Tysehk9IQp3OMgJLLqPeUuhrLaLXDkHr36NrY34n0hTZqRyIN8OlWEoVVqktJ84ZrUAnZHGM2puSo
 h+If2Gf1Ilku7oFCtXW2jEi1cWQQod7w61T/fqr2D7bPOCjw2noB8r+UstUy4m8wsDIb5gDNbE7V+
 gJemzfpw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53832)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tmUSs-0005bT-1N;
 Mon, 24 Feb 2025 09:09:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tmUSo-0004sM-28;
 Mon, 24 Feb 2025 09:09:22 +0000
Date: Mon, 24 Feb 2025 09:09:22 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Joe Perches <joe@perches.com>
Message-ID: <Z7w3QhcYhrzQk_5K@shell.armlinux.org.uk>
References: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
 <Z7sJHuiqbr4GU05c@shell.armlinux.org.uk>
 <7bf9577f4b6dcb818785be73c175bcd19b3b4f0c.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7bf9577f4b6dcb818785be73c175bcd19b3b4f0c.camel@perches.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, Drew Fustini <drew@pdp7.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
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

On Sun, Feb 23, 2025 at 06:33:44AM -0800, Joe Perches wrote:
> On Sun, 2025-02-23 at 11:40 +0000, Russell King (Oracle) wrote:
> > Adding Joe Perches.
> > 
> > On Fri, Feb 21, 2025 at 02:15:17PM +0000, Russell King (Oracle) wrote:
> []
> > I've been investigating why the NIPA bot complains about maintainers
> > not being Cc'd, such as for patch 1 of this series:
> > 
> > https://netdev.bots.linux.dev/static/nipa/936447/13985595/cc_maintainers/stdout
> 
> Additional maintainers added or missing?

Let me be clear - NIPA is not something under my control. It is a bot
run by Jakub on netdev patches that are received by patchwork - so
patches that have been emailed out, and thus contain at least the
To:, Cc: and Subject: header lines, possibly all header lines that
have been added such as Received: etc. I don't know what it actually
does.

Now let me restate the problem, because the answer to your question
is in the problem description. Here's the short version:

	K: entries match email headers.

Here's the long version:

If one runs get_maintainers.pl on a patch produced from git, it
comes out with a list of maintainers. In the case of dwmac-thead.c,
this includes an email address that contains "riscv".

If one adds this list of maintainers to email headers in the patch
prior to sending it out and then re-runs get_maintainers.pl on it,
or if one receives the patch after it having been emailed out, and
then runs get_maintainers.pl to validate that all appropriate
maintainers were sent a copy of the patch, then get_maintainers.pl
comes out with *extra* *additional* maintainers because the "K: riscv"
line matches *email* *headers*.

In this exact case of dwmac-thead.c, the first run prior to sending
out reports an email address containing "riscv". On these subsequent
runs with the maintainers added to email headers, the presence of
"K: riscv" in MAINTAINERS causes get_maintainers.pl to report the
three maintains for the "RISCV ARCHITECTURE" entry.

This is an issue for you as get_maintainers.pl maintainer and Jakub
as NIPA bot author to hash out - either get_maintainers.pl is
acting incorrectly and needs to be fixed, or NIPA is abusing
get_maintainers.pl in a way that it's not designed to be used.

I'm merely an observer of this behaviour and am merely reporting the
problem - that NIPA's cc_maintainers claim that maintainers were not
copied in my patch submission is incorrect and I've done the research
to identify _why_ it's incorrect. It's now up to you two to decide
where the problem lies and what the solution should be.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
