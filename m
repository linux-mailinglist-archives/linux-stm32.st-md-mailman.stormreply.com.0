Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DAC168EDE
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Feb 2020 13:34:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE15AC36B0B;
	Sat, 22 Feb 2020 12:34:08 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 996B0C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Feb 2020 12:34:02 +0000 (UTC)
Received: from localhost (p5486C6B7.dip0.t-ipconnect.de [84.134.198.183])
 by pokefinder.org (Postfix) with ESMTPSA id 2BC192C07F9;
 Sat, 22 Feb 2020 13:34:01 +0100 (CET)
Date: Sat, 22 Feb 2020 13:34:00 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200222123400.GF1716@kunai>
References: <1580752328-26009-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1580752328-26009-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCHv2] i2c: i2c-stm32f7: allow controller to
	be wakeup-source
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
Content-Type: multipart/mixed; boundary="===============1712133958165325593=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1712133958165325593==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Il7n/DHsA0sMLmDu"
Content-Disposition: inline


--Il7n/DHsA0sMLmDu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2020 at 06:52:08PM +0100, Alain Volmat wrote:
> Allow the i2c-stm32f7 controller to become a wakeup-source
> of the system. In such case, when a slave is registered to the
> I2C controller, receiving a I2C message targeting that registered
> slave address wakes up the suspended system.
>=20
> In order to be able to wake-up, the I2C controller DT node
> must have the property wakeup-source defined and a slave
> must be registered.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next, thanks!


--Il7n/DHsA0sMLmDu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5RH7QACgkQFA3kzBSg
KbbVzBAAqGtkUF4TZxt4ODn2bDGGVNG9F6i9rjjyI5ug25RWTB+ROjLWYiY/bhb5
aD74gBZY53Ec+Oux/YKTbTXPLdDZDWJch34GZSa/qGJzgOjWOOp0CzNN0pX+pxBW
VBhyTL9JP0UIMXypSoTc/1toTIrw6GBmT7j+/l1egUQWERrqzyEnkO0AG9hsSdy+
9NWnRmF4E4BqvBvguJWv5LxKut+fk4cimN1r09kc8Fu/D+2O0rsOwk6h2PWPEtWw
jxBQDQm6j7tChzipyzmUOQmNv9uG2fNxoIqdgl77y9b3bpRPRi6zjHlEpYU4Q9PP
frijrpx432VHOdR83b9Als8S6XV6rK0MffKtiw6dBwnljkwPsPmnrKAePHwBFW6j
mftKGaSEBFaiA1NfUJQJFvQovtUhJtHnQ4FafWoAv9UdfJEs/P/styAj7xMQ6Z/i
0q2c57ntHfCoXxBNTRGuiG+jw35avYfWH5yfvjQhUr2H6bDXWU5SLcnuhPraWSWV
3JqQuz8eGCig/FP96ZUsb3o1PIsNsQjFIZT81H9Gqc8FvS6wf1SEqvUHClVMvz1w
XY/hFcwAifYIOVKTIjoEYB7xdyV9Pql9d2gKeCwCzMVIQ02ULc+QDdgWJa0Cffjl
L57oZYPgRksiZPh0hS7QdyMaf2WA1vFNLIA8+sJ80xHBtEGop+A=
=+Wcg
-----END PGP SIGNATURE-----

--Il7n/DHsA0sMLmDu--

--===============1712133958165325593==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1712133958165325593==--
