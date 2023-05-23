Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A87A70E291
	for <lists+linux-stm32@lfdr.de>; Tue, 23 May 2023 19:02:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA001C6A61A;
	Tue, 23 May 2023 17:02:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05DD7C6A616
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 May 2023 17:02:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D1A2B634BA;
 Tue, 23 May 2023 17:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D70C433EF;
 Tue, 23 May 2023 17:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684861357;
 bh=bqtg2gzZ7yBsVvMiiXA1gNJFMTN6BSdFaSLeeq2qr8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hkpoetokkQsg+j8zbENYRW3D/eapwSURz3+12Nlh0Y+0ULUKRA8mbBMoX/3q/cy5I
 pZkLkfhPs3w3CRXs1McibPqt480fhRYOxOgUBycsEB9EQZ1q1+XtXfCWn1ewgKIYH0
 Y2D1EYO57h6UPfuCmcJBkbVc8hEzQJPOlO1ktePDHN16UHyS+yQgDK+RxVG4drVlEJ
 x2/YhgmlpYCdPLGyrq46eVuXYSkQxBxjqQd68s5FRdIO9EBZj57eaOiIaGyQj+uQzM
 s/Mxrglcp9RAb7AOsTL/xDyScqTrbk9JiXWIlSAaspUCBJA8oUDeJ8sCGabqF+NznS
 dGcPz5IqA7rEA==
Date: Tue, 23 May 2023 18:02:33 +0100
From: Conor Dooley <conor@kernel.org>
To: p.paillet@foss.st.com
Message-ID: <20230523-popular-chastise-67184785bae4@spud>
References: <20230523074206.201962-1-p.paillet@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230523074206.201962-1-p.paillet@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 lee@kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mfd: add vref_ddr supply for
	STPMIC1
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
Content-Type: multipart/mixed; boundary="===============7621168650854422296=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7621168650854422296==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UbRlB+0udV4GUR2J"
Content-Disposition: inline


--UbRlB+0udV4GUR2J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2023 at 09:42:06AM +0200, p.paillet@foss.st.com wrote:
> From: Pascal Paillet <p.paillet@foss.st.com>
>=20
> Add vref_ddr supply description for the STPMIC1.
>=20
> Signed-off-by: Pascal Paillet <p.paillet@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/mfd/st,stpmic1.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml b/Docu=
mentation/devicetree/bindings/mfd/st,stpmic1.yaml
> index 9573e4af949e..97c61097f9e2 100644
> --- a/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
> +++ b/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
> @@ -184,7 +184,7 @@ properties:
>          additionalProperties: false
> =20
>      patternProperties:
> -      "^(buck[1-4]|ldo[1-6]|boost|pwr_sw[1-2])-supply$":
> +      "^(buck[1-4]|ldo[1-6]|vref_ddr|boost|pwr_sw[1-2])-supply$":
>          description: STPMIC1 voltage regulators supplies
> =20
>        "^(buck[1-4]|ldo[1-6]|boost|vref_ddr|pwr_sw[1-2])$":
> --=20
> 2.25.1
>=20

--UbRlB+0udV4GUR2J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGzxqQAKCRB4tDGHoIJi
0nVwAP9HoYA6RsRFC5ZRa8pRYOFuGxOZoqpu4qiPLakmq++azAEA3ezO6nGHTrLH
Kh6X9fVxXJ/zLYUM7NWAWNQbmWl+Twc=
=7sMn
-----END PGP SIGNATURE-----

--UbRlB+0udV4GUR2J--

--===============7621168650854422296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7621168650854422296==--
