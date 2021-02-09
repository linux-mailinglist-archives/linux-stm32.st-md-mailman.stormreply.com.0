Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99778314E0B
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Feb 2021 12:16:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51CC5C57B54;
	Tue,  9 Feb 2021 11:16:14 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54629C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 11:16:11 +0000 (UTC)
Date: Tue, 9 Feb 2021 14:16:09 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20210209111609.tjxoqr6stkcf22jy@mobilestation>
References: <20210208140820.10410-1-Sergey.Semin@baikalelectronics.ru>
 <YCGSwZnSXIz5Ssef@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCGSwZnSXIz5Ssef@lunn.ch>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>, Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Subject: Re: [Linux-stm32] [PATCH 00/16] net: stmmac: Add DW MAC GPIOs and
 Baikal-T1 GMAC support
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

On Mon, Feb 08, 2021 at 08:36:33PM +0100, Andrew Lunn wrote:
> On Mon, Feb 08, 2021 at 05:08:04PM +0300, Serge Semin wrote:
> 
> Hi Serge
> 
> I suggest you split this patchset up. This uses the generic GPIO
> framework, which is great. But that also means you should be Cc: the
> GPIO subsystem maintainers and list. But you don't want to spam them
> with all the preparation work, which has little to do with the GPIO
> code.
> 
> So please split the actual GPIO driver and DT binding patches from the
> rest. netdev can review the preparation work, with a comment in the
> 0/X patch about what the big picture is, and then afterwards review
> the GPIO patchset with a wider audience.
> 
> And as Jakub pointed out, nobody is going to review 60 patches all at
> once. Please submit one series at a time, get it merged, and then
> move onto the next.

Hello Andrew
Right, with all that preparation work I've forgotten to Cc the
GPIO-subsystem maintainers. Thanks for noticing this.

Regarding the 60-patches. Please see my response to Jakub' post in the
first series. To cut it short let's start working with that patchset:
Link: https://lore.kernel.org/netdev/20210208135609.7685-1-Sergey.Semin@baikalelectronics.ru/
I'll rebase and resubmit the rest of the work when the time comes.

Regarding splitting the series up. I don't see a problem in just
sending the cover-letter patch and actual GPIO-related patches to
the GPIO-maintainers with no need to have them added to Cc in the rest
of the series. That's a normal practice. Splitting is not really
required. But since I have to split the very first patchset anyway.
I'll split this one up too, when it comes to have this part of changes
reviewed.

-Sergey

> 
> 	 Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
