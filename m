Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F136C52E1
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Mar 2023 18:42:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B01A6C6A5F6;
	Wed, 22 Mar 2023 17:42:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A271C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Mar 2023 17:42:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B29B62220;
 Wed, 22 Mar 2023 17:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2224C433EF;
 Wed, 22 Mar 2023 17:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679506960;
 bh=OcsrKnzki4a9lwOH45aqmVNP8I1F76AaxK2/K4GQegw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fi2ZrtRz/ikyvPo0/GL2HXtR1ipANItLggD55ea/dm3Dv7tC3EbIS+4U/z4Y4KfeH
 5o9i/VmrRAoXwCVnkmh+9xDiq9oL/masEjSb5CJ7cAIHgRHgc52K2WiqgCoRDMa8tG
 l+Pb5jNWez+J8x/LO2xsARN/h1/+mWCODeuMANOJ3jqdu7gwSbQB2zPbVfk1Yf5vB2
 7QyjcFZPLTNzd6CVGdq/5QH4sJJU+BbzMxlgOsSuQzvr99XDYA0ndpraliSJGiIa7T
 BM9P3J4ItPhA8kr1f8XmMLL5TegV6oqZrtyXDunlWLeWLQZedOgiCmrHYAgpCE6Czg
 VcHwwwBbpk0ZQ==
Date: Wed, 22 Mar 2023 17:42:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <1a780ce4-a34a-4d56-8e23-62c6ed383442@spud>
References: <20230322173449.3970718-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230322173449.3970718-1-robh@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Andy Gross <agross@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Baolin Wang <baolin.wang@linux.alibaba.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mailbox: Drop unneeded quotes
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
Content-Type: multipart/mixed; boundary="===============2511493482861286439=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2511493482861286439==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s7OkovLInhHlrXlo"
Content-Disposition: inline


--s7OkovLInhHlrXlo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 12:34:48PM -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

>  .../devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml   | 4 ++--

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--s7OkovLInhHlrXlo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBs+CQAKCRB4tDGHoIJi
0ljnAP9M6xcNRHWqsKP8m9DmhUIoAK2N9I8ntVPvgXgkDbXKNwEAmcuSgyWAzynP
jPQ9MIFEOPL9QVs0mQsmgjpm9NEXvwY=
=z625
-----END PGP SIGNATURE-----

--s7OkovLInhHlrXlo--

--===============2511493482861286439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2511493482861286439==--
