Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FED37CCE05
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Oct 2023 22:28:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA617C6C838;
	Tue, 17 Oct 2023 20:28:10 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99DA0C6C837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Oct 2023 20:28:09 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1qsqfI-0007Y4-Un; Tue, 17 Oct 2023 22:27:44 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mkl@pengutronix.de>)
 id 1qsqfG-002Ogt-Nj; Tue, 17 Oct 2023 22:27:42 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 4BD7C2385D9;
 Tue, 17 Oct 2023 20:27:42 +0000 (UTC)
Date: Tue, 17 Oct 2023 22:27:41 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20231017-transfer-refurbish-5cfaf12a524c-mkl@pengutronix.de>
References: <20231010-stmmac_fix_auxiliary_event_capture-v1-0-3eeca9e844fa@pengutronix.de>
 <20231010-stmmac_fix_auxiliary_event_capture-v1-2-3eeca9e844fa@pengutronix.de>
 <20231014144428.GA1386676@kernel.org>
 <004d6ce9-7d15-4944-b31c-c9e628e7483a@pengutronix.de>
 <20231017082618.4558ad06@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231017082618.4558ad06@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Johannes Zink <j.zink@pengutronix.de>, kernel@pengutronix.de,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>, linux-kernel@vger.kernel.org,
 Simon Horman <horms@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH net-next 2/5] net: stmmac: fix PPS capture
	input index
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
Content-Type: multipart/mixed; boundary="===============5124474153880069118=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5124474153880069118==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jxb4irrvefe35xe5"
Content-Disposition: inline


--jxb4irrvefe35xe5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 17.10.2023 08:26:18, Jakub Kicinski wrote:
> On Tue, 17 Oct 2023 11:12:53 +0200 Johannes Zink wrote:
> > > If it is a bug fix then it should probably be targeted at 'net',
> > > creating a dependency for the remainder of this series.
> > >=20
> > > On the other hand, if it is not a bug fix then perhaps it is best to
> > > update the subject and drop the Fixes tag. =20
> >=20
> > I added the fixes-Tag in order to make code archeology easier, but as i=
t may=20
> > trigger picks to stable branches (which is not required imho), I have n=
o=20
> > objections to dropping it for a v2.
>=20
> Would be good to clarify what impact on device operation the problem
> has. How would end user notice the problem?
> Does it mean snapshots were always or never enabled, previously?

On all dwmac devices not covered by dwmac-intel.c (INTEL 10/100/1000
Ethernet PCI driver), PPS capture can be requested from user-space, but
is not enabled in HW. There is no error message or other feedback to the
user space. The user space will not get any PPS events.

As this change also affects the Intel driver, and we don't have any
hardware to test, I think it's better that this goes via net-next to
give it a bit more time of testing.

> Note that if you submit this fix for net today it will still make it=20
> to -rc7 and net-next by tomorrow, so no major delay. We merge the trees
> on Thursday, usually.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--jxb4irrvefe35xe5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmUu7jsACgkQvlAcSiqK
BOjTdwf+PU0hEZRTTz3uvV22X9GHPn8ISxXtSbQP8oYST3HfxTdQSC8RkCKnWNy1
Fn2LgnwMCbQPWMobKRPjCU9fRnx1dmYCHUUyouXS+gvoy6AQoguwJgh4kalerA0k
vnA6fEeXt+Vm5ut/t9b0oQnSL6McZZS5vA9QWDQ4ouJfcAnP9dokWLoCoADR5w1p
8+nnnDDpYFE2Z9XUmyHy6SizjEhFgHRWyiP2nEg8RrxO5rhBqoU9HZqjZ9HtBx2B
ZpBOVX2M0v/cF+tVMOXLvdiC5CoZZiSpncPEF9bkwRDMZUmb56MgVQ2+o5cXCrI8
sNXUAlynq/n6yhnGsui4EakF/VXDMw==
=fvJW
-----END PGP SIGNATURE-----

--jxb4irrvefe35xe5--

--===============5124474153880069118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5124474153880069118==--
