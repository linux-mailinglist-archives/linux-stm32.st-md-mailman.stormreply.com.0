Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CE3B17253
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Jul 2025 15:50:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1B39C3F938;
	Thu, 31 Jul 2025 13:50:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61890C3F933
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Jul 2025 13:50:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D4F8D5C5B66;
 Thu, 31 Jul 2025 13:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466DCC4CEEF;
 Thu, 31 Jul 2025 13:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753969803;
 bh=jawTeo3jrKl31BlPRVIr+R1PBzhaxmiMePBk8kxuwVE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OYvfVm/ZsnER1HAKkEC4ux4CBvQVHusXAIuQa7z1ZbnKXII3hVV0Vn6nrQDFfiX8s
 IRdZpm0EQQII1M9WaXzoygW+pWRitgstvVXD/ZlpibPf1tutHLt/QsaliYM4OU3u1w
 qBs4XJvMcr091e+bw3lFfjJr5tAIDLaOboOA8r+jbb8ev/LYEcDbA4keqduCjzqmdL
 87p7crjoiKMwL4dJ7CAtIp7BJ8bfAGCAtE9FYCezeSVRHNfEcSxoPRB0kF+Mg8B3Ud
 sHuncQm80xlb2D2GQQ2hL52M1WqmHfZ0HkZnwQ9KqTy5t+q6zDZXtJgCkz2Pu/yzqc
 oyDag2pTvuaUg==
Date: Thu, 31 Jul 2025 08:50:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <175396980193.2134840.5721329894183158883.robh@kernel.org>
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-2-03f1be8ad396@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250728-ddrperfm-upstream-v5-2-03f1be8ad396@foss.st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Will Deacon <will@kernel.org>, linux-clk@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Le Goffic <legoffic.clement@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-perf-users@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Julius Werner <jwerner@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v5 02/20] dt-bindings: stm32: stm32mp25:
 add `#access-controller-cells` property
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


On Mon, 28 Jul 2025 17:29:33 +0200, Cl=E9ment Le Goffic wrote:
> RCC is able to check the availability of a clock.
> Allow to query the RCC with a firewall ID.
> =

> Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> ---
>  Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> =


Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
