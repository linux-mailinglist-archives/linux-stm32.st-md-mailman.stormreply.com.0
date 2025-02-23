Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8886A40F47
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Feb 2025 15:33:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E19EC7A843;
	Sun, 23 Feb 2025 14:33:54 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com
 [216.40.44.10])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAC9FC78F6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Feb 2025 14:33:52 +0000 (UTC)
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay10.hostedemail.com (Postfix) with ESMTP id 3AEDFC2A6D;
 Sun, 23 Feb 2025 14:33:50 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf19.hostedemail.com (Postfix) with ESMTPA id 9D56620027; 
 Sun, 23 Feb 2025 14:33:45 +0000 (UTC)
Message-ID: <7bf9577f4b6dcb818785be73c175bcd19b3b4f0c.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>
Date: Sun, 23 Feb 2025 06:33:44 -0800
In-Reply-To: <Z7sJHuiqbr4GU05c@shell.armlinux.org.uk>
References: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
 <Z7sJHuiqbr4GU05c@shell.armlinux.org.uk>
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-Stat-Signature: esw3dr8mhka38dy95jmw4hywg8muj68u
X-Rspamd-Server: rspamout01
X-Spam-Status: No, score=1.34
X-Rspamd-Queue-Id: 9D56620027
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+wRTpTpK3yZctHayRKM8k2m6yVovYm8rE=
X-HE-Tag: 1740321225-99173
X-HE-Meta: U2FsdGVkX18tLefx9AGTjZ0jhquEbj97fUAGJuLtZQssX3hWFu5sggBKHI4DwjWn8Zwn0QpW3Qr0HmBXP3ocR/MHKikZ9oAZK2xrnR9ATgzsWS1svxwvKnlT9OoQm5zxwAd/ZvqtW0AzDPqtc7FJP8cp33TVipXmpgupjKGtdNm8SwEeZaEALT3gFjUOydgga8gwmPF+qQG/2CHmqq4HGIIp4ZOJJjRR2ZedoQ80uSlycAsw472d4W8xMshd4NzXp6DYOxPADh0pAXMVHh37IPsPhCUT8YcB6bGYItqwGeOZ3/iGOfn9LRbizQIKBTGHXFkaAqVaWP8zsH3fGG8hmSj4Hv7mOeLeo/OdWEF/C68muP3EJXVkcAgoX9U7poXD
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

On Sun, 2025-02-23 at 11:40 +0000, Russell King (Oracle) wrote:
> Adding Joe Perches.
> 
> On Fri, Feb 21, 2025 at 02:15:17PM +0000, Russell King (Oracle) wrote:
[]
> I've been investigating why the NIPA bot complains about maintainers
> not being Cc'd, such as for patch 1 of this series:
> 
> https://netdev.bots.linux.dev/static/nipa/936447/13985595/cc_maintainers/stdout

Additional maintainers added or missing?

> So, it seems running get_maintainer.pl on an email received from
> mailing lists without first stripping many of the email headers can
> lead to false K: matches.

My guess is the nipa bot should exec get_maintainer.pl with the
--nokeywords option on some pass it uses after cc's are added.

Or are you suggesting that lines that start with "to:" or "cc:"
should be ignored by the get_maintainer keyword test?

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
