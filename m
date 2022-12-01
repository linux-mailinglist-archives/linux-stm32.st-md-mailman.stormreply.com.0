Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 258AC63EC1B
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Dec 2022 10:15:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDC9EC65073;
	Thu,  1 Dec 2022 09:15:10 +0000 (UTC)
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E420C03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Dec 2022 09:15:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1669886069; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PuFREHxuJ3FoD3zI0cgmwgxXBACrFbsNXtmB1ZUDMZF0Vw7u5go+yLfWIyRlKmsI4dy/C4JBEgDliSKn1GHoNmOpzBqaWl6iXr8io/eTVI3oCPsCmOMRaRxdzRXptLt4DP3hnV53GkO6NAhhWer+prEaTAbxrLXw/JqtvaQrzWo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1669886069;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=rmnGX0as+j0mWZhRBwCINR7c9wsJ33DTrPhAflpkh7k=; 
 b=fw/MEtbCpCH9VgI82wo0vE16g6dZ8NV1Le4xk0BjWdTYK38rt7XBr8kXPBBPo3YRUN6Qe0dqE8w6e3UHXsxU9mNhstxy2c3zRoUP/VEPwky/wlzovr2sCQ7tztCh20i22nk9oPAoF3GnSvN5RPlNAcT6sNLjUOovaigMSm1VuKI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669886069; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=rmnGX0as+j0mWZhRBwCINR7c9wsJ33DTrPhAflpkh7k=;
 b=kC5OJuaedGtqPWAXavS8QBOXmOzGAN9KVKeFTZblN5hQvtgIY+bZgMHEmvSv5xeL
 m50GcHUsZyBhq0mNsX+aCeIwwvLqFeeWwtPZKWwBHrfnYXDUeClaEjUb82O6yrKKDVx
 OifNFxxqXQi0y0KKnh1zyARvxBzbuGAfmR/P71Bk=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by
 mx.zohomail.com with SMTPS id 1669886067241836.827775278157;
 Thu, 1 Dec 2022 01:14:27 -0800 (PST)
Message-ID: <b5ed90cf-1b5d-9306-7b06-ded7c331ca2a@arinc9.com>
Date: Thu, 1 Dec 2022 12:14:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 soc@kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20221130141040.32447-1-arinc.unal@arinc9.com>
X-ZohoMailClient: External
Cc: devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/5] remove label = "cpu" from DSA
	dt-binding
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SSdtIHNlbmRpbmcgYSBtb3JlIHNwZWNpZmljIG1haWwgdG8gbWFrZSBzdXJlIHRoaXMgc2VyaWVz
IGRvZXNuJ3QgZmFsbCAKdGhyb3VnaCB0aGUgY3JhY2tzIGxpa2UgQW5kcmV3IHNhaWQuIEknZCBs
aWtlIHRoaXMgbWVyZ2VkIHRoaXMgd2VlayAKYmVmb3JlIHRoZSBtZXJnZSB3aW5kb3cgY2xvc2Vz
LgoKSmFrdWIsIHBsZWFzZSB0YWtlIHBhdGNoIDEuCkFybmQsIHBsZWFzZSB0YWtlIHBhdGNoIDIg
YW5kIDMuClRob21hcywgcGxlYXNlIHRha2UgcGF0Y2ggNC4KTWljaGFlbCwgcGxlYXNlIHRha2Ug
cGF0Y2ggNS4KCkFyxLFuw6cKCk9uIDMwLjExLjIwMjIgMTc6MTAsIEFyxLFuw6cgw5xOQUwgd3Jv
dGU6Cj4gSGVsbG8gZm9sa3MsCj4gCj4gV2l0aCB0aGlzIHBhdGNoIHNlcmllcywgd2UncmUgY29t
cGxldGVseSBnZXR0aW5nIHJpZCBvZiAnbGFiZWwgPSAiY3B1IjsnCj4gd2hpY2ggaXMgbm90IHVz
ZWQgYnkgdGhlIERTQSBkdC1iaW5kaW5nIGF0IGFsbC4KPiAKPiBJbmZvcm1hdGlvbiBmb3IgdGFr
aW5nIHRoZSBwYXRjaGVzIGZvciBtYWludGFpbmVyczoKPiBQYXRjaCAxOiBuZXRkZXYgbWFpbnRh
aW5lcnMgKGJhc2VkIG9mZiBuZXRkZXYvbmV0LW5leHQuZ2l0IG1haW4pCj4gUGF0Y2ggMi0zOiBT
b0MgbWFpbnRhaW5lcnMgKGJhc2VkIG9mZiBzb2Mvc29jLmdpdCBzb2MvZHQpCj4gUGF0Y2ggNDog
TUlQUyBtYWludGFpbmVycyAoYmFzZWQgb2ZmIG1pcHMvbGludXguZ2l0IG1pcHMtbmV4dCkKPiBQ
YXRjaCA1OiBQb3dlclBDIG1haW50YWluZXJzIChiYXNlZCBvZmYgcG93ZXJwYy9saW51eC5naXQg
bmV4dC10ZXN0KQo+IAo+IEkndmUgYmVlbiBtZWFuaW5nIHRvIHN1Ym1pdCB0aGlzIGZvciBhIGZl
dyBtb250aHMuIEZpbmQgdGhlIHJlbGV2YW50Cj4gY29udmVyc2F0aW9uIGhlcmU6Cj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjIwOTEzMTU1NDA4LkdBMzgwMjk5OC1yb2JoQGtl
cm5lbC5vcmcvCj4gCj4gSGVyZSdzIGhvdyBJIGRpZCBpdCwgZm9yIHRoZSBpbnRlcmVzdGVkIChv
ciBzdWdnZXN0aW9ucyk6Cj4gCj4gRmluZCB0aGUgcGxhdGZvcm1zIHdoaWNoIGhhdmUgZ290ICds
YWJlbCA9ICJjcHUiOycgZGVmaW5lZC4KPiBncmVwIC1ybncgLiAtZSAnbGFiZWwgPSAiY3B1Ijsn
Cj4gCj4gUmVtb3ZlIHRoZSBsaW5lIHdoZXJlICdsYWJlbCA9ICJjcHUiOycgaXMgaW5jbHVkZWQu
Cj4gc2VkIC1pIC8nbGFiZWwgPSAiY3B1IjsnLywrZCBhcmNoL2FybS9ib290L2R0cy8qCj4gc2Vk
IC1pIC8nbGFiZWwgPSAiY3B1IjsnLywrZCBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS8q
Cj4gc2VkIC1pIC8nbGFiZWwgPSAiY3B1IjsnLywrZCBhcmNoL2FybTY0L2Jvb3QvZHRzL21hcnZl
bGwvKgo+IHNlZCAtaSAvJ2xhYmVsID0gImNwdSI7Jy8sK2QgYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay8qCj4gc2VkIC1pIC8nbGFiZWwgPSAiY3B1IjsnLywrZCBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JvY2tjaGlwLyoKPiBzZWQgLWkgLydsYWJlbCA9ICJjcHUiOycvLCtkIGFyY2gvbWlwcy9i
b290L2R0cy9xY2EvKgo+IHNlZCAtaSAvJ2xhYmVsID0gImNwdSI7Jy8sK2QgYXJjaC9taXBzL2Jv
b3QvZHRzL3JhbGluay8qCj4gc2VkIC1pIC8nbGFiZWwgPSAiY3B1IjsnLywrZCBhcmNoL3Bvd2Vy
cGMvYm9vdC9kdHMvdHVycmlzMXguZHRzCj4gc2VkIC1pIC8nbGFiZWwgPSAiY3B1IjsnLywrZCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3FjYSxhcjcxeHgueWFtbAo+IAo+
IFJlc3RvcmUgdGhlIHN5bWxpbmsgZmlsZXMgd2hpY2ggdHlwZWNoYW5nZSBhZnRlciBydW5uaW5n
IHNlZC4KPiAKPiBBcsSxbsOnIMOcTkFMICg1KToKPiAgICBkdC1iaW5kaW5nczogbmV0OiBxY2Es
YXI3MXh4OiByZW1vdmUgbGFiZWwgPSAiY3B1IiBmcm9tIGV4YW1wbGVzCj4gICAgYXJtOiBkdHM6
IHJlbW92ZSBsYWJlbCA9ICJjcHUiIGZyb20gRFNBIGR0LWJpbmRpbmcKPiAgICBhcm02NDogZHRz
OiByZW1vdmUgbGFiZWwgPSAiY3B1IiBmcm9tIERTQSBkdC1iaW5kaW5nCj4gICAgbWlwczogZHRz
OiByZW1vdmUgbGFiZWwgPSAiY3B1IiBmcm9tIERTQSBkdC1iaW5kaW5nCj4gICAgcG93ZXJwYzog
ZHRzOiByZW1vdmUgbGFiZWwgPSAiY3B1IiBmcm9tIERTQSBkdC1iaW5kaW5nCj4gCj4gCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
