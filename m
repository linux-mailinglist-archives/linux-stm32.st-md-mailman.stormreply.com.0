Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CB0A4193D
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2025 10:34:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2F1DC7803B;
	Mon, 24 Feb 2025 09:34:44 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com
 [216.40.44.12])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09721CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 09:34:43 +0000 (UTC)
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay05.hostedemail.com (Postfix) with ESMTP id 8E501508AE;
 Mon, 24 Feb 2025 09:34:41 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf18.hostedemail.com (Postfix) with ESMTPA id 2B4DF2F; 
 Mon, 24 Feb 2025 09:34:37 +0000 (UTC)
Message-ID: <26d2832ce7aba1c919e8dcb4aeb8fa2abacedb01.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Date: Mon, 24 Feb 2025 01:34:36 -0800
In-Reply-To: <Z7w3QhcYhrzQk_5K@shell.armlinux.org.uk>
References: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
 <Z7sJHuiqbr4GU05c@shell.armlinux.org.uk>
 <7bf9577f4b6dcb818785be73c175bcd19b3b4f0c.camel@perches.com>
 <Z7w3QhcYhrzQk_5K@shell.armlinux.org.uk>
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 2B4DF2F
X-Spam-Status: No, score=1.39
X-Rspamd-Server: rspamout07
X-Stat-Signature: dzm4ebumxtwbyyqoo1qbgsybk7dqegac
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19mBx6pJ7hyud4Lf2EQyjPbmTA3e2vOugg=
X-HE-Tag: 1740389677-133558
X-HE-Meta: U2FsdGVkX1+5N1cDj+qw+umh28c+txKOgSUaaH0dqayci6ieB+Ae13yavbq9POxom5oeQHC4HdNuhPPmPXsSLd6Kpm9LqlFkdNzx1GkHImNhRB13sgX3E9525FyqznfvneP4+hF++evJu6CNqffpmVg1w5vIQJ+eSmDnBRBIPwqGHQV6wa9+r8Hijv8uD4Dfo1v9G5WQdMJJm96RAmQlvhjafuvnyZ1wBKpVJ4TTz8WQv82S2MqdXywz7IMMkS6J6OyG/v4gKkMIIPJ5J5Bnzf00AFODjrS82yb8FceibNoD+TOsaVTYKq/b47q0Xaxbrvvw8gvOLc/eYvRxvrTBydl20Rd4LDryFoqCticI/znHw9PE2ecmGNR9vjhgtjLr
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

On Mon, 2025-02-24 at 09:09 +0000, Russell King (Oracle) wrote:
> On Sun, Feb 23, 2025 at 06:33:44AM -0800, Joe Perches wrote:
> > On Sun, 2025-02-23 at 11:40 +0000, Russell King (Oracle) wrote:
> > > Adding Joe Perches.
> > > 
> > > On Fri, Feb 21, 2025 at 02:15:17PM +0000, Russell King (Oracle) wrote:
> > []
> > > I've been investigating why the NIPA bot complains about maintainers
> > > not being Cc'd, such as for patch 1 of this series:
> > > 
> > > https://netdev.bots.linux.dev/static/nipa/936447/13985595/cc_maintainers/stdout
> > 
> > Additional maintainers added or missing?
> 
> Let me be clear - NIPA is not something under my control. It is a bot
> run by Jakub on netdev patches that are received by patchwork - so
> patches that have been emailed out, and thus contain at least the
> To:, Cc: and Subject: header lines, possibly all header lines that
> have been added such as Received: etc. I don't know what it actually
> does.
> 
> Now let me restate the problem, because the answer to your question
> is in the problem description. Here's the short version:
> 
> 	K: entries match email headers.
> 
> Here's the long version:
> 
> If one runs get_maintainers.pl on a patch produced from git, it
> comes out with a list of maintainers. In the case of dwmac-thead.c,
> this includes an email address that contains "riscv".

Yeah, I got all that from your first cc, thanks.

Which is why I suggested that the nipa bot use
get_maintainer.pl's --nokeywords option somewhere.

I don't use/control/read/write/care_about the nipa bot either.

cheers, Joe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
