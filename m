Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D499D2C4915
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Nov 2020 21:30:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93471C5662F;
	Wed, 25 Nov 2020 20:30:20 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B367C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 20:30:17 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E62C2206F7;
 Wed, 25 Nov 2020 20:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606336215;
 bh=eAQmp5GZGUdkf04vSOwtkPQYMmhghulNucwaE29RuR0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oYKUyxis/nHy8FReftxkimZWOWuWMj9JA5cLvpjpBA9/HoLk6xLwY9+mGZQ17NcIS
 r6J6TJHDimtnfExA6cJFSDDV5CcoT+5bRVxVbjRo0yCcDNhcaiqNrk1VX3czGlFng6
 BJrVPxQW4rECcSSthzkLBlkQ8WYJWUfMe9kVm5L8=
Date: Wed, 25 Nov 2020 12:30:13 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Antonio Borneo <antonio.borneo@st.com>
Message-ID: <20201125123013.0a59c23b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201124230756.887925-1-antonio.borneo@st.com>
References: <20201124143848.874894-1-antonio.borneo@st.com>
 <20201124230756.887925-1-antonio.borneo@st.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Salil Mehta <salil.mehta@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 linuxarm@huawei.com, Russell King <linux@armlinux.org.uk>,
 Willy Liu <willy.liu@realtek.com>, Yonglong Liu <liuyonglong@huawei.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 net-next] net: phy: realtek: read
 actual speed on rtl8211f to detect downshift
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

On Wed, 25 Nov 2020 00:07:56 +0100 Antonio Borneo wrote:
> The rtl8211f supports downshift and before commit 5502b218e001
> ("net: phy: use phy_resolve_aneg_linkmode in genphy_read_status")
> the read-back of register MII_CTRL1000 was used to detect the
> negotiated link speed.
> The code added in commit d445dff2df60 ("net: phy: realtek: read
> actual speed to detect downshift") is working fine also for this
> phy and it's trivial re-using it to restore the downshift
> detection on rtl8211f.
> 
> Add the phy specific read_status() pointing to the existing
> function rtlgen_read_status().
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
> Link: https://lore.kernel.org/r/478f871a-583d-01f1-9cc5-2eea56d8c2a7@huawei.com

Applied, thanks everyone!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
