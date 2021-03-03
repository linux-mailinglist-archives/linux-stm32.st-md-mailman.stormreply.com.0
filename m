Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7E432BA38
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 20:31:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 792BEC57B64;
	Wed,  3 Mar 2021 19:31:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 091B5C56634
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 19:31:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF24B64ED0;
 Wed,  3 Mar 2021 19:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614799865;
 bh=h5FCaQLoCU1eLgBpB+1GspxLjjVwOPWrvQkt3lDgAUc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cEcgKJCSdq6xUFXNdC95YSgTC/uiJvkG0L6ZhxyQLlM/j4QKJH5PJyf053oXS82dR
 ebHF+Cr1XG27xFKZ+8MVrHy5b8t5zi7N+7vB3QzJ0/++vdoMaNBGT+W/z4WikA1PNZ
 +j3arvkQC+NwTQecUli9YcrdLDUear4lgJWqluqU=
Date: Wed, 3 Mar 2021 20:31:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Erwan Le Ray <erwan.leray@foss.st.com>
Message-ID: <YD/j9jhkcVbN3zs0@kroah.com>
References: <20210219174736.1022-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210219174736.1022-1-erwan.leray@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/13] stm32 usart various fixes
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

On Fri, Feb 19, 2021 at 06:47:23PM +0100, Erwan Le Ray wrote:
> This series brings various fixes to stm32-usart driver.
> 
> Erwan Le Ray (13):
>   serial: stm32: fix probe and remove order for dma
>   serial: stm32: fix startup by enabling usart for reception
>   serial: stm32: fix incorrect characters on console
>   serial: stm32: fix TX and RX FIFO thresholds
>   serial: stm32: fix a deadlock condition with wakeup event
>   serial: stm32: fix wake-up flag handling
>   serial: stm32: fix a deadlock in set_termios
>   serial: stm32: fix tx dma completion, release channel
>   serial: stm32: call stm32_transmit_chars locked
>   serial: stm32: fix FIFO flush in startup and set_termios
>   serial: stm32: add FIFO flush when port is closed
>   serial: stm32: fix tx_empty condition
>   serial: stm32: add support for "flush_buffer" ops
> 
>  drivers/tty/serial/stm32-usart.c | 198 +++++++++++++++++++++----------
>  drivers/tty/serial/stm32-usart.h |   3 -
>  2 files changed, 135 insertions(+), 66 deletions(-)

This series does not apply cleanly to my tree.  Can you rebase it
against 5.12-rc1 and resend?

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
