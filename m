Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA04184E3B7
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Feb 2024 16:08:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64736C65E4C;
	Thu,  8 Feb 2024 15:08:03 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 515BFC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Feb 2024 15:08:02 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1707404881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KWgJgd6Z3ryJqQjA1Py+G/4gkJHYEfzRUj8BBBe02k8=;
 b=qAHoFif3apfMZ5rPFFx44tAG5uffVd/VGorFMZXggJn2F3iILQ6Px4Pp39ptQACupsxrDE
 2vEXSN4dmNHy5wpSWi4sT1Y00zR2b13Nf/UmyIfoN+DkdyBkPDPfOjXcBgVUIqvHOEODuI
 xODZdWubb1xvkDbf1UVH7BNwFciDuN/jVDWuXS1OczDl8dBg6QCUSJs2VNv4KhxdC1q5hE
 4RZmUOznwbZ8eITl/dhsIHDgXgrrUMvAXwns719IUvvn//0M8TIhFbP1QXD7jAtcVnTqV+
 uItQOr6SAjOozbppeDoFqho4X5sjHx5PWFKAqV+olREOtaW0miYEDcZp/LWyJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1707404881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KWgJgd6Z3ryJqQjA1Py+G/4gkJHYEfzRUj8BBBe02k8=;
 b=CYhzDV5MkDoZ0H9Q8gHK39KLiF4HBdpN1Wbddapq8bhNDgRgPCNWfW3wDBhJoxNfPG6wbe
 4YNJiYpnDVdGKhCA==
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
In-Reply-To: <ZcTqqwmGTIEq6bfO@boxer>
References: <20240208-stmmac_irq-v1-1-8bab236026d4@linutronix.de>
 <ZcTNCxrWTAfj90Es@boxer> <871q9n81s1.fsf@kurt.kurt.home>
 <ZcTqqwmGTIEq6bfO@boxer>
Date: Thu, 08 Feb 2024 16:08:00 +0100
Message-ID: <87y1bv6lkf.fsf@kurt.kurt.home>
MIME-Version: 1.0
Cc: Yannick Vignon <yannick.vignon@nxp.com>, netdev@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: Simplify mtl IRQ
	status checking
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
Content-Type: multipart/mixed; boundary="===============8292519886525871217=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============8292519886525871217==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu Feb 08 2024, Maciej Fijalkowski wrote:
> On Thu, Feb 08, 2024 at 03:32:30PM +0100, Kurt Kanzenbach wrote:
>> On Thu Feb 08 2024, Maciej Fijalkowski wrote:
>> > On Thu, Feb 08, 2024 at 11:35:25AM +0100, Kurt Kanzenbach wrote:
>> >> Commit 8a7cb245cf28 ("net: stmmac: Do not enable RX FIFO overflow
>> >> interrupts") disabled the RX FIFO overflow interrupts. However, it le=
ft the
>> >> status variable around, but never checks it.
>> >>=20
>> >> As stmmac_host_mtl_irq_status() returns only 0 now, the code can be
>> >> simplified.
>> >>=20
>> >> Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
>> >> ---
>> >>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++----
>> >>  1 file changed, 2 insertions(+), 4 deletions(-)
>> >>=20
>> >> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driv=
ers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> >> index 04d817dc5899..10ce2f272b62 100644
>> >> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> >> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> >> @@ -6036,10 +6036,8 @@ static void stmmac_common_interrupt(struct stm=
mac_priv *priv)
>> >>  				priv->tx_path_in_lpi_mode =3D false;
>> >>  		}
>> >>=20=20
>> >> -		for (queue =3D 0; queue < queues_count; queue++) {
>> >> -			status =3D stmmac_host_mtl_irq_status(priv, priv->hw,
>> >> -							    queue);
>> >> -		}
>> >> +		for (queue =3D 0; queue < queues_count; queue++)
>> >> +			stmmac_host_mtl_irq_status(priv, priv->hw, queue);
>> >
>> > Hey Kurt,
>> >
>> > looks to me that all of the current callbacks just return 0 so why not
>> > make them return void instead?
>>=20
>> Well, there are two callbacks of this in dwmac4 and dwxgmac2. Both of
>> them still have the code for handling the overflow interrupt (and then
>> returning !=3D 0). However, as of commit 8a7cb245cf28 the interrupt
>> shouldn't fire. So yes, it could be changed to void along with some
>> code removal. But, maybe i'm missing something.
>
> Hmm, ok, my 'quick' glance over the code was too quick :) I missed
> overflow encoding to ret within callbacks, sorry. But it seems that even
> though they can return nonzero values they would be ignored, correct?

Yeah, they are ignored.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmXE7lATHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgtzBD/9nDDb3DltYcIgqEvmxDM3LECpgT0DF
HFB3GXNIA6YKdtCS+QusIoH1E0B6qf4F06j7zNh/os9u+tsbMyLkxiimsaWOyfIk
OEqX1a9bZpFcEFAaDcSLQB367SoqAGeuswQ+KHOUR+IerOj0Y+vCnz7jrjn5N+Pn
KfQXn1p2u3QkDHPILK+TSE4ygPDMqr3tk7CtHoWnZ+hT1qaRsPyNYZEpLX+R17+f
xndwQP6IzM77RrNq/RCfsM2Ozl/5Aar3PumvuHtB4eIgEMhTug2s1QI3KHq6bzL3
R9iyUPnqwhK8MUMEaR+jksVZPL0I+lZtLVJmQuiUpwLGLG1ipw0ULUOD1/38UZuk
yPaosBA8i3NyGS3akVmDc08AcsnsMrAnY/lgP2H2mKvmPCKf3/kuhmDbfLUehpql
gerYvYGfNIeGIe0PGuYSRf/1eWADM3gDMSzS2JlwVteYfIsSniD6DHkfRKTkOzr0
+Y6pH3dYrmSr0Zb9243Ebgw2f7nXbUIYW8MM16RgqC32vg4Yk6MrcQkZ6rpUOgk4
/0E6afVbJjrYYweTsiARACdluiF+9Yd5byyIxz7Om6KIWrY7zDkg90L3mVnE1WcR
U4ao0ASaiUSn5wL4rwLvvf6r1n/vE2ZzikBhKbr5E6mS6LgZAKeQ9DIHDsLRAjTL
RZyukkHrSq8KGg==
=U68y
-----END PGP SIGNATURE-----
--=-=-=--

--===============8292519886525871217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8292519886525871217==--
