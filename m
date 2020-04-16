Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ECD1ACED1
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2020 19:37:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DEBDC36B0C;
	Thu, 16 Apr 2020 17:37:25 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 956D3C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 17:37:23 +0000 (UTC)
Received: from Mani-XPS-13-9360 (unknown [157.50.106.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D183A2076D;
 Thu, 16 Apr 2020 17:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587058642;
 bh=c6RjcLo9mHi0Qj+iI/ymrQ+8S7krFiwa/crVExYtMzc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MPW/w2Hfnyk6tUbCwgA+epGBp7s9x8qUWJj1HiCBq+J9LTkOTM2QYZTP/j5uo/wrm
 Zu7E5RQleCiRVXkZUgTILmP6u9Q5+x1hOTZEgCwX8xxgd1Ay9ngjsrcfWax9ah1H31
 eWIhS2p6dEJvzP9lw8E2V62BIIK92l1CFStWvCOY=
Date: Thu, 16 Apr 2020 23:07:10 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <20200416173710.GA4548@Mani-XPS-13-9360>
References: <20200412180923.30774-1-mani@kernel.org>
 <CAHp75VfDUoFMWg42OFHZtKQ972eoR3UDLVAs+BQjJm3h3-fOGw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VfDUoFMWg42OFHZtKQ972eoR3UDLVAs+BQjJm3h3-fOGw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 0/2] Add software flow control support for
	STM32 UART
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

Hi Andy,

On Mon, Apr 13, 2020 at 12:17:21PM +0300, Andy Shevchenko wrote:
> On Mon, Apr 13, 2020 at 7:06 AM <mani@kernel.org> wrote:
> >
> > From: Manivannan Sadhasivam <mani@kernel.org>
> >
> > Hello,
> >
> > This patchset adds software flow control support for STM32 UART controller.
> > This is necessary for the upcoming STM32MP1 based board called Stinger96
> > IoT-Box. On that board, a bluetooth chip is connected to one of the UART
> > controller but the CTS/RTS lines got swapped mistakenly. So in order to
> > workaround that hardware bug and also to support the usecase of using only
> > Tx/Rx pins, this patchset adds software flow control support.
> >
> > This patchset has been validated w/ Stinger96 IoT-Box connected to Murata
> > WiFi-BT combo chip.
> >
> 
> I think it's a mix of terminology or so. Looking into the patches I
> found that it's required to have GPIOs for SW flow control.
> No, SW flow control does not require any additional signals, except RxD/TxD.
> 

Yikes. Yes I got it wrong. 'st,hw-flow-ctrl' property confused me :)

> On top of that, it seems you adding mctrl-gpio functionality. Why
> can't you use that one? And thus no bindings needs to be updated.
> 

Sure. This looks feasible. Will submit a follow up patch.

Thanks,
Mani

> > Thanks,
> > Mani
> >
> > Manivannan Sadhasivam (2):
> >   dt-bindings: serial: Add binding for software flow control in STM32
> >     UART
> >   tty: serial: Add software flow control support for STM32 USART
> >
> >  .../bindings/serial/st,stm32-uart.yaml        |  15 +-
> >  drivers/tty/serial/stm32-usart.c              | 143 +++++++++++++++++-
> >  drivers/tty/serial/stm32-usart.h              |   4 +
> >  3 files changed, 155 insertions(+), 7 deletions(-)
> >
> > --
> > 2.17.1
> >
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
