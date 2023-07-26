Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D77F6762AF2
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 07:50:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85D97C6A61A;
	Wed, 26 Jul 2023 05:50:38 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A77FC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 05:50:37 +0000 (UTC)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1qOXPd-00042j-DG; Wed, 26 Jul 2023 07:50:17 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id A5F631FAD5F;
 Wed, 26 Jul 2023 05:50:11 +0000 (UTC)
Date: Wed, 26 Jul 2023 07:50:11 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20230726-subsector-unguided-8f1fc1edb037-mkl@pengutronix.de>
References: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
 <20230725200606.5264b59c@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230725200606.5264b59c@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Johannes Zink <j.zink@pengutronix.de>, kernel test robot <lkp@intel.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Russell King <linux@armlinux.org.uk>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: correct MAC propagation
	delay
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
Content-Type: multipart/mixed; boundary="===============0872091204258886280=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0872091204258886280==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n73y6rsllricxc2b"
Content-Disposition: inline


--n73y6rsllricxc2b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 25.07.2023 20:06:06, Jakub Kicinski wrote:
> On Mon, 24 Jul 2023 12:01:31 +0200 Johannes Zink wrote:
> > The IEEE1588 Standard specifies that the timestamps of Packets must be
> > captured when the PTP message timestamp point (leading edge of first
> > octet after the start of frame delimiter) crosses the boundary between
> > the node and the network. As the MAC latches the timestamp at an
> > internal point, the captured timestamp must be corrected for the
> > additional path latency, as described in the publicly available
> > datasheet [1].
> >=20
> > This patch only corrects for the MAC-Internal delay, which can be read
> > out from the MAC_Ingress_Timestamp_Latency register, since the Phy
> > framework currently does not support querying the Phy ingress and egress
> > latency. The Closs Domain Crossing Circuits errors as indicated in [1]
> > are already being accounted in the stmmac_get_tx_hwtstamp() function and
> > are not corrected here.
> >=20
> > As the Latency varies for different link speeds and MII
> > modes of operation, the correction value needs to be updated on each
> > link state change.
> >=20
> > As the delay also causes a phase shift in the timestamp counter compared
> > to the rest of the network, this correction will also reduce phase error
> > when generating PPS outputs from the timestamp counter.
> >=20
> > [1] i.MX8MP Reference Manual, rev.1 Section 11.7.2.5.3 "Timestamp
> > correction"
>=20
> Hi Richard,
>=20
> any opinion on this one?
>=20
> The subject read to me like it's about *MII clocking delays, I figured
> you may have missed it, too.

The patch description clarifies what is being corrected, namely the
"MAC-internal delay, which can be read out from the
MAC_Ingress_Timestamp_Latency register".

The next step would be to correct PHY latency, but there is no support
for querying PHY latency yet.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--n73y6rsllricxc2b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmTAtA0ACgkQvlAcSiqK
BOj+xAf9HnUMaNIWiFRIZoj3nuV0Sm7RBhk/exT6G18NMZPSk82FtzDgOsBQmJba
Jg1SR+1P8sQl41S08+MUGp8la2aafbin8uKx59u9Cc2awqTCm8LKkH0Dy6VbIs+0
kzwv9OnjeUW59XCtw14bf6A98IzSF7EjUQbYHohSzu3rpPcP8FUFHn80E3Mx7eMf
lCUbHVKVSwk0UX/SEic4hBowFTIn5IOLhpvSShLGBTkG+Cwl2t7xQikqtlrrzoBd
cFA14fvDpoeN/zSkP/L+5RPheqpAsNMxfz/W1+c84+6k06yMZrg+0nlkD0u18MNg
nsLo15Uu8pW06snGCiGSny4ZBzEUQQ==
=o4NS
-----END PGP SIGNATURE-----

--n73y6rsllricxc2b--

--===============0872091204258886280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0872091204258886280==--
