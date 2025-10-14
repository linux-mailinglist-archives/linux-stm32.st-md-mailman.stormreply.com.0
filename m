Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D249CBDAE42
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Oct 2025 20:06:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A6C9C56608;
	Tue, 14 Oct 2025 18:06:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FE30C56607
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Oct 2025 18:06:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BF61144EBC;
 Tue, 14 Oct 2025 18:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CCFFC4CEE7;
 Tue, 14 Oct 2025 18:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760465163;
 bh=JfNs7dFvmbLt53h9POVLQpvwOzXq+QveaKQx6rXQNw8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eSz3Di7btbUQi85if9iBM+pXDgRpQCPe5IPR1EH1XLn9FLC4I/xBB8bZPvvlBU4BV
 mZ8811SvF95JAtHe/62tJCBxFIVM+5oDa7aXK74sgg9+1SyqcjJTMezUuqnEIlfH6o
 dNMM+nDzu/i9dF4oKj/YF+tJ6q3FRPDmMCTZ1qM5dhD0M2lNgwG4VbWA2xnng1+SDh
 eU9Iz4jvrZCPaw1dcKQ6FmAJvytohB24hnLItwHnCASx2feiXgjpmYQglbUrSCjzc3
 2/Zpb3i9MsczskqAk7ppoRMcJKP1g8YdNN9pR9OiBBZrRDV3azr5VgPk8MbVXgMNN7
 vPx5mB2cYHvDQ==
Date: Tue, 14 Oct 2025 19:05:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Message-ID: <20251014-privatize-unnerving-bb26a0626276@spud>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-9-antonio.borneo@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20251014140451.1009969-9-antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v3 08/10] dt-bindings: pinctrl: stm32: Use
 properties from pincfg-node.yaml
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
Content-Type: multipart/mixed; boundary="===============2740891223332687960=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2740891223332687960==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wigSmc8rrZJKQMu+"
Content-Disposition: inline


--wigSmc8rrZJKQMu+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--wigSmc8rrZJKQMu+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO6RBgAKCRB4tDGHoIJi
0hVaAQDs2t7Df4kI4kyx6xytw0ZMIEL3EaLx1elCU0OeibxfpwD/UIGUJYpE++Jz
HbbMxb2Nhx7TeJ4NiLJbGkxps5OpZAA=
=vh6W
-----END PGP SIGNATURE-----

--wigSmc8rrZJKQMu+--

--===============2740891223332687960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2740891223332687960==--
