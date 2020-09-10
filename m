Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A01264339
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Sep 2020 12:06:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE745C3FAFE;
	Thu, 10 Sep 2020 10:06:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2829C3FAE1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 10:06:12 +0000 (UTC)
Received: from localhost (p5486ceec.dip0.t-ipconnect.de [84.134.206.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CA7A20BED;
 Thu, 10 Sep 2020 10:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599732371;
 bh=eIs4Saiw+133hqlCLXwCeWfV39nXcWZNtgt8DRHyIgQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O5ac4xErBk7BTcwJSFCBWKSt06o5l2XIydsRh9gB18QV0Unf6Fy5rao/c+zFB59aU
 HHw1uK8iv7hTw6AieJEuHYXyC5GVoXhofvaRyjDjrIhcvmOh4U4eDZMWyWDgh9523y
 H5LenXnZSeQUzPHiDicb6bCjsn6qmzPbJCo+lLaI=
Date: Thu, 10 Sep 2020 12:06:07 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200910100607.GJ1031@ninjato>
References: <1599730349-2160-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1599730349-2160-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32: do not display error when DMA
 is not requested
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
Content-Type: multipart/mixed; boundary="===============6475985229385912972=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6475985229385912972==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T4IYkFBVPN84tP7K"
Content-Disposition: inline


--T4IYkFBVPN84tP7K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2020 at 11:32:29AM +0200, Alain Volmat wrote:
> DMA usage is optional for the I2C driver. check for the -ENODEV
> error in order to avoid displaying an error when no DMA
> has been requested.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
> This patch should be applied on top of the patch [i2c: stm32: Simplify wi=
th dev_err_probe()]

We can do it in this order, it just makes backporting to stable kernels
(if that is desired) a bit harder than a self-contained patch. I am fine
with both approaches, but just wanted to point it out.


--T4IYkFBVPN84tP7K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9Z+owACgkQFA3kzBSg
KbbUKA/+KTSoRH7YFrNpcdKxwqC6ptIuUxtoiGHylyvgNwJHVhKqkZUgWRVHriJ1
aKzYvs+yRqbCavro4dsUyfcQuGUMiTtFd0y01cw7+HjPpJrkeTXwsn08Ongk1rJF
vveoKMep7H1Zey1Da0LRcEUi/AcsJ+k3D81AZkwmrAOd3zR2/bKSNhGxYzxQZ9pd
QvPI2LzcKy6wndnycDcMtOoXstFn4GKm936TsYYhKKZ9rnAQhttLzVGriJhRZUHb
xRD35j7YMCa3jctQGFyIcF0aXDHvjM4dsPKNw3Zd/SxEd4rRb7Nfjm2G9qFHWbQq
Z6lY/pcmi7vez8LNl6iYRoVWsmvHOWLCUijmZzgGNTDZ1Q1uuQUn5NxmSkBqI3Eo
veZhypF9MPwVTalVcC7mJWRu6LgJxneLqIOfLqHHPk40iZewbFIMPzOclJhsC0Lz
O9XC9s9BxXROggJmd47Y+yfAGhftXOMcwYuIDwvOBo4OYrRNIUvYJ0TESfSch9Ac
MFcC/MINTsuRulclYQX++ITYNa+qg8qs7TAavl+h7rlFT5KuU71Ushm17gZqLTO3
M7nxKWohyFqpdoTCBt3VPHPVYSvGW9Zevd92crEZ2dqbTJYAhxC9oycTBuikSZPP
extoO8W0+oZ8ThZDSgCU1fIr0zZvs4mNWWHGwgt76qvTOuRhnY4=
=f0DT
-----END PGP SIGNATURE-----

--T4IYkFBVPN84tP7K--

--===============6475985229385912972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6475985229385912972==--
