Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMqbE8W3eWlHygEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 08:16:21 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 164A09DA42
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 08:16:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEF65C5A4DB;
	Wed, 28 Jan 2026 07:16:20 +0000 (UTC)
Received: from sgoci-sdnproxy-4.icoremail.net (sgoci-sdnproxy-4.icoremail.net
 [129.150.39.64])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88B9EC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 06:15:19 +0000 (UTC)
Received: from linmin$eswincomputing.com ( [10.10.96.205] ) by
 ajax-webmail-app2 (Coremail) ; Tue, 27 Jan 2026 14:14:51 +0800 (GMT+08:00)
X-Originating-IP: [10.10.96.205]
Date: Tue, 27 Jan 2026 14:14:51 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Min Lin" <linmin@eswincomputing.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <aXeydXuWEMDz-yVM@shell.armlinux.org.uk>
References: <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
 <59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch>
 <4e2a55e7.3662.19be8cb9c3c.Coremail.lizhi2@eswincomputing.com>
 <c5c0bfdb-316d-4796-afa0-f6f018ceb414@lunn.ch>
 <abf12a3f-9cdd-472d-a02e-af4da594b84f@gmail.com>
 <e6f7da45-3dec-4af6-a5b1-a72210bf24f4@kernel.org>
 <43923bf9-6202-4147-8eac-5bd7bb653fd4@gmail.com>
 <bd202cfa-d6eb-4d0e-982d-b49795dd25f7@lunn.ch>
 <009aefc4-fbc9-4f91-9230-23d18c281bf3@gmail.com>
 <73ea5619.2b71.19bf847c80d.Coremail.linmin@eswincomputing.com>
 <aXeydXuWEMDz-yVM@shell.armlinux.org.uk>
MIME-Version: 1.0
Message-ID: <32a1f814.2c79.19bfe173225.Coremail.linmin@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID: TQJkCgCH+y3bV3hppKsGAA--.1519W
X-CM-SenderInfo: 5olqzx3q6h245lqf0zpsxwx03jof0z/1tbiAgEACWl3l4EWAQAAsV
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-Mailman-Approved-At: Wed, 28 Jan 2026 07:16:18 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, Bo Gan <ganboing@gmail.com>,
 edumazet@google.com, =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, ningyu@eswincomputing.com,
 Krzysztof Kozlowski <krzk@kernel.org>, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v1 1/2] dt-bindings: ethernet: eswin: add
 clock sampling control
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[25];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DMARC_NA(0.00)[eswincomputing.com];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[linmin@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:ganboing@gmail.com,m:edumazet@google.com,m:lizhi2@eswincomputing.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:ningyu@eswincomputing.com,m:krzk@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,google.com,eswincomputing.com,st-md-mailman.stormreply.com,kernel.org,redhat.com,vger.kernel.org,lists.infradead.org,einfochips.com,davemloft.net];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linmin@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	HAS_X_PRIO_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,einfochips.com:email,eswincomputing.com:mid,eswincomputing.com:email,infradead.org:email]
X-Rspamd-Queue-Id: 164A09DA42
X-Rspamd-Action: no action

SGkgUnVzc2VsbCwKCgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZXMtLS0tLQo+IEZyb206ICJSdXNz
ZWxsIEtpbmcgKE9yYWNsZSkiIDxsaW51eEBhcm1saW51eC5vcmcudWs+Cj4gU2VuZCB0aW1lOlR1
ZXNkYXksIDI3LzAxLzIwMjYgMDI6Mjk6MDkKPiBUbzogIk1pbiBMaW4iIDxsaW5taW5AZXN3aW5j
b21wdXRpbmcuY29tPgo+IENjOiAiQm8gR2FuIiA8Z2FuYm9pbmdAZ21haWwuY29tPiwgIkFuZHJl
dyBMdW5uIiA8YW5kcmV3QGx1bm4uY2g+LCAiS3J6eXN6dG9mIEtvemxvd3NraSIgPGtyemtAa2Vy
bmVsLm9yZz4sIOadjuW/lyA8bGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbT4sIGRldmljZXRyZWVA
dmdlci5rZXJuZWwub3JnLCBhbmRyZXcrbmV0ZGV2QGx1bm4uY2gsIGRhdmVtQGRhdmVtbG9mdC5u
ZXQsIGVkdW1hemV0QGdvb2dsZS5jb20sIGt1YmFAa2VybmVsLm9yZywgcm9iaEBrZXJuZWwub3Jn
LCBrcnprK2R0QGtlcm5lbC5vcmcsIGNvbm9yK2R0QGtlcm5lbC5vcmcsIG5ldGRldkB2Z2VyLmtl
cm5lbC5vcmcsIHBhYmVuaUByZWRoYXQuY29tLCBtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tLCBh
bGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tLCBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tLCBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcsIGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcsIG5pbmd5dUBlc3dpbmNvbXB1dGluZy5jb20sIHBpbmtl
c2gudmFnaGVsYUBlaW5mb2NoaXBzLmNvbSwgd2Vpc2hhbmdqdWFuQGVzd2luY29tcHV0aW5nLmNv
bQo+IFN1YmplY3Q6IFJlOiBSZTogW1BBVENIIHYxIDEvMl0gZHQtYmluZGluZ3M6IGV0aGVybmV0
OiBlc3dpbjogYWRkIGNsb2NrIHNhbXBsaW5nIGNvbnRyb2wKPiAKPiBPbiBNb24sIEphbiAyNiwg
MjAyNiBhdCAxMToxMDoxMkFNICswODAwLCBNaW4gTGluIHdyb3RlOgo+ID4gRHVlIHRvIGNoaXAg
YmFja2VuZCByZWFzb25zLCB0aGVyZSBpcyBhbHJlYWR5IGEgfjQtNW5zIHNrZXcgYmV0d2VlbiB0
aGUgUlgKPiA+IGNsb2NrIGFuZCBkYXRhIG9mIHRoZSBldGgxIE1BQyBjb250cm9sbGVyIGluc2lk
ZSB0aGUgc2lsaWNvbi4KPiAKPiBMZXQncyBhbmFseXNlIHRoaXMuCj4gCj4gCVRYQyAvIFJYQwlU
WEMgLyBSWEMKPiBTcGVlZAlDbG9jayByYXRlCUNsb2NrIHBlcmlvZAo+IDFHCTEyNU1IegkJOG5z
Cj4gMTAwTQkyNU1IegkJNDBucwo+IDEwTQkyLjVNSHoJCTQwMG5zCj4gCj4gVGhlIHJlcXVpcmVk
IHNrZXcgZm9yIFRYQyBhbmQgUlhDIGF0IHRoZSByZWNlaXZlciBpcyBzcGVjaWZpZWQgdG8gYmUK
PiBiZXR3ZWVuIDEgYW5kIDIuNm5zIGlycmVzcGVjdGl2ZSBvZiB0aGUgc3BlZWQuIFRoZSBlZGdl
IG9mIHRoZSBjbG9jawo+IGlzIGFsc28gaW1wb3J0YW50OiB0aGUgcmlzaW5nIGVkZ2UgaW5kaWNh
dGVzIHRoZSBsb3dlciA0IGJpdHMsIGFuZAo+IHRoZSBmYWxsaW5nIGVkZ2UgaW5kaWNhdGVzIHRo
ZSB1cHBlciA0IGJpdHMuCj4gCj4gQXQgMUcgc3BlZWQsIHdpdGggYSAiNCB0byA1bnMiIHNrZXcg
aW4gdGhlIGNoaXAuIElmIHRoaXMgaXMgYWNjdXJhdGUsCj4gdGhlbiBpbnZlcnRpbmcgdGhlIGNs
b2NrIGFuZCBhZGRpbmcgMW5zIG9mIGFkZGl0aW9uYWwgc2tldyBieSBzb21lCj4gbWVhbnMgKFBD
QiB0cmFjZSwgb3IgYXQgdGhlIE1BQyBvciBQSFkpIHdpbGwgZ2l2ZSB0aGUgcmVxdWlyZWQgY2xv
Y2sKPiBhdCB0aGUgcmVjZWl2ZXIuCj4gCgpZZXMsIHRoYXQncyBleGFjdGx5IHRoZSBjYXNlLgoK
PiBUaGUgdGltaW5nIHRhYmxlIGluIHRoZSBSR01JSSBzdGFuZGFyZCAoMy4zKSBhbGxvd3MgZm9y
IFRjeWMgKHRoZQo+IGNsb2NrIHJhdGUpIHRvIGJlIHNjYWxlZCwgYnV0IHRoZXJlIGlzIG5vIGFs
bG93YW5jZSBmb3Igc2NhbGluZwo+IFRza2V3UiAodGhlIHJlcXVpcmVkIDEgdG8gMi42bnMgc2tl
dy4pIFRoaXMgc2tldyBwYXJhbWV0ZXIgaXMKPiBmaXhlZC4KPiAKPiBTbywgYXQgdGhlIG90aGVy
IHNwZWVkcywgeW91IGFyZSBjb21wbGV0ZWx5IHVuYWJsZSB0byBtZWV0IHRoZSB0aW1pbmcKPiBz
cGVjaWZpY2F0aW9uLCB3aGV0aGVyIGlycmVzcGVjdGl2ZSBvZiB0aGUgY2xvY2sgaW52ZXJzaW9u
LiBJbiBlZmZlY3QsCj4gdGhlIG9ubHkgc3BlZWQgdGhhdCB5b3UgY2FuIG1lZXQgdGhlIHNwZWNp
ZmljYXRpb24gaXMgMUcuCj4gCgpUaGUgdGltaW5nIHRhYmxlIGluIHRoZSBSR01JSSBzdGFuZGFy
ZCgzLjMpIHNheXMgdGhlIG1heCB2YWx1ZSBvZiBUc2tldwpmb3IgMTAvMTAwIGlzIHVuc3BlY2lm
aWVkLgpRdW90YXRpb246Im5vdGUxOiAuLi4sRm9yIDEwLzEwMCB0aGUgTWF4IHZhbHVlIGlzIHVu
c3BlY2lmaWVkLiIKCkkgdGhpbmsgZm9yIDEwLzEwMCwgdGhlICI0IHRvIDVucyIgc2tldyBpbiB0
aGUgY2hpcCBkb2Vzbid0IGJyZWFrIHRoZQpzdGFuZGFyZC4gQXQgMTAvMTAwIHNwZWVkcywgaXQg
bWVldHMgdGhlIHRpbWluZyBzcGVjaWZpY2F0aW9uIHdpdGhvdXQKaGF2aW5nIHRvIHRvIGFkZCBj
bG9jayBpbnZlcnNpb24uCkluIHByYWN0aWNlLCBpdCB3b3JrcyBhdCAxMC8xMDAgc3BlZWRzIGlu
IHRoZSByZ21paS1pZCBwaHkgbW9kZS4KCj4gVGh1cywgSSB0aGluayB0aGlzIGlzIHNvbWV0aGlu
ZyB0aGF0IG5lZWRzIGEgbG90IG1vcmUgdGhhbiBqdXN0ICJkbwo+IHdlIG5lZWQgdG8gaW52ZXJ0
IHRoZSBjbG9jayIuIFlvdSBhbHNvIG5lZWQgdG8gcHJldmVudCAxME0gYW5kIDEwME0KPiBiZWlu
ZyBzdXBwb3J0ZWQgSU1ITy4KPiAKClJlZ2FyZHMsCkxpbiBNaW4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
