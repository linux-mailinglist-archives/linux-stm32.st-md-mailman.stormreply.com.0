Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cO9SFhN5/WnnegAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 07:48:03 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 024154F20FE
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 07:48:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35E3BC03FCA;
	Fri,  8 May 2026 05:48:02 +0000 (UTC)
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net
 (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 997B2C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2026 05:48:01 +0000 (UTC)
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Fri, 8 May 2026 13:47:31 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Fri, 8 May 2026 13:47:31 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Andrew Lunn" <andrew@lunn.ch>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <2436c6e9-4aad-4ffd-9fef-0cbbe38dc66d@lunn.ch>
References: <20260507083037.152-1-lizhi2@eswincomputing.com>
 <20260507083136.175-1-lizhi2@eswincomputing.com>
 <2436c6e9-4aad-4ffd-9fef-0cbbe38dc66d@lunn.ch>
MIME-Version: 1.0
Message-ID: <1b38bce2.7d07.19e06207806.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgBn_HDzeP1p2NgXAA--.6342W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgEBDGn8vxER1gACsw
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Cc: edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com,
 ningyu@eswincomputing.com, maxime.chevallier@bootlin.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net v1 1/2] dt-bindings: ethernet: eswin:
 refine delay model and HSP register description
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
X-Rspamd-Queue-Id: 024154F20FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[eswincomputing.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:edumazet@google.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:pritesh.patel@einfochips.com,m:weishangjuan@eswincomputing.com,m:ningyu@eswincomputing.com,m:maxime.chevallier@bootlin.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:rmk+kernel@armlinux.org.uk,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_X_PRIO_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[google.com,st-md-mailman.stormreply.com,kernel.org,einfochips.com,eswincomputing.com,bootlin.com,redhat.com,vger.kernel.org,armlinux.org.uk,lists.infradead.org,lunn.ch,gmail.com,davemloft.net];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.851];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiQW5kcmV3IEx1bm4iIDxh
bmRyZXdAbHVubi5jaD4KPiDlj5HpgIHml7bpl7Q6MjAyNi0wNS0wNyAyMDoyOToxMCAo5pif5pyf
5ZubKQo+IOaUtuS7tuS6ujogbGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbQo+IOaKhOmAgTogYW5k
cmV3K25ldGRldkBsdW5uLmNoLCBkYXZlbUBkYXZlbWxvZnQubmV0LCBlZHVtYXpldEBnb29nbGUu
Y29tLCBrdWJhQGtlcm5lbC5vcmcsIHBhYmVuaUByZWRoYXQuY29tLCByb2JoQGtlcm5lbC5vcmcs
IGtyemsrZHRAa2VybmVsLm9yZywgY29ub3IrZHRAa2VybmVsLm9yZywgbmV0ZGV2QHZnZXIua2Vy
bmVsLm9yZywgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcsIG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20sIGFsZXhhbmRyZS50b3JndWVAZm9z
cy5zdC5jb20sIHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrLCBtYXhpbWUuY2hldmFsbGllckBi
b290bGluLmNvbSwgbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbSwgbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnLCBuaW5neXVAZXN3aW5jb21wdXRpbmcu
Y29tLCBsaW5taW5AZXN3aW5jb21wdXRpbmcuY29tLCBwaW5rZXNoLnZhZ2hlbGFAZWluZm9jaGlw
cy5jb20sIHByaXRlc2gucGF0ZWxAZWluZm9jaGlwcy5jb20sIHdlaXNoYW5nanVhbkBlc3dpbmNv
bXB1dGluZy5jb20KPiDkuLvpopg6IFJlOiBbUEFUQ0ggbmV0IHYxIDEvMl0gZHQtYmluZGluZ3M6
IGV0aGVybmV0OiBlc3dpbjogcmVmaW5lIGRlbGF5IG1vZGVsIGFuZCBIU1AgcmVnaXN0ZXIgZGVz
Y3JpcHRpb24KPiAKPiA+ICAgICAgZXRoZXJuZXRANTA0MDAwMDAgewo+ID4gICAgICAgICAgY29t
cGF0aWJsZSA9ICJlc3dpbixlaWM3NzAwLXFvcy1ldGgiLCAic25wcyxkd21hYy01LjIwIjsKPiA+
ICAgICAgICAgIHJlZyA9IDwweDUwNDAwMDAwIDB4MTAwMDA+Owo+ID4gLSAgICAgICAgY2xvY2tz
ID0gPCZkMF9jbG9jayAxODY+LCA8JmQwX2Nsb2NrIDE3MT4sIDwmZDBfY2xvY2sgNDA+LAo+ID4g
LSAgICAgICAgICAgICAgICA8JmQwX2Nsb2NrIDE5Mz47Cj4gPiAtICAgICAgICBjbG9jay1uYW1l
cyA9ICJheGkiLCAiY2ZnIiwgInN0bW1hY2V0aCIsICJ0eCI7Cj4gPiAgICAgICAgICBpbnRlcnJ1
cHQtcGFyZW50ID0gPCZwbGljPjsKPiA+ICAgICAgICAgIGludGVycnVwdHMgPSA8NjE+Owo+ID4g
ICAgICAgICAgaW50ZXJydXB0LW5hbWVzID0gIm1hY2lycSI7Cj4gPiAtICAgICAgICBwaHktbW9k
ZSA9ICJyZ21paS1pZCI7Cj4gPiAtICAgICAgICBwaHktaGFuZGxlID0gPCZwaHkwPjsKPiA+ICsg
ICAgICAgIGNsb2NrcyA9IDwmZDBfY2xvY2sgMTg2PiwgPCZkMF9jbG9jayAxNzE+LCA8JmQwX2Ns
b2NrIDQwPiwKPiA+ICsgICAgICAgICAgICAgICAgPCZkMF9jbG9jayAxOTM+Owo+ID4gKyAgICAg
ICAgY2xvY2stbmFtZXMgPSAiYXhpIiwgImNmZyIsICJzdG1tYWNldGgiLCAidHgiOwo+IAo+IFBs
ZWFzZSBkb24ndCBtb3ZlIHRoZSBjbG9ja3MgYXJvdW5kLCBzaW5jZSB0aGV5IGhhdmUgbm90aGlu
ZyB0byBkbwo+IHdpdGggUkdNSUkgZGVsYXlzLgo+IAo+IAo+ID4gICAgICAgICAgcmVzZXRzID0g
PCZyZXNldCA5NT47Cj4gPiAgICAgICAgICByZXNldC1uYW1lcyA9ICJzdG1tYWNldGgiOwo+ID4g
LSAgICAgICAgcngtaW50ZXJuYWwtZGVsYXktcHMgPSA8MjAwPjsKPiA+IC0gICAgICAgIHR4LWlu
dGVybmFsLWRlbGF5LXBzID0gPDIwMD47Cj4gPiAtICAgICAgICBlc3dpbixoc3Atc3AtY3NyID0g
PCZoc3Bfc3BfY3NyIDB4MTAwIDB4MTA4IDB4MTE4PjsKPiA+IC0gICAgICAgIHNucHMsYXhpLWNv
bmZpZyA9IDwmc3RtbWFjX2F4aV9zZXR1cD47Cj4gPiArICAgICAgICBlc3dpbixoc3Atc3AtY3Ny
ID0gPCZoc3Bfc3BfY3NyIDB4MTAwIDB4MTA4IDB4MTE4IDB4MTE0IDB4MTFjPjsKPiA+ICsgICAg
ICAgIHBoeS1oYW5kbGUgPSA8JnBoeTA+Owo+ID4gKyAgICAgICAgcGh5LW1vZGUgPSAicmdtaWkt
aWQiOwo+ID4gICAgICAgICAgc25wcyxhYWw7Cj4gPiAgICAgICAgICBzbnBzLGZpeGVkLWJ1cnN0
Owo+ID4gICAgICAgICAgc25wcyx0c287Cj4gPiAtICAgICAgICBzdG1tYWNfYXhpX3NldHVwOiBz
dG1tYWMtYXhpLWNvbmZpZyB7Cj4gPiArICAgICAgICBzbnBzLGF4aS1jb25maWcgPSA8JnN0bW1h
Y19heGlfc2V0dXBfZ21hYzA+Owo+ID4gKwo+ID4gKyAgICAgICAgc3RtbWFjX2F4aV9zZXR1cF9n
bWFjMDogc3RtbWFjLWF4aS1jb25maWcgewo+IAo+IEFuZCB3aGF0IGRvIHRoZXNlIGNoYW5nZXMg
aGF2ZSB0byBkbyB3aXRoIFJHTUlJIGRlbGF5cz8KPiAKCllvdSdyZSByaWdodCwgdGhvc2UgdW5y
ZWxhdGVkIGV4YW1wbGUgY2hhbmdlcyBzaG91bGQgbm90IGJlIG1peGVkIGludG8gdGhlCmZpeC1y
ZWxhdGVkIGJpbmRpbmcgdXBkYXRlLgoKSSB3aWxsIGxpbWl0IHRoZSBiaW5kaW5nIGNoYW5nZXMg
dG8gb25seSB3aGF0IGlzIHJlcXVpcmVkIGZvciB0aGUgZml4ZXMsCnN1Y2ggYXMgdGhlIGFkZGl0
aW9uYWwgSFNQIENTUiBvZmZzZXRzIG5lZWRlZCBmb3IgZXhwbGljaXQgVFhEL1JYRCBkZWxheQpy
ZWdpc3RlciBpbml0aWFsaXphdGlvbiwgYW5kIGRyb3AgdGhlIHVucmVsYXRlZCBEVFMgZXhhbXBs
ZSByZW9yZGVyaW5nIG9yCmNsZWFudXAgY2hhbmdlcyBmcm9tIHRoaXMgc2VyaWVzLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
