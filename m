Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C38925A5F59
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Aug 2022 11:26:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64C7EC5EC6B;
	Tue, 30 Aug 2022 09:26:43 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1607C57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 09:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661851601; x=1693387601;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=unlic4/lYX6T/gxK2b8kUDtNMgSGMfP8eMU0jAigMdY=;
 b=HlXMBWN2gCEwFj1bOgHSyVqnwbUa4Aj9zy/mvjtQnboG3ySk7jj51ZFO
 v/9dpxuCkZwC1l0Obm87/seE7eJreHfaCYLcxPePcOtVKnzz7Wz0dKJvl
 MIDh3lFth/ItPoMMUCgbFTaCFtiMskValS7IDfR3Pxc3sB4ZJxrYhVbYP
 yKgSFsLFCc8zUnXhW+ZZZp7bMBV4xO6Mie52iyC1RjbpCOgNIxpF8Y+e8
 1Kt1/s6+ZaYTUzdj4vZ/UeTq3atPiW8iupopttzaOkmpiXnMaHQGoib1Y
 4OWCLUlu9ZsmvyAUZSmna3MYzvbUkV2+o20W0X4o/5OtkB/rTkc2FTmR/ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="321256755"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="321256755"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 02:26:39 -0700
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="672778415"
Received: from arnesgom-mobl.ger.corp.intel.com ([10.252.54.235])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 02:26:30 -0700
Date: Tue, 30 Aug 2022 12:26:29 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <Yw3Pw9kwDDKXuqC+@kroah.com>
Message-ID: <58d6748-ebd-e637-c1b2-b8e469e6d86d@linux.intel.com>
References: <20220830072956.3630-1-ilpo.jarvinen@linux.intel.com>
 <20220830072956.3630-5-ilpo.jarvinen@linux.intel.com>
 <Yw3Pw9kwDDKXuqC+@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1331296277-1661851599=:1864"
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

--8323329-1331296277-1661851599=:1864
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

On Tue, 30 Aug 2022, Greg Kroah-Hartman wrote:

> On Tue, Aug 30, 2022 at 10:29:56AM +0300, Ilpo Järvinen wrote:
> > -static int serial_rs485_from_user(struct serial_rs485 *rs485,
> > +static int serial_rs485_from_user(struct kserial_rs485 *rs485,
> >  				  const struct serial_rs485 __user *rs485_user)
> >  {
> > -	if (copy_from_user(rs485, rs485_user, sizeof(*rs485)))
> > +	struct serial_rs485 rs485_uapi;
> > +
> > +	if (copy_from_user(&rs485_uapi, rs485_user, sizeof(*rs485)))
> >  		return -EFAULT;
> >  
> > +	*rs485 = *((struct kserial_rs485 *)&rs485_uapi);
> 
> Ah, you are mapping this on top of the existing structure, so there was
> no padding in the original one, why say that?

While I'm not exactly sure what you tried to say with this, I'll try to 
answer regardless.

It's the opposite, there's padding in rs485_user, and therefore also in 
rs485_uapi. Struct serial_rs485 has padding and is part of uapi so it 
cannot be changed to remove the extra padding.

I cannot directly copy_from_user into *rs485 because it lacks the padding. 
Thus, the immediate rs485_uapi and then assign to rs485.

> > +/*
> > + * Compile-time asserts for struct kserial_rs485 and struct serial_rs485 equality
> > + * (except padding).
> 
> This does not take into account any padding, in fact it's the opposite
> as all of this:

?? I said: "(except padding)" which I thought implies that padding is 
intentionally excluded (it doesn't exist in kserial_rs485).

> > + */
> > +static_assert(offsetof(struct kserial_rs485, flags) ==
> > +	      offsetof(struct serial_rs485, flags));
> > +static_assert(offsetof(struct kserial_rs485, delay_rts_before_send) ==
> > +	      offsetof(struct serial_rs485, delay_rts_before_send));
> > +static_assert(offsetof(struct kserial_rs485, delay_rts_after_send) ==
> > +	      offsetof(struct serial_rs485, delay_rts_after_send));
> > +static_assert(offsetof(struct kserial_rs485, addr_recv) ==
> > +	      offsetof(struct serial_rs485, addr_recv));
> > +static_assert(offsetof(struct kserial_rs485, addr_dest) ==
> > +	      offsetof(struct serial_rs485, addr_dest));
> > +static_assert(sizeof(struct kserial_rs485) <= sizeof(struct serial_rs485));
> 
> Is there to ensure that the offsets are exactly the same, no padding
> involved anywhere.

That's because for kernel padding "doesn't matter", it doesn't want it,
it would be just wasted space. After this series, padding is used only for 
uapi, no longer for the in-kernel structs.

> So I don't understand the problem you are trying to solve here,

struct serial_rs485 has padding that is ~16B long currently. serial_rs485 
is currently used for a few things:
- Keep track of rs485 state (per port)
- Record what rs485 options the port supports (per port)
- Record rs485 options a driver supports (per driver with rs485 support)
- Exchange rs485 config/state information with userspace

Only the last of those requires the padding (because it has been part of 
uapi since day 1). With kserial_rs485, the padding can eliminated for the 
first 3 cases.

If you feel ~32B per uart_port too little to be useful (and a little 
more per driver), I can just drop this patch.

-- 
 i.

--8323329-1331296277-1661851599=:1864
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--8323329-1331296277-1661851599=:1864--
