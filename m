Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFB31C5977
	for <lists+linux-stm32@lfdr.de>; Tue,  5 May 2020 16:28:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA718C36B35;
	Tue,  5 May 2020 14:28:22 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E588C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 May 2020 14:28:20 +0000 (UTC)
Received: from localhost (p54B335A1.dip0.t-ipconnect.de [84.179.53.161])
 by pokefinder.org (Postfix) with ESMTPSA id 911B52C0892;
 Tue,  5 May 2020 16:28:20 +0200 (CEST)
Date: Tue, 5 May 2020 16:28:17 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200505142817.GC2468@ninjato>
References: <1588261401-11914-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1588261401-11914-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: fix missing pm_runtime_put_sync in
	i2c_device_probe
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
Content-Type: multipart/mixed; boundary="===============5493019279102357571=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5493019279102357571==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7qSK/uQB79J36Y4o"
Content-Disposition: inline


--7qSK/uQB79J36Y4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2020 at 05:43:21PM +0200, Alain Volmat wrote:
> In case of the I2C client exposes the flag I2C_CLIENT_HOST_NOTIFY,
> pm_runtime_get_sync is called in order to always keep active the
> adapter. However later on, pm_runtime_put_sync is never called
> within the function in case of an error. This commit add this
> error handling.
>=20
> Fixes: 72bfcee11cf8 ("i2c: Prevent runtime suspend of adapter when Host N=
otify is required")
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-current, thanks!


--7qSK/uQB79J36Y4o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6xeAAACgkQFA3kzBSg
KbYhiA//T+l0PEzPiaE6M7x6gAJ8psbfRCvstiVnIPTm05RkWxc6F5hPg/P3gCbJ
23pSTbYP2xAhWve343T6dn/OsD/oRphhcu1av5v0yMee5k4QQ7I3MbAvxZM99bfG
mfzQoZngIvCKgEA4PMl7Bq9JPIV0dS+6CpAl7OWOBjJGt6H6uJ+07MQNmyyGoz5e
S3esTcF/60pQzcl5/VHA6/OyXExbqOOq92zcnd5IMXoqWC6xtIJjVoCHje0gJTpI
bO87BHiDe5iK8tSzhLqUU/QRAvGBPgTNa4vjew9OhZgvoFsBI8GA9gAcJqYYoh3j
t0XXWIq5sUjcWNZSlalb2/WLOdDHvEbvGMzc1jphUjdklw9ZYbY7fqA/6QIUvz6+
NqF/j0wrBsj+dxyfxj5f82Q0672glf0Zqzt4n/QuPJ4QLf3qPVW3u96CRl0HPV1C
/AwGTLPZUIbAmYiHaODfMlZ/v83HybqVZoRzhBS0xK/T7o4uUriVWag7tLOHmMni
eswp+a+MsxyL+WrrC+Ug9PslANq0/VM83k0edA6MfwkHGM/DMFiDP0/ZAFGnKkjn
zb6Wx0utBOgT7EaxNYwqFWlPHNK3X0l1cIKr4uO3t5hzIjjrF5tYoAzfTyV2uvQJ
uT6/TtJbeWnxuW1lLmepPYYse4XDeWrHj8q/DnBVBsFJW+wnfAg=
=e2w7
-----END PGP SIGNATURE-----

--7qSK/uQB79J36Y4o--

--===============5493019279102357571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5493019279102357571==--
