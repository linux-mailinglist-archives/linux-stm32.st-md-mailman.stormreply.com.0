Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B64262A91
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Sep 2020 10:40:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38AC2C424BA;
	Wed,  9 Sep 2020 08:40:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D112FC424B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 08:40:00 +0000 (UTC)
Received: from localhost (p54b33098.dip0.t-ipconnect.de [84.179.48.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B617B207DE;
 Wed,  9 Sep 2020 08:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599640799;
 bh=BbnDVHB8A3xGCPsPhdOsOXW5HCi8ljWrh90xTXF0bG8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lm6hFqTbTg7XG5FwExZc+8SS+2F4VxeNefAxyj38zMMcDUrf16thfT2z5N1BoWUcZ
 NkmTTNhjIxYA7OvakAlhp4B6LXbI6kHDsx3b6qLyixiwgA8o7cPcB6eIFkEPz9UyzG
 c7UkZA46xf49/6S7o+uWOz/a3MnsN3ZKsqshDTxM=
Date: Wed, 9 Sep 2020 10:39:56 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200909083956.GG2272@ninjato>
References: <1596431876-24115-1-git-send-email-alain.volmat@st.com>
 <1596431876-24115-3-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1596431876-24115-3-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/2] i2c: stm32f7: Add SMBus
 Host-Notify protocol support
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
Content-Type: multipart/mixed; boundary="===============0928602355481336586=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0928602355481336586==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2E/hm+v6kSLEYT3h"
Content-Disposition: inline


--2E/hm+v6kSLEYT3h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 03, 2020 at 07:17:56AM +0200, Alain Volmat wrote:
> Rely on the core functions to implement the host-notify
> protocol via the a I2C slave device.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next, thanks!


--2E/hm+v6kSLEYT3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9YlNwACgkQFA3kzBSg
KbYZxg/9H/2L3ghZ/LP17brMo/1wYK2lflEHShTBQHcbVNg82QaXJn8CVoh9lfwe
npimgd5SZXQWD6gXfMbS+ddR2YkVw5VM4RG8w72Ga6fmY0xoqWlf5Ynew2opCRC/
HaDTDuOKrSbMvTCTIm+9QnUyjBPNABXqteamcT9Tk4j7XfmBNt9f0e8o1kEvCxSg
gsbYnXWDDe7XSj65uY0NLcYsmyuRWiP0yWZmKmecitPS1UITrrJ02XSZ1Wd0hDTM
0ymGLf2UhNgLI0rc4odRb03aFzDxBt6NpgqfW7Y9jPXq3cA7IOc5Vh76aruJ+hnT
gr+7bY1wDmbbp/uWN23z/XC+tPFEvO+DC9pecuBUEBKAsn43HxR4zRB3to1Sa392
VpqBlT7gT0Mk7iYQvry8pqc5WO4eSzZNUUl+kNJE2FVjZj9Fvt9M4khglacz+sKi
eCI+fmKlsY0IhUvaGksjztRES+aZXWSzfYfv+IvnQCDipUrua9r4cjKa8z2Q9Qzu
WIEAarMjZoSAKNpyX7ObWTZ1pJCNFx5NBxrSMzJxrntzGqBK0MSUxRnEMRTBVeb3
1M95a8yxD/qT7WC25jxRQZoEa/Jy8r5G5NKmB8wD5dWNANxzRpc2Y1/vpqJySp+R
fcKixlnlm1Dwd+AfL+5WCkMz8ZZuZqhZuGv2+NH0VvHab+xhCVM=
=uIIc
-----END PGP SIGNATURE-----

--2E/hm+v6kSLEYT3h--

--===============0928602355481336586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0928602355481336586==--
