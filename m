Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9796D1DF6C5
	for <lists+linux-stm32@lfdr.de>; Sat, 23 May 2020 13:01:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 454C4C36B25;
	Sat, 23 May 2020 11:01:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E6F2C36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 May 2020 11:01:45 +0000 (UTC)
Received: from localhost (p5486c962.dip0.t-ipconnect.de [84.134.201.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5AA4D2070A;
 Sat, 23 May 2020 11:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590231704;
 bh=xemUji08Zmu27LB6PcMCt2apr23hpQFKF9p4eBeTcUs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PvxGdi8JW2GIxv1ABsPvTRT7aPsZr1ZUbmMFkyEtmN8PfosXq6gmoO2sa8qFQe7o0
 39mzeGKp7wFGafKBDr+GrIOaPyYxL8PmCLhogdPcUpNa80rM57xQ+ty8+rxMhqoZkY
 NIAS5Rk4rTZVL7njuQMdcRMuKJwlz3v1bcDz8QxE=
Date: Sat, 23 May 2020 13:01:40 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@st.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Message-ID: <20200523110140.GD3459@ninjato>
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
 <1588657871-14747-5-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1588657871-14747-5-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/4] i2c: stm32f7: Add SMBus-specific
	protocols support
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
Content-Type: multipart/mixed; boundary="===============7631141057292628929=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7631141057292628929==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u65IjBhB3TIa72Vp"
Content-Disposition: inline


--u65IjBhB3TIa72Vp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +static int stm32f7_i2c_reg_client(struct i2c_client *client)
> +{
> +	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(client->adapter);
> +	int ret;
> +
> +	if (client->flags & I2C_CLIENT_HOST_NOTIFY) {
> +		/* Only enable on the first device registration */
> +		if (atomic_inc_return(&i2c_dev->host_notify_cnt) == 1) {
> +			ret = stm32f7_i2c_enable_smbus_host(i2c_dev);
> +			if (ret) {
> +				dev_err(i2c_dev->dev,
> +					"failed to enable SMBus host notify (%d)\n",
> +					ret);
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}

So, as mentioned in the other review, I'd like to evaluate other
possibilities for the above:

- One option is to enable it globally in probe(). Then you lose the
  possibility to have a device at address 0x08.
- Enable it in probe() only if there is a generic binding "host-notify".
- Let the core scan for a device with HOST_NOTIFY when registering an
  adapter and then call back into the driver somehow?

Other ideas?


--u65IjBhB3TIa72Vp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7JApQACgkQFA3kzBSg
KbZPBg//Yu/cFAZDkasWicaLj/8KEo4knB3mYgq+/AGe8Sib9oPeQYo5UCBjjXhv
svRUyxcoHxwRvRo5iG/0hl3SzrAZz1xoz46znwdyGfUm5pX1cDe4o4wYUnuQsuJL
Kfg4+nQ/qLW75cOj1V1z9Tf7QGCWEhxkedMt+Up7xpDS06ZcwIb+Q4TE+Ziu/LYc
MoDLi4rbjWVSZKWRKpBvAAXyVLZUoFDJuHGr39IafE9Y3JdixRglrjwDE6T4feQS
V68mGqcWG1LBPtsyonN6PvPJq3bp9ZxhvhUioLUZCcoxmdSyT6qDewcOHczkwlnr
ZZ4tX9QZjPLwEe6VaTeJqWWvOkrWPlsDOnUDiZq8WPowITVL7eRNvkBpkRpCRkdH
hDNnOYtOgjVnGwkgM/S8aUEla8/LBTCWoFiGJ38yL7aNxXbEpE+uVQLsG1d2ci52
xfZZA0hm0GDxYKnigr11x3mIA8VdZLtQeaTw3EUZAsUWfKV/pfYRElsDZ/dul984
cSioEGynR6ndQJ+fEAaiRR2KWUaOUEaLCOco6aODIy/stIJnfSEQDk+cTsfBQV8v
Ptp5MEwkOItxXftIwDLexRaob7cbre+jNa/Nsvl1EcJpqq2pN1dCXM40JVdqA5a7
J//X8FOfUW0pALR5BSvRFtV9QaqJ/MDXbeww81CCLO8Zo+uv6g4=
=5Hj7
-----END PGP SIGNATURE-----

--u65IjBhB3TIa72Vp--

--===============7631141057292628929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7631141057292628929==--
