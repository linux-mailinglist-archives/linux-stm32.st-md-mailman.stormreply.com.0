Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGtXMjrFr2nWcAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Mar 2026 08:16:10 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A78D2462FB
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Mar 2026 08:16:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5FEBC8F290;
	Tue, 10 Mar 2026 07:16:09 +0000 (UTC)
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net
 [207.46.229.174])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5ECE7C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 07:16:07 +0000 (UTC)
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Tue, 10 Mar 2026 15:15:40 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Tue, 10 Mar 2026 15:15:40 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Yao Zi" <me@ziyao.cc>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <aaa4xodVNaY0gmBA@pie>
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
 <20260303061732.918-1-lizhi2@eswincomputing.com> <aaa4xodVNaY0gmBA@pie>
MIME-Version: 1.0
Message-ID: <408e45b4.51a4.19cd699f60e.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgDHaXMcxa9pRCIHAA--.2221W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAQECDGmu9hMT1QABsr
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Cc: edumazet@google.com, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, alex@ghiti.fr, ningyu@eswincomputing.com,
 pritesh.patel@einfochips.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, palmer@dabbelt.com,
 mcoquelin.stm32@gmail.com, pjw@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
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
X-Rspamd-Queue-Id: 4A78D2462FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[eswincomputing.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:me@ziyao.cc,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:ningyu@eswincomputing.com,m:pritesh.patel@einfochips.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,einfochips.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,armlinux.org.uk,lunn.ch,dabbelt.com,gmail.com,davemloft.net];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiWWFvIFppIiA8bWVAeml5
YW8uY2M+Cj4g5Y+R6YCB5pe26Ze0OjIwMjYtMDMtMDMgMTg6MzI6MzggKOaYn+acn+S6jCkKPiDm
lLbku7bkuro6IGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20sIGRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnLCBhbmRyZXcrbmV0ZGV2QGx1bm4uY2gsIGRhdmVtQGRhdmVtbG9mdC5uZXQsIGVkdW1h
emV0QGdvb2dsZS5jb20sIGt1YmFAa2VybmVsLm9yZywgcm9iaEBrZXJuZWwub3JnLCBrcnprK2R0
QGtlcm5lbC5vcmcsIGNvbm9yK2R0QGtlcm5lbC5vcmcsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcs
IHBhYmVuaUByZWRoYXQuY29tLCBtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tLCBhbGV4YW5kcmUu
dG9yZ3VlQGZvc3Muc3QuY29tLCBybWsra2VybmVsQGFybWxpbnV4Lm9yZy51aywgd2Vuc0BrZXJu
ZWwub3JnLCBwandAa2VybmVsLm9yZywgcGFsbWVyQGRhYmJlbHQuY29tLCBhb3VAZWVjcy5iZXJr
ZWxleS5lZHUsIGFsZXhAZ2hpdGkuZnIsIGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcs
IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20sIGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZywgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+IOaK
hOmAgTogbmluZ3l1QGVzd2luY29tcHV0aW5nLmNvbSwgbGlubWluQGVzd2luY29tcHV0aW5nLmNv
bSwgcGlua2VzaC52YWdoZWxhQGVpbmZvY2hpcHMuY29tLCBwcml0ZXNoLnBhdGVsQGVpbmZvY2hp
cHMuY29tLCB3ZWlzaGFuZ2p1YW5AZXN3aW5jb21wdXRpbmcuY29tCj4g5Li76aKYOiBSZTogW1BB
VENIIG5ldC1uZXh0IHYzIDMvM10gcmlzY3Y6IGR0czogZXN3aW46IGVpYzc3MDAtaGlmaXZlLXBy
ZW1pZXItcDU1MDogZW5hYmxlIEV0aGVybmV0IGNvbnRyb2xsZXIKPiAKPiBPbiBUdWUsIE1hciAw
MywgMjAyNiBhdCAwMjoxNzozMlBNICswODAwLCBsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tIHdy
b3RlOgo+ID4gRnJvbTogWmhpIExpIDxsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tPgo+ID4gCj4g
PiBFbmFibGUgdGhlIG9uLWJvYXJkIEdpZ2FiaXQgRXRoZXJuZXQgY29udHJvbGxlciBvbiB0aGUK
PiA+IEhpRml2ZSBQcmVtaWVyIFA1NTAgZGV2ZWxvcG1lbnQgYm9hcmQuCj4gPiAKPiA+IFNpZ25l
ZC1vZmYtYnk6IFpoaSBMaSA8bGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbT4KPiA+IC0tLQo+ID4g
IC4uLi9kdHMvZXN3aW4vZWljNzcwMC1oaWZpdmUtcHJlbWllci1wNTUwLmR0cyB8IDUwICsrKysr
KysrKysrKysrKysrCj4gPiAgYXJjaC9yaXNjdi9ib290L2R0cy9lc3dpbi9laWM3NzAwLmR0c2kg
ICAgICAgIHwgNTQgKysrKysrKysrKysrKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTA0
IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMv
ZXN3aW4vZWljNzcwMC1oaWZpdmUtcHJlbWllci1wNTUwLmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9k
dHMvZXN3aW4vZWljNzcwMC1oaWZpdmUtcHJlbWllci1wNTUwLmR0cwo+ID4gaW5kZXggMTMxZWQx
ZmM2YjJlLi5kNTU4ZjBmZGZiMzggMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L2Vzd2luL2VpYzc3MDAtaGlmaXZlLXByZW1pZXItcDU1MC5kdHMKPiA+ICsrKyBiL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvZXN3aW4vZWljNzcwMC1oaWZpdmUtcHJlbWllci1wNTUwLmR0cwo+IAo+IC4u
Lgo+IAo+ID4gQEAgLTIwLDYgKzIyLDU0IEBAIGNob3NlbiB7Cj4gPiAgCX07Cj4gPiAgfTsKPiA+
ICAKPiA+ICsmZ21hYzAgewo+ID4gKwlwaHktaGFuZGxlID0gPCZnbWFjMF9waHkwPjsKPiA+ICsJ
cGh5LW1vZGUgPSAicmdtaWktaWQiOwo+ID4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+
ID4gKwlwaW5jdHJsLTAgPSA8JmdwaW8xMDZfcGlucz47Cj4gPiArCXJ4LWludGVybmFsLWRlbGF5
LXBzID0gPDIwPjsKPiA+ICsJdHgtaW50ZXJuYWwtZGVsYXktcHMgPSA8MTAwPjsKPiA+ICsJc3Rh
dHVzID0gIm9rYXkiOwo+ID4gKwo+ID4gKwltZGlvIHsKPiA+ICsJCWNvbXBhdGlibGUgPSAic25w
cyxkd21hYy1tZGlvIjsKPiAKPiBTaW5jZSBpdCdzIGltcGxlbWVudGVkIGluIHRoZSBEV01BQyBJ
UCwgSSB0aGluayB0aGUgbWRpbyBidXMgaXMKPiBTb0Mtc3BlY2lmaWMgYW5kIHNob3VsZCBiZSBw
dXQgaW50byB0aGUgU29DIGRldmljZXRyZWUgaW5zdGVhZC4KPiAKCkhpIFlhbyBaaSwKClRoYW5r
cyBmb3IgdGhlIHJldmlldy4KCllvdSdyZSByaWdodCB0aGF0IHRoZSBNRElPIGJ1cyBpcyBpbXBs
ZW1lbnRlZCBhcyBwYXJ0IG9mIHRoZSBEV01BQyBJUCBhbmQKaXMgdGhlcmVmb3JlIFNvQy1zcGVj
aWZpYy4gSXQgbWFrZXMgbW9yZSBzZW5zZSB0byBkZXNjcmliZSB0aGUgTURJTwpjb250cm9sbGVy
IGluIHRoZSBTb0MgZHRzaS4KCkknbGwgbW92ZSB0aGUgTURJTyBub2RlIHRvIGVpYzc3MDAuZHRz
aSBhbmQga2VlcCBvbmx5IHRoZSBQSFkgbm9kZSBpbiB0aGUKYm9hcmQgZHRzIGluIHRoZSBuZXh0
IHJldmlzaW9uLgoKVGhhbmtzLApaaGkgTGkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
