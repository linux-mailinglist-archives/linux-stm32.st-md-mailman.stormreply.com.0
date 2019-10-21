Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2686DEE8D
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2019 15:59:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A61C2C36B0B;
	Mon, 21 Oct 2019 13:59:12 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E66FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2019 13:59:11 +0000 (UTC)
Received: from localhost (p54B33572.dip0.t-ipconnect.de [84.179.53.114])
 by pokefinder.org (Postfix) with ESMTPSA id C76372C0076;
 Mon, 21 Oct 2019 15:59:10 +0200 (CEST)
Date: Mon, 21 Oct 2019 15:59:10 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20191021135910.GA26782@ninjato>
References: <1569919869-3218-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
In-Reply-To: <1569919869-3218-1-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 alain.volmat@st.com, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: i2c-stm32f7: fix a race in slave
 mode with arbitration loss irq
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
Content-Type: multipart/mixed; boundary="===============1095577433624488479=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1095577433624488479==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2019 at 10:51:09AM +0200, Fabrice Gasnier wrote:
> When in slave mode, an arbitration loss (ARLO) may be detected before the
> slave had a chance to detect the stop condition (STOPF in ISR).
> This is seen when two master + slave adapters switch their roles. It
> provokes the i2c bus to be stuck, busy as SCL line is stretched.
> - the I2C_SLAVE_STOP event is never generated due to STOPF flag is set but
>   don't generate an irq (race with ARLO irq, STOPIE is masked). STOPF flag
>   remains set until next master xfer (e.g. when STOPIE irq get unmasked).
>   In this case, completion is generated too early: immediately upon new
>   transfer request (then it doesn't send all data).
> - Some data get stuck in TXDR register. As a consequence, the controller
>   stretches the SCL line: the bus gets busy until a future master transfer
>   triggers the bus busy / recovery mechanism (this can take time... and
>   may never happen at all)
>=20
> So choice is to let the STOPF being detected by the slave isr handler,
> to properly handle this stop condition. E.g. don't mask IRQs in error
> handler, when the slave is running.
>=20
> Fixes: 60d609f30de2 ("i2c: i2c-stm32f7: Add slave support")
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Applied to for-current, thanks!


--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2tuaoACgkQFA3kzBSg
KbY98A/+L5w+rU+ZlnLyPHs8O2CoyNVWD0XjDnXAYbAwpuCKQBjMjaTmom8/ucQM
JU86jNaLS9KM3yL8bhXnPiuXit/DXnq484npH49uK+GTVFK7pnVNu/QhBuLJzXPO
xvO4glb1xpFoNHAA7o16T4EQvK5YfZFmdxcbqPVxNfNOyxIHxwBkb5ZQHQwdVNvq
8izptQqmRWwm6DUQj5Cnbd3DOghf73SBMarADbzZOIJn2yIKNInWJTw18WY+sj8T
ayrS0KbcITMSbiArT5on/5Vwv0tM5uPYKilQPUR81YDSpZTidmXRblR04h5MS3or
j41iqKTldQ1xCBG/V9Z1unE4d3CWtBzGQD55UlBlzkvlV+kFsN8EjkW2Ow4HCIG9
Xn1NbcBvhidymJe94yGgu+YhUVmj5web+EjqLwZoodofg4fxZXRDWHYE8WMUdB9R
aYv6JERZJq0TSdr1kfGa2lB1FCzMAvtlyH+nnRQsskYHoVWgco5j/VSHfxnQog8+
O3Doke9VfMtAyOyYmKdogBD5jeO/iZJGLjE/LVC/jnPYVNI0psVD5ifeT1WZprqU
5JnzBK5JVMZxFrP20nT6ZBdGWFi9YygUHF7tichu6LAk+lCZddE9g9rHghVwMlwN
/RjlN9Ada2ceFOp3MzL2R4WORf1WZgAPSjrU2Tpz7CRuy0K4r3M=
=Kfp4
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--

--===============1095577433624488479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1095577433624488479==--
