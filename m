Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5270765FF36
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Jan 2023 11:56:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 078A5C69067;
	Fri,  6 Jan 2023 10:56:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 142E0C03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Jan 2023 10:56:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CAF6E61D9C;
 Fri,  6 Jan 2023 10:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DEDBC433D2;
 Fri,  6 Jan 2023 10:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673002584;
 bh=nbW5XajoK2QVAl0EVdOaNOkV2Y1wIBpQ9zgctDUR4Qw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gJ/A9EFgN6C5ZcWvpw+6eYLSOs5onyQmxZhit8VHS7NHySUkhhUuOm3V73dloz+/w
 vKhy3Hlg7nYn+OcBm+PqfrAS4KpLS6Ti2c8KHoFwKb1PcCtIZC8O6ECMz+uGnwXv8l
 gNWrdIa+T4G7fsmXqQiSv+rKcn0+tuq1b8VWvnPdAP0Wu2RGzhhj0LvL8Mv3yjfXpw
 aBS3/DS86W08XqhlgMK6n7mqxfAUdGQTPCpPXAmm3MHg3RD2f7A4ReO9/CEHCkMHWc
 jgGr2SJ6Jgdv5UEYjTDCCNMxEVHwJRgOQE/qWmGH1SrLV7BASJue+wUtUNUaAVZzAc
 FmO72MEp0bUBQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pDkP0-0001c3-ME; Fri, 06 Jan 2023 11:56:47 +0100
Date: Fri, 6 Jan 2023 11:56:46 +0100
From: Johan Hovold <johan@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <Y7f+birb2KpTygxI@hovoldconsulting.com>
References: <20221216115338.7150-1-marex@denx.de>
 <Y6sHr5kuxUoahlzJ@hovoldconsulting.com>
 <a66988fd-af44-63cd-e962-47ffa6205a6a@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a66988fd-af44-63cd-e962-47ffa6205a6a@denx.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-serial@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] serial: stm32: Merge hard IRQ and
 threaded IRQ handling into single IRQ handler
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

On Thu, Jan 05, 2023 at 09:46:57PM +0100, Marek Vasut wrote:
> On 12/27/22 15:56, Johan Hovold wrote:
> 
> [...]
> 
> >> @@ -793,27 +794,13 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
> >>   	}
> >>   
> >>   	if ((sr & USART_SR_TXE) && !(stm32_port->tx_ch)) {
> >> -		spin_lock(&port->lock);
> >> +		spin_lock_irqsave(&port->lock, flags);
> >>   		stm32_usart_transmit_chars(port);
> >> -		spin_unlock(&port->lock);
> >> +		spin_unlock_irqrestore(&port->lock, flags);
> > 
> > This is not needed as the handler runs with interrupts disabled.
> 
> On SMP system, another thread on another core can call 
> stm32_usart_transmit_chars() . I don't think removing the locking is 
> correct ?

I didn't say that you should remove the locking, which is very much
needed. There's just no need to disable interrupts in a (non-threaded)
interrupt handler as that has already been done by IRQ core (and, yes,
that is also the case with forced threading).

Johan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
