Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F51B17280
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Jul 2025 15:53:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25C3EC3F938;
	Thu, 31 Jul 2025 13:53:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1C9DC3F933
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Jul 2025 13:53:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B4FA75C637B;
 Thu, 31 Jul 2025 13:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAF4C4CEEF;
 Thu, 31 Jul 2025 13:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753969995;
 bh=yXz5mBUZF6Q+N9j0CfMMnnCvdMIaf13rIadj2MRnX6I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nuKFVyrU6RyPSXasWhoG+PZAXbRQvg71zY3Sb4uTSLtkzVcZM0ctCwZO3WwvbrI09
 ofP7XRFAPu1cfff9IQtvv+PsZrp7DYf2mrsMz4ChCf7VEdMnancKGYNTWTjE6nTgv4
 jkH4N26DgfRG0wbOfGY5i72biU7CN1WqAAjiYVz3VcYFVBazuo0nDfZbuitZk1w+Qa
 t1dnTWlsxZqR9BiurwrZeHrk8ddZNmlW4lAIpMUpX2ytaljEbDNC2ctWKdiOTqCGJ7
 Uccf4zOgOrnGHzrK+5ybIUOuYGenFyIiknGkpjqzCdoVc7TLn//RW+GppLnn3oeaof
 /JXo+hqbBlLwg==
Date: Thu, 31 Jul 2025 08:53:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <175396999408.2138783.9344122999119698215.robh@kernel.org>
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-9-03f1be8ad396@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250728-ddrperfm-upstream-v5-9-03f1be8ad396@foss.st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Will Deacon <will@kernel.org>, linux-clk@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Le Goffic <legoffic.clement@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Julius Werner <jwerner@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v5 09/20] dt-bindings: memory: SDRAM
 channel: standardise node name
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


On Mon, 28 Jul 2025 17:29:40 +0200, Cl=E9ment Le Goffic wrote:
> Add a pattern for sdram channel node name.
> =

> Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> ---
>  .../bindings/memory-controllers/ddr/jedec,sdram-channel.yaml       | 7 +=
++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> =


Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
