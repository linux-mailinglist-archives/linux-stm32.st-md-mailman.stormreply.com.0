Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DB8320AAC
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Feb 2021 14:51:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB245C57191;
	Sun, 21 Feb 2021 13:51:46 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B3E0C5718A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Feb 2021 13:51:45 +0000 (UTC)
Date: Sun, 21 Feb 2021 16:51:32 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <20210221135132.5uaogtn7h3gd4inr@mobilestation>
References: <20210208140341.9271-2-Sergey.Semin@baikalelectronics.ru>
 <8300d9ca-b877-860f-a975-731d6d3a93a5@gmail.com>
 <20210209101528.3lf47ouaedfgq74n@mobilestation>
 <a652c69b-94d3-9dc6-c529-1ebc0ed407ac@gmail.com>
 <20210209105646.GP1463@shell.armlinux.org.uk>
 <20210210164720.migzigazyqsuxwc6@mobilestation>
 <20210211103941.GW1463@shell.armlinux.org.uk>
 <20210220090248.oiyonlfucvmgzw6d@mobilestation>
 <4dcecf82-f222-4957-f5fc-e8f9d073599c@gmail.com>
 <YDEvglPLbUcNp0dR@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YDEvglPLbUcNp0dR@lunn.ch>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/20] net: phy: realtek: Fix events
 detection failure in LPI mode
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

On Sat, Feb 20, 2021 at 04:49:22PM +0100, Andrew Lunn wrote:
> > If in doubt, leaving the patch as is would be fine with me.
> 
> The patch is O.K. as is, no need to export something so simple for a
> single users. When the next user come along, we can reconsider.

Ok. Thanks for clarification. I performed some additional tests to
make sure the bug was on the PHY side. They proved my original
conclusion. It's indeed Realtek PHY to blame for the weird behavior. 
So I've added a few more words into the patch log regarding those
tests. The patch will be resent tomorrow together with the rest of the
STMMAC-driver-related bug-fixes detached from the original series of
the fixes and cleanups (as Andrew asked to do).

-Sergey

> 
>        Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
