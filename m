Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E0C24C07
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 11:56:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D29AC73B1E
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 09:56:34 +0000 (UTC)
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FA0FC73B1D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 09:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1558432591; bh=1nbvGwWgSb1jI/P1ZT27Mo4T3fhSGGa/u2NrHc/bhEY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aQxlmz+L5OjzAbaGr0IgpRjnbM2RyEQ9ga6eu6t3E1wgEuRsrhjeZ3D6nbtxshUqQ
 EFtz03J7GkN8M0jpVIqGGEF95yxB7bHBJWFoHkXR0AupOG3A5VI/5BhgWHf71ZAzVl
 J10mK1Th7bIsLg6pDXlJsqz4NYBtfHlHzsAteH3k=
Date: Tue, 21 May 2019 11:56:31 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <20190521095631.v5n3qml5ujofufk4@core.my.home>
Mail-Followup-To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 linux-sunxi@googlegroups.com,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Icenowy Zheng <icenowy@aosc.io>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Mark Rutland <mark.rutland@arm.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20190520235009.16734-1-megous@megous.com>
 <20190520235009.16734-3-megous@megous.com>
 <4e031eeb-2819-a97f-73bf-af84b04aa7b2@cogentembedded.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e031eeb-2819-a97f-73bf-af84b04aa7b2@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Jose Abreu <joabreu@synopsys.com>,
 devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [Linux-stm32] [PATCH v5 2/6] net: stmmac: sun8i: force select
 external PHY when no internal one
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello Sergei,

On Tue, May 21, 2019 at 12:27:24PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 21.05.2019 2:50, megous@megous.com wrote:
> 
> > From: Icenowy Zheng <icenowy@aosc.io>
> > 
> > The PHY selection bit also exists on SoCs without an internal PHY; if it's
> > set to 1 (internal PHY, default value) then the MAC will not make use of
> > any PHY such SoCs.
>          ^ "on" or "with" missing?

It's missing 'on'.

thank you,
	Ondrej

> > This problem appears when adapting for H6, which has no real internal PHY
> > (the "internal PHY" on H6 is not on-die, but on a co-packaged AC200 chip,
> > connected via RMII interface at GPIO bank A).
> > 
> > Force the PHY selection bit to 0 when the SOC doesn't have an internal PHY,
> > to address the problem of a wrong default value.
> > 
> > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > Signed-off-by: Ondrej Jirman <megous@megous.com>
> [...]
> 
> MBR, Sergei
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
