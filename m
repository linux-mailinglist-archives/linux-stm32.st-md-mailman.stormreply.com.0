Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E90E19E207B
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Dec 2024 15:59:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CA04C6C83D;
	Tue,  3 Dec 2024 14:59:08 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67A24C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 14:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=AQfWXnwBtjN4+gVX0bHkzy3HHnT2/jPXP6zHmg2fCvs=; b=Ln
 B4d1FLm6hFKT1zzUVBGaUbFqCSIXxlRMFuTgS6FHvoDQDHLEdDcUOJ8gi8ngmraFhNAug/S96vt/i
 t3QOSt5H8yDbjbaPbKmXFEjhTgrH+vleuSIwL0JbIp+/p6Xs3FsMCIm+Nafv2zdnT/daIZdJpICGx
 oZHrT0RltarQVX4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tIUMM-00F6Nb-5j; Tue, 03 Dec 2024 15:58:42 +0100
Date: Tue, 3 Dec 2024 15:58:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joey Lu <a0987203069@gmail.com>
Message-ID: <ba09cea2-4cf7-4203-ae98-ea5d8413f69e@lunn.ch>
References: <20241202023643.75010-1-a0987203069@gmail.com>
 <20241202023643.75010-4-a0987203069@gmail.com>
 <9f2c8532-8e52-439a-b253-ad2ceb07b21b@lunn.ch>
 <75eb13d7-b582-4056-b707-706865611706@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75eb13d7-b582-4056-b707-706865611706@gmail.com>
Cc: ychuang3@nuvoton.com, edumazet@google.com, schung@nuvoton.com,
 yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v4 3/3] net: stmmac: dwmac-nuvoton: Add
 dwmac glue for Nuvoton MA35 family
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

On Tue, Dec 03, 2024 at 05:12:24PM +0800, Joey Lu wrote:
> Dear Andrew,
> =

> You're correct. In the stmmac_hw_init function within stmmac_main.c, whet=
her
> pmt is true is determined by checking the pmt_remote_wake_up bit in the
> hardware feature register. However, our hardware configuration only suppo=
rts
> magic packet and not remote wakeup, so it must be overwritten in the glue
> driver.

Please add a comment explaining this. =



I'm not sure why the original code doesn't include magic packet as part
> of pmt.
> =

> source code:
> =

> =A0=A0=A0 =A0=A0=A0 stmmac_hw_init() @net/ethernet/stmicro/stmmac/stmmac_=
main.c
> =

> =A0=A0=A0=A0=A0=A0=A0 priv->plat->enh_desc =3D priv->dma_cap.enh_desc;
> =A0=A0=A0=A0=A0=A0=A0 priv->plat->pmt =3D priv->dma_cap.pmt_remote_wake_u=
p &&
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 !(priv->plat->flags & STMMA=
C_FLAG_USE_PHY_WOL);
> =A0=A0=A0=A0=A0=A0=A0 priv->hw->pmt =3D priv->plat->pmt;
> =

> Or modify the condition as follows:
> =

> =A0=A0=A0 =A0=A0=A0 priv->plat->pmt =3D (priv->dma_cap.pmt_remote_wake_up=
 || priv->
> dma_cap.pmt_magic_frame) &&
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 !(priv->plat->flags & STMMA=
C_FLAG_USE_PHY_WOL);

Are there other glue drivers which would benefit from this? It is hard
for me to say if you hardware is odd, or if this should be a generic
feature which other glue drivers would use.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
