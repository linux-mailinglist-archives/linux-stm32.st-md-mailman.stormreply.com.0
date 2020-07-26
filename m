Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA6522DF81
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Jul 2020 15:35:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F41BCC36B27;
	Sun, 26 Jul 2020 13:35:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E127DC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Jul 2020 13:35:55 +0000 (UTC)
Received: from localhost (p5486c93f.dip0.t-ipconnect.de [84.134.201.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB5132065F;
 Sun, 26 Jul 2020 13:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595770554;
 bh=jCCV8VYmRNQqNG2Se8e8SaJMyZBek/JWVtyEKyzac8k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LH68B0WJmnEaWbSDySqWttA4aypHw/aroEDcF5ZyW4HmwzuIHR99ugDY8963RLMxQ
 Y7P0Rtg5N1eOaRONHKGXrqe2f37KzqbDfvSb77jK68iWRKMVeRVkOfc8gVfYho1omX
 2gtnFBXQw72CRawIIPFNCzchjV6UMEx51g12JSVM=
Date: Sun, 26 Jul 2020 15:35:51 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200726133551.GC16169@ninjato>
References: <1593776168-17867-1-git-send-email-alain.volmat@st.com>
 <1593776168-17867-2-git-send-email-alain.volmat@st.com>
 <20200725202733.GA946@kunai>
MIME-Version: 1.0
In-Reply-To: <20200725202733.GA946@kunai>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] i2c: smbus: add core function
 handling SMBus host-notify
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
Content-Type: multipart/mixed; boundary="===============6142221093424425729=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6142221093424425729==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DSayHWYpDlRfCAAQ"
Content-Disposition: inline


--DSayHWYpDlRfCAAQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +void i2c_free_slave_host_notify_device(struct i2c_client *client)
> > +{
> > +	i2c_slave_unregister(client);
> > +	kfree(client->dev.platform_data);
> > +	i2c_unregister_device(client);
> > +}
> > +EXPORT_SYMBOL_GPL(i2c_free_slave_host_notify_device);
>=20
> Sidenote: With my recent series "i2c: slave: improve sanity checks when
> un-/registering" this code became NULL-safe (and IS_ERR safe, too).

Stupid me, it is not NULL safe. The functions are. But, we deregister
'client' on our own. It probably makes sense to add some sanity checking
of the parameters of the exported functions.


--DSayHWYpDlRfCAAQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8dhrMACgkQFA3kzBSg
KbbyGxAAqCXGbq/i0jvy+gmv+JJk5HTVXYtglHm52P7iDw0zolpXRm0OEmF4+yRt
4MmbRDeEeQLeR2TvtaziN1q+LNQ2CObxbbVoyjcgNuc9pyo/zoM4No2JNnFqKWUt
k5gl0nzVKXIlmJy2zb0EJT/xoyX+rae4hamgve7t3TvdQC3DS+sFJcReM9AmmMtN
XHdPkrSbwHUhEUfDzmKw63CJZ46ExLmM03Ev08nkxW6YDkpZJeLMmloL54e8aVz7
KEYKO24PUZ4/fzgtvHK7H1baBmALgIn4sR2R6UqgIDE0BDGKP9a6XXUz2S+ZDuja
vmJXZYwwKMgNPjFN5vFku1vxLUQRTNnQGy3cjX0PYW9AVMFcqLt7AOR7qHzNCZv7
t0MFewm19NOJMztPP+iLDPVOTACbuinF9NK4DptHwiBlEF2CIRYmBifJyLFjERW1
Q/S6T1k7u9EQ7ya9Rc6J8j9qk3GU9q6xU6DJtGlMGM94MvqNwdOrhzN9ysrJso7U
tvfiv2lw0yDkQysl1QgtR68xpI2PLBZwahv5t+11M/7A14bd4LAWr+6kZ7Oc8G08
GeCpGIu1Ja1rMV/zPptp4IrxC1BA5GyVYaX6n01B59mK5GZMorzASUv18thLWNtq
k64ubcie8Ka+C6YNvNPe9hs3egA3En5BHIXrZJidbM11PhZjY34=
=AW42
-----END PGP SIGNATURE-----

--DSayHWYpDlRfCAAQ--

--===============6142221093424425729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6142221093424425729==--
