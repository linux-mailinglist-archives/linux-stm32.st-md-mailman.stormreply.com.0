Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6241634FADC
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Mar 2021 09:55:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13AF2C57B5B;
	Wed, 31 Mar 2021 07:55:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 223DDC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 07:55:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9470061582;
 Wed, 31 Mar 2021 07:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617177319;
 bh=EzitGg86srFNwq2ybWNTNEkYH5cOxpBgx7ICUgiY5yo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HoEE25OE8avfFADAgHRysi5TbL9Q2GJYNdipPYMDvqhA1KarMfxqZpV9Uoyafa0bG
 RZLpwqxufdgARkTFbMWqqqv2xkNdcdUfakfMbdxfguce9XtIrsT70N3gtFEWQw9yod
 2RVA9yaHSQqHXt+rgqdBf0Zg2mU/cfzWyBDRcGiLFiPFWeLztE88cFMSAYtvYVoMXZ
 MHwyzwGQkiGOSuirfKPNj57lYlHvQB1QNoW1frAPZ0eHOiY7HSPl9DSSJewmjlpW/e
 zHUarypb4raAyvxr/hPfPXifCNGp5XZtEuq7+jL3gMXaw1342sCMA3FmLaNgztXyXq
 aBZlCjym0+BFg==
Date: Wed, 31 Mar 2021 09:55:16 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Message-ID: <20210331075516.GF1025@ninjato>
References: <20210324140610.32385-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210324140610.32385-1-unixbhaskar@gmail.com>
Cc: mcoquelin.stm32@gmail.com, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, p.zabel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH] i2c-stm32f4: Mundane typo fix
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
Content-Type: multipart/mixed; boundary="===============3839087573232227753=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3839087573232227753==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CXFpZVxO6m2Ol4tQ"
Content-Disposition: inline


--CXFpZVxO6m2Ol4tQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 07:36:10PM +0530, Bhaskar Chowdhury wrote:
>=20
> s/postion/position/
>=20
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Applied to for-current, thanks! Please check older commits to this
driver for the proper subject prefix, i.e. "i2c: <driver>" in I2C.


--CXFpZVxO6m2Ol4tQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBkKuAACgkQFA3kzBSg
KbZcNg/+Kgz6fUXwT8UG1T6AI2mSbxrDvEf1HZabVoWUXqfAUzW70AOuupu6rANv
ZALbbp5LgXqd9mlB6SsLgZb2Fu+KH2HHfb8Vb+3MoyVPRPxY4hz0ISqGohy4cWH0
3WRpT7ZKYwxjHj/0YFaQxrVSa3Vxpy/iifohlnezxqWYcKm/WVoRvpUXPAqT53w5
buqBb+CY133IjNtPg3GVrV/7yPuPM2hQAapY0PsbwPz4Krq2G6jsuhQ8V5vHIaTm
Y8DJiRDvAzgDgTUKu/Ndi4JD1g8InykBnLRqAbdk84ktM1vuGEpvk7/LbbybBKj3
ZezZCW9Ux/1X69t17Z8l/R8S85xRXiRcXjO04+rVHjnsMMPVyiarGQEptejqY3CH
nQjiVNdCUh6uzkQcD6zdUgIeqrdq/IAConxpk5BAKmMqQfVkM85oY20AMZP/gEtg
yBVkQdXVpvltbIvxtcP7Zxf2X90PpSVfexJpqHBx45MGy7FkEnu29gwo4SZ+q81S
Y+sXwxxuyL3KvxFibgnLTLf2lcpTVGpcC5N6VZjOrAf3pfWxgx3QvJ0LqtQrYcwB
lNZiq1C+a5eGpOdBEnEmpc69YTTs40ry4fBkTnnzOdPCJVkDsdn4ZTDp5cAnyy2E
VKGky1q77+EEI2EIjmquoP6f/u+yQNf3In2VZbaYZjXz+kckDPM=
=P84I
-----END PGP SIGNATURE-----

--CXFpZVxO6m2Ol4tQ--

--===============3839087573232227753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3839087573232227753==--
