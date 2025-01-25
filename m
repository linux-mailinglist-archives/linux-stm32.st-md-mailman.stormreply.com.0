Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F77A1C504
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Jan 2025 20:08:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBE50C78F69;
	Sat, 25 Jan 2025 19:08:29 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31E52C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jan 2025 19:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=obzrF8Fcswq9E43yJqIugq65f/Z50UkRlpZ6W6TRcfc=; b=2v+ju4SsDiTdVKKpK7HJYAX9kd
 wIrW6FKP9mt3eNl3DnsnGQtVpN2A/M+h4vKG5Iuok9zmf614ZaybqOw6H9RXWfQ/ZF5q0g9DdAtC4
 i68eI481stsLB1+vUbTxYf++BzjSSLG4L56+Xqw1gVPx7U8JjMLFIH4knLGhcJBwsZuM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tblVs-0081uW-OA; Sat, 25 Jan 2025 20:08:12 +0100
Date: Sat, 25 Jan 2025 20:08:12 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <09442385-573c-4756-8c30-296631bc6272@lunn.ch>
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
 <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
 <20250124104256.00007d23@gmail.com> <Z5S69kb7Qz_QZqOh@shredder>
 <20250125230347.0000187b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250125230347.0000187b@gmail.com>
Cc: Paolo Abeni <pabeni@redhat.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>, netdev@vger.kernel.org,
 Joe Damato <jdamato@fastly.com>, linux-kernel@vger.kernel.org,
 Brad Griffis <bgriffis@nvidia.com>, Ido Schimmel <idosch@idosch.org>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Lunn <andrew+netdev@lunn.ch>
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/4] net: stmmac: Switch to
 zero-copy in non-XDP RX path
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

> It is recommended to disable the "SPH feature" by default unless some
> certain cases depend on it. Like Ido said, two large buffers being
> allocated from the same page pool for each packet, this is a huge waste
> of memory, and brings performance drops for most of general cases.

I don't know this driver, but it looks like SPH is required for
NETIF_F_GRO? Can you add this flag to hw_features, but not
wanted_features and leave SPH disabled until ethtool is used to enable
GRO?

Are there other use cases where SPH is needed?

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
