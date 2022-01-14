Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2799C48E351
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jan 2022 05:35:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEECEC5F1F5;
	Fri, 14 Jan 2022 04:35:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA2BFCFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 04:35:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A2C0561670;
 Fri, 14 Jan 2022 04:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592F2C36AEA;
 Fri, 14 Jan 2022 04:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642134925;
 bh=5ujrF7TIlOeg9a58cDS1ACqnP2rvn0LCA4q1ER9VkWQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cv0DqK+UwemWWlFsZxqshPiEwbp+K1z0lulrNtgjuiT1Ucq/Q5SaO1KImGbmnMcOt
 ib16xTYq+vHwd4UTUK6j0qWL4YPBuI5mYW6sp47Njg5JDp9b8jYCvsKAdW1Cf3Z4aV
 c2rqSgRJhbXI465f3oGQUCDFj6wU7HyJ5+J3Yos9qrg68rA4KU86a61+ecfZ9UOVPr
 /hQYu3jG/3jzcJ2bCN01NaemFLKvjIo6Z6l9FYYEhvbvGAORjC65qqjr0p/WbNL97R
 YbhYjumZi7K0gRnbxHlySFxndwkv3RPGj3IUJWfm7MSUDp0CkXxGvLLHkYe43DaheT
 +2+K+E90niP7w==
Date: Thu, 13 Jan 2022 20:35:23 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Message-ID: <20220113203523.310e13d3@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20220114040755.1314349-2-kai.heng.feng@canonical.com>
References: <20220114040755.1314349-1-kai.heng.feng@canonical.com>
 <20220114040755.1314349-2-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Cc: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 Russell King <linux@armlinux.org.uk>, joabreu@synopsys.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, peppe.cavallaro@st.com,
 Ivan Bornyakov <i.bornyakov@metrotek.ru>,
 Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 2/2] stmmac: intel: Honor phy LED set by
 system firmware on a Dell hardware
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

On Fri, 14 Jan 2022 12:07:54 +0800 Kai-Heng Feng wrote:
> BIOS on Dell Edge Gateway 3200 already makes its own phy LED setting, so
> instead of setting another value, keep it untouched and restore the saved
> value on system resume.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

I defer to PHY experts for review. Coincidentally the first Marvell
flag appears dead, nobody sets it:

$ git grep MARVELL_PHY_M1145_FLAGS_RESISTANCE
drivers/net/phy/marvell.c:      if (phydev->dev_flags & MARVELL_PHY_M1145_FLAGS_RESISTANCE) {
include/linux/marvell_phy.h:#define MARVELL_PHY_M1145_FLAGS_RESISTANCE  0x00000001
$

unless it's read from DT under different name or something.


Once you get some reviews please wait for net-next to open:

http://vger.kernel.org/~davem/net-next.html

and repost. It should happen the week of Jan 24th. When you repost
please drop the first patch, I believe Russell does not like the BIT()
macro, his opinion overrides checkpatch.

Thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
