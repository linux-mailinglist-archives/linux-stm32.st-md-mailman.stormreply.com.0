Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1EFA56ED9
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 18:15:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D826FC78F97;
	Fri,  7 Mar 2025 17:15:19 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FF43C78F95
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 17:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=7iCfeCNhNbSrVOG/TQp6z3O5xsMhBDg1NtYO7QQkYWU=; b=0vR1x4S5bgxV4e+q8kztTqAS5Q
 FZaQNPmxqGbP43RmbWr8HlU0OPAcKw8UrBdet7aVdujyV7eYAoR69y2AZjCxL4k7++Kgr/0AAwLw8
 Fkrx4cZsD11XbOXigk7VXhIuhC/tlX1eUTow5XtzblBl28J/We/kxNk8JqogbMksssAA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tqbHq-003CZh-KO; Fri, 07 Mar 2025 18:15:02 +0100
Date: Fri, 7 Mar 2025 18:15:02 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <1995782a-0a1c-46dc-8929-7fa3428a5ca3@lunn.ch>
References: <20250306210950.1686713-1-jonas@kwiboo.se>
 <20250306210950.1686713-3-jonas@kwiboo.se>
 <bab793bb-1cbe-4df6-ba6b-7ac8bfef989d@lunn.ch>
 <1dd9e663-561e-4d6c-b9d9-6ded22b9f81b@kwiboo.se>
 <20250307085558.5f8fcb90@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250307085558.5f8fcb90@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-rockchip@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 devicetree@vger.kernel.org
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

On Fri, Mar 07, 2025 at 08:55:58AM -0800, Jakub Kicinski wrote:
> On Fri, 7 Mar 2025 00:49:38 +0100 Jonas Karlman wrote:
> > Subject: Re: [PATCH 2/2] net: stmmac: dwmac-rk: Validate rockchip,grf and php-grf during probe
> > 
> > [encrypted.asc  application/octet-stream (3384 bytes)] 
> 
> Is it just me or does anyone else get blobs from Jonas?
> The list gets text, according to lore.

Sorry, already deleted, but i was able to read the contents, so either
they are plain text, or mutt is clever enough to make sense of the
blob.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
