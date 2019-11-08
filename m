Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAB8F4508
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Nov 2019 11:53:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E65BAC36B0B;
	Fri,  8 Nov 2019 10:53:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A416C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2019 10:42:36 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3AD162178F;
 Fri,  8 Nov 2019 10:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573209754;
 bh=Tpjnf2GWTDvkR6aqCvBySs7nsoGgpKOv1/rmGC0yfaI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UptJ0S7oZTBv0d9I0RlV9aZeyCEKwOa/K/FY8IxrQu6u+AVWXByUglJFW4o/QdfZa
 nW5/cdTO9pZ4iLMlmWCLSXMP+RO3IwZk7aqhE2wUAuJMM8ixJcBNDnHM3eT4Ds9mTo
 Ah6/7qFO+bNIBK/SZ6Nrb03LlxJVz0bZ7J/OREu8=
Date: Fri, 8 Nov 2019 11:42:31 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Christophe Roullier <christophe.roullier@st.com>
Message-ID: <20191108104231.GE4345@gilmour.lan>
References: <20191108103526.22254-1-christophe.roullier@st.com>
 <20191108103526.22254-2-christophe.roullier@st.com>
MIME-Version: 1.0
In-Reply-To: <20191108103526.22254-2-christophe.roullier@st.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Fri, 08 Nov 2019 10:53:06 +0000
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandru.ardelean@analog.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: net: dwmac: increase
 'maxItems' for 'clocks', 'clock-names' properties
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
Content-Type: multipart/mixed; boundary="===============0091165300805007497=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0091165300805007497==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SWTRyWv/ijrBap1m"
Content-Disposition: inline


--SWTRyWv/ijrBap1m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Nov 08, 2019 at 11:35:25AM +0100, Christophe Roullier wrote:
> This change is needed for some soc based on snps,dwmac, which have
> more than 3 clocks.
>
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 4845e29411e4..376a531062c2 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -27,6 +27,7 @@ select:
>            - snps,dwmac-3.710
>            - snps,dwmac-4.00
>            - snps,dwmac-4.10a
> +          - snps,dwmac-4.20a
>            - snps,dwxgmac
>            - snps,dwxgmac-2.10
>
> @@ -62,6 +63,7 @@ properties:
>          - snps,dwmac-3.710
>          - snps,dwmac-4.00
>          - snps,dwmac-4.10a
> +        - snps,dwmac-4.20a
>          - snps,dwxgmac
>          - snps,dwxgmac-2.10
>
> @@ -87,7 +89,8 @@ properties:
>
>    clocks:
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 5
> +    additionalItems: true

Those additional clocks should be documented

Maxime
--SWTRyWv/ijrBap1m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXcVGlwAKCRDj7w1vZxhR
xbqKAQDvkfzfxpAJ6TR82T/DMy/J2ehuCMos4R9wkjU53VpciQEAmWKEhrULTnu0
xg9rU8jTzA5wsosJo34XQ8gcdH7JPgA=
=vzrR
-----END PGP SIGNATURE-----

--SWTRyWv/ijrBap1m--

--===============0091165300805007497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0091165300805007497==--
