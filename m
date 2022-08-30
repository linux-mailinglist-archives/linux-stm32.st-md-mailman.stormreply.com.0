Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D8D5A6077
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Aug 2022 12:14:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3381EC5EC6B;
	Tue, 30 Aug 2022 10:14:38 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23958C03FD4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 10:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661854476; x=1693390476;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=UgNERPcJtkcZ6uHTT9C3QVaF5md5rEDPHJWxiZf1opY=;
 b=IrkxTkxFoHVLqCTKIaRUi9Y9oPtxChd9F7CJWlVcC9K3O6622DGTtk+a
 nWZ1Fwb7JvTdDn7Okn/hxBqs95+KK+38SegOISODA+Pk8dCf0ox29Qz1K
 qjTOlWXIl5X0tyJqhsrMzTTnxM+IRIxBJkha+DDGF9tt18U2LUl8sMPr/
 xFQ5+EoWqeolJtkR/vU9j41VDubqhgDzokU+6SdrZL54hj7gsaI/eZFno
 3YRI5YcEMWqC+2o37rPF3NCUmjAPCCSkzSf+QOBaH3PFxFWJwfeXM32VM
 cjkqEcbEg8Eoo2xVbszdvV+bKIkyPvXeQ1SOTkRkE8P0ynOCzv5GBzgyh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="275538182"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="275538182"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 03:14:34 -0700
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="672797149"
Received: from arnesgom-mobl.ger.corp.intel.com ([10.252.54.235])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 03:14:28 -0700
Date: Tue, 30 Aug 2022 13:14:27 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <Yw3Zf5cwJIlBAV2z@kroah.com>
Message-ID: <55e7b5d8-9bf7-4186-fa5d-29e1e1b3a1d3@linux.intel.com>
References: <20220830072956.3630-1-ilpo.jarvinen@linux.intel.com>
 <20220830072956.3630-5-ilpo.jarvinen@linux.intel.com>
 <Yw3Pw9kwDDKXuqC+@kroah.com>
 <58d6748-ebd-e637-c1b2-b8e469e6d86d@linux.intel.com>
 <Yw3Zf5cwJIlBAV2z@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1914567423-1661852593=:1864"
Content-ID: <e212410-9396-e748-6f82-3fb0839d31@linux.intel.com>
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

--8323329-1914567423-1661852593=:1864
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <1aefe4bc-c222-7b33-216c-7cd023ce365@linux.intel.com>

On Tue, 30 Aug 2022, Greg Kroah-Hartman wrote:

> On Tue, Aug 30, 2022 at 12:26:29PM +0300, Ilpo Järvinen wrote:
> > On Tue, 30 Aug 2022, Greg Kroah-Hartman wrote:

> > > Ah, you are mapping this on top of the existing structure, so there was
> > > no padding in the original one, why say that?
> > 
> > While I'm not exactly sure what you tried to say with this, I'll try to 
> > answer regardless.
> > 
> > It's the opposite, there's padding in rs485_user, and therefore also in 
> > rs485_uapi. Struct serial_rs485 has padding and is part of uapi so it 
> > cannot be changed to remove the extra padding.
> > 
> > I cannot directly copy_from_user into *rs485 because it lacks the padding. 
> > Thus, the immediate rs485_uapi and then assign to rs485.
> 
> Padding could be in the middle of the structure, it's not obvious that
> it is not there.  You are just trying to drop the trailing "unused
> space", while all of the fields are identical otherwise.
> 
> So be specific about that, as padding is often in the middle of a
> structure.

Ah, sorry. I didn't realize there would be such a way to misunderstand
the message because I knew too well where the padding with this particular 
struct is.

> > If you feel ~32B per uart_port too little to be useful (and a little 
> > more per driver), I can just drop this patch.
> 
> I think 32 bytes per serial port is totally lost in the noise and would
> not even be able to be measured at all due to how slabs are aligned
> (meaning you are not actually saving any memory at all.)
>
> Can you notice any measurable savings on your systems?

It's not that straightforward. Many uart_ports are embedded into arrays
like this:

static struct ...[N];

...But then one could again say that, e.g., module alignment eats up all 
potential benefits, etc.

Obviously with big systems and small number of ports, this would never 
matter much so while I believe likely could get some small looking number 
for you I don't feel the effort needed to be anymore justified.

> And what is the code increase overall with this patch series?  :)

The series was mostly shuffling existing code around, the only thing added 
was that those struct copies so probably less than it looked.

> I'm all for making things const, to prevent errors, but that could
> probably be done without this type of change, right?

OK, I'll drop this last patch. For the first three though, there's useful 
stuff in them making some things more cleaner/consistent, I'll sort that 
out.

Thanks for your comments.


-- 
 i.
--8323329-1914567423-1661852593=:1864
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--8323329-1914567423-1661852593=:1864--
