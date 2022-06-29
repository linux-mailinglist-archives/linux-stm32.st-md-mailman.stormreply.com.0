Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0968560A87
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jun 2022 21:44:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55EFDC5F1D7;
	Wed, 29 Jun 2022 19:44:44 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 146E5C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 19:44:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 997FCB826B8;
 Wed, 29 Jun 2022 19:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88BB8C34114;
 Wed, 29 Jun 2022 19:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656531881;
 bh=zcGOsPeA4W/M19Cgq+IwJ/rAzjsEafamsLVcy7I5yLQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cPWGo7pLf0mgj/MNOxCOX27vIibuw8MAfmAJGIPv9XA9WtnMF6wC5ApvhPADMtQIT
 q6tiqC2dOi7OySO8mwFMx0iHgrAggfdzVxRCeAdaNutMWVbj7oiMveT/d9rkvhrkw1
 1Ll7kkDmOwtrK3BMYVa+1jNisHMsVVult2XM9mj1T8XWwHu4EiMrVRCzbKSMl3JR6S
 XuUF3eznTOr6zK6XyPE5dI0nRHESP6AEQl11at1U9hddcXNTnXFbIbRba+rG9y+bsq
 pens3xirkM/Vq9F2yCQ/qHSMxXKCqHa0wZ6scAPpA6r30VkWa8tccw5w14QmasyBe9
 QWrhyxI4DqVvQ==
Date: Wed, 29 Jun 2022 21:44:37 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <YryrpbBKsAKcL865@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, Rob Herring <robh@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>, mark.rutland@arm.com,
 pierre-yves.mordret@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <20220620105405.145959-1-alain.volmat@foss.st.com>
 <20220620105405.145959-2-alain.volmat@foss.st.com>
 <20220628134115.GA345270-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220628134115.GA345270-robh@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: i2c: st,
 stm32-i2c: don't mandate a reset line
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
Content-Type: multipart/mixed; boundary="===============0982935737481161858=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0982935737481161858==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ekIVSbt5ZRWqdhEl"
Content-Disposition: inline


--ekIVSbt5ZRWqdhEl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2022 at 07:41:15AM -0600, Rob Herring wrote:
> On Mon, Jun 20, 2022 at 12:54:02PM +0200, Alain Volmat wrote:
> > Update the dt-bindings of the i2c-stm32 drivers to avoid the
> > needs for a reset property in the device-tree.
>=20
> That is clear from the diff, but why. Some chips don't have a reset?=20
> If so, this should be combined with patch 2 as part of changes needed=20
> for a new version.

What do you mean? Patches 1+2 should be squashed together? I can do this
when applying. Or do you mean something else?

>=20
> >=20
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 1 -
> >  1 file changed, 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/=
Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> > index dccbb18b6dc0..8879144fbbfb 100644
> > --- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> > @@ -94,7 +94,6 @@ required:
> >    - compatible
> >    - reg
> >    - interrupts
> > -  - resets
> >    - clocks
> > =20
> >  unevaluatedProperties: false
> > --=20
> > 2.25.1
> >=20
> >=20

--ekIVSbt5ZRWqdhEl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmK8q6QACgkQFA3kzBSg
Kba/dw/9HiqC7hJIBjmzkeSy2RQELIZxZbWbGpNm2r2PFwEhYqgVfFYAXgAm+YB7
zXYq6y1hi+DdkIInEftxL6y32UoEJ5Lh4BKBgPskMOyb/3/sdtZAc/FGUMBAhOXy
pgtnuoYhDYTXL9ztsyzzML1pfm/tjgQPItYdByQWFOYpDh5mIQeGrwbFZhSfoQRQ
Jo9MKsOdRr0OoGpmP4001aIjWRzU8v8tqqKi+C5JyBqQFZH8bvNg8j8CDZro+hCk
8M4g4ri23oxozlJ4ZUiWga9U5uBuVThfAlbHuT8nnvZQWJYhpNHjFiG3W+Qt1JiF
DeEEPKEA8fvbMdK5Wv0dSDbMBdAYvabiTVmLzPolcEiHcHkdMMfxLc6QVnmKD1l+
g392htFKjRQgMbzDWnDbuELiIVksqhyGeJZAvYqO2igbvncsrGNCs/sVu7vg5Mrk
ySfMvobGm1RRbcz8CUVFd6Xmb+C4EOHY6WzVW6bPlkoiJZzm602C8a0lODXg03YG
gYZH4odaoPbYaOrC56DriIxtZpSsr6+LHns6GQyU0B+RlPnYd0X5VQOiXI7Z6MSd
I3DXom1RV0uUiK8jpy0Upiv/PnEk/soU4mc1SNypY9BLnP1Oy78mhxpPuzVF8Sso
xGgKBPJYlJKKo72hqTwyOvIPEjfMgAmxUiy6o8izpq2WIvG9Tvc=
=aKQP
-----END PGP SIGNATURE-----

--ekIVSbt5ZRWqdhEl--

--===============0982935737481161858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0982935737481161858==--
