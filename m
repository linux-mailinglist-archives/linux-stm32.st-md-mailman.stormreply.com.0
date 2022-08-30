Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3B75A5E6F
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Aug 2022 10:45:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE4B8C5EC6B;
	Tue, 30 Aug 2022 08:45:09 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4960AC57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 08:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661849108; x=1693385108;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=Td5i70jCRkECHM6VGo1f2VVW8QLL7NTNnHGfBf6NaC4=;
 b=blJ7/WukxM/N5mqGipoY13ic8iV5c+iVdNI+l7uuREfpPmhQFNaR4Mm+
 62NtFDWcDgz5BDEbWTAHKIJ6r2GcPzN8UQGRiSJheG8s6BfBVU1GCi/bj
 +EEtY7yMPcIPGwTy3GLTwC6xJac0LQIH6Nt92KnUB4AZ/K6OcUYY7SJ7A
 W0IlsOn5Kx0CqN57LO7EUTqBpYh7CI79uopser+Jxy6Tubn3y2IXjXd8J
 rHP2/PMsHeGejqD2eLGkDMzOFJatPuMyNrWQ1Rqd1lZJedszWMqjLzGpR
 gmKQ0BAyJEZft2VvF8kPB8CA53Yv6tMMRbQzxuiKO4BFQhhCkKShLW+3u w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="292699365"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="292699365"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 01:45:06 -0700
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="672760099"
Received: from arnesgom-mobl.ger.corp.intel.com ([10.252.54.235])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 01:45:00 -0700
Date: Tue, 30 Aug 2022 11:44:59 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <1068ad37-d80c-6e63-6cd9-6ecf6c256d46@kernel.org>
Message-ID: <eb2ba117-6b94-16dd-8e28-9e66f23e8dea@linux.intel.com>
References: <20220830072956.3630-1-ilpo.jarvinen@linux.intel.com>
 <20220830072956.3630-5-ilpo.jarvinen@linux.intel.com>
 <1068ad37-d80c-6e63-6cd9-6ecf6c256d46@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1910140727-1661849107=:1864"
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>,
 Lino Sanfilippo <LinoSanfilippo@gmx.de>, NXP Linux Team <linux-imx@nxp.com>,
 linux-serial <linux-serial@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Richard Genoud <richard.genoud@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

--8323329-1910140727-1661849107=:1864
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 30 Aug 2022, Jiri Slaby wrote:

> On 30. 08. 22, 9:29, Ilpo Järvinen wrote:
> > --- a/include/linux/serial_core.h
> > +++ b/include/linux/serial_core.h
> > @@ -31,6 +31,29 @@ struct serial_struct;
> ...
> > + * Must match with struct serial_rs485 in include/uapi/linux/serial.h
> > excluding
> > + * the padding.
> 
> Have you considered BUILD_BUG_ON() checks with few offset_of()s to enforce the
> above?

It's all enforced at the end of serial_core.c already. Would you perhaps 
prefer I'd put them elsewhere or is it fine as is?

/*
 * Compile-time asserts for struct kserial_rs485 and struct serial_rs485 equality
 * (except padding).
 */
static_assert(offsetof(struct kserial_rs485, flags) ==
              offsetof(struct serial_rs485, flags));
static_assert(offsetof(struct kserial_rs485, delay_rts_before_send) ==
              offsetof(struct serial_rs485, delay_rts_before_send));
static_assert(offsetof(struct kserial_rs485, delay_rts_after_send) ==
              offsetof(struct serial_rs485, delay_rts_after_send));
static_assert(offsetof(struct kserial_rs485, addr_recv) ==
              offsetof(struct serial_rs485, addr_recv));
static_assert(offsetof(struct kserial_rs485, addr_dest) ==
              offsetof(struct serial_rs485, addr_dest));
static_assert(sizeof(struct kserial_rs485) <= sizeof(struct serial_rs485));


-- 
 i.

> > +struct kserial_rs485 {
> > +	__u32	flags;
> > +	__u32	delay_rts_before_send;
> > +	__u32	delay_rts_after_send;
> > +	struct {
> > +		__u8    addr_recv;
> > +		__u8    addr_dest;
> > +	};
> > +};

--8323329-1910140727-1661849107=:1864
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--8323329-1910140727-1661849107=:1864--
