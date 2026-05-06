Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOJyLmSj+mlWQwMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 04:11:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EB14D5936
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 04:11:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8661CC87ED0;
	Wed,  6 May 2026 02:11:47 +0000 (UTC)
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net
 (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2843DC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2026 02:11:45 +0000 (UTC)
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Wed, 6 May 2026 10:10:57 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Wed, 6 May 2026 10:10:57 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Jakub Kicinski" <kuba@kernel.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260430163551.7491407a@kernel.org>
References: <20260427072353.1114-1-lizhi2@eswincomputing.com>
 <20260427072508.1151-1-lizhi2@eswincomputing.com>
 <20260428180625.738223cf@kernel.org>
 <2117464.7991.19ddd2125d1.Coremail.lizhi2@eswincomputing.com>
 <20260430163551.7491407a@kernel.org>
MIME-Version: 1.0
Message-ID: <38d052b7.7a70.19dfb0d782b.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgDHaXMyo_ppwzEXAA--.6613W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAQETDGn6G5we7wACs4
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
X-Rspamd-Queue-Id: 52EB14D5936
X-Rspamd-Action: no action
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiSmFrdWIgS2ljaW5za2ki
IDxrdWJhQGtlcm5lbC5vcmc+Cj4g5Y+R6YCB5pe26Ze0OjIwMjYtMDUtMDEgMDc6MzU6NTEgKOaY
n+acn+S6lCkKPiDmlLbku7bkuro6IOadjuW/lyA8bGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbT4K
PiDmioTpgIE6IGFuZHJldytuZXRkZXZAbHVubi5jaCwgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmcsIGRhdmVtQGRhdmVtbG9mdC5uZXQsIGVkdW1hemV0QGdvb2dsZS5jb20sIHJvYmhAa2VybmVs
Lm9yZywga3J6aytkdEBrZXJuZWwub3JnLCBjb25vcitkdEBrZXJuZWwub3JnLCBuZXRkZXZAdmdl
ci5rZXJuZWwub3JnLCBwYWJlbmlAcmVkaGF0LmNvbSwgbWNvcXVlbGluLnN0bTMyQGdtYWlsLmNv
bSwgYWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbSwgcm1rK2tlcm5lbEBhcm1saW51eC5vcmcu
dWssIHBqd0BrZXJuZWwub3JnLCBwYWxtZXJAZGFiYmVsdC5jb20sIGFvdUBlZWNzLmJlcmtlbGV5
LmVkdSwgYWxleEBnaGl0aS5mciwgbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZywgbGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbSwgbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBtYXhpbWUu
Y2hldmFsbGllckBib290bGluLmNvbSwgbmluZ3l1QGVzd2luY29tcHV0aW5nLmNvbSwgbGlubWlu
QGVzd2luY29tcHV0aW5nLmNvbSwgcGlua2VzaC52YWdoZWxhQGVpbmZvY2hpcHMuY29tLCBwcml0
ZXNoLnBhdGVsQGVpbmZvY2hpcHMuY29tLCB3ZWlzaGFuZ2p1YW5AZXN3aW5jb21wdXRpbmcuY29t
LCBob3Jtc0BrZXJuZWwub3JnCj4g5Li76aKYOiBSZTogW1BBVENIIG5ldC1uZXh0IHY3IDIvNF0g
bmV0OiBzdG1tYWM6IGVpYzc3MDA6IGVuYWJsZSBjbG9ja3MgYmVmb3JlIHN5c2NvbiBhY2Nlc3Mg
YW5kIGNvcnJlY3QgUlggc2FtcGxpbmcgdGltaW5nCj4gCj4gT24gVGh1LCAzMCBBcHIgMjAyNiAx
NDo0Mzo1MCArMDgwMCAoR01UKzA4OjAwKSDmnY7lv5cgd3JvdGU6Cj4gPiA+IFdoeSBGaXhlcz8g
SWYgZXRoMSBuZXZlciB3b3JrZWQgdGhpcyBpcyBub3QgYSBmaXggYnV0IG5ldyBmdW5jdGlvbmFs
aXR5Cj4gPiA+IElmIHlvdSB3YW50IHRvIG1ha2UgdGhpcyBhIGZpeCB0byBwcmV2ZW50IGluY29t
cGF0aWJpbGl0eSAtIGN1dCBpdCBkb3duCj4gPiA+IGp1c3QgdG8gdGhlIGV0aDAgY2hhbmdlcy4K
PiA+ID4gICAKPiA+IFRoYW5rIHlvdSBmb3IgdGhlIHN1Z2dlc3Rpb24uCj4gPiAKPiA+IFlvdSdy
ZSByaWdodCB0aGF0IGV0aDEgbmV2ZXIgd29ya2VkIGF0IEdpZ2FiaXQgc3BlZWQsIHNvIHRoaXMg
c2hvdWxkCj4gPiBub3QgYmUgdHJlYXRlZCBhcyBhIGZpeC4KPiA+IAo+ID4gSW4gdjgsIEkgd2ls
bCBzcGxpdCB0aGUgY2hhbmdlcyBpbnRvIHR3byBwYXRjaGVzIHdpdGhpbiB0aGUgc2FtZSBzZXJp
ZXM6Cj4gPiAtIFBhdGNoIDEgd2lsbCBjb250YWluIG9ubHkgdGhlIGZpeGVzIGFmZmVjdGluZyB0
aGUgZXhpc3RpbmcgZXRoMAo+ID4gZnVuY3Rpb25hbGl0eSwgYW5kIHdpbGwga2VlcCB0aGUgRml4
ZXMgdGFnLgo+ID4gLSBQYXRjaCAyIHdpbGwgYWRkIHRoZSBldGgxIHN1cHBvcnQgKFJYIGNsb2Nr
IGludmVyc2lvbiB3b3JrYXJvdW5kKQo+ID4gYXMgbmV3IGZ1bmN0aW9uYWxpdHksIHdpdGhvdXQg
YSBGaXhlcyB0YWcuCj4gPiAKPiA+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3Ugd291bGQgcHJl
ZmVyIGEgZGlmZmVyZW50IHNwbGl0IG9yIG9yZGVyaW5nLgo+IAo+IElmIHlvdSB3YW50IHRvIGNv
bnNpZGVyIHNvbWUgcGFydCBvZiB0aGlzIGNvbW1pdCBhIGZpeCBpdCBoYXMgdG8gYmUKPiBwb3N0
ZWQgc2VwYXJhdGVseSB0byB0aGUgbmV0IHRyZWUgKHJhdGhlciB0aGFuIG5ldC1uZXh0KS4KPiBP
bmNlIGl0J3MgbWVyZ2VkIGFuZCBtYWtlcyBpdCB3YXkgb3ZlciB0byB0aGUgbmV0LW5leHQgdHJl
ZSAoZWFjaAo+IFRodXJzZGF5KSB5b3UgY2FuIHBvc3QgdGhlIG5ldC1uZXh0IGNobmFnZXMgZm9y
IGV0aDEKClRoYW5rcywgdW5kZXJzdG9vZC4KCkkgd2lsbCBzcGxpdCB0aGUgY2hhbmdlcyBhY2Nv
cmRpbmdseToKLSBTZW5kIHRoZSBldGgwIGZpeGVzIGFzIGEgbmV3IHYxIHNlcmllcyB0YXJnZXRp
bmcgbmV0LgotIFNlbmQgdGhlIGV0aDEgZW5hYmxlbWVudCBhcyBhIG5ldyB2MSBzZXJpZXMgdGFy
Z2V0aW5nIG5ldC1uZXh0LgoKVGhhbmtzIGZvciB0aGUgZ3VpZGFuY2UuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
