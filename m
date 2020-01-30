Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3CB14D7CE
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Jan 2020 09:38:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A37A2C36B0B;
	Thu, 30 Jan 2020 08:38:12 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F005C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 08:38:11 +0000 (UTC)
Received: from localhost (p54B33261.dip0.t-ipconnect.de [84.179.50.97])
 by pokefinder.org (Postfix) with ESMTPSA id 0929F2C0697;
 Thu, 30 Jan 2020 09:38:11 +0100 (CET)
Date: Thu, 30 Jan 2020 09:38:10 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200130083810.GG2208@ninjato>
References: <1578317314-17197-1-git-send-email-alain.volmat@st.com>
 <1578317314-17197-5-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1578317314-17197-5-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/6] i2c: i2c-stm32f7: add PM_SLEEP
	suspend/resume support
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
Content-Type: multipart/mixed; boundary="===============2466851235364483951=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2466851235364483951==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oOB74oR0WcNeq9Zb"
Content-Disposition: inline


--oOB74oR0WcNeq9Zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2020 at 02:28:32PM +0100, Alain Volmat wrote:
> Backup/restore I2C registers as part of the suspend/resume
> handlers. The device is marked as suspended to ensure that
> transfers are rejected during the suspended period.
>=20
> Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next, thanks!


--oOB74oR0WcNeq9Zb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4yle4ACgkQFA3kzBSg
KbY32g/+MsJU/Mz6bHmAAS9cTmzSotAvgy/o+WUUunotmJ7EHIyl25iZjMCFrs2z
Xi3Gk59qbPt4oMVu1wQNhT7NDbvjyyfltJPFyRjevxMfBKwcMGdd6lI4W+jsogCk
JtzOEIkiDrSXFqrC58/zjxbTV6vxpR0gtvbhnvVUvhtcAaVEWtrKm+f3NE7XoDt3
E4IhMehFrxlHxaBtzJUzlEyUrv0rRav4knChHnpAgtCHIh5wOVdj2PAMTibteAJ2
56Mt6MvU+W+vs6enYkDcFCtEu9sgOZF1RM3ozUurkI98Efqn/21M2fP7WtxZMDih
Ai/bVREnuAeJWI8LA65h9diLll6Wfi+QKlgh8Lq1XQmIfsPtv9kZGD3jCLZ9AEcJ
Gv//iQpUstLg728O+atN0pTYLyQ0Tuync+LxYnqyFHclpqFb4nwe37zF2gzVMkY8
H5Xaz+I7jqzG+I42img+kcLYIYbmT7Wjq/LJdivpAA8EzETeLzxX0QVroIDXzcOs
vGrk26aCR8xAfST/6KAb7AC8G5HSIDYFzsfbGhYMYm6jVvXw2pZYBXGsxtxTOXJ8
S8GsbiiY+3sND5foLLbEAtqpNgDNnJsPxS3R8MwES/2MiuPp+yEk1oinnS8cY6li
lom0Vqb3JaX8OQjZDu6uYyPAvhm2ED4jCCSMSvdMJNZtojtASKo=
=yyQ3
-----END PGP SIGNATURE-----

--oOB74oR0WcNeq9Zb--

--===============2466851235364483951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2466851235364483951==--
