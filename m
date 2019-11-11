Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D967AF805B
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2019 20:42:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90C36C36B0B;
	Mon, 11 Nov 2019 19:42:06 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4F7DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2019 19:42:03 +0000 (UTC)
Received: from localhost (x4db75ae4.dyn.telefonica.de [77.183.90.228])
 by pokefinder.org (Postfix) with ESMTPSA id 985922C0428;
 Mon, 11 Nov 2019 20:42:02 +0100 (CET)
Date: Mon, 11 Nov 2019 20:42:02 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20191111194202.GD1608@kunai>
References: <1572012264-31996-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1572012264-31996-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: i2c-stm32f7: fix & reorder remove &
 probe error handling
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
Content-Type: multipart/mixed; boundary="===============3981300626292975280=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3981300626292975280==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VV4b6MQE+OnNyhkM"
Content-Disposition: inline


--VV4b6MQE+OnNyhkM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2019 at 04:04:24PM +0200, Alain Volmat wrote:
> Add missing dma channels free calls in case of error during probe
> and reorder the remove function so that dma channels are freed after
> the i2c adapter is deleted.
> Overall, reorder the remove function so that probe error handling order
> and remove function order are same.
>=20
> Fixes: 7ecc8cfde553 ("i2c: i2c-stm32f7: Add DMA support")
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next, thanks!


--VV4b6MQE+OnNyhkM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3JuYkACgkQFA3kzBSg
KbYcnRAAq1jv0t+cBFdjV0cAyRRX0WL1Iv9MAU84u/vxXm3x5WV277AuXXWzofmd
XqKJsLIq6lSoh20bC+LHePMkmQ+T8oX6C8c4wjmqzls5Uq2St0evOX39JoQa+yFu
Q+/S1xdhPIjOzqJbwtEw/iVZ3KaHzEsTJEBpQEhH786eiv1vfkUiAKFrJ7KLSEMs
BUsNPYE/b+EasW9rylAPjoVp6ALXxPU8ScXQq4H8mh7Ifvlp01kx8Vi4ukI0niXQ
W+VtoiCxEjRTIx9EaeVZAzcbVouvePqp8hB7GP5+ys5s8bXaTnJcSc86Uu5tY9Ax
0oZ1s1irGqpDz67hb5inyDvC0d0cvhaqNcqW5Ez6tCA4A0sKYETGfRWXMmFIbNTd
8j8M2Ecq+twpTpwoMwtYMLwkFJvVhizOM7MSYctisgGkhZcLzNVq2CzJ1bEIVk3I
qSQT4JfDWiVCpt/aUSrxdrzAarpbKIbfKmBtNlXKkOu2g4QTioty1LxntndndIpC
HHgk7ZuoqnDk2IQdzv7MJiBDVEmAZICPCZ/dESjNnZuQ/W45Iuc28CZiYpDW+mmh
64zfpSo/jAp9ZVoU0Imp+zKCtuqldEEAScptvP3e06kMuNsZRuShAl1DAudYfFIf
Y8NeKiE3ex/XEW5c5jLlt7o9oc0ipoOd0CPALRJjXnjyl4DICFE=
=exY/
-----END PGP SIGNATURE-----

--VV4b6MQE+OnNyhkM--

--===============3981300626292975280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3981300626292975280==--
