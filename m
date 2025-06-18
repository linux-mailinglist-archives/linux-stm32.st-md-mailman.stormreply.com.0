Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A92ADF5F2
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jun 2025 20:33:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0473C36B30;
	Wed, 18 Jun 2025 18:33:40 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45E56C36B0F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 18:33:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 48DE361F1F;
 Wed, 18 Jun 2025 18:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3F6C4CEE7;
 Wed, 18 Jun 2025 18:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750271618;
 bh=Qvk01E4K4eKwx+8ladXQ0z7hVsHIb+7XaYBHTXV1Qho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XzYud4bftYB9pjydcI4H4I2BpBLdO83lNw+wguQau46tp6Sh0UauAF4ND4tOpOpLP
 D2/Kf8q0knJy5v0b1oZHaSKTA3P2gFtLrDxnRRjOmXCsfz1C8tnF8niME+kTuWtXav
 CbT8TSSE6zTs9qIQoa9OQtf98mZ/Lx0dYzZbc2ViKVGru0vTDkM9w9P5HpHA1p16hJ
 MOBmcZfOBbgBUozS+2zstmeSdPwOdMynK6nwraPDiwIJMJ4eOg6cNdh50DkWoJ19jn
 ZCw0l0fqTM0wMXyELOFqtPjq5UaoY6mCns0psqj6uWdg+NBrxJ3VthF6OHpaOBqKXd
 xZvDXhGQThkMA==
Date: Wed, 18 Jun 2025 19:33:33 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250618183333.GW1699@horms.kernel.org>
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
 <E1uRqE9-004c7G-CB@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1uRqE9-004c7G-CB@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: loongson1:
 provide match data struct
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

On Wed, Jun 18, 2025 at 11:41:09AM +0100, Russell King (Oracle) wrote:
> Provide a structure for match data rather than using the function
> pointer as match data. This allows stronger type-checking for the
> function itself, and allows extensions to the match data.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
