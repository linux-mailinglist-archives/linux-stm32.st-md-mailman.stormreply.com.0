Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D94F4A56E68
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 17:56:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AB00C78F97;
	Fri,  7 Mar 2025 16:56:02 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 514A7C78F95
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 16:56:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AF56EA43ED0;
 Fri,  7 Mar 2025 16:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB91C4CED1;
 Fri,  7 Mar 2025 16:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741366559;
 bh=zm4IUNRU5F9Q7F6IslhySw9XY0LvJZqmHl7UPH2oVUQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AVpLkgsm+rJ1/+ojcbOf8+M3KoFzyiiESQHwjozKAPjF8B36+xTNHrBJm+OV0IzoP
 9DIl30BifTky83nb+ef9gFAfamPXZoSgWIfmpA9euJYTrs3wu9ivgapJI6JR3gFCA1
 CmjG6ORlNPfFLBEhuTr35fy8VNDn2/WcqANJ0KGlI4nwtFgIJwW2aIS2H4i8v4MZV/
 5ubKCGk/uJxRELly6gsEXqtT/B4vlKspg7bln92m2n9XTmZwRFUEnruBztw+BLShQq
 APwS0a6x/LJuzZQ7QklhKw3O/u2zP8pBoWkBqbqNfww/A8IKi8k251LDbdwJQX11IJ
 v5MuibhQrFa/g==
Date: Fri, 7 Mar 2025 08:55:58 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>, Andrew Lunn <andrew@lunn.ch>
Message-ID: <20250307085558.5f8fcb90@kernel.org>
In-Reply-To: <1dd9e663-561e-4d6c-b9d9-6ded22b9f81b@kwiboo.se>
References: <20250306210950.1686713-1-jonas@kwiboo.se>
 <20250306210950.1686713-3-jonas@kwiboo.se>
 <bab793bb-1cbe-4df6-ba6b-7ac8bfef989d@lunn.ch>
 <1dd9e663-561e-4d6c-b9d9-6ded22b9f81b@kwiboo.se>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-rockchip@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] net: stmmac: dwmac-rk: Validate
 rockchip, grf and php-grf during probe
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

On Fri, 7 Mar 2025 00:49:38 +0100 Jonas Karlman wrote:
> Subject: Re: [PATCH 2/2] net: stmmac: dwmac-rk: Validate rockchip,grf and php-grf during probe
> 
> [encrypted.asc  application/octet-stream (3384 bytes)] 

Is it just me or does anyone else get blobs from Jonas?
The list gets text, according to lore.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
