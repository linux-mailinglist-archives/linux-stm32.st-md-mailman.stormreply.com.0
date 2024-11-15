Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C61A9D4188
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D405C7A852;
	Wed, 20 Nov 2024 17:49:45 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15B8DC6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2024 19:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=finest.io;
 s=s1-ionos; t=1731697183; x=1732301983; i=parker@finest.io;
 bh=JjVpzz7rrwn9sD/anIgIO4Wd5itVBXvna3LVl+1VzIE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=P72VuWdkg8flIDByk8mejscF1bP8JOMM8wQMJ/Ujq6JbK1A+EOGNDHy0bnI9aM/C
 gsmQucY0TlIsVwjuGmcd90VN/bCz1Rg52+ZRoaXovo8a87/W8FANQcwPNLAYlVA3p
 PXMUR93e0idikezocrKr+6ecYNq4kokWyqL5LpvwgpvtxLO4Fi1xG+Snu5ZhbZb+z
 m2nCVrephyEmlLUDduzGsjs6rYxkGbkSGivDHHztOLtlNf36xEEKx9WG+Ht6e7hMe
 DmfgYzizqeEx9RG4iQnInMq5fkpYFlt0VdwGMRhh2UKyRHVogD5ZHWJ29tnpTRiim
 xtJ1xUZMnV+1z0iUGQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from SWDEV2.connecttech.local ([98.159.241.229]) by
 mrelay.perfora.net (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id
 1MXpU8-1tHbbH21Ea-00WOVK; Fri, 15 Nov 2024 19:59:43 +0100
Date: Fri, 15 Nov 2024 13:59:40 -0500
From: Parker Newman <parker@finest.io>
To: Paolo Abeni <pabeni@redhat.com>
Message-ID: <20241115135940.5f898781.parker@finest.io>
In-Reply-To: <ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
References: <cover.1731685185.git.pnewman@connecttech.com>
 <f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
 <ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
Organization: Connect Tech Inc.
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:SFy/NKLNIwSILLteMFW/RS4w4hsJ0Lq5clxhKWhdd5K4p2oB9I7
 9E9yNKCESFsfEU0sj+5Y9V+rZNMMQFjkMFnnYmmhyhhtXpf+Lg5IH4+6SdB2u4yxJPhoy59
 aSUqUXK8ay7+Nvwtd9u0LH4v948NFr9VXi4995v9PaDbK6ftWGEYEL0r6aFdA+cDnsjk0pM
 b5HC5M3cqWpsKjRB+Smmg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:O1wAl8LMaVo=;D2BnCpZbxQfWSIkE7z45IOy7zNg
 U8Alp9c6UVr5okWRhEhSL5n1pbeO+AzORuE9RDkpCYpVAsgPM7L67Q0Qi0nTVWQxX34+n+BB3
 lgERJ0pDZil5xYIRQHMzkmfxoXVZcxdbj9Q2A4a5RZ6kt4s6Jv/MCCCxw1YhXHA4jitgO/5gn
 0AZalep2Uf/1ufOfpn6uk1QhDtd3CkNG8lwZObGj7GZYBJIQp+IBsAf8ktRZandaNFT+ujPVk
 ZIyU1+Scy3sEqoG3RZ5oyIlV6qrxs2UrYIAp3ltvgpoqHtFFNBZVAX6ut4LQmlpoKL9yWC/oI
 iR+k9jTuMXK19Kip/rMVuePCDxIBFi/ezcuWHxRw1kjUZSZtnS/9C7JrD3uFpCmHek7Zvtyub
 pbWjxGS5D92HBqkjzSr9cfhNn4KvoTltDTEKjjf2KZn8TAyfqa049znfSxKqr63+necLfE1Cn
 GWHWds9/wOxpRjPFQL8w7mBXZG6466J0XxBltikARJuJyk5T3gp1MzKya8Z5mIpbUblOb4qGy
 A2cwd8QSzccGq8WikGeAHjz59XF7QWZI3yXTyrRmxzMW2fpm8MJbGm9twncq0JosZ4jJL3Hnm
 wJPFUGeTL7C7ZJlsbdzab/7wjSx0lECOBZLfElOOVxqFWzM1lvwXPwGc4QeEk3ro1Aa4GmZAR
 3N1jYmURAZmnrqTA+yS2g3rYBS36H/lT6yNhkUA6c63TgeeFB3Hv/1aQzNr0yHyD4ckfSwh7E
 JlWAIUpkgxiuI5g5BGtfbP8TOet0DQU4gUU7T9RNE2jnnCqgtFC3GorvcXHDdENqoHaoqwHuX
 mA2DL+v2o77sT+qfM087IugzDMUJ3o80LXH5T10ButyS9p6jhR1zuX9VJXM+cJc8y0
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: Parker Newman <pnewman@connecttech.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/1] net: stmmac: dwmac-tegra: Read
 iommu stream id from device tree
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

On Fri, 15 Nov 2024 18:17:07 +0100
Paolo Abeni <pabeni@redhat.com> wrote:

> On 11/15/24 17:31, Parker Newman wrote:
> > From: Parker Newman <pnewman@connecttech.com>
> >
> > Read the iommu stream id from device tree rather than hard coding to mgbe0.
> > Fixes kernel panics when using mgbe controllers other than mgbe0.
>
> It's better to include the full Oops backtrace, possibly decoded.
>

Will do, there are many different ones but I can add the most common.

> > Tested with Orin AGX 64GB module on Connect Tech Forge carrier board.
>
> Since this looks like a fix, you should include a suitable 'Fixes' tag
> here, and specify the 'net' target tree in the subj prefix.
>

Sorry I missed the "net" tag.

The bug has existed since dwmac-tegra.c was added. I can add a Fixes tag but
in the past I was told they aren't needed in that situation?

> > @@ -241,6 +243,12 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
> >  	if (IS_ERR(mgbe->xpcs))
> >  		return PTR_ERR(mgbe->xpcs);
> >
> > +	/* get controller's stream id from iommu property in device tree */
> > +	if (!tegra_dev_iommu_get_stream_id(mgbe->dev, &mgbe->iommu_sid)) {
> > +		dev_err(mgbe->dev, "failed to get iommu stream id\n");
> > +		return -EINVAL;
> > +	}
>
> I *think* it would be better to fallback (possibly with a warning or
> notice) to the previous default value when the device tree property is
> not available, to avoid regressions.
>

I debated this as well... In theory the iommu must be setup for the
mgbe controller to work anyways. Doing it this way means the worst case is
probe() fails and you lose an ethernet port.

Having it fall back to mgbe0's SID adds the risk of the entire system crashing.

I can see arguments for both methods. I can add the fallback to mgbe0's SID
and change the message to a warning when I send V2 if you like.

Thanks!
Parker

> Thanks,
>
> Paolo
>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
