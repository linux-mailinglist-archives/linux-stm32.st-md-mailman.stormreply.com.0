Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A56764F704
	for <lists+linux-stm32@lfdr.de>; Sat, 17 Dec 2022 03:28:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DD18C65049;
	Sat, 17 Dec 2022 02:28:56 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0592EC6411C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Dec 2022 02:28:54 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 83CA384E8F;
 Sat, 17 Dec 2022 03:28:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1671244134;
 bh=Vx8cqL+nZJ2mCHK55sgVTq9WnS2+/3Lbg32HIFjo55A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Q0tf4VqSMJZYG+bJv0j/WjHQduXefOJoD+fb1CkqPWtDtzBelW0bD236j7zL28InQ
 hrEEoIfSV08NAl/wtBgyjcl7M55aQ5Y1cQ+jdwucb1e4GEhiiQiOW+d7gihibSMW1r
 mrcZXvK9rek5aLIAi/tLatRYOmZSX617ioUowLkrL1wjCvf+w5l0n2+UdVtwUVrdIq
 FjoA0O+DL2FCwLy7zpkZrs8HGLX1d/EM2cu6ooc8SFtvHX13Zjbglg5anzpPWHDWBG
 lIgaIB5D6PKGrweGOsSARbhJgE7lg+6wFGnV/TA5mJ21uchC9K4IF7NdlvIgzORX51
 QBv7pkJB0HmRA==
Message-ID: <a8a3caa2-4be6-c672-8607-7c8795e5f583@denx.de>
Date: Sat, 17 Dec 2022 03:28:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <20221216021504.457699-1-marex@denx.de>
 <Y5wljLfx4bj1R9kl@linutronix.de>
 <7eba06d4-4ea1-0a15-2bb0-a1837f342a34@denx.de>
 <Y5yfhkO4NAdxrxf6@linutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Y5yfhkO4NAdxrxf6@linutronix.de>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] serial: stm32: Merge hard IRQ and
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 12/16/22 17:40, Sebastian Andrzej Siewior wrote:
> On 2022-12-16 12:52:43 [+0100], Marek Vasut wrote:
>>> Also it might be worth checking if the DMA mode makes any sense if the
>>> FIFO is so small.
>>
>> If you want to push a lot of data through the UART without refilling the
>> small FIFO all the time and getting a lot of IRQs, that's where the DMA
>> comes in. Maybe I misunderstood this comment ?
> 
> I have no idea how this works in detail. However: if you FIFO which is
> 16 bytes deep then filling it means 16 writes and so one interrupt every
> 16 bytes. If the DMA engine is the "average slave dma support" then it
> gets programmed to fill 16 bytes and then issues an interrupt again. The
> "lucky" case if you can program say 512 bytes (or so) and the DMA
> engines itself is able to fill the FIFO 32 times without involving the
> CPU. The last case is clear win.

Ah, no, on the STM32 the DMA should be capable of streaming arbitrary 
amount of data from DRAM to the UART FIFO if needed I think.

> If you have the 16 bytes-DMA case then you would have to check what is
> cheaper: programming the DMA engine for 16 bytes or stuffing it directly
> into the FIFO.
> If the DMA engine supports the larger case say 512 and refills the FIFO
> on its own, then using it makes sense. However this makes usually sense
> for larger transfers. Having a console on it usually leads to more
> overhead because you receive usually say two bytes a second (unless you
> are a fast typer). Sending depends on the usecase and the peak is
> usually during boot. People doing BT via UART usually want to use DMA
> because of the insane amount of data, that is pumped.

Yes, I think we are in agreement here. The terse version was just a bit 
too terse. Thanks
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
