Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46828A94B4
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2019 23:12:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6F30C35E01;
	Wed,  4 Sep 2019 21:12:41 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41713C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2019 21:12:40 +0000 (UTC)
Received: from localhost (p54B337F1.dip0.t-ipconnect.de [84.179.55.241])
 by pokefinder.org (Postfix) with ESMTPSA id BF8B72C4F2F;
 Wed,  4 Sep 2019 23:12:39 +0200 (CEST)
Date: Wed, 4 Sep 2019 23:12:39 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Message-ID: <20190904211239.GC23608@ninjato>
References: <20190815055857.1944-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190815055857.1944-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: Make structure
	stm32f7_i2c_algo constant
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
Content-Type: multipart/mixed; boundary="===============5295102623770864384=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5295102623770864384==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yVhtmJPUSI46BTXb"
Content-Disposition: inline


--yVhtmJPUSI46BTXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2019 at 11:28:57AM +0530, Nishka Dasgupta wrote:
> Static structure stm32f7_i2c_algo, of type i2c_algorithm, is used only
> when it is assigned to constant field algo of a variable having type
> i2c_adapter. As stm32f7_i2c_algo is therefore never modified, make it
> const as well to protect it from unintended modification.
> Issue found with Coccinelle.
>=20
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Applied to for-next, thanks!


--yVhtmJPUSI46BTXb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1wKMcACgkQFA3kzBSg
KbZtHRAAhUQXfvaGpBOwnt6QQ5sO9+U8ZeiPYL2IqsqOwOBGhLpWReFjilAKXk2o
8x/xXEaituqT7t2Z/ECReg5oTMQESJBVj3hnbknunZX7etJGj9pbQGDsV9Ou0lPn
gm4JjLPiC12KM9xv1si8lTrYQJp5K14stjXHSE4YW8Xu1W4SQ9lJSHpm+SvtfFIv
6Ddi2F4XIRhx7JYyN/XDW0ABXpJMd4FayJ6G/N+vtd5N2KT9Ee8FdEcjFKD/7Vec
J050E9XXNBYHBfjtvksGwEYxBHdltnsZlmmTOB4fKvmA7L1PqqoTKi4prhGL3Hum
BnitzpIhFP1hjIyIHiOCQWGW0CvN7mmlu13vUaGJnvpKkb3vk+HSxGgxVu3kf8Hp
MXmysO8ZUUOXe8ZLWSCTiqniNtQjlrFujnmYC5CR9q4KLBKZc18ef1GaGoLmHRom
rYo5B4nMZdWntuyVsPK0UzTDJpt3KEFSHqBqJqmBRJGGiIFV8XdyHSmjt0MWLMqz
If4rX7JmgShYUnpoCTM10Y/vwDBAEQ2tXqfhH+AfzU/n+bA9f0Hr+Tqy3V+LASxl
Gp8jQqL34fs7yXc7gswe0t+PSaXM/SVelCTI3M6YIT1IZ2vVLzaowYdIMoTyFLZr
/g0zgz7p8BHKMxnNxi2bhFXKPo6Ary+Do+H+Lx1xOsgIn/UIiR0=
=Tqt8
-----END PGP SIGNATURE-----

--yVhtmJPUSI46BTXb--

--===============5295102623770864384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5295102623770864384==--
