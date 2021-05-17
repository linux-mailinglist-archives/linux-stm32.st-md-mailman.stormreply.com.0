Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AB3382C05
	for <lists+linux-stm32@lfdr.de>; Mon, 17 May 2021 14:24:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FEC9C57B75;
	Mon, 17 May 2021 12:24:24 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE4F3C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 May 2021 12:24:22 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3E0911F4202E;
 Mon, 17 May 2021 13:24:22 +0100 (BST)
Date: Mon, 17 May 2021 14:24:18 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <20210517142418.7689c01f@collabora.com>
In-Reply-To: <21717dd0-86a7-b3d9-952e-5c7539f90bee@foss.st.com>
References: <20210507131756.17028-1-patrice.chotard@foss.st.com>
 <20210507131756.17028-2-patrice.chotard@foss.st.com>
 <20210517094140.53cb643a@collabora.com>
 <e70b13ba-7f65-7ff1-0517-94b39615dcdb@foss.st.com>
 <20210517132551.7dd56a5e@collabora.com>
 <21717dd0-86a7-b3d9-952e-5c7539f90bee@foss.st.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] spi: spi-mem: add automatic poll
 status functions
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

On Mon, 17 May 2021 13:59:54 +0200
Patrice CHOTARD <patrice.chotard@foss.st.com> wrote:

> Hi 
> 
> On 5/17/21 1:25 PM, Boris Brezillon wrote:
> > On Mon, 17 May 2021 11:24:25 +0200
> > Patrice CHOTARD <patrice.chotard@foss.st.com> wrote:
> >   
> >> Hi Boris
> >>
> >> On 5/17/21 9:41 AM, Boris Brezillon wrote:  
> >>> On Fri, 7 May 2021 15:17:54 +0200
> >>> <patrice.chotard@foss.st.com> wrote:
> >>>     
> >>>> +/**
> >>>> + * spi_mem_poll_status() - Poll memory device status
> >>>> + * @mem: SPI memory device
> >>>> + * @op: the memory operation to execute
> >>>> + * @mask: status bitmask to ckeck
> >>>> + * @match: (status & mask) expected value
> >>>> + * @timeout_ms: timeout in milliseconds
> >>>> + *
> >>>> + * This function send a polling status request to the controller driver
> >>>> + *
> >>>> + * Return: 0 in case of success, -ETIMEDOUT in case of error,
> >>>> + *         -EOPNOTSUPP if not supported.
> >>>> + */
> >>>> +int spi_mem_poll_status(struct spi_mem *mem,
> >>>> +			const struct spi_mem_op *op,
> >>>> +			u16 mask, u16 match, u16 timeout_ms)    
> >>>
> >>> Maybe you should pass a delay_us too, to poll the status at the right
> >>> rate in the SW-based case (can also be used by drivers if they need to    
> >>
> >> Ok, i will add a polling_rate_us parameter to poll_status() callback,
> >> even if in STM32 driver case we will not use it, i agree it should be useful 
> >> depending of driver's implementation.
> >>  
> >>> configure the polling rate). You could also add an initial_delay_us to
> >>> avoid polling the status too early: an erase operation will take longer
> >>> than a write which will take longer than a read. No need to check the
> >>> status just after issuing the command, especially if the polling is
> >>> done in SW. Those 2 arguments should also be passed to the driver.    
> >>
> >> Regarding the addition of an initial_delay_us. We got two solution:
> >>   - use the same polling rate already used by read_poll_timeout() and 
> >>     set read_poll_timeout()'s sleep_before_read parameter to true (in our case 20 us
> >>     will be used as initial delay and as polling rate).
> >>
> >>   - add an udelay(initial_delay_us) or even better usleep_range(initial_delay_us,
> >>     initial_delay_us + delta) before calling read_poll_timeout().
> >>
> >> I imagine you prefer the second solution ?  
> > 
> > Yep, you might want to use udelay() when the delay is small and
> > usleep_range() otherwise.
> >   
> >>
> >> By adding polling_rate_us and initial_delay_us parameters to 
> >> spi_mem_poll_status(), it implies to update all spinand_wait() calls for 
> >> different operations (reset, read page, write page, erase) with respective  
> >> initial_delay_us/polling_rate_us values for spi_mem_poll_status()'s parameters.
> >>
> >> Can you provide adequate initial_delay_us and polling rate_us for each operation type ?.  
> > 
> > If I refer to the datasheets I have,
> > 
> > tBERS (erase) 1ms to 4ms
> > tPROG 300us to 400us
> > tREAD 25us to 100us
> > 
> > Let's assume we want to minimize the latency, I'd recommend dividing
> > the min value by 4 for the initial delay, and dividing it by 20 for the
> > poll delay, which gives:
> > 
> > ERASE -> initial_delay = 250us, poll_delay = 50us
> > PROG -> initial_delay = 100us, poll_delay = 20us
> > READ -> initial_delay = 6us, poll_delay = 5us  
> 
> 
> What about RESET ? we also need an initial and poll delay too (see spinand_reset_op() )

5us/10us/500us if the device is respectively
reading/programming/erasing when the RESET occurs. Since we always
issue a RESET when the device is IDLE, I'd recommend going for 5us for
both the initial_delay and poll_delay.

> 
> > 
> > Of course, that'd be even better if we were able to extract this
> > information from the NAND ID (or ONFI table), but I guess we can live
> > with those optimistic values in the meantime.
> >   
> 
> Thanks
> Patrice

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
