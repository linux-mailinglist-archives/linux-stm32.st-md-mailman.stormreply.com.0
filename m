Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8D68A002E
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Apr 2024 20:58:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20218C6C820;
	Wed, 10 Apr 2024 18:58:30 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E28EC6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 18:58:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B0B59CE2B8E;
 Wed, 10 Apr 2024 18:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C449AC433C7;
 Wed, 10 Apr 2024 18:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712775506;
 bh=9YYPyx0qIUyI2HnU5/vkhTGz6+QCGmfdShkQKgzhQ6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NctKVa6nDuwhkik7DjWM/8gh6F+hOS55GKTNqBVCX1nBdzkyfiYssDUSeRGXdCF2S
 wxkoec0/uuRSCRW7Pq9Hi/Ha4DvgRKER3vzJ3UHVdATxV7WQlxWo3GNSvHIVE35aqx
 bsSYCoy+DFdkQW2vjW4ebXc9IH9SRhMxnDOl3XjC4NvcVIPC8xPC/B/9gT8BaqDCCY
 KvQWXcWzW+TSyFFnROqICrLEUwMaeMFms0kmBgJBAayEctO6ln8J34GTEZ7ScOb8zy
 lHcNfa0Wt6RGjRIAL6b7ilVf22abWc7Wj2xhgf9XyTvvADKixDs7OD44sWp35AQkdP
 EFEigzh7HECrw==
Date: Wed, 10 Apr 2024 13:58:23 -0500
From: Rob Herring <robh@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <171277550043.890351.16696873966908975164.robh@kernel.org>
References: <20240409-rzn1-gmac1-v2-0-79ca45f2fc79@bootlin.com>
 <20240409-rzn1-gmac1-v2-1-79ca45f2fc79@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240409-rzn1-gmac1-v2-1-79ca45f2fc79@bootlin.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "David S. Miller" <davem@davemloft.net>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/5] dt-bindings: net: renesas,
 rzn1-gmac: Document RZ/N1 GMAC support
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


On Tue, 09 Apr 2024 11:21:44 +0200, Romain Gantois wrote:
> From: Cl=E9ment L=E9ger <clement.leger@bootlin.com>
> =

> The RZ/N1 series of MPUs feature up to two Gigabit Ethernet controllers.
> These controllers are based on Synopsys IPs. They can be connected to
> RZ/N1 RGMII/RMII converters.
> =

> Add a binding that describes these GMAC devices.
> =

> Signed-off-by: "Cl=E9ment L=E9ger" <clement.leger@bootlin.com>
> [rgantois: commit log]
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>  .../devicetree/bindings/net/renesas,rzn1-gmac.yaml | 66 ++++++++++++++++=
++++++
>  1 file changed, 66 insertions(+)
> =


Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
