Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F51BEB2B8
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 20:16:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4CD6C5A4C1;
	Fri, 17 Oct 2025 18:16:42 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D2F2C5978F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 18:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=fO2f6mURH8bQZYGfr1Lrr+16q3HGGYwVpFWAgRU4ZMA=; b=SKKZAasNBz3jruAECyAjMqftbi
 YjSr/IHx0LNgu/gwWoBxRT9vJ672lGqiMf9jY4kjA2Qn9D08oJdRzxsGxmGq2xqatPMRanlpA+wgR
 jNN83D9izslqFUcUA/TJVo0ZhHqZtGG6cosMyVpjp4nEEG+kA60sYEKM5tVJTPmiKPrM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1v9ozx-00BJbN-Qd; Fri, 17 Oct 2025 20:16:17 +0200
Date: Fri, 17 Oct 2025 20:16:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <34fcc4cd-cd3d-418a-8d06-7426d2514dee@lunn.ch>
References: <20251017011802.523140-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017011802.523140-1-inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>,
 sophgo@lists.linux.dev, Vivian Wang <wangruikang@iscas.ac.cn>,
 Chen Wang <unicorn_wang@outlook.com>, Longbin Li <looong.bin@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Yixun Lan <dlan@gentoo.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Han Gao <rabenda.cn@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Yao Zi <ziyao@disroot.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-sophgo: Add phy
	interface filter
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

On Fri, Oct 17, 2025 at 09:18:01AM +0800, Inochi Amaoto wrote:
> As the SG2042 has an internal rx delay, the delay should be remove
> when init the mac, otherwise the phy will be misconfigurated.

Are there any in tree DT blobs using invalid phy-modes? In theory,
they should not work, but sometimes there is other magic going on. I
just want to make sure this is not going to cause a regression.

Also, does the DT binding document list the valid phy-modes?

      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
