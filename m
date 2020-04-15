Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EE21A9B98
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2020 13:01:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1E47C36B0C;
	Wed, 15 Apr 2020 11:01:03 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1BE8C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 11:01:02 +0000 (UTC)
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
 by pokefinder.org (Postfix) with ESMTPSA id 2CE8D2C1FF1;
 Wed, 15 Apr 2020 13:01:02 +0200 (CEST)
Date: Wed, 15 Apr 2020 13:01:01 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200415110101.GM1141@ninjato>
References: <1584642115-15378-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1584642115-15378-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: i2c-stm32f7: improve nack debug
	message
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
Content-Type: multipart/mixed; boundary="===============0288533123567495549=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0288533123567495549==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oiL9LJXJsdjS5rzq"
Content-Disposition: inline


--oiL9LJXJsdjS5rzq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2020 at 07:21:55PM +0100, Alain Volmat wrote:
> From: Fabrice Gasnier <fabrice.gasnier@st.com>
>=20
> Add information on slave addr in the nack debug message.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next, thanks! (I'd drop the __func__, though; doesn't
add information, does it?)


--oiL9LJXJsdjS5rzq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W6W0ACgkQFA3kzBSg
KbbB7A/9EmAD4ef/5loAXglkahpH2UJci8WgDL5JIyHmGpZKPB2FhoVScwPzkz/B
DflvRJg4S7nQBvVe5o1ewFgNW5mH4M0QTAEA8tyE7irUfAxZR0FH7C6ub95v8JKs
eakWVl4yeoDOkQMJRQZEF5yq0ra0ASjFAt3b0YgxLGJ3TRuC1AGJ0Iwm9GyFAaK9
7jhntL11lD24Thyw+NhYbK4a4VZNFZMDemq4+5ZtlKVHUs6NjrhAY2E6panB5BBd
nANADQQv/hXHgxEscLqtGrCx5CTfVvYd3+v78q+ALi2Sj1pVBie4wUvT8Ev5EA35
t8V9MGWNS4R5K9+7qU78vkNzbm59xteR7zYJOzOQYFOofsbWR9t/l90w0vxT2VKv
7OyQ6S1V2doz+oaIGQaGXBdl9t9ObXAyZfOvyDpER4Ot6D8hToO7FavQJ15o0Rm0
uahzgFBdufsWy/ltSSIio0HdjNT9mWP2YWlc2HsLrx6GtzQ7epdTVCjQ72q33kDC
9QAeJ77rN/BVfZmKsaq1RjtP6A9LFSy/hVIqLnBl4uVDoHTx1bBCTexiVVXOROEu
TBEpcU57cwC1wZ39KfJh74lyV1JAnOhPw81e5C0Rd6wyEm07DBhvpAhcfzR5T4R/
NcF6tc6ANE8t8lGsPoYwwlcTgNrxh+BBKwy5yFERn6bHYOV71DI=
=52zH
-----END PGP SIGNATURE-----

--oiL9LJXJsdjS5rzq--

--===============0288533123567495549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0288533123567495549==--
