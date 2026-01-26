Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBYRD8W3eWlHygEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 08:16:21 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EA59DA40
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 08:16:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 428E6C56603;
	Wed, 28 Jan 2026 07:16:20 +0000 (UTC)
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net
 [13.75.44.102])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BF83C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 03:10:47 +0000 (UTC)
Received: from linmin$eswincomputing.com ( [10.10.96.205] ) by
 ajax-webmail-app2 (Coremail) ; Mon, 26 Jan 2026 11:10:12 +0800 (GMT+08:00)
X-Originating-IP: [10.10.96.205]
Date: Mon, 26 Jan 2026 11:10:12 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Min Lin" <linmin@eswincomputing.com>
To: "Bo Gan" <ganboing@gmail.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <009aefc4-fbc9-4f91-9230-23d18c281bf3@gmail.com>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
 <59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch>
 <4e2a55e7.3662.19be8cb9c3c.Coremail.lizhi2@eswincomputing.com>
 <c5c0bfdb-316d-4796-afa0-f6f018ceb414@lunn.ch>
 <abf12a3f-9cdd-472d-a02e-af4da594b84f@gmail.com>
 <e6f7da45-3dec-4af6-a5b1-a72210bf24f4@kernel.org>
 <43923bf9-6202-4147-8eac-5bd7bb653fd4@gmail.com>
 <bd202cfa-d6eb-4d0e-982d-b49795dd25f7@lunn.ch>
 <009aefc4-fbc9-4f91-9230-23d18c281bf3@gmail.com>
MIME-Version: 1.0
Message-ID: <73ea5619.2b71.19bf847c80d.Coremail.linmin@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID: TQJkCgAXiy0U23Zp0gsGAA--.1374W
X-CM-SenderInfo: 5olqzx3q6h245lqf0zpsxwx03jof0z/1tbiAQETCWl2RY0XlgABsN
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-Mailman-Approved-At: Wed, 28 Jan 2026 07:16:18 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, edumazet@google.com,
 =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, ningyu@eswincomputing.com,
 Krzysztof Kozlowski <krzk@kernel.org>, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, rmk+kernel@armlinux.org.uk,
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
	DATE_IN_PAST(1.00)[52];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[eswincomputing.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:ganboing@gmail.com,m:andrew@lunn.ch,m:edumazet@google.com,m:lizhi2@eswincomputing.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:ningyu@eswincomputing.com,m:krzk@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:rmk+kernel@armlinux.org.uk,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[linmin@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,google.com,eswincomputing.com,st-md-mailman.stormreply.com,kernel.org,redhat.com,vger.kernel.org,armlinux.org.uk,lists.infradead.org,einfochips.com,gmail.com,davemloft.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[linmin@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,eswincomputing.com:mid,eswincomputing.com:email,einfochips.com:email]
X-Rspamd-Queue-Id: B6EA59DA40
X-Rspamd-Action: no action

SGkgQm8gR2FuCgoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2VzLS0tLS0KPiBGcm9tOiAiQm8gR2Fu
IiA8Z2FuYm9pbmdAZ21haWwuY29tPgo+IFNlbmQgdGltZTpTYXR1cmRheSwgMjQvMDEvMjAyNiAx
Mjo1NzoyMwo+IFRvOiAiQW5kcmV3IEx1bm4iIDxhbmRyZXdAbHVubi5jaD4KPiBDYzogIktyenlz
enRvZiBLb3psb3dza2kiIDxrcnprQGtlcm5lbC5vcmc+LCDmnY7lv5cgPGxpemhpMkBlc3dpbmNv
bXB1dGluZy5jb20+LCBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZywgYW5kcmV3K25ldGRldkBs
dW5uLmNoLCBkYXZlbUBkYXZlbWxvZnQubmV0LCBlZHVtYXpldEBnb29nbGUuY29tLCBrdWJhQGtl
cm5lbC5vcmcsIHJvYmhAa2VybmVsLm9yZywga3J6aytkdEBrZXJuZWwub3JnLCBjb25vcitkdEBr
ZXJuZWwub3JnLCBuZXRkZXZAdmdlci5rZXJuZWwub3JnLCBwYWJlbmlAcmVkaGF0LmNvbSwgbWNv
cXVlbGluLnN0bTMyQGdtYWlsLmNvbSwgYWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbSwgcm1r
K2tlcm5lbEBhcm1saW51eC5vcmcudWssIGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20sIGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZywgbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZywgbmluZ3l1QGVzd2luY29tcHV0aW5nLmNvbSwgbGlubWluQGVz
d2luY29tcHV0aW5nLmNvbSwgcGlua2VzaC52YWdoZWxhQGVpbmZvY2hpcHMuY29tLCB3ZWlzaGFu
Z2p1YW5AZXN3aW5jb21wdXRpbmcuY29tCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MSAxLzJdIGR0
LWJpbmRpbmdzOiBldGhlcm5ldDogZXN3aW46IGFkZCBjbG9jayBzYW1wbGluZyBjb250cm9sCj4g
Cj4gSGkgQW5kcmV3LAo+IAo+IE9uIDEvMjMvMjYgMTE6NDMsIEFuZHJldyBMdW5uIHdyb3RlOgo+
ID4gT24gRnJpLCBKYW4gMjMsIDIwMjYgYXQgMDI6NDc6MThBTSAtMDgwMCwgQm8gR2FuIHdyb3Rl
Ogo+ID4+IEhpIEtyenlzenRvZiwKPiA+Pgo+ID4+IE9uIDEvMjMvMjYgMDI6MDcsIEtyenlzenRv
ZiBLb3psb3dza2kgd3JvdGU6Cj4gPj4+IE9uIDIzLzAxLzIwMjYgMDg6MzksIEJvIEdhbiB3cm90
ZToKPiA+Pj4+PiBJIGFzc3VtZSB0aGUgYWRkcmVzcyBvZiB0aGUgaW50ZXJmYWNlIGlzIGZpeGVk
LiBTbyB5b3UgY2FuIGp1c3Qga2V5Cj4gPj4+Pj4gb2ZmIHRoYXQgdG8gZGlzdGluZ3Vpc2ggdGhl
IHR3byBpbnN0YW5jZXMuCj4gPj4+Pj4KPiA+Pj4+PiBTaW5jZSB0aGlzIGlzIGFuIGludGVybmFs
IHByb3BlcnR5LCBub3QgYSBib2FyZCBwcm9wZXJ0eSwgaXQgaXMgbm90Cj4gPj4+Pj4gY2xlYXIg
aXQgYWN0dWFsbHkgYmVsb25ncyBvbiBEVC4KPiA+Pj4+Pgo+ID4+Pj4+ICAgICAgICBBbmRyZXcK
PiA+Pj4+Cj4gPj4+PiBJTU8sIHRoZXkgc2hvdWxkIGJlIGluIERUIHRvIHByb3ZpZGUgbWF4aW11
bSBmbGV4aWJpbGl0eS4gVGhlIFNvQyAuZHRzaQo+ID4+Pgo+ID4+PiBUaGlzIGlzIG5vdCB0aGUg
cHVycG9zZSBvZiBEVC4gUGxlYXNlIHJhdGhlciB1c2UgYXJndW1lbnRzIGluIHRlcm1zIG9mCj4g
Pj4+IERUIHJ1bGVzIChzZWUgZG9jcywgcHJlc2VudGF0aW9ucykuCj4gPj4+Cj4gPj4gQW55IGV4
YW1wbGVzPyBsaW5rcz8gVGhhbmsgeW91IGZvciB5b3VyIHBhdGllbmNlLgo+ID4+Cj4gPj4gSSdk
IHNheSBpZiB0aGUgYm9hcmQgLmR0cyBuZXZlciBvdmVycmlkZXMgdGhlIGVzd2luLHJ4LWNsay1p
bnZlcnQsIChFLmcuLAo+ID4+IHRoZSBTb0MgLmR0c2kgaGFzIHJ4LWNsay1pbnZlcnQsIGxhdGVy
IHRoZSBib2FyZCAvZGVsZXRlLXByb3BlcnR5LydzIGl0KQo+ID4+IHRoZW4geWVzLCBpdCBjYW4g
YmUgdHJlYXRlZCBhcyBzb21ldGhpbmcgaW5oZXJlbnQgdG8gdGhlIG1hYywgYW5kIHRoZW4KPiA+
PiAidXNlIGFyZ3VtZW50cyBpbiB0ZXJtcyBvZiBEVCBydWxlcyIuIEkgd2FzIHRoaW5raW5nIGFi
b3V0IHVzZSBjYXNlcyBsaWtlOgo+ID4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIz
MDcxNDEwNDUyMS4xODc1MS0zLXNhbWluLmd1b0BzdGFyZml2ZXRlY2guY29tLwo+ID4gCj4gPiBZ
b3VyIGRldmljZSBzaG91bGQgYmUgY29tcGxpYW50IHdpdGggdGhlIFJHTUlJIHN0YW5kYXJkIGJ5
Cj4gPiBkZWZhdWx0LiBUaGVyZSBzaG91bGQgbm90IGJlIGEgRFQgcHJvcGVydHkgdG8gYXNrIGl0
IG5pY2VseSB0byBmb2xsb3cKPiA+IHRoZSBzdGFuZGFyZC4KPiA+IAo+ID4gUHJvcGVydGllcyBs
aWtlCj4gPiAKPiA+IG1vdG9yY29tbSx0eC1jbGstYWRqLWVuYWJsZWQ7Cj4gPiBtb3RvcmNvbW0s
dHgtY2xrLTEwMC1pbnZlcnRlZDsKPiA+IG1vdG9yY29tbSx0eC1jbGstMTAwMC1pbnZlcnRlZDsK
PiA+IAo+ID4gYXJlIGZvciBicm9rZW4gYm9hcmRzIHdoaWNoIGJyZWFrIHRoZSBzdGFuZGFyZCBh
bmQgcmVxdWlyZSB0aGUgTUFDIGRvCj4gPiBhbHNvIGJyZWFrIHRoZSBzdGFuZGFyZCBzbyB0aGF0
IGV2ZXJ5dGhpbmcgd29ya3MuIFdlIHNob3VsZCBub3Qgc3RhcnQKPiA+IG91dCB3aXRoIHRoZSBh
c3N1bXB0aW9uIHlvdSBuZWVkIHRvIHN1cHBvcnQgYnJva2VuIGJvYXJkcyB3aGljaCBpZ25vcmUK
PiA+IHRoZSBzdGFuZGFyZC4KPiAKPiBNeSByZWFkaW5nIG9mCj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzMwOGI2NzYuMmQwMy4xOWJiMGNhZWJlZC5Db3JlbWFpbC5saXpoaTJAZXN3aW5j
b21wdXRpbmcuY29tLwo+IGlzIHRoYXQgdGhlIGV0aDEgTUFDIGlzIGFscmVhZHkgYnJlYWtpbmcg
dGhlIHN0YW5kYXJkIGF0IFNvQyBsZXZlbCwgYW5kCj4gdGhlIGJvYXJkcyBjYW4gdW4tYnJlYWsg
aXQgb3IgYnJlYWsgaXQgZXZlbiBtb3JlLiBIZW5jZSwgZXZlbiBmb3IgcHJvcGVyCj4gZGVzaWdu
ZWQgYm9hcmQsIFNvQyAuZHRzaSBzdGlsbCBuZWVkcyBlc3dpbixyeC1jbGstaW52ZXJ0IChmb3Ig
KmV0aDEqKS4KPiBGb3IgYnJva2VuIGJvYXJkcywgdGhleSBtYXkgcmVxdWlyZSBlc3dpbixyeC1j
bGstaW52ZXJ0IGZvciAqZXRoMCosIGV2ZW4KPiB0aG91Z2ggU29DIGRvZXNuJ3QgbWFuZGF0ZS4g
Rm9yICpldGgxKiBicm9rZW4gYm9hcmRzIG1pZ2h0IGhhdmUgdG8KPiAvZGVsZXRlLXByb3BlcnR5
LyBpdCBhbmQgdXNlIGVzd2luLHR4LWNsay1pbnZlcnQgb3Igc29tZXRoaW5nIGVsc2UuCj4gSXQn
cyBjbGVhcmVyIHRvIGhhdmUgYWxsIHRoZXNlIHBhcmFtZXRlcnMgdmlzaWJsZSBhbmQgZXhwbGlj
aXQgaW4gRFQuCj4gCj4gRVNXSU4sIHBsZWFzZSBjb3JyZWN0IG1lIGlmIEknbSB3cm9uZy4KCkR1
ZSB0byBjaGlwIGJhY2tlbmQgcmVhc29ucywgdGhlcmUgaXMgYWxyZWFkeSBhIH40LTVucyBza2V3
IGJldHdlZW4gdGhlIFJYCmNsb2NrIGFuZCBkYXRhIG9mIHRoZSBldGgxIE1BQyBjb250cm9sbGVy
IGluc2lkZSB0aGUgc2lsaWNvbi4KVGhlIFJYIGNsb2NrIG11c3QgYmUgaW52ZXJ0ZWQgc2luY2Ug
aXQncyBub3QgYWJsZSB0byBtYXRjaCB0aGUgUkdNSUkKdGltaW5nIG9ubHkgYnkgYWRkaW5nIHJ4
LWludGVybmFsLWRlbGF5LXBzIG9uIHRoZSBNQUMgYW5kIDJucyBkZWxheSBvbiB0aGUgUEhZLgpT
bywgeWVzLCBldmVuIGZvciBhIHByb3Blcmx5IGRlc2lnbmVkIGJvYXJkLCBldGgxIHN0aWxsIHJl
cXVpcmVzCmVzd2luLHJ4LWNsay1pbnZlcnQuCgpUaGlzIGlzIGEgY2hpcC1sZXZlbCBkZWZlY3Qs
IGFuZCBpbmRlZWQsIGl0IGJyZWFrcyB0aGUgUkdNSUkgc3RhbmRhcmQgYXQKdGhlIFNvQyBsZXZl
bC4KCkZvciB0aGUgVFggb2YgZXRoMSwgdGhlcmUgaXMgYWxzbyBhIHNrZXcgYmV0d2VlbiB0aGUg
VFggY2xvY2sgYW5kIGRhdGEgb24KdGhlIE1BQyBjb250cm9sbGVyIGluc2lkZSB0aGUgc2lsaWNv
bi4gVGhpcyBza2V3IGhhcHBlbnMgdG8gYmUgYXBwcm94aW1hdGVseSB+Mm5zLgpUaGVyZWZvcmUs
IHdlIGNhbiBjb25zaWRlciB0aGF0IHRoZSAybnMgZGVsYXkgb2YgVFggaXMgcHJvdmlkZWQgYnkg
dGhlIE1BQywKc28gdGhlIFRYIGlzIGNvbXBsaWFudCB3aXRoIHRoZSBSR01JSSBzdGFuZGFyZC4K
CgpSZWdhcmRzLApMaW4gTWluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
