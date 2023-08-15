Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E381377CDFF
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Aug 2023 16:23:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 883BEC6B45E;
	Tue, 15 Aug 2023 14:23:35 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46A2BC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Aug 2023 14:23:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 02A02652F9;
 Tue, 15 Aug 2023 14:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE06C433C7;
 Tue, 15 Aug 2023 14:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692109411;
 bh=G0wLK5bMRBZ3biEchEhetIoIiQUxmKkj//WHJ7fAgPk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ayT/rgQZ9gf6TrxVQT3sc+8xiMemB0kYDYqjjBJ4oZG7/pyrNlqvKMsiJacV7sfuw
 N1hyx9+1O7GWZYe3bMlssVLZsrWObOOFiammzaUsX+qM0eMBK5U62HwAfMjzTwnMm9
 Qs4kjUCb7YLtciKzj80gSQ1/wYb4i4nROV8qB+bpBYWe1oObvjTthdrEFTKppgVe4J
 bKAMp1vYydharH/5fI4ceiiGT+53TK0DBtWLkQOtaF8edOWmrHmwmErF2+MUleGEij
 FRMuREKDjQ+LutI+xUzfvqnZ+lNqHr8wytA4wc9lDJbMlfGDETJlUlFyE2duviPPJv
 uFClPDn9XM4kg==
Date: Tue, 15 Aug 2023 15:23:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Rohan G Thomas <rohan.g.thomas@intel.com>
Message-ID: <20230815-reconcile-reshoot-1dfc9ab4a60f@spud>
References: <20230814140637.27629-1-rohan.g.thomas@intel.com>
 <20230814140637.27629-2-rohan.g.thomas@intel.com>
MIME-Version: 1.0
In-Reply-To: <20230814140637.27629-2-rohan.g.thomas@intel.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/2] dt-bindings: net: snps,
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
Content-Type: multipart/mixed; boundary="===============1086392108196543864=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1086392108196543864==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="31EWOSqhpz72Q0+j"
Content-Disposition: inline


--31EWOSqhpz72Q0+j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 10:06:36PM +0800, Rohan G Thomas wrote:
> Add dt-bindings for the number of tx queues with coe support. Some
> dwmac IPs support tx queues only for a few initial tx queues,
> starting from tx queue 0.
>=20
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Docu=
mentation/devicetree/bindings/net/snps,dwmac.yaml
> index ddf9522a5dc2..0c6431c10cf9 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -313,6 +313,9 @@ properties:
>        snps,tx-queues-to-use:
>          $ref: /schemas/types.yaml#/definitions/uint32
>          description: number of TX queues to be used in the driver
> +      snps,tx-queues-with-coe:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: number of TX queues that support TX checksum offloa=
ding
>        snps,tx-sched-wrr:
>          type: boolean
>          description: Weighted Round Robin
> --=20
> 2.19.0
>=20

--31EWOSqhpz72Q0+j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNuKXQAKCRB4tDGHoIJi
0kNYAQC89tAi2N1i1739qtPj8asdT8XtPs5imJ8IXuR77su/SgEAtdnyhxQ9FezS
87c/00tTpw4Xbqxwe7wmDz5Hf5pSlAM=
=gfdG
-----END PGP SIGNATURE-----

--31EWOSqhpz72Q0+j--

--===============1086392108196543864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1086392108196543864==--
