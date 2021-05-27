Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D70D939365C
	for <lists+linux-stm32@lfdr.de>; Thu, 27 May 2021 21:35:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F401C5718D;
	Thu, 27 May 2021 19:35:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3133C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 May 2021 19:35:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7100F6124B;
 Thu, 27 May 2021 19:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622144127;
 bh=U2Ze2Z48ItKiHpTqteWjO2nJqG7zIKVcG2c08EhvewQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CD+uXfgaxYOXJUBTPXIPNeg+T4KdnGkSTyOwAjvb7nVfclpNSRweZKgKK1h/LTVHD
 KX1t/PuDrv2QCBm51LLEvCGTdUnJrLhUhFUiyZASGiNLhesrw1bT8IlzgsC/VaNq/3
 bCs0IWcVqUHULH+YToBd7EUp5XQh6SwhGopgmEuW3nMg5AbV4jkTpLzdzJMWw9iruy
 LAjZUjtRVAVZJeTBtZhC4aBrbdAc/xJ2l+saExvjwk7NcLdcFAdSiVsieqyocvEb9Q
 uHjSYGIvs+9ycKLL6GhuJZJBncZ9bB23AQ5H9zrrHZ6U8aWHAjr748ExY/578lLbyT
 i5jy8ZZnqPDnA==
Date: Thu, 27 May 2021 21:35:23 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <YK/0ey8dDl8kuOZq@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Cedric Madianga <cedric.madianga@gmail.com>,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-15-lee.jones@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210520190105.3772683-15-lee.jones@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-i2c@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Cedric Madianga <cedric.madianga@gmail.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 14/16] i2c: busses: i2c-stm32f4: Remove
 incorrectly placed ' ' from function name
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
Content-Type: multipart/mixed; boundary="===============2999690523809754118=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2999690523809754118==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S7uyhsFHR0thk5i6"
Content-Disposition: inline


--S7uyhsFHR0thk5i6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 08:01:03PM +0100, Lee Jones wrote:
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/i2c/busses/i2c-stm32f4.c:321: warning: expecting prototype for s=
tm32f4_i2c_write_ byte()(). Prototype was for stm32f4_i2c_write_byte() inst=
ead
>=20
> Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Cedric Madianga <cedric.madianga@gmail.com>
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied to for-current, thanks!


--S7uyhsFHR0thk5i6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCv9HsACgkQFA3kzBSg
KbYbFA//S1EmqAqycU4fQVwttYYM2h36NbcLlkfMWsKPxSZv1LZ0wyxiCehpR7mt
JmFbV+SnTonx85xv5xYW349Lu6ol4J/7tMs+dFIVyW4y3S/fqMo+9BkVXicc3BeY
nxQ0a4VDIp5c3+mAwJVtoUF6UWkYhIYvOxc2Q7ZlcG1dmEppNrNyi/61ZtEEsZ4m
xaIdW+OlClETZtZfudSF114LKikQExSToiByPA5yvhcpsMY+umPqJkzSMl8Fd4Sw
6BhHDpxpHYC+MKPqCnjW1JHZNRDLuV19J4gH8W/rEfSld3WBQwKJTn9UT83HbDCS
L+n5qEx4HJEJdXFOcjxGNwyKYiy1DlzDk4rH73zUxT+K0x3qDLTTAdLMk1mbmIOI
Dgy4SdeloOwAIpF6Bo1jWjosMWnFv+xy6UOXSG0AT6oHMEN4DwJIn4cplXAcfj3R
Ekj3TyOugmP/Zdi7HVVU4viUavbDBaygxL0XJLLp1KDhPRxN7+tKoGtVTAzEzb2h
pDaBmiU/iJ2BXOZ7/u3Vutfid58eqw1kLGu9v2VCfPaDBofMmYotV/366UBbj2QK
AFBv/4VN33MXzlRPDa9hRRrLMqd2gHN86g81qMaj43gM/3eYO4hmXjehpn9wmPx/
zSGaIFH6MHw5P5mfwoSa9FPZnlNfyXb+4vO4mJ3gedlQ29KuLFU=
=ZtQd
-----END PGP SIGNATURE-----

--S7uyhsFHR0thk5i6--

--===============2999690523809754118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2999690523809754118==--
