Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB6514E8FA
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jan 2020 07:56:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C29B8C36B0C;
	Fri, 31 Jan 2020 06:56:56 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D171DC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 06:56:55 +0000 (UTC)
Received: from localhost (p54B333AF.dip0.t-ipconnect.de [84.179.51.175])
 by pokefinder.org (Postfix) with ESMTPSA id 721C42C0830;
 Fri, 31 Jan 2020 07:56:55 +0100 (CET)
Date: Fri, 31 Jan 2020 07:56:55 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200131065654.GB1028@ninjato>
References: <1578317314-17197-1-git-send-email-alain.volmat@st.com>
 <1578317314-17197-6-git-send-email-alain.volmat@st.com>
 <20200130083927.GH2208@ninjato>
MIME-Version: 1.0
In-Reply-To: <20200130083927.GH2208@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/6] i2c: i2c-stm32f7: allow controller to
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
Content-Type: multipart/mixed; boundary="===============4892356710775833163=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4892356710775833163==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Content-Disposition: inline


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2020 at 09:39:27AM +0100, Wolfram Sang wrote:
> On Mon, Jan 06, 2020 at 02:28:33PM +0100, Alain Volmat wrote:
> > Allow the i2c-stm32f7 controller to become a wakeup-source
> > of the system. In such case, when a slave is registered to the
> > I2C controller, receiving a I2C message targeting that registered
> > slave address wakes up the suspended system.
> >=20
> > In order to be able to wake-up, the I2C controller DT node
> > must have the property wakeup-source defined and a slave
> > must be registered.
> >=20
> > Signed-off-by: Alain Volmat <alain.volmat@st.com>
>=20
> Applied to for-next, thanks!

And I will drop it again because buildbot rightfully complains:


> Reported-by: kbuild test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
>    drivers/i2c/busses/i2c-stm32f7.c: In function 'stm32f7_i2c_suspend':
> >> drivers/i2c/busses/i2c-stm32f7.c:2199:44: error: 'struct dev_pm_info' =
has no member named 'wakeup_path'
>      if (!device_may_wakeup(dev) && !dev->power.wakeup_path) {
>                                                ^
>    drivers/i2c/busses/i2c-stm32f7.c: In function 'stm32f7_i2c_resume':
>    drivers/i2c/busses/i2c-stm32f7.c:2218:44: error: 'struct dev_pm_info' =
has no member named 'wakeup_path'
>      if (!device_may_wakeup(dev) && !dev->power.wakeup_path) {
>                                                ^

wakeup_path is only there if CONFIG_PM. Please fix and send a new
version.


--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4zz7YACgkQFA3kzBSg
KbaWShAAsD5Gaj6lEFcuVH415Va4PzT6S2H3CUZIfq7iTBdNKWV8nvABcAaS18FA
WY9qmpili5WRVugYU+1X4rxzEnSPiO6Sx5s9HGZHPefRlr2B99BknwPRCRkwWb6g
vGNROAZh+qQuTayJ2UH33dSGtjXQ09KH4uDrIeRBoxWRuOlhxOe1FBmwudzEC4UM
g3nCUq94rccym19fNkWxATy1RCwd2LZF4RRjj2CQLW+o41hUa/Vtb953oxjKPZHo
p6lNncLSls4myb0yyqLEfnyFgOaopM7kOaTsgZAElto7WptLPtrcv0M6pCuZGeQx
jFEqtZqSGNQsnlv4kZIei/Cnwp/zP1wgsHblLH20w1AuKAwq0G91kysEIH6OYak/
HUL09BSJ25ZVEKDOonq/bIVPlxSvO5C0SYkq+YjgY5ojSCWWLF8ThkUCayynCEu1
qsLn6oY7bB/8qqpiqPb+rx6M5ZuLLz3RKQmv28WuV2Oyl/KPgjtBXQ4KDG8l5fxI
bUGHLyMdiyGFoK64lppvjAWp3WSsN8IvcVfRrl7HfTgZ+iGONbCs+ZYVQ9Y3i1gw
APQl4R/vack7OumxG6wFjRvEpPDfwDvaR6A4yxpi62mp+YwP9NZ93pduvhqrF/DB
XMvJqyy4aMLZFDC1ioWldHX8FuFEXLqc2BULX/o0S92ZKSRYVc4=
=wM4/
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--

--===============4892356710775833163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4892356710775833163==--
