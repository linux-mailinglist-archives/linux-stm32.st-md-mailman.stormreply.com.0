Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD3C89988B
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Apr 2024 10:53:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8BEEC6C83C;
	Fri,  5 Apr 2024 08:53:05 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1ACB0C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 08:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=b58X
 /MIMUkzWJKfAi7xukhYyNxm3BVKa9wfMtsb3Sd4=; b=KH/O2kU4AXBavxNzHugQ
 Cr0XiXqp/GPDBSk990nWASPmI37jJSCyQb7Lmqf/oL1tdcIHRX8jcmo2vwR2Tob2
 3MSo8HTQY7A27SYWA+SI/NfQ5pqpmi79n6McsjIcB3WFLNWrOIMRU9rOtunrND10
 HWjAn9CXhCQ+B9a1mPUM02wRXvB9PLITUPY3IFp4RQdrilkojM5jzuhcnTiEv7VH
 VYyQIaPUSbCJyxVg+Ps6gEY1GV7GeeCVXIVYwLifWiKRkws+ODNIdvmXrsiBWpB2
 SNQ1HJX7xrINzXmGee9lezHXjMCnmDNUx7uK3emvEkF2ZwnnAUK7Pn+L+1Q5APd7
 Jg==
Received: (qmail 4047676 invoked from network); 5 Apr 2024 10:53:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 5 Apr 2024 10:53:03 +0200
X-UD-Smtp-Session: l3s3148p1@2SRllVUV0pYgAwDPXwEGAANOsN0UmmrN
Date: Fri, 5 Apr 2024 10:53:02 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <fgcn3ly4qk726eqv3lleqbrg7odgyklkyd6d7wmpyl73bbt5ir@tjui6nsxrlgk>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Russell King <linux@armlinux.org.uk>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
 James Clark <james.clark@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
 Vinod Koul <vkoul@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Michal Simek <michal.simek@amd.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org,
 linux-crypto@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-input@vger.kernel.org, kvm@vger.kernel.org
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <20240326-module-owner-amba-v1-14-4517b091385b@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240326-module-owner-amba-v1-14-4517b091385b@linaro.org>
Cc: kvm@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Herbert Xu <herbert@gondor.apana.org.au>, Russell King <linux@armlinux.org.uk>,
 linux-input@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 coresight@lists.linaro.org, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Olivia Mackall <olivia@selenic.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 James Clark <james.clark@arm.com>
Subject: Re: [Linux-stm32] [PATCH 14/19] i2c: nomadik: drop owner assignment
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
Content-Type: multipart/mixed; boundary="===============1990564087816237994=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1990564087816237994==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="honofbm32v4z4vxk"
Content-Disposition: inline


--honofbm32v4z4vxk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 09:23:44PM +0100, Krzysztof Kozlowski wrote:
> Amba bus core already sets owner, so driver does not need to.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--honofbm32v4z4vxk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYPu+4ACgkQFA3kzBSg
KbY+PhAAmNuSoACChosjYi33qGWzyeoBhz9tLue2x0d13airycgFlY6FyFx1aY+/
NadTECwyu8TNhXdRAYk/Y1sTo9S+MezhsboJhiL8+5hiOBEZHXt7U5+8k/Pkg499
9QHeM8PaeBfpoodRPGG7UCxHkjENntyyR4OV1X5eWgGheKFtzw6F2NwEMqTdus5H
yGju+VYEMeH97wXMkPRPmqIAUfG140PY+fTfOInco1my/ejprCYy+OJdL+uMDBlG
3MSIMIrLahtlKK6tkhnA9MdGaC3J4v5bzpo7lgDwM6qPcOHY6ftTfz726DpdI68w
JLoRj/Ne4xKX4Munav7MMDCPGWaSY3fQ6F1xtzq+EdfVQHnSIxpuhH/zvpj7LDEz
l+yVUvhjs41B3d8QkXmFp0ByjxaiIdO5EAkraw/OguBo6kv3N0TgEG1BZTdVa5+Q
UfSRHLLAXCksCuADcBcHaRGXp3dlJB2Ywba2iCYBOeBD2DefxfHGcEurJyY3mp1h
i+RlMmzHBKEoT5/nYkhzVZyQ8cosiJoL0LeK11p10xoexmDJzd7W8oshLhEDaB2L
5zXqlT0JmawXt/SmDjByPFelFQPhEtWkIo/D65i4EBb0DnglGQSc4frb9FBiVP5U
vPwuPyzkXVvObtEfHT2TL6wUD2IVZWJv4tCMQel7J/DK7WEJLjM=
=o9jg
-----END PGP SIGNATURE-----

--honofbm32v4z4vxk--

--===============1990564087816237994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1990564087816237994==--
