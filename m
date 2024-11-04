Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D2F9BBB91
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B0D5C7A85A;
	Mon,  4 Nov 2024 17:18:40 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 611DFC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Nov 2024 14:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730731597;
 bh=OuS/4i+oygUwsdbc+DVGxua1yWNGYXVWyfGEWNFamiw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lTSHtLS836wcVaZJDpm8Yf8qGI47kjv7/IUuPAG4uEwoXmnGr4LDmIN2uQk2Iv82m
 Sm178fUyf/ZN8sJLsAA7CvSLgf48cQnCFrVbdors/KoZ1eCTtw4ktA/s/eA6d4ynYF
 OrpfuFm+okUH1/UIcJNuasDi4zp1oYo8hqDKZAnRQceI1Fba9HH6pBRRyygKWkuxdl
 xRXOUCV6dj8n0bzWIZdH6oqV12rZSeKcW6sXSjzBSNVH1N86162i8PGA5pHbMen/e9
 yG3hm8vszU5yTpruquqB0J5+PqIppIXloKC69s6VLbQEJBzlcFvgXe1rsM0kA5VYve
 msFOR5HntBqDA==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net
 [100.2.116.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F2AF17E3696;
 Mon,  4 Nov 2024 15:46:35 +0100 (CET)
Date: Mon, 4 Nov 2024 09:46:33 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <c6fec04a-7eed-4c61-85bf-a11542df441b@notapiano>
References: <20241101-mediatek-mac-wol-noninverted-v1-0-75b81808717a@collabora.com>
 <9a1ce320-e1ce-4d2f-a8d1-7680155ef71f@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a1ce320-e1ce-4d2f-a8d1-7680155ef71f@collabora.com>
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@collabora.com, devicetree@vger.kernel.org,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/4] net: stmmac: dwmac-mediatek: Fix
 inverted logic for mediatek, mac-wol
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

On Mon, Nov 04, 2024 at 11:18:48AM +0100, AngeloGioacchino Del Regno wrote:
> Il 01/11/24 16:20, N=EDcolas F. R. A. Prado ha scritto:
> > This series fixes the inverted handling of the mediatek,mac-wol DT
> > property while keeping backward compatibility. It does so by introducing
> > a new property on patch 1 and updating the driver to handle it on patch
> > 2. Patch 3 adds this property on the Genio 700 EVK DT, where this issue
> > was noticed, to get WOL working on that platform. Patch 4 adds the new
> > property on all DTs with the MediaTek DWMAC ethernet node enabled
> > and inverts the presence of mediatek,mac-wol to maintain the
> > current behavior and have it match the description in the binding.
> > =

> =

> Actually, I'm sure that all of these boards *do* need MAC WOL and *not* P=
HY WOL.
> =

> The only one I'm unsure about is MT2712, but that's an evaluation board a=
nd not
> a retail product with "that kind of diffusion".
> =

> I think you can just fix the bug in the driver without getting new proper=
ties
> and such. One commit, two lines.

Alright, since you're sure all the boards need MAC WOL this is simpler: I c=
an
just fix the driver handling, and also update all the DTs to make sure they=
 use
MAC WOL. (Right now some are enabling PHY WOL, mt8395-genio-1200-evk.dts and
mt8395-radxa-nio-12l.dts, while the others are enabling the MAC WOL)

The MT2712 EVB currently enables MAC WOL, so even though you're not sure ab=
out
that one, I think it makes sense to keep the current behavior ie add the
mediatek,mac-wol property just like for the others, so it keeps using MAC W=
OL.

I'll wait a couple days in case there are more comments and then I'll send =
v2
with those changes.

Thanks,
N=EDcolas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
