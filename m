Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKgIOtwyBWonTQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 04:26:36 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E7B53D03A
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 04:26:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFD1CC8F290;
	Thu, 14 May 2026 02:26:35 +0000 (UTC)
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net
 (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 133D9C8F289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 02:26:33 +0000 (UTC)
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Thu, 14 May 2026 10:25:55 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Thu, 14 May 2026 10:25:55 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Jakub Kicinski" <kuba@kernel.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260512161315.141aba88@kernel.org>
References: <20260427072353.1114-1-lizhi2@eswincomputing.com>
 <20260427072508.1151-1-lizhi2@eswincomputing.com>
 <20260428180625.738223cf@kernel.org>
 <2117464.7991.19ddd2125d1.Coremail.lizhi2@eswincomputing.com>
 <20260430163551.7491407a@kernel.org>
 <38d052b7.7a70.19dfb0d782b.Coremail.lizhi2@eswincomputing.com>
 <446f69bd.7fe4.19e1ab248fb.Coremail.lizhi2@eswincomputing.com>
 <20260512161315.141aba88@kernel.org>
MIME-Version: 1.0
Message-ID: <7171f9b3.81b6.19e244e0e9f.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID: TAJkCgDHaXO1MgVqOkkZAA--.7373W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAQEGDGoDVh1cGAAEso
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Cc: edumazet@google.com, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com, alex@ghiti.fr,
 ningyu@eswincomputing.com, maxime.chevallier@bootlin.com, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu,
 horms@kernel.org, rmk+kernel@armlinux.org.uk, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, palmer@dabbelt.com,
 mcoquelin.stm32@gmail.com, pjw@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v7 2/4] net: stmmac: eic7700:
 enable clocks before syscon access and correct RX sampling timing
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
X-Rspamd-Queue-Id: 42E7B53D03A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[eswincomputing.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:pritesh.patel@einfochips.com,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:ningyu@eswincomputing.com,m:maxime.chevallier@bootlin.com,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:horms@kernel.org,m:rmk+kernel@armlinux.org.uk,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_X_PRIO_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,einfochips.com,eswincomputing.com,ghiti.fr,bootlin.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,armlinux.org.uk,lunn.ch,dabbelt.com,gmail.com,davemloft.net];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

CgoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2VzLS0tLS0KPiBGcm9tOiAiSmFrdWIgS2ljaW5za2ki
IDxrdWJhQGtlcm5lbC5vcmc+Cj4gU2VuZCB0aW1lOldlZG5lc2RheSwgMTMvMDUvMjAyNiAwNzox
MzoxNQo+IFRvOiDmnY7lv5cgPGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20+Cj4gQ2M6IGFuZHJl
dytuZXRkZXZAbHVubi5jaCwgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGRhdmVtQGRhdmVt
bG9mdC5uZXQsIGVkdW1hemV0QGdvb2dsZS5jb20sIHJvYmhAa2VybmVsLm9yZywga3J6aytkdEBr
ZXJuZWwub3JnLCBjb25vcitkdEBrZXJuZWwub3JnLCBuZXRkZXZAdmdlci5rZXJuZWwub3JnLCBw
YWJlbmlAcmVkaGF0LmNvbSwgbWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbSwgYWxleGFuZHJlLnRv
cmd1ZUBmb3NzLnN0LmNvbSwgcm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWssIHBqd0BrZXJuZWwu
b3JnLCBwYWxtZXJAZGFiYmVsdC5jb20sIGFvdUBlZWNzLmJlcmtlbGV5LmVkdSwgYWxleEBnaGl0
aS5mciwgbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZywgbGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbSwgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBtYXhpbWUuY2hldmFsbGllckBib290
bGluLmNvbSwgbmluZ3l1QGVzd2luY29tcHV0aW5nLmNvbSwgbGlubWluQGVzd2luY29tcHV0aW5n
LmNvbSwgcGlua2VzaC52YWdoZWxhQGVpbmZvY2hpcHMuY29tLCBwcml0ZXNoLnBhdGVsQGVpbmZv
Y2hpcHMuY29tLCB3ZWlzaGFuZ2p1YW5AZXN3aW5jb21wdXRpbmcuY29tLCBob3Jtc0BrZXJuZWwu
b3JnCj4gU3ViamVjdDogUmU6IFtQQVRDSCBuZXQtbmV4dCB2NyAyLzRdIG5ldDogc3RtbWFjOiBl
aWM3NzAwOiBlbmFibGUgY2xvY2tzIGJlZm9yZSBzeXNjb24gYWNjZXNzIGFuZCBjb3JyZWN0IFJY
IHNhbXBsaW5nIHRpbWluZwo+IAo+IE9uIFR1ZSwgMTIgTWF5IDIwMjYgMTM6Mzk6MTIgKzA4MDAg
KEdNVCswODowMCkg5p2O5b+XIHdyb3RlOgo+ID4gRm9yIHRoZSBldGgxIGVuYWJsZW1lbnQgcGFy
dCwgbXkgY3VycmVudCB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgaXQKPiA+IHNob3VsZCBiZSB0cmVh
dGVkIGFzIGEgbmV3IGluZGVwZW5kZW50IHYxIHNlcmllcyBmb3IgbmV0LW5leHQsCj4gPiBzaW5j
ZSB0aGUgc2NvcGUgYW5kIHRhcmdldCB0cmVlIGhhdmUgY2hhbmdlZCBhZnRlciB0aGUgc3BsaXQu
Cj4gPiAKPiA+IFdvdWxkIHlvdSBwcmVmZXIgdGhpcyBldGgxIHNlcmllcyB0byBzdGFydCBhcyB2
MSwgb3Igc2hvdWxkIGl0Cj4gPiBjb250aW51ZSBhcyB2OCBmb3IgY29udGludWl0eSB3aXRoIHRo
ZSBvcmlnaW5hbCBzZXJpZXM/Cj4gCj4gdjggaXMgYmV0dGVyLCBidXQgaXMgdGhlIGZpeCBpbiBu
ZXQtbmV4dCBhbHJlYWR5Pwo+IAo+IElmIHRoaXMgaXMgdGhlIHBvc3RpbmcgeW91J3JlIHJlZmVy
cmluZyB0bzoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA1MDcwODMyMTQuMTky
LTEtbGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbS8KPiBpdCBoYXMgYmVlbiBkcm9wcGVkIGJhc2Vk
IG9uIGZlZWRiYWNrIGZyb20gTWF4aW1lIGFuZCBJIGRvbid0IHNlZSBhIHYyLgoKWWVzLCB0aGUg
ZXRoMCBmaXhlcyBoYXZlIG5vdyBiZWVuIHJlcG9zdGVkIGFzIGEgZGVkaWNhdGVkIHNlcmllcyB0
YXJnZXRpbmcgbmV0OgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjYwNTA3MDgzMDM3
LjE1Mi0xLWxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20vCgpUaGUgcHJldmlvdXMgbmV0LW5leHQg
ZXRoMS1yZWxhdGVkIHBvc3Rpbmcgd2FzIGRyb3BwZWQgZm9sbG93aW5nIHlvdXIgZ3VpZGFuY2UK
dG8gZmlyc3QgY29tcGxldGUgdGhlIGV0aDAgZml4ZXMgaW4gbmV0IGJlZm9yZSBjb250aW51aW5n
IHdpdGggZXRoMS4gSSB3aWxsCmtlZXAgZXRoMSBhcyB2OCBhcyBwcmV2aW91c2x5IHN1Z2dlc3Rl
ZC4KCkZvciB0aGUgZXRoMCBuZXQgc2VyaWVzLCBJIHdpbGwgc3BsaXQgdGhlIHJlbWFpbmluZyBj
aGFuZ2VzIGluIHYyIGFzIHN1Z2dlc3RlZApieSBNYXhpbWUgdG8gaW1wcm92ZSByZXZpZXdhYmls
aXR5IGFuZCBiaXNlY3RhYmlsaXR5LCBhbmQgcmVzZW5kIHNob3J0bHkuCgpPbmNlIHRoYXQgaXMg
Y29tcGxldGVkLCBJIHdpbGwgcHJvY2VlZCB3aXRoIHRoZSBldGgxIGVuYWJsZW1lbnQgc2VyaWVz
ICh2OCkKYmFzZWQgb24gdGhlIHVwZGF0ZWQgY29udGV4dC4KClRoYW5rcywKWmhpCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
