Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DEB5A4B1A
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Aug 2022 14:09:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4220C04001;
	Mon, 29 Aug 2022 12:09:18 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 287F9C03FDA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Aug 2022 12:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661774957; x=1693310957;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=oxQnpIC7Es3fbk5Y7KL1o+zPbw4eWKeljrhF6pZeVsU=;
 b=HSxvDbZTSkzfLYlmPM0aZyhTf3HYIKdQ5gZO4zwt4Leq9XxAajm1AqeZ
 P4BcXTltjC6fYIXsGkOKiNex3onmXhfUli0NV6r+U4QOTZGIPcP1iJ/mT
 NUIAeR9CSVCLgrjsI661C3dylNVs1YfC/WLsWSVuESkeG0JSvgoCtJyH4
 M4DJ1uVuZoyaSlbjPOSAkdDUJhVpNJ1VwycQyG40T0PgNK2Eev8VE+Pig
 2B/5Igy1VC1xWoC8k2A1FMJwTr98/Wqn28jeU9d58O0GYJPfvyPkjr62J
 nFeeUSyLTrwKQqDaG9YRv0IJoD7V7DLyN+kV7sUMH+kzhtHQDwLQpbHlZ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="320997396"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="320997396"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 05:09:15 -0700
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="588142891"
Received: from kvehmane-mobl1.ger.corp.intel.com ([10.251.220.41])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 05:09:08 -0700
Date: Mon, 29 Aug 2022 15:09:09 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
In-Reply-To: <CAHp75Vc4NfZE6DxFnfeAS9fxnZHpxMjacHy1TsG8ib+FiCqFLQ@mail.gmail.com>
Message-ID: <1712a4c5-638-4e63-af29-32bdcbaab443@linux.intel.com>
References: <20220826144629.11507-1-ilpo.jarvinen@linux.intel.com>
 <20220826144629.11507-4-ilpo.jarvinen@linux.intel.com>
 <CAHp75Vc4NfZE6DxFnfeAS9fxnZHpxMjacHy1TsG8ib+FiCqFLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-174262208-1661774957=:1928"
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Corbet <corbet@lwn.net>, Jiri Slaby <jirislaby@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Richard Genoud <richard.genoud@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 3/3] serial: Add kserial_rs485 to avoid
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

--8323329-174262208-1661774957=:1928
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 26 Aug 2022, Andy Shevchenko wrote:

> On Fri, Aug 26, 2022 at 5:51 PM Ilpo Järvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> 
> > -static int user_rs485_to_kernel_serial_rs485(struct serial_rs485 *rs485,
> > +static int user_rs485_to_kernel_serial_rs485(struct kserial_rs485 *rs485,
> >                                              const struct serial_rs485 __user *rs485_user)
> >  {
> > -       if (copy_from_user(rs485, rs485_user, sizeof(*rs485)))
> > +       struct serial_rs485 rs485_uapi;
> > +
> > +       if (copy_from_user(&rs485_uapi, rs485_user, sizeof(*rs485)))
> >                 return -EFAULT;
> 
> > +       *rs485 = *((struct kserial_rs485 *)&rs485_uapi);
> 
> So with all assets we have we can be sure that on BE64 / BE32 machines
> this will be flawless. Is this assumption correct?

I think so. At worst it could trigger a build fail assuming the kernel 
would do some really odd struct layout reordering (which, according to 
the build bot, doesn't occur for any currently tested arch).

Now that you highlighted this line though, I started to wonder if it would 
be just better to use memcpy() instead as it would avoid those casts.

> > + * padding.
> > + */
> > +struct kserial_rs485 {
> > +       __u32   flags;                  /* RS485 feature flags */
> > +       __u32   delay_rts_before_send;  /* Delay before send (milliseconds) */
> > +       __u32   delay_rts_after_send;   /* Delay after send (milliseconds) */
> > +       struct {
> > +               __u8    addr_recv;
> > +               __u8    addr_dest;
> > +       };
> 
> Btw, can't we convert them to kernel doc?

Yes, why not.

-- 
 i.

--8323329-174262208-1661774957=:1928
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--8323329-174262208-1661774957=:1928--
