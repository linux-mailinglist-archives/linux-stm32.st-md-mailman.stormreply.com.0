Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4422D242F
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Dec 2020 08:19:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E62B3C3FADC;
	Tue,  8 Dec 2020 07:19:07 +0000 (UTC)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AF91C3FAD8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Dec 2020 10:33:17 +0000 (UTC)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1kmDpT-00058D-00; Mon, 07 Dec 2020 11:33:15 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id A2790C02EA; Mon,  7 Dec 2020 11:32:21 +0100 (CET)
Date: Mon, 7 Dec 2020 11:32:21 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Alexander Dahl <post@lespocky.de>
Message-ID: <20201207103221.GA15686@alpha.franken.de>
References: <20201128215353.3991-1-post@lespocky.de>
 <20201128215353.3991-6-post@lespocky.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201128215353.3991-6-post@lespocky.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 08 Dec 2020 07:19:04 +0000
Cc: devicetree@vger.kernel.org, James Hartley <james.hartley@sondrel.com>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v8 5/5] MIPS: DTS: img: Fix schema
	warnings for pwm-leds
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

On Sat, Nov 28, 2020 at 10:53:53PM +0100, Alexander Dahl wrote:
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
> 
> Notes:
>     v7 -> v8:
>       * rebased on v5.10-rc1
>     
>     v6 -> v7:
>       * added another explaining sentence to commit message
>     
>     v6:
>       * added this patch to series
> 
>  arch/mips/boot/dts/img/pistachio_marduk.dts | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
