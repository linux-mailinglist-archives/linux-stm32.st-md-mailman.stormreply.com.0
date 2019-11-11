Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C8AF807F
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2019 20:51:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 356FEC36B0B;
	Mon, 11 Nov 2019 19:51:36 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5E5EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2019 19:51:35 +0000 (UTC)
Received: from localhost (x4db75ae4.dyn.telefonica.de [77.183.90.228])
 by pokefinder.org (Postfix) with ESMTPSA id 569DA2C0428;
 Mon, 11 Nov 2019 20:51:35 +0100 (CET)
Date: Mon, 11 Nov 2019 20:51:34 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20191111195134.GG1608@kunai>
References: <1571921521-8502-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1571921521-8502-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: i2c-stm32f7: report dma error during
	probe
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
Content-Type: multipart/mixed; boundary="===============0528941764284556777=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0528941764284556777==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HB4mHL4PVvkpZAgW"
Content-Disposition: inline


--HB4mHL4PVvkpZAgW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 02:52:00PM +0200, Alain Volmat wrote:
> Distinguish between the case where dma information is not provided
> within the DT and the case of an error during the dma init.
> Exit the probe with error in case of an error during dma init.
>=20
> Fixes: bb8822cbbc53 ("i2c: i2c-stm32: Add generic DMA API")
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next, thanks!


--HB4mHL4PVvkpZAgW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3Ju8YACgkQFA3kzBSg
KbZO1g/9Ejg7dTPbsECJT9cFjP1yXrbGjFWabztNPI9cB407mc32FMMHolmR+e7t
Qar4sss2ieh/Rf+AG13KAk5y8VQ+0ioVReojH968fYVPPOxrx2G58rhOYiZnvz8p
BWZ6/wJGn66eJtSP7OfdyXKdDuewHrlE0GWx0hHxhEf6clN4bSbKyvcUIEUu3Z0R
91vC3pIxRY+6uEGSeFSnl+2m+zClqdP8kdAHW0vpNzPjjkJyhLWZTi/So0CN4Ymc
mL2MEAI6Epl4MADbMqXvSFViGbDeTMfK0WVnxnWIKCivOviWwbvzb7RGf+uF8wzG
mOX3rWgyHWe6laUDpvsVJ8gqJ7kQbEXAKitU9ERmFAmUSHGwjx69zWM8S4aF7J7m
sBkXaU7tp1L56wtoiy/v3UoDVMAkYkcTj6pXwsINgvNE44GslOdbHQwdd0p6Elgb
ivH0H7Sv+mRZU9ZPYot8rG4jKg2hQKS0dpKWo7d5nCmWf0unpRCmKxBSjdi8Kddr
8Qp4BXyjPm3GhsELW+Cpwz2n7VBcxRfHXW9v8BAng1pqgBkShfpB4zT4sLcltRjj
3+TfkDPjpqPGjmQRozWvSP5E34HXR7luMWr2TrD/2wxOsBZr6+q0TDOj3Uii6cxx
ZeKVrXSY1Xgg5tboDZSEYfY1WrsIfUF5NKduYnc21SsUbsQ+z9w=
=XSn5
-----END PGP SIGNATURE-----

--HB4mHL4PVvkpZAgW--

--===============0528941764284556777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0528941764284556777==--
