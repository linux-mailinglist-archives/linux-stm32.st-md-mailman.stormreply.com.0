Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF227A3512
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Sep 2023 12:04:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3228C6B45D;
	Sun, 17 Sep 2023 10:04:05 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBFACC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Sep 2023 10:04:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8E2D960AFA;
 Sun, 17 Sep 2023 10:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52139C433C8;
 Sun, 17 Sep 2023 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694945041;
 bh=Gso6S/NadZnbLvgrACDdGV3yKQ0lDXCmgQv0+9JSmeE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V5bdmq+S8UpnPJnPiePBHbssJs5tcLQYAfJy3MYqUbj4Z1ggrkoekIJNTi+fW/cGS
 SJpPDQ2WOXZQwUrLeAia9CsGSQW1AjPjrb6Q5R6hJ1gujm7EteVVQzaeedetIM3jdx
 3xxQis3riBr6+R2kTADEeXAsBA7lewPP8EAHAEg3g4Ono+D9dbGgpbYGAaR+37VhgR
 ZR6jqzDXReYg3cqVFmpmf6MIsQzUUnFN4wggJeBxJHDo5d3N/disihdWZ/K6ZxnE9g
 ZcpajpyxaZr9kilkPrnNNINqubQMErLDjlYI0RxwgMciiC5e8iYUbcODsg6wPCntRY
 wunFLDNXQSYlA==
Date: Sun, 17 Sep 2023 11:03:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Rohan G Thomas <rohan.g.thomas@intel.com>
Message-ID: <20230917-figurine-overlying-f5a0935af5ea@spud>
References: <20230916063312.7011-1-rohan.g.thomas@intel.com>
 <20230916063312.7011-2-rohan.g.thomas@intel.com>
MIME-Version: 1.0
In-Reply-To: <20230916063312.7011-2-rohan.g.thomas@intel.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, fancer.lancer@gmail.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v7 1/2] dt-bindings: net: snps,
 dwmac: Tx coe unsupported
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
Content-Type: multipart/mixed; boundary="===============8891732501121763907=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8891732501121763907==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sfl5dMioS+61NyiC"
Content-Disposition: inline


--sfl5dMioS+61NyiC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 16, 2023 at 02:33:11PM +0800, Rohan G Thomas wrote:
> Add dt-bindings for coe-unsupported property per tx queue. Some DWMAC
> IPs support tx checksum offloading(coe) only for a few tx queues.
>=20
> DW xGMAC IP can be synthesized such that it can support tx coe only
> for a few initial tx queues. Also as Serge pointed out, for the DW
> QoS IP tx coe can be individually configured for each tx queue. This
> property is added to have sw fallback for checksum calculation if a
> tx queue doesn't support tx coe.
>=20
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Docu=
mentation/devicetree/bindings/net/snps,dwmac.yaml
> index ddf9522a5dc2..5c2769dc689a 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -394,6 +394,11 @@ properties:
>                When a PFC frame is received with priorities matching the =
bitmask,
>                the queue is blocked from transmitting for the pause time =
specified
>                in the PFC frame.
> +
> +          snps,coe-unsupported:
> +            type: boolean
> +            description: TX checksum offload is unsupported by the TX qu=
eue.
> +
>          allOf:
>            - if:
>                required:
> --=20
> 2.25.1
>=20

--sfl5dMioS+61NyiC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQbPCwAKCRB4tDGHoIJi
0jpOAP0Rec+DYUN9Tx+3DSmk0L8jcQbqesqX7hzjoxzMCmsBwAD+LoOp6/jRtBiP
ZD5abXvbAPNK63Z3f0NgpMoHlrqdKQY=
=Te+k
-----END PGP SIGNATURE-----

--sfl5dMioS+61NyiC--

--===============8891732501121763907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8891732501121763907==--
