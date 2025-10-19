Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 297E0BEDD12
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Oct 2025 02:04:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC032C5A4DF;
	Sun, 19 Oct 2025 00:04:54 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA76EC32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Oct 2025 00:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=rz0DjI9FG3R+Vf1dNEL5GbVU6jXA/C1j8hwA+dUf/6I=; b=AcN5Xqb1JNtWQtEk5ZUe7Vs44j
 z6+QascX8RZXSMzyNmZzlFs0g6XLvpMzTZ0U8eTgVmWGTWkCOapk0xir30PnWmjZ3UOLRQTKoWVuS
 ukLu99pJOm6qI3+yfv+f7nNyf4DISn160d2zMZr8VTYh9aVfCTZXUGhortzxREz4zatY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1vAGu2-00BP9M-KF; Sun, 19 Oct 2025 02:04:02 +0200
Date: Sun, 19 Oct 2025 02:04:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <370d13b7-bba8-449d-9050-e0719d20b57c@lunn.ch>
References: <20251017011802.523140-1-inochiama@gmail.com>
 <34fcc4cd-cd3d-418a-8d06-7426d2514dee@lunn.ch>
 <i5prc7y4fxt3krghgvs7buyfkwwulxnsc2oagbwdjx4tbqjqls@fx4nkkyz6tdt>
 <c16e53f9-f506-41e8-b3c6-cc3bdb1843e1@lunn.ch>
 <aPP9cjzwihca-h6C@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aPP9cjzwihca-h6C@shell.armlinux.org.uk>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 Icenowy Zheng <uwu@icenowy.me>, Inochi Amaoto <inochiama@gmail.com>,
 Chen Wang <unicorn_wang@outlook.com>, Longbin Li <looong.bin@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Yixun Lan <dlan@gentoo.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Han Gao <rabenda.cn@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, sophgo@lists.linux.dev,
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

> "rgmii-id" doesn't mean "there is a delay _somewhere_ in the system".
> It's supposed to mean that the PHY should add delays on both tx and
> rx paths.

When passed to the PHY it means that.

However, DT describes the hardware, the PCB. "rgmii-id" means the PCB
does not provide the delays. So the MAC/PHY combination needs to add
the delays. We normally have the PHY provide the delays, so the
phy-mode is normally passed straight to the PHY. However, if the MAC
is adding a delay, which it is in this case, in one direction and
cannot be turned off, the value passed to the PHY needs to reflect
this, to avoid double delays.

And because the MAC delay cannot be turned off, it means there are PCB
designs which don't work, double delays. So it would be nice not to
list them in the binding.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
