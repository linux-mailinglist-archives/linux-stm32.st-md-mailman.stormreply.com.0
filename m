Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F555978C8
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Aug 2022 23:16:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49D86C640F1;
	Wed, 17 Aug 2022 21:16:15 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DB57C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Aug 2022 21:16:14 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1oOQOX-0004kI-IR; Wed, 17 Aug 2022 23:16:09 +0200
Received: from pengutronix.de (unknown
 [IPv6:2a01:4f8:1c1c:29e9:22:41ff:fe00:1400])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 5D4F1CD031;
 Wed, 17 Aug 2022 21:16:05 +0000 (UTC)
Date: Wed, 17 Aug 2022 23:16:04 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20220817211604.o44ojny342ynk7zg@pengutronix.de>
References: <20220817143529.257908-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20220817143529.257908-1-dario.binacchi@amarulasolutions.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org, linux-can@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH 0/4] can: bxcan: add support for ST
	bxCAN controller
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
Content-Type: multipart/mixed; boundary="===============1675808491128113494=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1675808491128113494==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kmsf55lalqtcovvr"
Content-Disposition: inline


--kmsf55lalqtcovvr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

I've stripped down the Cc list a bit...

On 17.08.2022 16:35:25, Dario Binacchi wrote:
> The series adds support for the basic extended CAN controller (bxCAN)
> found in many low- to middle-end STM32 SoCs.
>
> The driver has been tested on the stm32f469i-discovery board with a
> kernel version 5.19.0-rc2 in loopback + silent mode:

I've had no time for a in depth review, but here are some warnings by
the standard checker tools:

Please fix these sparse errors:

| drivers/net/can/bxcan/bxcan-drv.c:641:39: warning: incorrect type in initializer (different address spaces)
| drivers/net/can/bxcan/bxcan-drv.c:641:39:    expected struct bxcan_regs *regs
| drivers/net/can/bxcan/bxcan-drv.c:641:39:    got struct bxcan_regs [noderef] __iomem *regs
| drivers/net/can/bxcan/bxcan-drv.c:650:15: warning: incorrect type in argument 1 (different address spaces)
| drivers/net/can/bxcan/bxcan-drv.c:650:15:    expected void const volatile [noderef] __iomem *addr
| drivers/net/can/bxcan/bxcan-drv.c:650:15:    got unsigned int *
| drivers/net/can/bxcan/bxcan-drv.c:667:20: warning: incorrect type in argument 1 (different address spaces)
| drivers/net/can/bxcan/bxcan-drv.c:667:20:    expected void volatile [noderef] __iomem *addr
| drivers/net/can/bxcan/bxcan-drv.c:667:20:    got unsigned int *
| drivers/net/can/bxcan/bxcan-drv.c:672:17: warning: incorrect type in argument 2 (different address spaces)
| drivers/net/can/bxcan/bxcan-drv.c:672:17:    expected void volatile [noderef] __iomem *addr
| drivers/net/can/bxcan/bxcan-drv.c:672:17:    got unsigned int *
| drivers/net/can/bxcan/bxcan-drv.c:675:9: warning: incorrect type in argument 2 (different address spaces)
| drivers/net/can/bxcan/bxcan-drv.c:675:9:    expected void volatile [noderef] __iomem *addr
| drivers/net/can/bxcan/bxcan-drv.c:675:9:    got unsigned int *
| drivers/net/can/bxcan/bxcan-drv.c:677:15: warning: incorrect type in argument 1 (different address spaces)
| drivers/net/can/bxcan/bxcan-drv.c:677:15:    expected void const volatile [noderef] __iomem *addr
| drivers/net/can/bxcan/bxcan-drv.c:677:15:    got unsigned int *
| drivers/net/can/bxcan/bxcan-drv.c:703:14: warning: incorrect type in argument 1 (different address spaces)
| drivers/net/can/bxcan/bxcan-drv.c:703:14:    expected void const volatile [noderef] __iomem *addr
| drivers/net/can/bxcan/bxcan-drv.c:703:14:    got unsigned int *
| drivers/net/can/bxcan/bxcan-drv.c:709:15: warning: incorrect type in argument 1 (different address spaces)
| drivers/net/can/bxcan/bxcan-drv.c:709:15:    expected void const volatile [noderef] __iomem *addr
| drivers/net/can/bxcan/bxcan-drv.c:709:15:    got unsigned int *
| drivers/net/can/bxcan/bxcan-drv.c:718:50: warning: incorrect type in argument 1 (different address spaces)
| drivers/net/can/bxcan/bxcan-drv.c:718:50:    expected void const volatile [noderef] __iomem *addr
| drivers/net/can/bxcan/bxcan-drv.c:718:50:    got unsigned int *
| drivers/net/can/bxcan/bxcan-drv.c:730:39: warning: incorrect type in initializer (different address spaces)
| drivers/net/can/bxcan/bxcan-drv.c:730:39:    expected struct bxcan_regs *regs
| drivers/net/can/bxcan/bxcan-drv.c:730:39:    got struct bxcan_regs [noderef] __iomem *regs
| drivers/net/can/bxcan/bxcan-drv.c:735:24: warning: incorrect type in argument 1 (different address spaces)
| drivers/net/can/bxcan/bxcan-drv.c:735:24:    expected void const volatile [noderef] __iomem *addr
| drivers/net/can/bxcan/bxcan-drv.c:735:24:    got unsigned int *
| drivers/net/can/bxcan/bxcan-drv.c:742:17: warning: incorrect type in argument 2 (different address spaces)
| drivers/net/can/bxcan/bxcan-drv.c:742:17:    expected void volatile [noderef] __iomem *addr
| drivers/net/can/bxcan/bxcan-drv.c:742:17:    got unsigned int *
| drivers/net/can/bxcan/bxcan-drv.c:747:28: warning: incorrect type in argument 1 (different address spaces)
| drivers/net/can/bxcan/bxcan-drv.c:747:28:    expected void volatile [noderef] __iomem *addr
| drivers/net/can/bxcan/bxcan-drv.c:747:28:    got unsigned int *
| drivers/net/can/bxcan/bxcan-drv.c:802:39: warning: incorrect type in initializer (different address spaces)
| drivers/net/can/bxcan/bxcan-drv.c:802:39:    expected struct bxcan_regs *regs
| drivers/net/can/bxcan/bxcan-drv.c:802:39:    got struct bxcan_regs [noderef] __iomem *regs
| drivers/net/can/bxcan/bxcan-drv.c:810:15: warning: incorrect type in argument 1 (different address spaces)
| drivers/net/can/bxcan/bxcan-drv.c:810:15:    expected void const volatile [noderef] __iomem *addr
| drivers/net/can/bxcan/bxcan-drv.c:810:15:    got unsigned int *

(To enable sparse checking, do a "make C=1" to compile.)

Please fix these checkpatch warnings:

| WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
| #74:
| new file mode 100644

Please create a MAINTAINERS entry.

| WARNING: Using vsprintf specifier '%px' potentially exposes the kernel memory layout, if you don't really need the address please consider using '%p'.
| #307: FILE: drivers/net/can/bxcan/bxcan-core.c:179:
| +       dev_info(&pdev->dev, "regs: %px\n", priv->base);

Please remove the print of the base address.

| WARNING: Use of volatile is usually wrong: see Documentation/process/volatile-considered-harmful.rst
| #356: FILE: drivers/net/can/bxcan/bxcan-core.h:21:
| +static inline void bxcan_rmw(volatile void __iomem *addr, u32 clear, u32 set)

remove the volatile.

| WARNING: Using vsprintf specifier '%px' potentially exposes the kernel memory layout, if you don't really need the address please consider using '%p'.
| #1273: FILE: drivers/net/can/bxcan/bxcan-drv.c:899:
| +       }
| +
| +       dev_info(dev, "regs: %px, clk: %d Hz, IRQs: %d, %d, %d\n",
| +                priv->regs, priv->can.clock.freq, tx_irq, rx_irq,
| +                sce_irq);

Remote the print of the regs.

regards,
Marc

--
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--kmsf55lalqtcovvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmL9WpAACgkQrX5LkNig
0104Swf/WXC5q/uKxglR55v1iXB0ag/QppN8vUAVT8mrTm2JteBp0W1p+t9MWqjP
WzqJspo6R4uhrdOp6IG0w8IwS6aIESsE6IvYgCrEVjJUBMnHAEgDiaL5YxrTNwqL
bVCskkv93KZmpTEhpHlqUlgTufpxlJOnpo+g5vTy169+0eh1eEP5F2CySrYDcEnO
+r1yf0dKBUpRnMe+EAZ+UN7FK5yHheanbnm44i35zfZ3+Tm72Z4SzS9jd48iINTv
qLmGsTKoYfmW3bYkUreCVEwTC7mrn6suAvVE8bNECtfHkEENwtEHVaQfnI42ySsW
Aiw+/cyVC3TM66PhZtmzT3Slo+Wmkg==
=NSCv
-----END PGP SIGNATURE-----

--kmsf55lalqtcovvr--

--===============1675808491128113494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1675808491128113494==--
