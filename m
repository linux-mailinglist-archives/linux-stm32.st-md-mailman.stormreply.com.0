Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95832818C68
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Dec 2023 17:39:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44904C6B477;
	Tue, 19 Dec 2023 16:39:49 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96184C6B44D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Dec 2023 16:39:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E180FB8109D;
 Tue, 19 Dec 2023 16:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50975C433C7;
 Tue, 19 Dec 2023 16:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703003986;
 bh=DT67ZW2+7W7SD3PMRmJ/cCFJ+tiSAVkDYvY8fK5VSCg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DXnU1sRUlssrMaubs35Weig4mJ7cexODuIlPLyIjQc1AVB7EucGeE4Kg5R0hyInKx
 jYBnrb+zt9e7od6NvxkNy752We/zA12wkv711DjK0nom9uw+e3kGVrwjP0aJIB9Ez3
 D9jXbtX8UG79fw+JwMgjZ1oXV69MHi9lkBWg4VkIOGbdoFB9DJ4tpTuF+U5j2fvSwt
 El82HnryXouUWO9Yw+QGYn7HwbBoaEZci0CFfw/+b66mMfjFQVdQkfNPLTjFeMpIwO
 kDsivo1zuCFSFul0ozEH16dwaEMcSZhoMOoAbv5/fZ8I0xlz6lDWvwZKDZ+jhZLO3O
 1UA5kTwXIotzg==
Date: Tue, 19 Dec 2023 16:39:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20231219-subwoofer-aversion-385ee53dc6be@spud>
References: <20231218155721.359198-1-alain.volmat@foss.st.com>
 <20231218155721.359198-3-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231218155721.359198-3-alain.volmat@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/6] dt-bindings: spi: stm32: add st,
 stm32mp25-spi compatible
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
Content-Type: multipart/mixed; boundary="===============8553793045256084447=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8553793045256084447==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4JfhjNn4JBeIfO3a"
Content-Disposition: inline


--4JfhjNn4JBeIfO3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>


--4JfhjNn4JBeIfO3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYHHTAAKCRB4tDGHoIJi
0hGNAP0WWifqG0WIUZAm9584zAolrMPgrTHdyBtimolc18oB7wD/fb/NYoQ375mc
QjQs2n6rDOzLOQS4euFbxvdah5N8FQs=
=RwnB
-----END PGP SIGNATURE-----

--4JfhjNn4JBeIfO3a--

--===============8553793045256084447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8553793045256084447==--
