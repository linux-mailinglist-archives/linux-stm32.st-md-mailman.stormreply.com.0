Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 801BB4BB722
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Feb 2022 11:45:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 318EFC6046A;
	Fri, 18 Feb 2022 10:45:22 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB047C5F1FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Feb 2022 10:45:20 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1nL0lE-0007Wy-FR; Fri, 18 Feb 2022 11:45:12 +0100
Received: from pengutronix.de (unknown [195.138.59.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 9A31436EAB;
 Fri, 18 Feb 2022 10:45:07 +0000 (UTC)
Date: Fri, 18 Feb 2022 11:45:04 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20220218104504.62sfwbc4yoaceqdw@pengutronix.de>
References: <20220217145527.2696444-1-vincent.whitchurch@axis.com>
 <20220217203604.39e318d0@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
In-Reply-To: <20220217203604.39e318d0@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@st.com>, netdev@vger.kernel.org,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 kernel@axis.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lars Persson <larper@axis.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Enable NAPI before
	interrupts go live
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
Content-Type: multipart/mixed; boundary="===============7856784495460333511=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7856784495460333511==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h4oitkp7lwuotckt"
Content-Disposition: inline


--h4oitkp7lwuotckt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 17.02.2022 20:36:04, Jakub Kicinski wrote:
> On Thu, 17 Feb 2022 15:55:26 +0100 Vincent Whitchurch wrote:
> > From: Lars Persson <larper@axis.com>
> >=20
> > The stmmac_open function has a race window between enabling the RX
> > path and its interrupt to the point where napi_enabled is called.
> >=20
> > A chatty network with plenty of broadcast/multicast traffic has the
> > potential to completely fill the RX ring before the interrupt handler
> > is installed. In this scenario the single interrupt taken will find
> > napi disabled and the RX ring will not be processed. No further RX
> > interrupt will be delivered because the ring is full.
> >=20
> > The RX stall could eventually clear because the TX path will trigger a
> > DMA interrupt once the tx_coal_frames threshold is reached and then
> > NAPI becomes scheduled.
>=20
> LGTM, although now the ndo_open and ndo_stop paths are not symmetrical.
> Is there no way to mask the IRQs so that they don't fire immediately?
> More common flow (IMO) would be:
>  - request irq
>  - mask irq

I think you can merge these, to avoid a race condition, see:

| cbe16f35bee6 genirq: Add IRQF_NO_AUTOEN for request_irq/nmi()

>  - populate rings
>  - start dma
>  - enable napi
>  - unmask irq
> Other than the difference in flow between open/stop there may also be
> some unpleasantness around restarting tx queues twice with the patch
> as is.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--h4oitkp7lwuotckt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmIPeK0ACgkQrX5LkNig
011lEAf/ceZBFk9BF55mTJawpi5z5TpEgwyp84woyMIdPDmhW3IArp/mlLOJTaMF
7lcjuYVsoI2YmLM5uuk8XFrI/+7ajWtphtGFcks3RxEMR3/GoSPdY8UI5Z4bdMT8
c0dMjvNeD77ha6lQ2ZUHflAaBzCbtRctty+f8nxqVix/uI2xLQ4AAgehs079auMh
+yEBwQ8WWBF5UWdLCcLe9zqcQ5NPHMLfPiiHLA3VLUr8ilDTcp1gy613RDzHRPnj
qGvowf3Kwa4jAN0LISa1kJ1/4OsezXdrTvUTwfns6JxvP/PmktSX0ENg6jVKefds
vIR5lSdqHX0L74ub2GLCNXqf7rJCdw==
=WZKK
-----END PGP SIGNATURE-----

--h4oitkp7lwuotckt--

--===============7856784495460333511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7856784495460333511==--
