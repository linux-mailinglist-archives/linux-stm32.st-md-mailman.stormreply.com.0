Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E86B0B04E9A
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 05:20:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9053C3F931;
	Tue, 15 Jul 2025 03:20:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF6F9C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 03:20:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 657BD45E81;
 Tue, 15 Jul 2025 03:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5B9C4CEED;
 Tue, 15 Jul 2025 03:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752549621;
 bh=TDYuRWmFZrwnvk8qMS3AlGvkZ3xUWYu930vi3adDEoY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mhnvEVxTxd7nbP4JvA3c5oAI7v4Uh1XECXIYdE/N/qy0huEeZvo77oD3clb4yTeWg
 ymcvNK/OWxZiNy8QB28n853qDQu5Onfy2QbNM99FmG7C495d6/1pBwDdOtioibMSSr
 /rlMD2bWz/hqVqcD18knvPH4J8lLajX/kcQ2Ilm7eWdWbm7ZGc4Q/ZTnOWmINuwNNe
 BxX9zMQoXhN+gpCMRRtNwTSi0RuN0t+Gkpq8fEib5xKs3IOxjBmVBIpaSmzbYDP8qg
 xOWvSr5FiKi9K5beUealNgIeVFiD9nCqjoctx0r+oRvwk+1p8VUoHmrFlNxs9LXyT7
 106sWikoj8ffw==
Date: Mon, 14 Jul 2025 22:20:20 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <20250715032020.GB4144523-robh@kernel.org>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
 <20250711-ddrperfm-upstream-v2-6-cdece720348f@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250711-ddrperfm-upstream-v2-6-cdece720348f@foss.st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-doc@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-perf-users@vger.kernel.org, Le Goffic <legoffic.clement@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 06/16] arm64: dts: st: add LPDDR
 channel to stm32mp257f-dk board
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

On Fri, Jul 11, 2025 at 04:48:58PM +0200, Cl=E9ment Le Goffic wrote:
> Add 32bits LPDDR4 channel to the stm32mp257f-dk board.
> =

> Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> ---
>  arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/=
dts/st/stm32mp257f-dk.dts
> index a278a1e3ce03..a97b41f14ecc 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
> +++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
> @@ -54,6 +54,13 @@ led-blue {
>  		};
>  	};
>  =

> +	lpddr_channel: lpddr4-channel {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		compatible =3D "jedec,lpddr4-channel";

Not tested because this doesn't match the binding.

> +		io-width =3D <32>;
> +	};

What would multiple channels look like? I think this needs some work. =

Like it should perhaps be within the memory node. It's a lot to just say =

32-bit LPDDR4 x1.

> +
>  	memory@80000000 {
>  		device_type =3D "memory";
>  		reg =3D <0x0 0x80000000 0x1 0x0>;
> =

> -- =

> 2.43.0
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
