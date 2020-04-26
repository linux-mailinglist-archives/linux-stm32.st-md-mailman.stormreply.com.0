Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7996F1B8DAB
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Apr 2020 09:54:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B65FC36B0B;
	Sun, 26 Apr 2020 07:54:27 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B905C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Apr 2020 07:54:26 +0000 (UTC)
Received: from localhost (p54B33954.dip0.t-ipconnect.de [84.179.57.84])
 by pokefinder.org (Postfix) with ESMTPSA id DADC22C01E8;
 Sun, 26 Apr 2020 09:54:25 +0200 (CEST)
Date: Sun, 26 Apr 2020 09:54:25 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200426075425.GE1262@kunai>
References: <1587394677-6872-1-git-send-email-alain.volmat@st.com>
 <1587394677-6872-3-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1587394677-6872-3-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/2] i2c: i2c-stm32f7: allows for any
	bus frequency
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
Content-Type: multipart/mixed; boundary="===============3490287528347162218=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3490287528347162218==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G6nVm6DDWH/FONJq"
Content-Disposition: inline


--G6nVm6DDWH/FONJq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2020 at 04:57:57PM +0200, Alain Volmat wrote:
> Do not limitate to the 3 (100KHz, 400KHz, 1MHz) bus frequency but
> instead allows any frequency (if it matches timing requirements).
> Depending on the requested frequency, use the spec data from either
> Standard, Fast or Fast Plus mode.
>=20
> Hardcoding of min/max bus frequencies is removed and is instead computed.
>=20
> The driver do not use anymore speed identifier but instead handle
> directly the frequency and figure out the spec data (necessary
> for the computation of the timing register) based on the frequency.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Fixed this checkpatch CHECK:

CHECK: Macro argument 'rate' may be better as '(rate)' to avoid precedence =
issues
#133: FILE: drivers/i2c/busses/i2c-stm32f7.c:413:
+#define	RATE_MIN(rate)	(rate * 8 / 10)

and applied to for-next.

If you could drop the 'i2c-' prefix in $subject, that would save me one
step.

Thanks!


--G6nVm6DDWH/FONJq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6lPjEACgkQFA3kzBSg
KbZ32A//bNuNc1m8uNO3qX4GtIk7gvqICXMOsqW1gDL2FW0PlxR1D4J0jiLwYQQw
PJ+FnD0Enp0TP7IgQ43/gZiZVhqJ0+vnzOYejWHcWM6PXggKVEp2R6+3GxQqcmHt
55tl6t+qDHp4gcRNq0TAT025GnKF8DtiCx35bIVrb5i4mTE18ckk4B5VsrTrhuEk
t6E8aLRADTKpcM3F2FD7jc9S2KXHScNQGYAiYSAQb8eBi1f2kloG5q36lua/MenA
AF/BApIxIYcaKYicSxWsOG3ngQV5EUNUKCjlPAnIYJzjhgTjzjXsBLE/G6C0q/Gb
QzUhobIeFEuVbFNduir0BSF+1Aj9SeIxx5Q83Kh8QgG4bDrpBOLhvkO/ZvXvF+II
9DNyPZSQdrWjB6PWsR0fiJVPtlHWCxnv0Oq0yl182gtNudyqAXMLKl3r0w6Dyyin
20Rl5Idx5NdcBY0iSuuk29XwNVb/7tO4fiTGsUvt6c/aXyCMsm+v7nTXGxoTpP63
/x3ViqpewKGWamsIrMNTYJtFPhLa0AWyl4DLalF6/3TaC3PCJupYXR30e6+CNahk
EFE6tJabxRiQ+4KRosTnWNjgYvyylfO3zt/XnHV/pPDvDR8JBu9hr58UlLzGM3/b
WnzyHk67GbcvggNGpi5qzZQd37P3qSppxpG6u9Jz6Uj4Tv0RWQg=
=TPJd
-----END PGP SIGNATURE-----

--G6nVm6DDWH/FONJq--

--===============3490287528347162218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3490287528347162218==--
