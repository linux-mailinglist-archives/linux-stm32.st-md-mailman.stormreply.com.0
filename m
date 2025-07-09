Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA36AFF00F
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 19:42:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54F89C36B2B;
	Wed,  9 Jul 2025 17:42:25 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81713C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 17:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9JNMjRDCMIHa+Po0H1LYj8KqoI3Jfy0hutL9Xpr7pSU=; b=tbhZoaNAh9WyeIfezPzjBJKpAf
 jyvVdnsDK+o+tp55I7V65vC8T5Cl8sjTg6iLu1L6Nu+zrJj5U80bQv9AwD4+7dY0PsPAOwIafbpOh
 TIiGkLQFVw5dJwNeWWmUsj103sFDE2EN26yOUWNQmMzvprLx4/Lxxq2hn1IuCzcKLwxdhetx0QJ1X
 djzSN/MMoqkGr8IPalFPJYpD7lGFfccg1bd+654QLcIVLFjZEwnSJWze1InOSEa8Z5925YX4TToUy
 MhZQF6JqWQ+/jsQS/gN4G779mK07e4zaL5ZPDaWUHyqrvaCPgJRNmDNsoKBxm/g1wB1CmIShjP/M2
 xKv4TjyA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56254)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1uZYo3-0008JZ-0r;
 Wed, 09 Jul 2025 18:42:07 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1uZYnv-0002pD-1X;
 Wed, 09 Jul 2025 18:41:59 +0100
Date: Wed, 9 Jul 2025 18:41:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: lizhe <sensor1010@163.com>
Message-ID: <aG6p5_p9CmqxZcxM@shell.armlinux.org.uk>
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 vladimir.oltean@nxp.com, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVGh1LCBKdWwgMTAsIDIwMjUgYXQgMTI6MDU6MDVBTSArMDgwMCwgbGl6aGUgd3JvdGU6Cj4g
SGnvvIwKPiAKPiAgICAgIAo+IAo+ICAgaWYgaSBhZGQgdGhlIGZvbGxvd2luZyBjb2RlIHRvIHRo
aXMgZnVuY3Rpb24sIHRoZSBncGlvIG91dHB1dHMgYSBoaWdoIGxldmVsCj4gCj4gICB3aXRob3V0
IHRoaXMgY29kZSwgaXQgb3V0cHV0cyBhIGxvdyBsZXZlbCwgCj4gICB0aGUgZnVuY3Rpb24gY3Vy
cmVudGx5IGRyaXZlcnMgdGhlIHJlc2V0IEdQSU8gdG8gYSBsb3cgc3RhdGUsIGZhaWxpbmcgdG8g
YWNjb3VudCAKPiAKPiAgIGZvciBkZXZpY2VzIHJlcXVpcmluZyBhbiBhY3RpdmUtaGlnaCByZXNl
dC4KPiAKPiAKPiAKPiAKPiAgIGkgaW52aXRlZCBvdXIgaGFyZHdhcmUgZW5naW5lZXIgdG8gIG1l
YXN1cmUgdGhlIHZvbHRhZ2UgbGV2ZWwgb24gdGhpcyBHUElPIHBpbiwKPiAKPiAgIHdpdGhvdXQg
IGFkZGluZyB0aGlzIGNvZGUsIHRoZSB2b2x0YWdlIGF0IHRoaXMgR1BJTyBwaW4gcmVtYWlucyBh
dCAwVgo+IAo+IAo+IAo+IAo+ICAgKyAgICAgICAgICAgICBpbnQgY3VycmVudF92YWx1ZTsKPiAK
PiAKPiAKPiAKPiAgICsgICAgICAgICAgICAga2VlcF9oaWdoID0gZGV2aWNlX3Byb3BlcnR5X3Jl
YWRfYm9vbChwcml2LT5kZXZpY2UsCj4gCj4gICArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJzbnBzLHJlc2V0LWtlZXAtaGlnaCIp
Owo+IAo+ICAgKyAgICAgICAgICAgICAgaWYgKGtlZXBfaGlnaCkgewo+IAo+ICAgKyAgICAgICAg
ICAgICAgICAgICAgIGdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcChyZXNldF9ncGlvLCAxKTsKPiAK
PiAgICsgICAgICAgICAgICAgICAgICAgICAgY3VycmVudF92YWx1ZSA9IGdwaW9kX2dldF92YWx1
ZV9jYW5zbGVlcChyZXNldF9ncGlvKTsKPiAKPiAgICsgICAgICAgICAgICAgICAgICAgICAgcHJf
aW5mbygiY3VycmVudF92YWx1ZTogJWRcbiIsIGN1cnJlbnRfdmFsdWUpOwo+IAo+ICAgKyAgICAg
ICAgICAgICAgfQo+IAo+ICAgIGluIHRoZSBSSzM1ODggc3lzdGVtLCBpIGFtIHVzaW5nICx0aGVy
ZSBhcmUgbWFueSBEVFMgbm9kZSBjb25maWd1cmVkIGxpbmsgdGhpczoKPiAKPiAgICAgc25wcywg
cmVzZXQtZ3BpbyA9IDwmZ3Bpb1ggUktfUFhYIEdQSU9fQUNUSVZFX0hJR0g+OyAgIAo+ICAgICBB
bGwgb2YgdGhlbSBjb3JyZWN0bHkgcGFyc2UgdGhlIEdQSU8gcGluJ3Mgc3RhdGUgYXJlIGRlc2Ny
aWJlZCBpbiB0aGUgRFRTCj4gCgpJJ20gd29uZGVyaW5nIGF0IHRoaXMgcG9pbnQgd2hldGhlciB0
aGUgcHJvYmxlbSBoZXJlIGlzIG9uZSBvZgptaXMtdW5kZXJzdGFuZGluZyB0aGUgZW5naW5lZXJp
bmcgdGVybWlub2xvZ3kuIExvb2sgYXQgdGhlIGJlbG93CnVzaW5nIGEgZml4ZWQtd2lkdGggZm9u
dDoKCkFjdGl2ZS1oaWdoIHJlc2V0OiBfX19fXy9eXl5eXl5eXlxfX19fCgpBY3RpdmUtbG93IHJl
c2V0OiAgXl5eXl5cX19fX19fX18vXl5eXgoKICAgICAgICAgICAgICAgICAgICAgICAgfCByZXNl
dCAgfAoJCQl8YXNzZXJ0ZWR8CgpTbywgYW4gYWN0aXZlIGhpZ2ggcmVzZXQgbmVlZHMgdG8gYmUg
bG9naWMgbG93IGluIG9yZGVyIGZvciB0aGUKZGV2aWNlIHRvIGZ1bmN0aW9uLiBBbiBhY3RpdmUg
bG93IHJlc2V0IG5lZWRzIHRvIGJlIGxvZ2ljIGhpZ2gKZm9yIHRoZSBkZXZpY2UgdG8gZnVuY3Rp
b24uCgpZb3Ugc2VlbSB0byBiZSB3YW50aW5nIHRvIHRlbGwgdGhlIGtlcm5lbCB0aGF0IHlvdSBo
YXZlIGFuCmFjdGl2ZSBoaWdoIHJlc2V0LCBhbmQgZXhwZWN0IGl0IHRvIGJlIGxvZ2ljIGhpZ2gg
d2hlbiB5b3UKd2FudCBpdCB0byBiZSBhY3RpdmUuIFRoYXQgaXMgKm5vdCogYW4gYWN0aXZlIGhp
Z2ggcmVzZXQuCgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51eC5v
cmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVFAgaXMgaGVyZSEgODBNYnBzIGRvd24gMTBNYnBz
IHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxhc3QhCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
