Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8187FC5C319
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 10:15:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F48AC60468;
	Fri, 14 Nov 2025 09:15:12 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F862C06935
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 09:15:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 36F5743296;
 Fri, 14 Nov 2025 09:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC346C19425;
 Fri, 14 Nov 2025 09:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763111709;
 bh=kbbz3wPLsY8nHQqv/+1SqRtx1it+jT7BWo1yvJHgzbc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X6Uq+CGSHZEcFvyGEAUK4pc9y33nD+Jt6d6Ud5m2nl90pHN8xFkNSeLIVJloO1kfr
 oAg7QzRhvlYEiN3dmhejq2EJc07MRTDkwC21KkfzJbXtp+rTwNlPOTx8jTj0JnlbBi
 2gLqlvWOEyquRPYl9sTbJaa3Ub9A+mNOHT3l1ODPaR4Bu4GvmOKh5JWxpvnDbFubMS
 gbr+apaUh7HffU8O4atzgS2qPZKmAPGmPifnoGW0qZ14S65qSs1C/3ukWYHrh2VvuM
 skZmJNXmXo8bxBnny/DiciS9f8PDatyii7JrAAiy2D9M2Ot6WH/C7U9JIVfnD04ck2
 fDHQJgQheIvsQ==
Date: Fri, 14 Nov 2025 09:15:01 +0000
From: Simon Horman <horms@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <aRbzFUWzvkiLO8wx@horms.kernel.org>
References: <20251114003805.494387-1-inochiama@gmail.com>
 <20251114003805.494387-4-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251114003805.494387-4-inochiama@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Longbin Li <looong.bin@gmail.com>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Chen Wang <unicorn_wang@outlook.com>,
 Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, sophgo@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Han Gao <rabenda.cn@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v8 3/3] net: stmmac: dwmac-sophgo: Add phy
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

On Fri, Nov 14, 2025 at 08:38:05AM +0800, Inochi Amaoto wrote:
> As the SG2042 has an internal rx delay, the delay should be removed
> when initializing the mac, otherwise the phy will be misconfigurated.
> 
> Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Tested-by: Han Gao <rabenda.cn@gmail.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
