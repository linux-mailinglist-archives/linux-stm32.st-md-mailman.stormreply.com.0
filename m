Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10247A71DF0
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Mar 2025 19:02:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3B13C78F67;
	Wed, 26 Mar 2025 18:02:53 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7223CC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Mar 2025 18:02:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A034543F32;
 Wed, 26 Mar 2025 18:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80658C4CEE2;
 Wed, 26 Mar 2025 18:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743012170;
 bh=mCdk+P8p/pxLv5pZKLEF1MRBDsB6k071tpMVyXHg/i8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DU7uG78fcayWWNWGPZI/LxhjRwbFf0OsHTKN4h0TxpNI2BotBiazAwhqSsBUSEUdk
 s0GEk4PlA/khBLWS4nU/7WwdUecp7PpFI7q8xzTAtXJPGitYLtujmRDpWCa6gcv/IJ
 YoSyWDmxUPC+kFOcxZeznrHy8OWHsUAk2ObcAf6QMJIQvcmetYj6AQOYWW9lunG19T
 wuATgZm+59mKhninq8V0pcIex+Z3GIJEsvBsLmiXHkyYg0sDwaQdsxhdutn+IV9Cjf
 vVLKSp8qm2KGES6cIk7mqRJA2tjZqedN9Iu5ZY1jw5hzW2LHbcddY8+ee6Tps7wo7N
 IXK21x5v7Wgbw==
Date: Wed, 26 Mar 2025 18:02:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20250326-giblet-endearing-cd76a00c6077@spud>
References: <20250326083912.12714-1-arnaud.pouliquen@foss.st.com>
 <20250326083912.12714-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20250326083912.12714-2-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: remoteproc: stm32-rproc:
 Add firmware-name property
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
Content-Type: multipart/mixed; boundary="===============8022064864610382772=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8022064864610382772==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pIJa1m7h2upDJxWu"
Content-Disposition: inline


--pIJa1m7h2upDJxWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 09:39:11AM +0100, Arnaud Pouliquen wrote:
> Add the 'firmware-name' property to the remote processor binding
> to allow specifying the default firmware name in the device tree.
>=20
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml       | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.=
yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> index 370af61d8f28..a0a16bfe8ef7 100644
> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> @@ -139,6 +139,11 @@ properties:
>        If defined, when remoteproc is probed, it loads the default firmwa=
re and
>        starts the remote processor.
> =20
> +  firmware-name:

> +    $ref: /schemas/types.yaml#/definitions/string-array

This should not be needed, it's a standard property, no?

> +    maxItems: 1
> +    description: Default name of the remote processor firmware.
> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.25.1
>=20

--pIJa1m7h2upDJxWu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+RBRgAKCRB4tDGHoIJi
0vE1AP9J58xanH9W6GTrEbCuKn5eu2aDyiiSA/vp2NtSg8fYyQD9EWt7Ndn+h+NW
CEY02RuwuVdniaCzT+U+CADdHf+7SgQ=
=4xuG
-----END PGP SIGNATURE-----

--pIJa1m7h2upDJxWu--

--===============8022064864610382772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8022064864610382772==--
