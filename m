Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2CBA41B40
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2025 11:36:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98E51C7803B;
	Mon, 24 Feb 2025 10:36:36 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7288EC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 10:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sUjP7nME49XMvRbecnVxakYaXIvcyMTx+cRewy4gHSk=; b=GvdTGoh27LkRUBokpiKsLaOG/a
 HL6tFMB4c/rXgQoEZKGjiokpD9LhpZll3xHktZUWfH0pRuDEyey7dtS7S5QR71f93x+CMZnmLDM7S
 ja8cREoXzrY1rkyGB6eiwbf6+EgKmvsMvII2gWchKhiz0xIQEPvVH2a2LofEhqMKVGPw0OLoOzJuM
 ffhMXj4G3FVRNH+4TLPiQU13H485dg+XbV8m1ZiTuNJwQsfhvcXZVupj9jRt5Q8BfoLVdxXMzGE5H
 eIerSoxk8Vjsu0sfttPbf71XDFbTOMfBW8P7IQmWGggtx0IITyePhKIsFGPlWiBvvCgMwnRbdftJG
 LZP3qkXg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52350)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tmVoy-0005u6-0x;
 Mon, 24 Feb 2025 10:36:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tmVot-0004us-2b;
 Mon, 24 Feb 2025 10:36:15 +0000
Date: Mon, 24 Feb 2025 10:36:15 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Joe Perches <joe@perches.com>
Message-ID: <Z7xLn5dDM1zUfgys@shell.armlinux.org.uk>
References: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
 <Z7sJHuiqbr4GU05c@shell.armlinux.org.uk>
 <7bf9577f4b6dcb818785be73c175bcd19b3b4f0c.camel@perches.com>
 <Z7w3QhcYhrzQk_5K@shell.armlinux.org.uk>
 <26d2832ce7aba1c919e8dcb4aeb8fa2abacedb01.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26d2832ce7aba1c919e8dcb4aeb8fa2abacedb01.camel@perches.com>
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

On Mon, Feb 24, 2025 at 01:34:36AM -0800, Joe Perches wrote:
> On Mon, 2025-02-24 at 09:09 +0000, Russell King (Oracle) wrote:
> > On Sun, Feb 23, 2025 at 06:33:44AM -0800, Joe Perches wrote:
> > > On Sun, 2025-02-23 at 11:40 +0000, Russell King (Oracle) wrote:
> > > > Adding Joe Perches.
> > > > 
> > > > On Fri, Feb 21, 2025 at 02:15:17PM +0000, Russell King (Oracle) wrote:
> > > []
> > > > I've been investigating why the NIPA bot complains about maintainers
> > > > not being Cc'd, such as for patch 1 of this series:
> > > > 
> > > > https://netdev.bots.linux.dev/static/nipa/936447/13985595/cc_maintainers/stdout
> > > 
> > > Additional maintainers added or missing?
> > 
> > Let me be clear - NIPA is not something under my control. It is a bot
> > run by Jakub on netdev patches that are received by patchwork - so
> > patches that have been emailed out, and thus contain at least the
> > To:, Cc: and Subject: header lines, possibly all header lines that
> > have been added such as Received: etc. I don't know what it actually
> > does.
> > 
> > Now let me restate the problem, because the answer to your question
> > is in the problem description. Here's the short version:
> > 
> > 	K: entries match email headers.
> > 
> > Here's the long version:
> > 
> > If one runs get_maintainers.pl on a patch produced from git, it
> > comes out with a list of maintainers. In the case of dwmac-thead.c,
> > this includes an email address that contains "riscv".
> 
> Yeah, I got all that from your first cc, thanks.
> 
> Which is why I suggested that the nipa bot use
> get_maintainer.pl's --nokeywords option somewhere.

That's no solution. K: exists so that maintainers get Cc'd on patches
that match keywords - for example a subsystem maintainer wants to be
Cc'd on patches that make use of the subsystem interfaces would include
a K: line to pick up on function names that appear in patches.

Disabling K: means that these will be missed.

NIPA has caught several instances where I should have been Cc'd but
haven't because of this facility, and thus patches have not been
properly reviewed. So, disabling K: is detrimental.

IMHO, it's crazy that keywords match any of the email headers present
in a patch that is presented to it. As I've already said - either
get_maintainers should restrict to a limited number of headers used
for matching, or NIPA needs to present to get_maintainers what would
be an original patch as generated by git without lots of email headers.

> I don't use/control/read/write/care_about the nipa bot either.

Sigh. Why is this so damn difficult. I wasn't expecting you to do
anything about it immediately. It's something that _you_ /and/
_Jakub_ as the author of NIPA need to come to some agreement on.
That's why my original email was also sent _to_ Jakub as well.

Sheesh. Again, why is this so difficult????

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
