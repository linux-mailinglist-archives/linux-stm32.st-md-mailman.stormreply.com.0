Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A995A5F7D
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Aug 2022 11:34:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D6DFC5EC6B;
	Tue, 30 Aug 2022 09:34:12 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0F01C03FD4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 09:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661852049; x=1693388049;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=BZlFP+2gMdlipVyXYzNcamg3THGOdoHRiZzKamrAIYY=;
 b=jv4SkrtHGqLF3daSd5ScPRGXlLOmFID8C67JL5Dq6R2917xRNKoX/73/
 Zg9aUSPe0w5uaBjttG7HD2aceWPWvOIquszKvLqSIjt/eg2H1NLh9EhRU
 hXhQIf3GjFI0rhDaUe0pF3sYoQMB8h6b0gPOMI8ppLWlaD594+u3vzI+E
 ndXCKKg1sgOzb/CJo2aXAtDsKxXHDjQsLrVwuvbcvGpOlfOny+oqD0VOK
 HLONp+Pyo6gglZl+mNdRZbaS7gMNhcVQGhc/FsxR1kMa92V8xCwY1gDYR
 HTSr5T6xIOzpgWNtTXDEZ/ErOcpqiaV9P8qnujoA/4h2ESNYrNCQbKGVc w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="274879183"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="274879183"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 02:34:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="588532455"
Received: from arnesgom-mobl.ger.corp.intel.com ([10.252.54.235])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 02:34:01 -0700
Date: Tue, 30 Aug 2022 12:34:00 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <Yw3PHg0imhJyb9sf@kroah.com>
Message-ID: <31865b7-22f3-c07b-c934-83b44269eb3@linux.intel.com>
References: <20220830072956.3630-1-ilpo.jarvinen@linux.intel.com>
 <20220830072956.3630-5-ilpo.jarvinen@linux.intel.com>
 <Yw3PHg0imhJyb9sf@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-437881220-1661852048=:1864"
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Corbet <corbet@lwn.net>, Jiri Slaby <jirislaby@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 linux-serial <linux-serial@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Richard Genoud <richard.genoud@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v2 4/4] serial: Add kserial_rs485 to avoid
 wasted space due to .padding
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
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-437881220-1661852048=:1864
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

On Tue, 30 Aug 2022, Greg Kroah-Hartman wrote:

> On Tue, Aug 30, 2022 at 10:29:56AM +0300, Ilpo Järvinen wrote:
> > The struct serial_rs485 has a .padding field to make uapi updates
> > easier. It wastes space, however. Create struct kserial_rs485 which is
> > a kerner counterpart w/o padding.
> 
> "kernel"?
> 
> And what is the size difference now?

Roughly 16B of padding is eliminated. That saving is then multiplied by 
the times it appears in in-kernel structs (2x per uart_port, 1x per rs485 
supporting driver). As said in my other reply, if you feel it's too 
little gained by eliminating the padding, I can drop this patch, just let 
me know.

> > +/**
> > + * struct kserial_rs485 - kernel-side struct for controlling RS485 settings.
> > + * @flags:			RS485 feature flags
> > + * @delay_rts_before_send:	Delay before send (milliseconds)
> > + * @delay_rts_after_send:	Delay after send (milliseconds)
> > + * @addr_recv:			Receive filter for RS485 addressing mode
> > + *				(used only when %SER_RS485_ADDR_RECV is set).
> > + * @addr_dest:			Destination address for RS485 addressing mode
> > + *				(used only when %SER_RS485_ADDR_DEST is set).
> > + *
> > + * Must match with struct serial_rs485 in include/uapi/linux/serial.h excluding
> > + * the padding.
> 
> Why must this match?

Because serial_rs485_from_user() and serial_rs485_to_user() just copy 
things over from one struct type to another w/o considering the fields 
individually. If that's not acceptable, I could make it copy field by 
field but it didn't feel necessary to allow "real" fields to differ to 
achieve padding elimination...

> And how is that going to be enforced?

With static_assert()s in serial_core.c. I'll add a note about that into 
the comment.

> > + */
> > +struct kserial_rs485 {
> > +	__u32	flags;
> > +	__u32	delay_rts_before_send;
> > +	__u32	delay_rts_after_send;
> > +	struct {
> > +		__u8    addr_recv;
> > +		__u8    addr_dest;
> > +	};
> 
> As this is an in-kernel structure, this should be "u32" and "u8" now.

Right, I'll change those.

-- 
 i.

--8323329-437881220-1661852048=:1864
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--8323329-437881220-1661852048=:1864--
