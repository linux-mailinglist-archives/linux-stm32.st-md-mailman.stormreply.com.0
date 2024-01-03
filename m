Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A38582371B
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jan 2024 22:28:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C26F4C6B476;
	Wed,  3 Jan 2024 21:28:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13653C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jan 2024 21:28:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B5E89614D9;
 Wed,  3 Jan 2024 21:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B636CC433C7;
 Wed,  3 Jan 2024 21:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704317292;
 bh=lsIltowJTF2uPmkvluJHvqzbq5Y1CclQ0kHOdf4F8/U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ecUTs7UIgS6ZiKnr0JIwImr+ok5K/x+CfGqILIaRm4v52MUZeR78LgRqd+i4BpzfD
 BAAb7VMM+veGKEdWwJtVg8B/SwdrHUWN8/oPWfC26PrGtw2rvOCxkevmZF+SeRI4cJ
 CTHblMxY7P2sCczM1kL4dzzf4dzmDtLNIdZpoDj7S5FZ+H0crZBatAPk1FtFN4ZHgi
 261b/tBYjrre/HjHOZ+ZcwZ8MnLb9F71elJNoRc0czmCMVHouCFtUKsz868/rHfDZ8
 U+1DqSuAJ5GTjwnZANtDAb8HY8p9P0+X71imJyj/D3y84RylXDqKbX3Y2QxZI6X8FP
 VxykDzWZ86tbA==
Date: Wed, 3 Jan 2024 13:28:10 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <20240103132810.1aae03e8@kernel.org>
In-Reply-To: <20240103142827.168321-1-romain.gantois@bootlin.com>
References: <20240103142827.168321-1-romain.gantois@bootlin.com>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Andrew Lunn <andrew@lunn.ch>,
 Pascal EBERHARD <pascal.eberhard@se.com>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 linux-renesas-soc@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net 0/5] Fix missing PHY-to-MAC RX clock
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gV2VkLCAgMyBKYW4gMjAyNCAxNToyODoyMCArMDEwMCBSb21haW4gR2FudG9pcyB3cm90ZToK
PiBUaGVyZSBpcyBhbiBpc3N1ZSB3aXRoIHNvbWUgc3RtbWFjL1BIWSBjb21iaW5hdGlvbnMgdGhh
dCBoYXMgYmVlbiByZXBvcnRlZAo+IHNvbWUgdGltZSBhZ28gaW4gYSBjb3VwbGUgb2YgZGlmZmVy
ZW50IHNlcmllczoKPiAKPiBDbGFyayBXYW5nJ3MgcmVwb3J0OiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyMzAyMDIwODE1NTkuMzU1MzYzNy0xLXhpYW9uaW5nLndhbmdAbnhwLmNvbS8K
PiBDbMOpbWVudCBMw6lnZXIncyByZXBvcnQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LWFybS1rZXJuZWwvMjAyMzAxMTYxMDM5MjYuMjc2ODY5LTQtY2xlbWVudC5sZWdlckBib290bGlu
LmNvbS8KCklmIHRob3NlIHN0bW1hYy9QSFkgY29tYmluYXRpb25zIG5ldmVyIHdvcmtlZCB1cHN0
cmVhbSBwbGVhc2UgdGFnIAphcyBbUEFUQ0ggbmV0LW5leHRdLCB3ZSBzaG91bGQgY29uc2lkZXIg
dGhpcyB3b3JrIHRvIGJlIGEgYmUgYSBuZXcKZmVhdHVyZSAvIEhXIHN1cHBvcnQuIElmIHRoZXkg
dXNlZCB0byB3b3JrIC0gd2UnbGwgbmVlZCBzb21lIEZpeGVzCnRhZ3MuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
