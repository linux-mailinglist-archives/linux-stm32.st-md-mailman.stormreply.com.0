Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51848B0623B
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 17:02:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E97F1C349C0;
	Tue, 15 Jul 2025 15:02:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2FCAC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 15:02:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 951D94541B;
 Tue, 15 Jul 2025 15:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A969C4CEE3;
 Tue, 15 Jul 2025 15:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752591745;
 bh=exdnCy6Q0C3xztw8Y5wA0w4YeM3tO9kw+ROGW6J34Ko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u3nVs5JArxYZr5IH2Ok+/K4hHyHoWBVdGIoU6WY8tNh0eZVhrimCIIocOoTFKgPJd
 ZY8KvLnsN9tFCaasqmMFKfi17RPbEEOvbvE1XJIf72g/np8VLh7I+KENFzR+c6mJ1/
 lREjBaJpi3lTbwvoKrglymKwsd2cFD6hR2i+eNWA11UDOgOzp+dBD2/d1FHvGiZMOO
 7smub8SEg4+w2NOnrTOBV8tyvOb5iUl/7hAf/J63avI/ml4S8tKpDgM6GIPX8N/Qqe
 0PRTfmcpzkLp+wV/p2hKVJhMhgdC9QZH8kjTRduAUoGsgh6ImOHdA7WFvZKdPrx1Pm
 mBI+wFd67+pHw==
Date: Tue, 15 Jul 2025 10:02:24 -0500
From: Rob Herring <robh@kernel.org>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Message-ID: <20250715150224.GA1319886-robh@kernel.org>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
 <20250711-ddrperfm-upstream-v2-6-cdece720348f@foss.st.com>
 <20250715032020.GB4144523-robh@kernel.org>
 <ae960a16-65ad-4b22-b9fb-89efbffacd3e@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae960a16-65ad-4b22-b9fb-89efbffacd3e@foss.st.com>
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

On Tue, Jul 15, 2025 at 10:32:09AM +0200, Clement LE GOFFIC wrote:
> Hi Rob,
> =

> Thanks for the review !
> =

> On 7/15/25 05:20, Rob Herring wrote:
> > On Fri, Jul 11, 2025 at 04:48:58PM +0200, Cl=E9ment Le Goffic wrote:
> > > Add 32bits LPDDR4 channel to the stm32mp257f-dk board.
> > > =

> > > Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> > > ---
> > >   arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 7 +++++++
> > >   1 file changed, 7 insertions(+)
> > > =

> > > diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/b=
oot/dts/st/stm32mp257f-dk.dts
> > > index a278a1e3ce03..a97b41f14ecc 100644
> > > --- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
> > > +++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
> > > @@ -54,6 +54,13 @@ led-blue {
> > >   		};
> > >   	};
> > > +	lpddr_channel: lpddr4-channel {
> > > +		#address-cells =3D <1>;
> > > +		#size-cells =3D <0>;
> > > +		compatible =3D "jedec,lpddr4-channel";
> > =

> > Not tested because this doesn't match the binding.
> =

> Hmm, I've tested with make dtbs_check and dt_binding_check and it didn't
> complain on my side.
> What I have miss ?

Oh wait, we already have a binding for that. I was confused with your =

adding "jedec,ddr4-channel". Sorry for the noise.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
