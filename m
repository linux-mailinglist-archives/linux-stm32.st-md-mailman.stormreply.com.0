Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0086777C66
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 17:39:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93F76C6B469;
	Thu, 10 Aug 2023 15:39:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED638C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 15:39:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA6486603F;
 Thu, 10 Aug 2023 15:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AEE9C433C7;
 Thu, 10 Aug 2023 15:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691681975;
 bh=+RqZA0cX8VIY0s3e11+0Z9i6zfMLI9V7lSoagiXzHiM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HjxbKhdZqC5p2SHPbNZsipblSdM/awSjA5WKv4TzP1/gOuM327LgmV4K1MyB2FGm1
 VwnxudQD81C4kPg9N1ZwuUQWnjnwhQM3uTknXSUuk3Y+YvY97Gec4bb2j+GM+mkSMc
 N6n5rtiqcoF9F5nfCF85qQBT34ip9ySg1Yt2YUYJyUQATX6G89y1//KgxR+Yx1WI+y
 LcV0w6CfzfiHlGjioxkW3EOAZtHbKmUIEqidUNu01UYNdEAsebCtWfYnKo/XAqNYAo
 LDHGTKGwc/Hi9mwU9r4gTl0h4SGzWcMoZMEeVarCKWcwqAz76GbNZD+nb5MH5dqpv1
 CiKiOa2yuI1aQ==
Date: Thu, 10 Aug 2023 16:39:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Rohan G Thomas <rohan.g.thomas@intel.com>
Message-ID: <20230810-avid-perplexed-0c25013617c9@spud>
References: <20230810150328.19704-1-rohan.g.thomas@intel.com>
 <20230810150328.19704-2-rohan.g.thomas@intel.com>
MIME-Version: 1.0
In-Reply-To: <20230810150328.19704-2-rohan.g.thomas@intel.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] dt-bindings: net: snps,
 dwmac: Tx queues with coe
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
Content-Type: multipart/mixed; boundary="===============8863148197237952776=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8863148197237952776==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MuZ3wrqm02dw4gEw"
Content-Disposition: inline


--MuZ3wrqm02dw4gEw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 11:03:27PM +0800, Rohan G Thomas wrote:
> Add dt-bindings for the number of tx queues with coe support. Some
> dwmac IPs support tx queues only for few initial tx queues, starting
> from tx queue 0.
>=20
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Docu=
mentation/devicetree/bindings/net/snps,dwmac.yaml
> index ddf9522a5dc2..ad26a32e0557 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -313,6 +313,9 @@ properties:
>        snps,tx-queues-to-use:
>          $ref: /schemas/types.yaml#/definitions/uint32
>          description: number of TX queues to be used in the driver
> +      snps,tx-queues-with-coe:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: number of TX queues support TX checksum offloading

Either you omitted a "ing" or a whole word from this description.

>        snps,tx-sched-wrr:
>          type: boolean
>          description: Weighted Round Robin
> --=20
> 2.26.2
>=20

--MuZ3wrqm02dw4gEw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNUEsQAKCRB4tDGHoIJi
0iOmAQDn/yAcD1JLuhTNKcQin6nvPE+5IS9OqAUHFX4TkbFa9gEAgTyktV5zdQHm
uELPRWXyRAJCvDqDi2+ETRiC7hBXRAg=
=3asX
-----END PGP SIGNATURE-----

--MuZ3wrqm02dw4gEw--

--===============8863148197237952776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8863148197237952776==--
