Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE059361B9F
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Apr 2021 10:35:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DA35C57B78;
	Fri, 16 Apr 2021 08:35:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEF5AC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Apr 2021 08:35:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E63046117A;
 Fri, 16 Apr 2021 08:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618562145;
 bh=3fqUinZK9zKoBF4djR3n5P+LR2PK0OAFRag8ham6HF0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ELQ7Hx/RT6vhndZPrvCgO3jKinPLP8Rc3MaaJz0gMxb97SVX8SCldaQygzA5WgR9Q
 v8/E8WVkd4gpYLheYvc6RfUWI/wqrm+W3UF4SXBRAeqziZOv3lMrrR0jQSxq+Lz1pa
 p4XnQyIBCxf7JEL9jGWysRBtqqESZKKd6LD4DMBKw7hjKiQ+lC5U4C6ob+SpoImel2
 CARPpFP/IU1EiHc0APCQR2ivvGUD08Nnyb1xVa1L3rtFxeBXBEDHdOysA+JN7cwFfH
 eHlPOHSYTphO6WJJsmJJ7dP4Bu8PU4P83JR4YNncfVEaOgg7NkVdFcW+7y/n8AAFb6
 q2aIry6J8dyKg==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lXJx3-0001HE-Hr; Fri, 16 Apr 2021 10:35:45 +0200
Date: Fri, 16 Apr 2021 10:35:45 +0200
From: Johan Hovold <johan@kernel.org>
To: dillon min <dillon.minfei@gmail.com>
Message-ID: <YHlMYZCCxL+SS9ye@hovoldconsulting.com>
References: <1618219898-4600-1-git-send-email-dillon.minfei@gmail.com>
 <YHRGPpQ03XgBMkiy@hovoldconsulting.com>
 <CAL9mu0JF-9hy3Z_ytpEO+hzKh0D+f-0gYaUBEA0v28EOHpC80w@mail.gmail.com>
 <CAL9mu0Ke97FUZ03jvdH8Lz2qRnVY82B7tAEtjbhW97sPOVkAxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL9mu0Ke97FUZ03jvdH8Lz2qRnVY82B7tAEtjbhW97sPOVkAxQ@mail.gmail.com>
Cc: Gerald Baeza <gerald.baeza@foss.st.com>, kbuild-all@lists.01.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux@googlegroups.com, linux-serial@vger.kernel.org,
 jirislaby@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 kernel test robot <lkp@intel.com>
Subject: Re: [Linux-stm32] [PATCH v2] serial: stm32: optimize spin lock usage
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

On Tue, Apr 13, 2021 at 07:44:39AM +0800, dillon min wrote:
> Hi Johan, Erwan
> 
> It seems still a bit of a problem in the current version, not deadlock
> but access register at the same time.
> 
> For driver , we should consider it running under smp, let's think
> about it for this case:
> 
> static void stm32_usart_console_write(struct console *co, const char *s,
>                                       unsigned int cnt)
> {
>          .....
>          local_irq_save(flags);
>          if (port->sysrq)
>                     locked = 0;
>          .....
>          access register cr1, tdr, isr
>          .....
> 
>          local_irq_restore(flags);
> }
> 
> if port->sysrq is 1, stm32_usart_console_write() just disable local
> irq response by local_irq_save(), at the time of access register cr1,
> tdr, isr. an TXE interrupt raised, for other cores(I know stm32
> mpu/mcu do not have multi cores, just assume it has), it still has a
> chance to handle interrupt.  Then there is no lock to protect the uart
> register.

Right, the sysrq handling is a bit of a hack.

> changes to below, should be more safe:
> 
> .....
> if (port->sysrq || oops_in_progress)
>       locked = spin_trylock_irqsave(&port->lock, flags);

Except that the lock debugging code would detect the attempt at
recursive locking here and complain loudly on UP.

If you really want to fix this, we have uart_unlock_and_check_sysrq()
which can be used to defer sysrq processing until the interrupt handler
has released the lock.

> else
>       spin_lock_irqsave(&port->lock, flags);
> 
> ....
> 
> if (locked)
>      spin_unlock_irqrestore(&port->lock, flags);

Johan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
