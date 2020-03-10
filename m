Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4666217F60B
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Mar 2020 12:18:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01036C36B0D;
	Tue, 10 Mar 2020 11:18:36 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36B40C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2020 11:18:35 +0000 (UTC)
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
 by pokefinder.org (Postfix) with ESMTPSA id B82582C1EB6;
 Tue, 10 Mar 2020 12:18:34 +0100 (CET)
Date: Tue, 10 Mar 2020 12:18:34 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200310111834.GR1987@ninjato>
References: <1583413141-1268-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1583413141-1268-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: do not backup read-only
	PECR register
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
Content-Type: multipart/mixed; boundary="===============5614181319851712311=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5614181319851712311==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TDVcAd+kFgbLxwBe"
Content-Disposition: inline


--TDVcAd+kFgbLxwBe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 05, 2020 at 01:59:01PM +0100, Alain Volmat wrote:
> The PECR register provides received packet computed PEC value.=C2=A0
> It makes no sense restoring its value after a reset, and anyway,
> as read-only register it cannot be restored.
>=20
> Fixes: ea6dd25deeb5 ("i2c: stm32f7: add PM_SLEEP suspend/resume support")
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Looks good, but I can't apply. Please rebase on top of your other
patches.


--TDVcAd+kFgbLxwBe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5nd4oACgkQFA3kzBSg
KbZHZg//eBBQyGXSgFi5dgT7rnfeukqPIx67/g3xi+EVigN2zR1MqSNIRgS6gdI2
hou5993KGHyxg55JYVEGPjPriPPyXkBkmaXvsH5luYF1cEObodZ7CuBalIFldW47
y/bcLA/e9Z+hyCx+W97X+AXDv6/Bncpht8hIzg5Axia8T/yLHixPKgaz3yMHdC9V
ltIOxkEU2QEMLarGbqTeRNEa4/wzVlJuRuwzAR3htjSX0lg7N3/crNnCNZdLT30i
zlBp3FhIJ9mHrUmDleg0rZtQimLiQK/BY0iO3aaCzfUFt3IQSyqQc5uxaqo/Tkn/
hc8/NZ6090W2hRtydtEfJp6mE6R1RaW4w00qLf60uhiK5imsNIPXvNYHKdkG84RJ
CwfcTWzq6JNPIJ+M1VtcZbE7u0rFsNaYVneGThOUes64T8kymMwVAn07wzaK6w7j
+3+tuJNpTWjEi8wvtpEyXRpJtJZTQstFBJPpe7BdjtHL00YViE80h7gFuc6AqoZy
qriyt497GVbwDQPN7qO0w++2dTY/l8awDq0UAodAGcTXl92IOn8jRNvD1UpA9YNI
TwJktN5qx9EHR4qgP1YgInk7kgL2zVT3FXR9XEz//U7ilLjT8mtZGVW1UOzhRUlb
Yomy7tf5FP9VE86KmflMVGg/EQe8+wTIboXbdoWLktq/AS+BQoI=
=Qlcu
-----END PGP SIGNATURE-----

--TDVcAd+kFgbLxwBe--

--===============5614181319851712311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5614181319851712311==--
