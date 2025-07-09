Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F276AFEF4B
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 19:01:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E39E4C36B2B;
	Wed,  9 Jul 2025 17:01:55 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B419C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 17:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=xwIuPRfBvgwDUvog670XJikOKlbcAYFNfjUJsTugx6A=; b=Cw
 VMW57aiB17xlq/dLe76GHEPU5J1MEexTvB8lWof2SLJB4Cje7+Cqa3FdsRzEK5ZRVjyNg1whbcbl7
 00tT82y8NBDIr7x8bXUunG89PbkXlPnVl6VclpKalW4d2FBVW6zhNY1tD5IlaiiuSI2yrL/WPxTEo
 60Pe9RLlao8dOWE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uZYAo-000y3p-7J; Wed, 09 Jul 2025 19:01:34 +0200
Date: Wed, 9 Jul 2025 19:01:34 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: lizhe <sensor1010@163.com>
Message-ID: <05cd64a0-ec24-4ea0-9f57-8d8542563a51@lunn.ch>
References: <20250708165044.3923-1-sensor1010@163.com>
 <52b71fe7-d10a-4680-9549-ca55fd2e2864@lunn.ch>
 <5c7adfef.1876.197ece74c25.Coremail.sensor1010@163.com>
 <aG3vj1WYn3TjcBZe@shell.armlinux.org.uk>
 <5bb49dc0.6933.197ee28444e.Coremail.sensor1010@163.com>
 <aG5ORmbgMYd08eNR@shell.armlinux.org.uk>
 <4cfb4aab.9588.197eefef55f.Coremail.sensor1010@163.com>
 <aG582lPgpOr8oyyx@shell.armlinux.org.uk>
 <2352b745.a454.197efeef829.Coremail.sensor1010@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2352b745.a454.197efeef829.Coremail.sensor1010@163.com>
Cc: linux-kernel@vger.kernel.org, vladimir.oltean@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVGh1LCBKdWwgMTAsIDIwMjUgYXQgMTI6MDU6MDVBTSArMDgwMCwgbGl6aGUgd3JvdGU6Cj4g
SGnvvIwKClBsZWFzZSBkb24ndCB0b3AgcG9zdC4KCj4gICAgIHNucHMsIHJlc2V0LWdwaW8gPSA8
JmdwaW9YIFJLX1BYWCBHUElPX0FDVElWRV9ISUdIPjsgICAKPiAgICAgQWxsIG9mIHRoZW0gY29y
cmVjdGx5IHBhcnNlIHRoZSBHUElPIHBpbidzIHN0YXRlIGFyZSBkZXNjcmliZWQgaW4gdGhlIERU
Uwo+IAo+IAo+IAo+IFRoeCAhCj4gCj4gTGl6aGUKPiAKPiAKPiAKPiAKPiBBdCAyMDI1LTA3LTA5
IDIyOjI5OjQ2LCAiUnVzc2VsbCBLaW5nIChPcmFjbGUpIiA8bGludXhAYXJtbGludXgub3JnLnVr
PiB3cm90ZToKPiA+T24gV2VkLCBKdWwgMDksIDIwMjUgYXQgMDc6NDI6NTVQTSArMDgwMCwgbGl6
aGUgd3JvdGU6Cj4gPj4gSGksCj4gPj4gICAgIGkgaGF2ZSBhbHJlYWR5IGRlY2xhcmVkIGl0IGlu
IHRoZSBEVFMuCj4gPj4KPiA+PiAgICAgJmdtYWMgewo+ID4+ICAgICAgICAgICAgIHNucHMscmVz
ZXQtZ3BpbyA9IDwmZ3BpbzMgUktfUEI3IEdQSU9fQUNUSVZFX0hJR0g+Owo+ID4+ICAgICB9Owo+
ID4KPiA+QWN0aXZlIGhpZ2ggbWVhbnMgdGhhdCB0aGUgcmVzZXQgaXMgaW4gZWZmZWN0IHdoZW4g
dGhlIG91dHB1dCBpcyBhdCB0aGUKPiA+bG9naWMgJzEnIHN0YXRlLiBTbywgZ3Bpb2RfZ2V0X3Zh
bHVlKigpIHdpbGwgcmV0dXJuIHRoZSBzYW1lIGFzCj4gPmdwaW9kX2dldF9yYXdfdmFsdWUqKCku
Cj4gPgo+ID5BY3RpdmUgbG93IG1lYW5zIHRoYXQgdGhlIHJlc2V0IGlzIGluIGVmZmVjdCB3aGVu
IHRoZSBvdXRwdXQgaXMgYXQgdGhlCj4gPmxvZ2ljICcwJyBzdGF0ZSwgYW5kIGluIHRoYXQgY2Fz
ZSB0aGUgcmV0dXJuIHZhbHVlIG9mCj4gPmdwaW9kX2dldF92YWx1ZSooKSB3aWxsIHJldHVybiB0
cnVlIHdoZW4gdGhlIHJlc2V0IGlzIGFjdGl2ZSAoYXQgbG9naWMKPiA+JzAnIHN0YXRlKSB3aGVy
ZWFzIGdwaW9kX2dldF9yYXdfdmFsdWUqKCkgd2lsbCByZXR1cm4gemVyby4KCkRpZCB5b3UgcmVh
ZCB3aGF0IFJ1c3NlbGwgc2FpZD8gSWYgc28sIHdoeSBhcmUgeW91IHVzaW5nCkdQSU9fQUNUSVZF
X0hJR0g/CgoJQW5kcmV3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
