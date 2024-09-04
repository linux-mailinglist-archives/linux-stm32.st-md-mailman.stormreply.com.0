Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F00EA96B070
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 07:21:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98C6FC78013;
	Wed,  4 Sep 2024 05:21:27 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E51F4C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2024 05:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=0FiySO0ehAi2iikWHKUB4ZlYAWXZ+o7GoMT2M1CTeSI=; b=Wv
 Fo6HRMDncl5nsiz6wV007AXZL1lu65SAoBmZrWKLc9J1ldZzv6TadWQMvA6MBFguNWhbwtTipQMZV
 gXC5g8CfCXoHjoaD23vl2QXkIeoZP7Wdbs7c+vQa1yMqDvVQZO6j5hHr2pUvVPi/zVQkyKTW9XT1p
 XoF/5XcZwl4NZaw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sliRV-006Ujj-0O; Wed, 04 Sep 2024 07:20:33 +0200
Date: Wed, 4 Sep 2024 07:20:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Li Zetao <lizetao1@huawei.com>
Message-ID: <65a6fdd6-5afc-47b6-ab24-3ba05007eb48@lunn.ch>
References: <20240831021334.1907921-1-lizetao1@huawei.com>
 <20240831021334.1907921-10-lizetao1@huawei.com>
 <20240903151649.1b466145@kernel.org>
 <b4f6e9ae-bda8-4496-82a7-de70004e2f29@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b4f6e9ae-bda8-4496-82a7-de70004e2f29@huawei.com>
Cc: heiko@sntech.de, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, radhey.shyam.pandey@amd.com,
 ajay.kathat@microchip.com, florian.fainelli@broadcom.com, samuel@sholland.org,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org, wens@csie.org,
 joabreu@synopsys.com, u.kleine-koenig@pengutronix.de,
 Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com, yisen.zhuang@huawei.com,
 linux-sunxi@lists.linux.dev, jacky_chou@aspeedtech.com, hauke@hauke-m.de,
 kvalo@kernel.org, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 salil.mehta@huawei.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 claudiu.beznea@tuxon.dev, mcoquelin.stm32@gmail.com, wellslutw@gmail.com,
 olteanv@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 09/12] net: ethernet: sunplus:
 Convert using devm_clk_get_enabled() in spl2sw_probe()
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

T24gV2VkLCBTZXAgMDQsIDIwMjQgYXQgMDk6Mjc6MDZBTSArMDgwMCwgTGkgWmV0YW8gd3JvdGU6
Cj4gSGksCj4gCj4g5ZyoIDIwMjQvOS80IDY6MTYsIEpha3ViIEtpY2luc2tpIOWGmemBkzoKPiA+
IE9uIFNhdCwgMzEgQXVnIDIwMjQgMTA6MTM6MzEgKzA4MDAgTGkgWmV0YW8gd3JvdGU6Cj4gPiA+
ICsJY29tbS0+Y2xrID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoJnBkZXYtPmRldiwgTlVMTCk7Cj4g
PiAKPiA+IFlvdSBjYW4gcmVtb3ZlIGNsayBmcm9tIHRoZSBkcml2ZXIgc3RydWN0IG5vdy4KPiBJ
IGRvbuKAmXQgcXVpdGUgdW5kZXJzdGFuZCB3aHkgY2xrIGNhbiBiZSByZW1vdmVkIGZyb20gdGhl
IGRyaXZlciBzdHJ1Y3QsCgpBZnRlciB5b3UgcGF0Y2gsIHdoZXJlIGlzIGl0IHVzZWQ/CgoJQW5k
cmV3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
