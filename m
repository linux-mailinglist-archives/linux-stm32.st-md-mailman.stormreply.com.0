Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A5BAFD567
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jul 2025 19:34:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE049C3F92F;
	Tue,  8 Jul 2025 17:34:31 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03B27C3089F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jul 2025 17:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=HeTiWPyX1Uk+AB/SKOARIcNngzgui6r0hgRLKTkBHIA=; b=kGJYjVWq21LQqgydAHfeMNK8dp
 J+6sYTxzXjuLubKC7Msz6ENWEUhgmhPn7m7sPTbPabrY4Fba/Z4b1v/jshyrMB+sTdxoUK4iuh2/a
 w0SYNPthAl6FLk/Q0LS0blYMeW0hPMDJTZMy5Qe79sgTlbuRBhf8Er9jUGmxf6OxTVlY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uZCCl-000qlv-FD; Tue, 08 Jul 2025 19:34:07 +0200
Date: Tue, 8 Jul 2025 19:34:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lizhe <sensor1010@163.com>
Message-ID: <52b71fe7-d10a-4680-9549-ca55fd2e2864@lunn.ch>
References: <20250708165044.3923-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250708165044.3923-1-sensor1010@163.com>
Cc: linux-kernel@vger.kernel.org, vladimir.oltean@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, rmk+kernel@armlinux.org.uk,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Support gpio high-level
 reset for devices requiring it
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

On Tue, Jul 08, 2025 at 09:50:44AM -0700, Lizhe wrote:
> some devices only reset when the GPIO is at a high level, but the
> current function lacks support for such devices. add high-level
> reset functionality to the function to support devices that require
> high-level triggering for reset

You can probably specify this in DT:

reset-gpios = <&qe_pio_e 18 GPIO_ACTIVE_LOW>;

The gpio core will then flip the meaning of

gpiod_set_value_cansleep(reset_gpio, 1);

such that a value of 1 will become low, 0 will become high.

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
