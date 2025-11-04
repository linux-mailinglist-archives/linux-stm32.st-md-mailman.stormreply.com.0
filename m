Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED9CC30F00
	for <lists+linux-stm32@lfdr.de>; Tue, 04 Nov 2025 13:16:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB278C62ED9;
	Tue,  4 Nov 2025 12:16:37 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F2F1C62D53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 00:22:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 812C843DA6;
 Tue,  4 Nov 2025 00:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3140DC4CEE7;
 Tue,  4 Nov 2025 00:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762215724;
 bh=PZC6ZAFX5mF9YpTkaCf/jKGSfMQTSFoPUl3PB0kzxEA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jgWfkAHbxDoD2BP9iwLha/1gvlsiF+jnLgr+WZifolFV8R5Egc0AIiBEvR5rsz4g5
 eK7tWcNkCdVUq+7RKQHBkE8gcWNmBDvriEI0qcRx5En9g0HpHrA0UAOAnQOYiY8UmM
 WT1XtGrThAoV48lvxFlXafD7NhcgI6X3J49WtET07eOA8P01A/SQpoxOyiO+dUgm/a
 NGNek3UIn5jcORQ9NXJ1pGpsj0MXt+NgvNWy0TPuJGVQKsRqsT2bwGdr3FB1IFqRB4
 t+RQF86mNa+58QWc81TjbMTVQBV9+/qYLVtQeN21XdaERSkPYbo5KpT5x046flgsCO
 dB9BvXJGVm+HA==
Date: Mon, 3 Nov 2025 16:22:02 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <20251103162202.1bd0dae0@kernel.org>
In-Reply-To: <20251103030526.1092365-3-inochiama@gmail.com>
References: <20251103030526.1092365-1-inochiama@gmail.com>
 <20251103030526.1092365-3-inochiama@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 04 Nov 2025 12:16:35 +0000
Cc: Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Icenowy Zheng <uwu@icenowy.me>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Chen Wang <unicorn_wang@outlook.com>, Russell King <linux@armlinux.org.uk>,
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
Subject: Re: [Linux-stm32] [PATCH v6 2/3] net: phy: Add helper for fixing
 RGMII PHY mode based on internal mac delay
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

On Mon,  3 Nov 2025 11:05:25 +0800 Inochi Amaoto wrote:
> +/**
> + * phy_fix_phy_mode_for_mac_delays - Convenience function for fixing PHY
> + * mode based on whether mac adds internal delay
> + *
> + * @interface: The current interface mode of the port
> + * @mac_txid: True if the mac adds internal tx delay
> + * @mac_rxid: True if the mac adds internal rx delay
> + *
> + * Return fixed PHY mode, or PHY_INTERFACE_MODE_NA if the interface can
> + * not apply the internal delay
> + */

Please add a : after Return, so:

 * Return: fixed PHY mode, or PHY_INTERFACE_MODE_NA if the interface can

otherwise kdoc warns:

Warning: drivers/net/phy/phy-core.c:116 No description found for return value of 'phy_fix_phy_mode_for_mac_delays'
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
