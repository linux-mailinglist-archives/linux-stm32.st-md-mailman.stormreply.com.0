Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 260576460C4
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Dec 2022 18:54:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF205C65067;
	Wed,  7 Dec 2022 17:54:34 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 260EEC01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 17:54:33 +0000 (UTC)
Date: Wed, 7 Dec 2022 18:54:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1670435672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Qv+ToYWMo1dpqX5Z3uNmjhGCpXG5eWmQjyf4rytM80=;
 b=0PifV1sZ0qCan2d2TFr/K09Me1sEUHnW1V18jvWZRuJWu6RKyKQgqtKiRUs95CGDPxzH8W
 XleXwQ/Q2AjbruQvsGUhMaM98/Q+bzIGjSLE51j86xknnmTaOMgsh7M3M65GHa7yt9EneA
 M1p+fDJaG2CNf4Bp/szqKiqzx52bXM/fNhp8Jpzg7nVL5ZmcESinD61bvjRhBnkjLTFgDr
 M3s1eFpKcxWph1kB4WBoEaSqtcgTLHlOj0N6g6GGCYhNr+ER8FvGIMORMeIKWr+OBqyEA1
 HFX4S8uAuDrY1rZ/NX5gJDUsZbcSqgkfZ/1JXaa/QamWv5aXMRpNxDsOdNqn2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1670435672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Qv+ToYWMo1dpqX5Z3uNmjhGCpXG5eWmQjyf4rytM80=;
 b=/C2bNXvqXQTbAxGq877O2kXHJrvR7D0LEDcuLnYdhKumhWcIQUmmW4BbBGDq4+Ghtf+ytm
 c8af9oRvnvlcepBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marek Vasut <marex@denx.de>
Message-ID: <Y5DTVqo/YC5friOo@linutronix.de>
References: <20221207013012.395585-1-marex@denx.de>
 <Y5BLvE/2RTJsUVms@linutronix.de>
 <d69c213f-c447-63ad-fbea-b77df11f503a@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d69c213f-c447-63ad-fbea-b77df11f503a@denx.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-stm32@st-md-mailman.stormreply.com, johan@kernel.org,
 linux-serial@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>,
 Jean Philippe Romain <jean-philippe.romain@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] [RFC] serial: stm32: Move
 stm32_usart_transmit_chars() to interrupt thread
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

On 2022-12-07 17:55:42 [+0100], Marek Vasut wrote:
> 
> Is the suggestion therefore to completely remove the hard IRQ handler and
> move everything into the threaded IRQ handler ?

Commit
	3489187204eb7 ("serial: stm32: adding dma support")

added the threaded mode with DMA support. It didn't say _why_ this is
needed. So I would suggest to use request_irq() and merge the two
handler. The part where it ignores the IRQ handler in the
"stm32_port->throttled" case isn't nice since it returns IRQ_HANDLED
while doing nothing.

> Are there any drawbacks of doing that to a serial port driver ?
The threaded handler runs with disabled interrupts (due to irq-save
lock) so there shouldn't be any visible difference other than the thread
is gone. I'm not sure what the benefit here actually is.
With `threadirqs' and so on PREEMPT_RT the whole routine will be moved
in the thread (as it should).

Looking at drivers/tty/serial/, the stm32-usart is the only one
requesting threaded-interrupts with a primary handler. So I guess it was
not needed to begin with.

Sebastian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
