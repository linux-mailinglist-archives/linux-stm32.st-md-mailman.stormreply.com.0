Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F1C790777
	for <lists+linux-stm32@lfdr.de>; Sat,  2 Sep 2023 12:53:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8795CC6A61D;
	Sat,  2 Sep 2023 10:53:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22632C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Sep 2023 10:53:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9741F60ACB;
 Sat,  2 Sep 2023 10:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9A3C433C8;
 Sat,  2 Sep 2023 10:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693652034;
 bh=5mUneaMYsihzWac40KTej7cQHjUWMP3FfxWNxAgPEkM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dL4rU5o8pCsKc2PY7aL5CGYUYhElJpKvmfz3MDOOSpTbA2vmzJMGSoWJIuGe71k81
 OB1xk5+hCq/07LiGqbDBfgEjEicbqlOyv5dbiw848ZF18qhE6XzjXrXWj2mn83YD1G
 /ZM3trcDbUEl0eMbnOilM1Kl7gvfut9Y1xXAESaT6ErtkAewxHVemsYktL+ukXA9iO
 ieS1CJcZ0NtABhPMCJuCvSv4y9ZfQLG3UA3kUo6xutH58roKzvaI+8Tw/mCqGHOe6c
 P427fH++cyWfiQA0MfSGcBzNRd7clZHmFOeW+Mp2ooV472Eq3UzHZulxjU8naFuHSR
 Z+l23hbl8RUFQ==
Date: Sat, 2 Sep 2023 11:53:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20230902-undone-mobster-234b589d3714@spud>
References: <20230901155732.252436-1-alain.volmat@foss.st.com>
 <20230901155732.252436-2-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230901155732.252436-2-alain.volmat@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Dan Scally <dan.scally@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 1/5] dt-bindings: media: add bindings
	for stm32 dcmipp
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
Content-Type: multipart/mixed; boundary="===============1466882560876338008=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1466882560876338008==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y2l6E071THuAoQbt"
Content-Disposition: inline


--y2l6E071THuAoQbt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2023 at 05:57:20PM +0200, Alain Volmat wrote:
> Add the yaml binding for the ST Microelectronics STM32 DCMIPP
> (Digital Camera Memory Interface Pixel Processor)
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--y2l6E071THuAoQbt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPMUPAAKCRB4tDGHoIJi
0mJUAP9nsxwmCpy9C0wAB98r+NuyBpnBXvMJkEM7Sxp8M7zyYgD8C/cME37tRoxC
X9j9prRoXAsDDO1R9EO1/JcMhzGh6QE=
=dnj9
-----END PGP SIGNATURE-----

--y2l6E071THuAoQbt--

--===============1466882560876338008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1466882560876338008==--
