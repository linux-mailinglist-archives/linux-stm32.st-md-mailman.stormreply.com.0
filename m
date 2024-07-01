Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EAE91D859
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2024 08:56:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49A47C6DD9A;
	Mon,  1 Jul 2024 06:56:15 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1658C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jul 2024 06:56:07 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1sOAx0-0003Yo-FR; Mon, 01 Jul 2024 08:55:46 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ore@pengutronix.de>)
 id 1sOAww-006JJB-6n; Mon, 01 Jul 2024 08:55:42 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1sOAww-008Jk4-0K;
 Mon, 01 Jul 2024 08:55:42 +0200
Date: Mon, 1 Jul 2024 08:55:42 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <ZoJS7hAdf36ezyUn@pengutronix.de>
References: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
 <Zn6HMrYG2b7epUxT@pengutronix.de>
 <20240628-awesome-discerning-bear-1621f9-mkl@pengutronix.de>
 <9e6b5cff-8692-484e-9e1c-b89a1f49d6c7@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e6b5cff-8692-484e-9e1c-b89a1f49d6c7@baylibre.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 Julien Stephan <jstephan@baylibre.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, T.Scherer@eckelmann.de,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Martin Sperl <kernel@martin.sperl.org>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/5] spi: add support for pre-cooking
	messages
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

On Fri, Jun 28, 2024 at 10:27:28AM -0500, David Lechner wrote:
> On 6/28/24 5:16 AM, Marc Kleine-Budde wrote:
> > On 28.06.2024 11:49:38, Oleksij Rempel wrote:
> >> It seems to be spi_mux specific. We have seen similar trace on other system
> >> with spi_mux.
> > 
> > Here is the other backtrace from another imx8mp system with a completely
> > different workload. Both have in common that they use a spi_mux on the
> > spi-imx driver.
> > 
> > Unable to handle kernel NULL pointer dereference at virtual address 0000000000000dd0
> > Mem abort info:
> >   ESR = 0x0000000096000004
> >   EC = 0x25: DABT (current EL), IL = 32 bits
> >   SET = 0, FnV = 0
> >   EA = 0, S1PTW = 0
> >   FSC = 0x04: level 0 translation fault
> > Data abort info:
> >   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> >   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> >   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> > user pgtable: 4k pages, 48-bit VAs, pgdp=0000000046760000
> > [0000000000000dd0] pgd=0000000000000000, p4d=0000000000000000
> > Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> > Modules linked in: can_raw can ti_ads7950 industrialio_triggered_buffer kfifo_buf spi_mux fsl_imx8_ddr_perf at24 flexcan caam can_dev error rtc_snvs imx8mm_thermal spi_imx capture_events_irq cfg80211 iio_trig_hrtimer industrialio_sw_trigger ind>
> > CPU: 3 PID: 177 Comm: spi5 Not tainted 6.9.0 #1
> > Hardware name: xxxxxxxxxxxxxxxx (xxxxxxxxx) (DT)
> > pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > pc : spi_res_release+0x24/0xb8
> > lr : spi_async+0xac/0x118
> > sp : ffff8000823fbcc0
> > x29: ffff8000823fbcc0 x28: 0000000000000000 x27: 0000000000000000
> > x26: ffff8000807bef88 x25: ffff80008115c008 x24: 0000000000000000
> > x23: ffff8000826c3938 x22: 0000000000000000 x21: ffff0000076a9800
> > x20: 0000000000000000 x19: 0000000000000dc8 x18: 0000000000000000
> > x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffff88c0e760
> > x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> > x11: ffff8000815a1f98 x10: ffff8000823fbb40 x9 : ffff8000807b8420
> > x8 : ffff800081508000 x7 : 0000000000000004 x6 : 0000000003ce4c66
> > x5 : 0000000001000000 x4 : 0000000000000000 x3 : 0000000001000000
> > x2 : 0000000000000000 x1 : ffff8000826c38e0 x0 : ffff0000076a9800
> > Call trace:
> >  spi_res_release+0x24/0xb8
> >  spi_async+0xac/0x118
> >  spi_mux_transfer_one_message+0xb8/0xf0 [spi_mux]
> >  __spi_pump_transfer_message+0x260/0x5d8
> >  __spi_pump_messages+0xdc/0x320
> >  spi_pump_messages+0x20/0x38
> >  kthread_worker_fn+0xdc/0x220
> >  kthread+0x118/0x128
> >  ret_from_fork+0x10/0x20
> > Code: a90153f3 a90363f7 91016037 f9403033 (f9400674) 
> > ---[ end trace 0000000000000000 ]---
> > 
> > regards,
> > Marc
> > 
> 
> 
> Hi Oleksij and Marc,
> 
> I'm supposed to be on vacation so I didn't look into this deeply yet
> but I can see what is happening here.
> 
> spi_mux_transfer_one_message() is calling spi_async() which is calling
> __spi_optimize_message() on an already optimized message.
> 
> Then it also calls __spi_unoptimize_message() which tries to release
> resources. But this fails because the spi-mux driver has swapped
> out the pointer to the device in the SPI message. This causes the
> wrong ctlr to be passed to spi_res_release(), causing the crash.
> 
> I don't know if a proper fix could be quite so simple, but here is
> something you could try (untested):

This issue is still reproducible with following trace:
[   19.566433] Call trace:
[   19.568882]  spi_async+0x90/0x118
[   19.572204]  spi_mux_transfer_one_message+0xd4/0x110
[   19.577175]  __spi_pump_transfer_message+0x2bc/0x6e8
[   19.582149]  __spi_pump_messages+0xe0/0x228
[   19.586339]  spi_pump_messages+0x20/0x38
[   19.590271]  kthread_worker_fn+0xe0/0x2e8
[   19.594286]  kthread+0x10c/0x120
[   19.597518]  ret_from_fork+0x10/0x20

addr2line for spi_async+0x90/0x118 -> drivers/spi/spi.c:2136
  2132 static void __spi_unoptimize_message(struct spi_message *msg)         
  2133 {                                                                     
  2134         struct spi_controller *ctlr = msg->spi->controller;
  2135
  2136         if (ctlr->unoptimize_message)
  2137                ctlr->unoptimize_message(msg);
  2138
  2139         spi_res_release(ctlr, msg);                                   
  2140
  2141         msg->optimized = false;
  2142         msg->opt_state = NULL;
  2143 }

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
