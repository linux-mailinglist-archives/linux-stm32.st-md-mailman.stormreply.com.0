Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6440AFE972
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 14:54:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 681ACC36B2A;
	Wed,  9 Jul 2025 12:54:44 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4679C36B19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 12:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=t79h60EOE9SVzV/lSAFUANryOijd3ceSpP+xl2sr/zo=; b=us
 p4w+HpkHUACw9jAJA+G2O9+nD3UMKn8yluu61YrP7Maq0gfFET9IcIIAaaGtzzYe4xWKa8EI4eA26
 +tOH+Dmcj1nQ5UFzZA763YXpz5Zld1dO+GjmqqbkH1KTPpSy6wACvmOJQ/lr2jWKgopP5uUgJQp4d
 y5zbOerb4VCgeBA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uZUJX-000wOt-Ak; Wed, 09 Jul 2025 14:54:19 +0200
Date: Wed, 9 Jul 2025 14:54:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: lizhe <sensor1010@163.com>
Message-ID: <30933244-bfc0-4f6c-9dec-0db4bb33ba58@lunn.ch>
References: <20250708165044.3923-1-sensor1010@163.com>
 <52b71fe7-d10a-4680-9549-ca55fd2e2864@lunn.ch>
 <5c7adfef.1876.197ece74c25.Coremail.sensor1010@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c7adfef.1876.197ece74c25.Coremail.sensor1010@163.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gV2VkLCBKdWwgMDksIDIwMjUgYXQgMDk6NTc6NTBBTSArMDgwMCwgbGl6aGUgd3JvdGU6Cj4g
SGnvvIwgQW5kcmV3Cj4gCj4gVGh4LAo+IAo+IAo+IGkgY29uZHVjdGVkIGFuIGV4cGVyaW1lbnQs
IGFuZCBubyBtYXR0ZXIgd2hldGhlciBpIGNvbmZpZ3VyZWQgaXQgYXMgCj4gCj4gR1BJT19BQ1RJ
VkVfTE9XIG9yIEdQSU9fQUNUSVZFX0hJR0ggaW4gdGhlIGR0cywgdGhlIHJlc3VsdGluZwo+IAo+
IEdQSU8gcGluIHN0YXRlIHdhcyAwLCBpbmRpY2F0aW5nIGEgbG93IGxldmVsLgoKWW91IG5lZWQg
dG8ga2VlcCBkaWdnaW5nIGFuZCB1bmRlcnN0YW5kIHdoeS4KClNjYXR0ZXIgc29tZSBwcmludGso
KSBpbiB0aGUgZ3BpbyBjb3JlIGNvZGUuIERvZXMgaXQgcmVjb2duaXNlIHRoZQpvcHRpb24gaW4g
RFQ/IElzIEdQSU9fQUNUSVZFX0xPVywgRkxBR19BQ1RJVkVfTE9XIGJlaW5nIHNldD8KClB1dCBz
b21lIHByaW50cyBpbnRvIHRoZSBhY3R1YWwgR1BJTyBkcml2ZXIsIHdoYXQgaXMgcGFzc2VkIHRv
IGl0LgoKVGhlcmUgaXMgc29tZXRoaW5nIGludGVyZXN0aW5nIGluIGdwaW8udHh0OgoKTW9zdCBj
b250cm9sbGVycyBhcmUgc3BlY2lmeWluZyBhIGdlbmVyaWMgZmxhZyBiaXRmaWVsZCBpbiB0aGUg
bGFzdCBjZWxsLCBzbwpmb3IgdGhlc2UsIHVzZSB0aGUgbWFjcm9zIGRlZmluZWQgaW4KaW5jbHVk
ZS9kdC1iaW5kaW5ncy9ncGlvL2dwaW8uaCB3aGVuZXZlciBwb3NzaWJsZToKCkl0IHNheXMgJ01v
c3QnLiBJcyB0aGUgR1BJTyBjb250cm9sbGVyIHlvdSBhcmUgdXNpbmcgbm90IGFjdHVhbGx5CmRv
aW5nIHRoaXM/CgoJQW5kcmV3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
