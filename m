Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDE97613D2
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jul 2023 13:14:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4437DC6B442;
	Tue, 25 Jul 2023 11:14:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA5C5C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 11:14:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ABDA061691;
 Tue, 25 Jul 2023 11:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049E1C433C7;
 Tue, 25 Jul 2023 11:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690283654;
 bh=kZj42ScISmz4li2JKwWSsvJeodC1GyqO823+DqOgMQA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d5pB4XYyX/A8pr8IKx/l1JTHeGyCZ2SsK+MNAA9OCo/+yt8nQFOIhMhkTmboBCRIa
 Xp3ihxmefa6W674THia7xXWtAM4Yu9bl2wwIPl/yRUdSuPeS2PaiCf2/9Akd1BvwnO
 cBstWGkYYCUsI/kBZzFxICr5JZiR7a1ULiUjF506GGI3bbeMGQheJcr1ksxZQ1bkDF
 7Z1QGX91AdC1rjoDmqEqPlRMxXWYaMMeKB0JO7l7zw9fPVenA03NcMAyeaZgYCv3d/
 qicSz1l6Hjc9RPBvMhCH/EEIJn7dl2AEvM6ZwemBYHzAES6yfKS5ai4M4KeehoFAD9
 edIEpusA7+FWA==
Date: Tue, 25 Jul 2023 12:14:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <246eea6e-dd34-426f-9fc7-427d808fe8f0@sirena.org.uk>
References: <20230725105421.99160-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230725105421.99160-1-krzysztof.kozlowski@linaro.org>
X-Cookie: BARBARA STANWYCK makes me nervous!!
Cc: linux-arm-msm@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 devicetree@vger.kernel.org, Pascal Paillet <p.paillet@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 ChiYuan Huang <cy_huang@richtek.com>, Andy Gross <agross@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 - <patches@opensource.cirrus.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Robin Gong <yibin.gong@nxp.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/2] regulator: dt-bindings: add missing
 unevaluatedProperties for each regulator
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
Content-Type: multipart/mixed; boundary="===============3697731341320339695=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3697731341320339695==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pU6qgD5QqpPaeXtO"
Content-Disposition: inline


--pU6qgD5QqpPaeXtO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 25, 2023 at 12:54:20PM +0200, Krzysztof Kozlowski wrote:
> Each regulator node, which references common regulator.yaml schema,
> should disallow additional or unevaluated properties.  Otherwise
> mistakes in properties will go unnoticed.

This doesn't apply against current code, please check and resend.

>  Documentation/devicetree/bindings/regulator/ti,tps65090.yaml  | 1 +

This doesn't seem to be upstream.

--pU6qgD5QqpPaeXtO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS/rn4ACgkQJNaLcl1U
h9Aqggf/aDeIQ1IKzvUqzKpJJNCra6EytL7wUkPxFef7t8RGjNvn50RLK+/3lwv6
iQvyVaumklG1HDAgEHWjfQd6nOOzvoRxmX057o9Tq7cTt57Btvvo6/Oqd8qmMKgK
j0+UTFnUtRp2K2IJ7BB5Apv8aOSvp0yRjqXuZ+U4Eb75NrjHKzpNB2Izroh/Jipt
M8DeS5IYFX/hDBqWt/DJ7IbwoP7HWkTqcR/7uNjnamhgK13y3Snq2TN1R2GuG+YO
CxwwBz4b+xImipL+7fNZRKWE0vz1L5VtyVwwcSfCYwDBNDnObJVmeL2nDM0ndPXD
r1+ge6uWiU507QcyrTs0YVStltnPEQ==
=jUXK
-----END PGP SIGNATURE-----

--pU6qgD5QqpPaeXtO--

--===============3697731341320339695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3697731341320339695==--
