Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2BBC03118
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Oct 2025 20:50:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1C4FC5EC76;
	Thu, 23 Oct 2025 18:50:50 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 424CFC5EC67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 18:50:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CCBF441B6A;
 Thu, 23 Oct 2025 18:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5E0C4CEFD;
 Thu, 23 Oct 2025 18:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761245448;
 bh=pmkyy2iRIDR1hgrgKOXi1EcISl1p6QEbGBXwWbteuVg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JZl+5n9uvNCE31Qo09O3KwUURfiUcdSN9aEx/GcGhai6II3myGrfG2YkIFNE0K0V6
 FX0N2kamEmionLI4TqLH8RGLuO519ty2RvjjIBdULcTN/4ba6bj5x48r8iJti/MwbL
 jMTEuYkIYYBnuapX9PPyqGPSmgwbr7lQLu5PVeb/UTGgack4qxS/MkMDndWW5Rd7oh
 YqcQoxNM52fen9U2Gj8m8yalWAhL2WHsxuEk3CQUpUnZwZ3p/t7V5TttjFfteVjiBy
 2NOUUW1EyXqRAwqGW8djEhLU5c70+B2OFVgFipS3lhJSgS17kFmmV9ggted1bZ6jXl
 UuFPt1C8HPecg==
Date: Thu, 23 Oct 2025 19:50:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Message-ID: <20251023-mop-deuce-2a5b364c5cf2@spud>
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-12-antonio.borneo@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20251023132700.1199871-12-antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v4 11/12] dt-bindings: pinctrl: stm32:
 Support I/O synchronization parameters
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
Content-Type: multipart/mixed; boundary="===============4487280850558219534=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4487280850558219534==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9MD3BrnpDScLq+jf"
Content-Disposition: inline


--9MD3BrnpDScLq+jf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 23, 2025 at 03:26:59PM +0200, Antonio Borneo wrote:
> +        # Not allowed both skew-delay-input-ps and skew-delay-output-ps

I think this sort of comment is effectively pointless, it just
reiterates what the binding says below it. If you wanna have a comment,
explain why they cannot coexist.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> +        if:
> +          required:
> +            - skew-delay-input-ps
> +        then:
> +          properties:
> +            skew-delay-output-ps: false



--9MD3BrnpDScLq+jf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPp5AwAKCRB4tDGHoIJi
0nzFAPkB+S3fwX4Vb86zDJEk5T4qXXJxIkXaxZXRkZAETxDq4QEAzciIBv0IWNBE
6H75honujjY5hI9iJiWp4q/TraC1EAE=
=tf6q
-----END PGP SIGNATURE-----

--9MD3BrnpDScLq+jf--

--===============4487280850558219534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4487280850558219534==--
