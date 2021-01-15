Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E21EF2F75AE
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jan 2021 10:42:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96BC5C424C0;
	Fri, 15 Jan 2021 09:42:55 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6905CC32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jan 2021 09:42:53 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([109.250.106.207]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MLhsE-1lHsVq2E4W-00Hh89; Fri, 15 Jan 2021 10:42:46 +0100
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <post@lespocky.de>)
 id 1l0Lcu-0004aO-T6; Fri, 15 Jan 2021 10:42:42 +0100
Date: Fri, 15 Jan 2021 10:42:39 +0100
From: Alexander Dahl <post@lespocky.de>
To: Jeff LaBundy <jeff@labundy.com>
Message-ID: <20210115094238.s36rrgmpq63a622p@falbala.internal.home.lespocky.de>
Mail-Followup-To: Jeff LaBundy <jeff@labundy.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-amlogic@lists.infradead.org, Rob Herring <robh@kernel.org>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-2-post@lespocky.de>
 <20210114100312.GL3975472@dell>
 <20210115035050.GA27243@labundy.com>
MIME-Version: 1.0
In-Reply-To: <20210115035050.GA27243@labundy.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Scan-Signature: cebb1f1cd8c059b76424c23a7b2a6eee
X-Spam-Score: -3.3 (---)
X-Provags-ID: V03:K1:NOWsO8Ky6tGtOQE7h7YxhW4mI24HkwY3RcOJvf3uTx/DSwn0422
 t3p/GnUrPrcY6dSeMEjz4Gi1aPxDyKCZbGnRdPknJs1xPu/QdBkX4OTdDgKFTLX5HDq+Qoo
 3g79+oqgBQOupbSUNvA4eKCRAU4A9edEdOR12g5fIzuwHx0TmP9mhGQIlVKWlQDcnr4PlCK
 gNvY+sW4GDySGzNlEuwFw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EY0QcSCryvE=:5JD5RiuQuL8HuXAa4U4PyI
 wKLLWN3SWcddfqVqVFKdjScZS9LtLYCJaOZR0CfVfLmmLLWmQD0rJH6FQy29bRv/TdUCUrnFE
 dbLMVVMftbkID9hoM+WDk3/e1O/kwekew1qtYEaXdGSeG7SELWcQvSSm24k+Uwd6UdzNuMPXM
 GiKXuZSC01P1LXGumFcYQLEx0MX1ofOYqH5xLNXFaySgSd5J3JbhPrzmKPb8TTrN3JNDwJZPD
 ehkTV005W2KyePA5MeEu4KJLNmvikv6J00shbQCwLyil/Zclpi5YXHPWJEqFRvidKKeWOoKvh
 AbG/3Jom1XgmOqedpuYn6mWY777mxKHc3VxohDWmqwL6KkhQBKbRP4XHeV+5d3F1+XoOp2hPF
 2cfZrjR1nslQ/yoYi14CXdc+Buk4Cn0r8X6t7rk8KPaBs0JAMPdteMBAflSOH
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Alexander Dahl <post@lespocky.de>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v9 1/4] dt-bindings: mfd: Fix schema
	warnings for pwm-leds
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
Content-Type: multipart/mixed; boundary="===============2649343245426222886=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2649343245426222886==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h2j7lras76hzpifw"
Content-Disposition: inline


--h2j7lras76hzpifw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jeff,

On Thu, Jan 14, 2021 at 09:50:50PM -0600, Jeff LaBundy wrote:
> On Thu, Jan 14, 2021 at 10:03:12AM +0000, Lee Jones wrote:
> > On Mon, 28 Dec 2020, Alexander Dahl wrote:
> >=20
> > > The node names for devices using the pwm-leds driver follow a certain
> > > naming scheme (now).  Parent node name is not enforced, but recommend=
ed
> > > by DT project.
> > >=20
> > >   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > >   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > > /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.e=
xample.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-=
[0-9a-f]+)?$', 'pinctrl-[0-9]+'
> > >         From schema: /home/alex/src/linux/leds/Documentation/devicetr=
ee/bindings/leds/leds-pwm.yaml
> > >=20
> > > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > > Acked-by: Jeff LaBundy <jeff@labundy.com>
> > > Acked-by: Rob Herring <robh@kernel.org>
> > > ---
> > >=20
> > > Notes:
> > >     v8 -> v9:
> > >       * added forgotten Acked-by (Jeff LaBundy)
> > >       * rebased on v5.11-rc1
> > >    =20
> > >     v7 -> v8:
> > >       * rebased on recent pavel/for-next (post v5.10-rc1)
> > >       * added Acked-by (Rob Herring)
> > >    =20
> > >     v6 -> v7:
> > >       * added warning message to commit message (Krzysztof Kozlowski)
> > >    =20
> > >     v6:
> > >       * added this patch to series
> > >=20
> > >  Documentation/devicetree/bindings/mfd/iqs62x.yaml | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > Failed to apply:
> >=20
> > Applying: dt-bindings: mfd: Fix schema warnings for pwm-leds
> > Using index info to reconstruct a base tree...
> > M	Documentation/devicetree/bindings/mfd/iqs62x.yaml
> > /home/lee/projects/linux/kernel/.git/worktrees/mfd/rebase-apply/patch:3=
4: indent with spaces.
> >             led-1 {
> > /home/lee/projects/linux/kernel/.git/worktrees/mfd/rebase-apply/patch:3=
5: indent with spaces.
> >                     label =3D "panel";
> > warning: 2 lines add whitespace errors.
> > Falling back to patching base and 3-way merge...
> > Auto-merging Documentation/devicetree/bindings/mfd/iqs62x.yaml
> > CONFLICT (content): Merge conflict in Documentation/devicetree/bindings=
/mfd/iqs62x.yaml
> > Recorded preimage for 'Documentation/devicetree/bindings/mfd/iqs62x.yam=
l'
>=20
> It looks like the following patch already beat this to the punch:
>=20
> 8237e8382498 ("dt-bindings: mfd: Correct the node name of the panel LED")

Which tree is that commit on? This one?

https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/

> That patch does not retain the LED's label or rename the parent node to
> led-controller, however. The label hardly matters for this example, but
> perhaps we still want the parent node change to follow leds-pwm.yaml.

Should I rework the patch then to have that change only?

Greets
Alex

--=20
/"\ ASCII RIBBON | =BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--h2j7lras76hzpifw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAmABY4oACgkQNK3NAHIh
XMab+xAAiHeOZzBFG4YB0oYV5i8ACoy6/kajEnF698M7uAJyVfCdryYdg9vejNsY
N43fEtfkWgqaNph449fNAFJIzrfCez8Y7uz3HHXaSfPSYkXpDsM+248YuSUEBBV1
AMji0bj3CiUGh4WtVfLBR5L13xeSR/tKKoZqpIaFBgOlsii/8W+Dc7vw2CoFIE6U
Ac4eVKylR8D/619Oij//lMFT3YiEUEsKmH2oiQ21yKHL5IuYMmGJAMZJg3COgVf+
Abn1i7Dln8iz3OMdISlUgClhRpNv5DGXf8U1z3JeaWWK1f0EQYfgMWy8gz8zSmv9
v07Bx90iY8YABFkdIRXJTbm4kKfiZ9WQQepfN2sHuQXvnKM3aKORx6o43fIR/A1G
yaCIsU49ONg/zWQtdLMzXomLdIfhZNx0poREu01GhLVbWNQLtZzTCnVRNfp/tCkz
irqNzETxwk6MjHV2xgY1kJ3Sx4rM/BVX+sYO/fwdKT95v/voCJNob52H16w6TUue
hIKktspa97v9y31m7ejI/8WHMt9Qgb+aHWvRtFaNI7g3XF9UDUxGD5WRzor8a/Ii
MOh2Tr5tS9nl0BdR2iHn4FMWkSwnr8Q4DiQLkvdNW5e4/92ODuMN/q1A66kxiWm5
KrIpfaNcUmg/NBYoE9vnOKej5D8dNQryaiVb6TwSpbVYJ3vVJyE=
=wtKq
-----END PGP SIGNATURE-----

--h2j7lras76hzpifw--

--===============2649343245426222886==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2649343245426222886==--
