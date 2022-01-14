Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B116C48EE06
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jan 2022 17:23:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62061C5F1F4;
	Fri, 14 Jan 2022 16:23:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59A03C5C842
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 16:23:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 183CF61F85;
 Fri, 14 Jan 2022 16:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75BDC36AE5;
 Fri, 14 Jan 2022 16:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642177390;
 bh=8EEtbq135Y0w2OjVUTuJBP80ewEFZkVxYRnAxWNG0eY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G+MoEykL1Bzcf4w4AmXD+dX82/JB8pi55zC1aY+51movMZJ+fQNkqDJiNVLBeqaXK
 66h8mj10pJnEMsA6EcLsz7bK+9zrJr73Aknmr80Wk5g5sbyfRb+cbAIbZdEgLdqNWH
 3sgBSDZteg/GXq5TSfGLXRb/cimeHMgq17JkgyCsrAGc/fW4IMm5IjXknUz97qp1K/
 JQEW+Kpy21DFQOGvcGI7kypMT707B7HmAfLHT+lmSdicfoXklTmnuY2hgT+6OsaZOV
 bUZ69y/0FBYanLA3SOuetWFb6qZv7vva5S9whhT5I3vqFJheVnSKeItWWBiWkAE4WW
 BjIFhvUDzN1HQ==
Date: Fri, 14 Jan 2022 08:23:08 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Message-ID: <20220114082308.76a5cca5@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <CAAd53p6rW7PcugY7okKsXybK2O=pS8qAhctMzsa-MEgJrKhEdg@mail.gmail.com>
References: <20220114040755.1314349-1-kai.heng.feng@canonical.com>
 <20220114040755.1314349-2-kai.heng.feng@canonical.com>
 <20220113203523.310e13d3@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
 <CAAd53p6rW7PcugY7okKsXybK2O=pS8qAhctMzsa-MEgJrKhEdg@mail.gmail.com>
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

On Fri, 14 Jan 2022 14:47:47 +0800 Kai-Heng Feng wrote:
> > Coincidentally the first Marvell flag appears dead, nobody sets it:
> >
> > $ git grep MARVELL_PHY_M1145_FLAGS_RESISTANCE
> > drivers/net/phy/marvell.c:      if (phydev->dev_flags & MARVELL_PHY_M1145_FLAGS_RESISTANCE) {
> > include/linux/marvell_phy.h:#define MARVELL_PHY_M1145_FLAGS_RESISTANCE  0x00000001
> > $
> >
> > unless it's read from DT under different name or something.  
> 
> It was introduced by 95d21ff4c645 without any user. Should we keep it?

Not unless someone explains that it's actually used somehow.

Please post a patch once net-next opens.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
