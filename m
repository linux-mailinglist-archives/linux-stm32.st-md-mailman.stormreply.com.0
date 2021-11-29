Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0C4461588
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 13:52:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C93EC57B6F;
	Mon, 29 Nov 2021 12:52:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF099C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 12:52:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 572D461450;
 Mon, 29 Nov 2021 12:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194F3C53FCB;
 Mon, 29 Nov 2021 12:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638190353;
 bh=c+hJCgT7nD8Aff6H/94yNwkxSoHUS9aZu/eXKfvl8y0=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=F+SCY/Ud+cOzAn4K76jOmIJ0tCSY55bJL7O4fAog9ys9SIBlonxACgxm5vDQ3XXN6
 e2fRvqkSzdDXJSD2wnfit8fnIM1qWgrOwDiTXPImFCDnzqD65aU2yhJe19L3f1xGn9
 Ogh4KPSftMKimbA7s3ZA6lJZHlEDTCPZo+v1XoI6W6rQkTzo0bBVtTbm+nDXx3L16a
 KDkpec0wwLbf3MxniLust3ItZ13aNPoB8/QvfdEgAJ9riOp0rp8EIeQ266G3yLX+Hy
 M8Y9Gjz/Hc1i1/DTfGikjl0g8HO2P8RcQMyx9erNHwyfWHKws6YWJSbxs7ZJXE9swy
 nv1Xi07lDd7dA==
Date: Mon, 29 Nov 2021 13:52:30 +0100
From: Wolfram Sang <wsa@kernel.org>
To: pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
Message-ID: <YaTNDq7rEyQIopim@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
 <1632151292-18503-3-git-send-email-alain.volmat@foss.st.com>
 <YaTE0f9ciy5JRZ3Q@kunai>
 <20211129123302.GB486850@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
In-Reply-To: <20211129123302.GB486850@gnbcxd0016.gnb.st.com>
Subject: Re: [Linux-stm32] [PATCH 2/4] i2c: stm32f7: recover the bus on
	access timeout
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
Content-Type: multipart/mixed; boundary="===============1020610274515493827=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1020610274515493827==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5hCTBkD/yBfPADtw"
Content-Disposition: inline


--5hCTBkD/yBfPADtw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alain,

> > > +		stm32f7_i2c_wait_free_bus(i2c_dev);
> >=20
> > This does only a controller reset, not a bus recovery with 9 toggling
> > pulses, or?
>=20
> indeed. I might better rework this and at the same time introduce the
> bus recovery mechanism via the bus recovery callback in this driver.
> Please don't merge this patch and I will rework that.

Wait a sec. Resetting a controller at the end of a failed transfer might
make sense if the controller is otherwise in an confused state.

Full bus recovery (9 pulses) should be done at the beginning of a
transfer when SDA is low, though.

So, I'd actually suggest to apply this patch and add full bus recovery
based on SDA low at the beginning of a transfer seperately.

What do you think?

All the best,

   Wolfram


--5hCTBkD/yBfPADtw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkzQ4ACgkQFA3kzBSg
Kbb09RAApgWh5w47oO8V4rNkg78h6Cf6iocL3kiEtiG6Gxgcl/INGRIw02rb0eUb
iMfzC1fBQsdhA49WMXjKTaQ3Y/wcp2ecs7j5IF82NuI5S/zYIuuY2OIMcipfh690
UyDdz/5Vkm9dVak14Joaqm/zPhZuyJiIjq/4ncRerM+lfJ2ebS6yVFyAPwd8/No4
M1Vdtz4HG0gL6GIqO4nYOpk7rVBWGxIQaE0FEU9xCB7T8lUbolSdRKPrnhh7E1qx
NfzvvI1+ANmBaPjOD3ITCqW54wWKPhJJmU+0ymuho0qFHwzqRJvJwS/AvPwNxIRZ
/nsgxX2IVT+eL1D8YtxupdIB5o7JhvsuWQ1TlCGmnNpGTKxdNhwtwVMxqPzu+rS+
F14IZTvcQz0eiYu5s+7TGB5l13RlYsI6RT2cw9J0vniY09uFePDxd4xoe4T2l6ca
994KrTvxgJbJM6Up/A9DDbLUJerAbI1TV+rp6VTGH3fOHEpthkw6g+WZwHQgN18p
eW4RrkfKOyhrkMOD66msHgsnc6wcCMatzdWq5oaLkimFAloAtv2Lv6+m7UG+6A6d
X4WPLE4f6OB/RnrC3ntAJGq7mNygj4CACoMJTSSGuDFrmYOeSAaR3lmLFVd+7Mzo
LMdaovdObwqsZgvVyGHQTF7nGRbIlb5zbrP0MgpT9y5fadY8QLc=
=DxgC
-----END PGP SIGNATURE-----

--5hCTBkD/yBfPADtw--

--===============1020610274515493827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1020610274515493827==--
