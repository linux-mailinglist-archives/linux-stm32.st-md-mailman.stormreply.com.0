Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 599E6667C37
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jan 2023 18:09:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01EB7C65E45;
	Thu, 12 Jan 2023 17:09:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11FA9C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 17:09:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D9867620DD;
 Thu, 12 Jan 2023 17:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408A0C433D2;
 Thu, 12 Jan 2023 17:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673543376;
 bh=9xQ33Eh9z3TFCKCJ2CPzPxhtL7agkZ3pnyzzji0v8uU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=raTAz9plym1EoPh2G4jyDAgi/7oIHZyRxhNVsLREvxf+ASINg+53X+KwQoziit//s
 j/fiE/SVBWGZrfPEDbC7E0AXZMWAMbCvUoDjk5SuFP4+f6CAAHE8e3sFNJ9KjD44/q
 uWzZWm4p2CBFWk14zoytfpNfJA+4Gun5vOtomN6TJcG5V0Xz3j0k8QbyjJHPd7No73
 nBRgJxTEvdoF3j/rnXVtMpq5jIprr/LQydDlU3Pn9XDOY+fAnHbmytgDWVh9X/mcy4
 i/O46W4tDoAasbVjYLM7EW5j56y+KgqyxIzU7mp8+0rT70pW6Wtr2szkrYFA/vSdSO
 XGMB0WpTe0Xrg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pG15D-0004aa-Aw; Thu, 12 Jan 2023 18:09:44 +0100
Date: Thu, 12 Jan 2023 18:09:43 +0100
From: Johan Hovold <johan@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <Y8A+1wUUNCU+3Kry@hovoldconsulting.com>
References: <20221216115338.7150-1-marex@denx.de>
 <Y6sHr5kuxUoahlzJ@hovoldconsulting.com>
 <Y7vou3wAeLP4X+TY@linutronix.de>
 <Y8AHaJIttNga68q4@hovoldconsulting.com>
 <78e3f61f-4f87-9ac5-7c7c-172714da69d3@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78e3f61f-4f87-9ac5-7c7c-172714da69d3@denx.de>
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

On Thu, Jan 12, 2023 at 05:38:48PM +0100, Marek Vasut wrote:
> On 1/12/23 14:13, Johan Hovold wrote:
  
> > The author did not seem to think this was stable material as there is no
> > cc-stable tag and it also seems fairly intrusive.
> 
> The author does not have enough experience with preempt-rt to make that 
> determination, hence deferred to Sebastian for better judgement.

Fair enough. And it's not obvious that the stable team should backport
patches that only concern PREEMPT_RT either (e.g. as parts of it are
still out-of-tree).

The stable tag is still missing from the final revision though.

> > But if the ST guys or whoever cares about this driver are fine with this
> > being backported, I don't really mind either.

Johan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
