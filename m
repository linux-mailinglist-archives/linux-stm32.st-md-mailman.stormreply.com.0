Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3F2ABDFAB
	for <lists+linux-stm32@lfdr.de>; Tue, 20 May 2025 17:56:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BF11C78F9C;
	Tue, 20 May 2025 15:56:36 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16441C78F9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 May 2025 15:56:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9136D442D7;
 Tue, 20 May 2025 15:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD3AC4CEE9;
 Tue, 20 May 2025 15:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747756593;
 bh=n1pxIM65d8MoHw115XP1NVDZAKKeEk/k6mze3yHO8s4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U7XBpT+epQQjXsP8yAqN2XraGSgMh8piR5ajbSpVPDUaH4r+x5+81+SVQq34FXmTz
 AbuW/jbx1xIcfy+2hw+gF3aWO1+lojCd/9Pg5qx4jMWLYXwPrs7mnOLTie8cmN0Z4u
 jE6FqXRZOjuV2gQcwkuZghvDXum/x0IbticiC4VExuxfZjdDd2kZmiXHMIpZd01P4T
 VhiHsuXI1TW4trYh99AJ5yx27EJyCESSPhDxclDQQs7LFER5PyBQRlPMd3R3aHaTaN
 kBu5EZNwKHLlrw/eAwAZ4/3365c/87QtuEw/prjx1v9unenMntbKknWXn8GK+EBSUf
 ags6MohDMZPGA==
Date: Tue, 20 May 2025 16:56:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Message-ID: <20250520-absence-sixtyfold-0fd9bb03a42d@spud>
References: <20250520-upstream_rcc_mp21-v2-0-3c776a6e5862@foss.st.com>
 <20250520-upstream_rcc_mp21-v2-1-3c776a6e5862@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20250520-upstream_rcc_mp21-v2-1-3c776a6e5862@foss.st.com>
Cc: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: stm32: add STM32MP21
 clocks and reset bindings
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
Content-Type: multipart/mixed; boundary="===============5684693739428116902=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5684693739428116902==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jx9VuttWMZGkwh2m"
Content-Disposition: inline


--jx9VuttWMZGkwh2m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 20, 2025 at 05:28:37PM +0200, Gabriel Fernandez wrote:
> +
> +  access-controllers:
> +    description: phandle to the rifsc device to check access right.
> +    items:
> +      - description: phandle to access controller
> +
> +    minItems: 1
> +    maxItems: 1

That's just maxItems: 1, the minItems is redundant.


> +    rcc: clock-controller@44200000 {

Remove the label, there's no user.

--jx9VuttWMZGkwh2m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCymLAAKCRB4tDGHoIJi
0kaJAP4grAh/GT4IdIk9FDbZ3XvjNvZh5my/Az0+lUyaEjrXHwD8CskVJGC8F6if
ly0yvkmRUH6dHXpa2Y3SE/anCpfV+QQ=
=C2Ym
-----END PGP SIGNATURE-----

--jx9VuttWMZGkwh2m--

--===============5684693739428116902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5684693739428116902==--
