Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMrOCMlmt2mQQwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 03:11:21 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71451293D3E
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 03:11:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15BEAC87EBD;
	Mon, 16 Mar 2026 02:11:20 +0000 (UTC)
Received: from sgoci-sdnproxy-4.icoremail.net (sgoci-sdnproxy-4.icoremail.net
 [129.150.39.64])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CE5AC0693D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 02:11:18 +0000 (UTC)
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Mon, 16 Mar 2026 10:10:43 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Mon, 16 Mar 2026 10:10:43 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Simon Horman" <horms@kernel.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260315162735.1427325-1-horms@kernel.org>
References: <20260313075416.1607-1-lizhi2@eswincomputing.com>
 <20260315162735.1427325-1-horms@kernel.org>
MIME-Version: 1.0
Message-ID: <c78ac2e.555c.19cf468f04e.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgBnCXOjZrdpC8gIAA--.2658W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAQEIDGm23xQQkwABsS
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Cc: edumazet@google.com, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, alex@ghiti.fr, andrew+netdev@lunn.ch,
 pritesh.patel@einfochips.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, ningyu@eswincomputing.com, palmer@dabbelt.com,
 mcoquelin.stm32@gmail.com, pjw@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [net-next, v4,
 2/3] net: stmmac: eic7700: enable clocks before syscon access and
 correct RX sampling timing
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
	FORGED_RECIPIENTS(0.00)[m:horms@kernel.org,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:andrew+netdev@lunn.ch,m:pritesh.patel@einfochips.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ningyu@eswincomputing.com,m:palmer@dabbelt.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:andrew@lunn.ch,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,lunn.ch,einfochips.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,armlinux.org.uk,dabbelt.com,gmail.com,davemloft.net];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 71451293D3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiU2ltb24gSG9ybWFuIiA8
aG9ybXNAa2VybmVsLm9yZz4KPiDlj5HpgIHml7bpl7Q6MjAyNi0wMy0xNiAwMDoyNzozNSAo5pif
5pyf5LiAKQo+IOaUtuS7tuS6ujogbGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbQo+IOaKhOmAgTog
IlNpbW9uIEhvcm1hbiIgPGhvcm1zQGtlcm5lbC5vcmc+LCBhbGV4YW5kcmUudG9yZ3VlQGZvc3Mu
c3QuY29tLCBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZywgYWxleEBnaGl0aS5mciwgbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tLCBuaW5neXVAZXN3aW5jb21wdXRpbmcuY29tLCBsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnLCBrcnprK2R0QGtlcm5lbC5vcmcsIGRhdmVtQGRhdmVtbG9mdC5u
ZXQsIGFuZHJldytuZXRkZXZAbHVubi5jaCwgY29ub3IrZHRAa2VybmVsLm9yZywgd2Vpc2hhbmdq
dWFuQGVzd2luY29tcHV0aW5nLmNvbSwga3ViYUBrZXJuZWwub3JnLCByb2JoQGtlcm5lbC5vcmcs
IGVkdW1hemV0QGdvb2dsZS5jb20sIHBqd0BrZXJuZWwub3JnLCBybWsra2VybmVsQGFybWxpbnV4
Lm9yZy51aywgcGFsbWVyQGRhYmJlbHQuY29tLCBtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tLCBw
aW5rZXNoLnZhZ2hlbGFAZWluZm9jaGlwcy5jb20sIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcsIHByaXRlc2gucGF0ZWxAZWluZm9jaGlwcy5jb20sIHBhYmVuaUByZWRoYXQuY29tLCBhb3VA
ZWVjcy5iZXJrZWxleS5lZHUsIHdlbnNAa2VybmVsLm9yZywgbmV0ZGV2QHZnZXIua2VybmVsLm9y
ZywgbGlubWluQGVzd2luY29tcHV0aW5nLmNvbQo+IOS4u+mimDogUmU6IFtuZXQtbmV4dCx2NCwy
LzNdIG5ldDogc3RtbWFjOiBlaWM3NzAwOiBlbmFibGUgY2xvY2tzIGJlZm9yZSBzeXNjb24gYWNj
ZXNzIGFuZCBjb3JyZWN0IFJYIHNhbXBsaW5nIHRpbWluZwo+IAo+IFRoaXMgaXMgYW4gQUktZ2Vu
ZXJhdGVkIHJldmlldyBvZiB5b3VyIHBhdGNoLiBUaGUgaHVtYW4gc2VuZGluZyB0aGlzCj4gZW1h
aWwgaGFzIGNvbnNpZGVyZWQgdGhlIEFJIHJldmlldyB2YWxpZCwgb3IgYXQgbGVhc3QgcGxhdXNp
YmxlLgo+IAo+IEZvciBsb2NhbCByZXByb2R1Y3Rpb24gc3RlcHMgc2VlIGh0dHBzOi8vbmV0ZGV2
LWFpLmJvdHMubGludXguZGV2L2FpLWxvY2FsLmh0bWwKPiAtLS0KPiBuZXQ6IHN0bW1hYzogZWlj
NzcwMDogZW5hYmxlIGNsb2NrcyBiZWZvcmUgc3lzY29uIGFjY2VzcyBhbmQgY29ycmVjdCBSWCBz
YW1wbGluZyB0aW1pbmcKPiAKPiBUaGUgc2Vjb25kIEV0aGVybmV0IGNvbnRyb2xsZXIgKGV0aDEp
IG9uIHRoZSBFc3dpbiBFSUM3NzAwIFNvQyBtYXkgZmFpbAo+IHRvIHNhbXBsZSBSWCBkYXRhIGNv
cnJlY3RseSBhdCBHaWdhYml0IHNwZWVkIGR1ZSB0byBFSUM3NzAwLXNwZWNpZmljCj4gcmVjZWl2
ZSBjbG9jayB0byBkYXRhIHNrZXcgYXQgdGhlIE1BQyBpbnB1dCBpbiB0aGUgc2lsaWNvbi4gVGhl
IGV4aXN0aW5nCj4gaW50ZXJuYWwgZGVsYXkgY29uZmlndXJhdGlvbiBkb2VzIG5vdCBwcm92aWRl
IHN1ZmZpY2llbnQgYWRqdXN0bWVudCByYW5nZQo+IHRvIGNvbXBlbnNhdGUgZm9yIHRoaXMgY29u
ZGl0aW9uIGF0IDEwMDBNYnBzLiBVcGRhdGUgdGhlIEVJQzc3MDAgRFdNQUMKPiBnbHVlIGRyaXZl
ciB0byBhcHBseSBFSUM3NzAwLXNwZWNpZmljIGNsb2NrIHNhbXBsaW5nIGludmVyc2lvbiBvbmx5
Cj4gZHVyaW5nIEdpZ2FiaXQgb3BlcmF0aW9uIG9uIE1BQyBpbnN0YW5jZXMgdGhhdCByZXF1aXJl
IGl0Lgo+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL2R3bWFjLWVpYzc3MDAuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L2R3bWFjLWVpYzc3MDAuYwo+ID4gaW5kZXggYmNiOGUwMDBlNzIwLi5iMjMwYmM1YjkwMmEgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1l
aWM3NzAwLmMKPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3
bWFjLWVpYzc3MDAuYwo+IAo+IFsgLi4uIF0KPiAKPiA+IEBAIC02MSw4ICs4MSwyNiBAQCBzdGF0
aWMgaW50IGVpYzc3MDBfY2xrc19jb25maWcodm9pZCAqcHJpdiwgYm9vbCBlbmFibGVkKQo+ID4g
IHN0YXRpYyBpbnQgZWljNzcwMF9kd21hY19pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAq
cHJpdikKPiA+ICB7Cj4gPiAgCXN0cnVjdCBlaWM3NzAwX3Fvc19wcml2ICpkd2MgPSBwcml2Owo+
ID4gKwlpbnQgcmV0Owo+ID4gKwo+ID4gKwlyZXQgPSBlaWM3NzAwX2Nsa3NfY29uZmlnKGR3Yywg
dHJ1ZSk7Cj4gPiArCWlmIChyZXQpCj4gPiArCQlyZXR1cm4gcmV0Owo+ID4gKwo+ID4gKwlyZXQg
PSByZWdtYXBfc2V0X2JpdHMoZHdjLT5laWM3NzAwX2hzcF9yZWdtYXAsCj4gPiArCQkJICAgICAg
ZHdjLT5ldGhfcGh5X2N0cmxfb2Zmc2V0LAo+ID4gKwkJCSAgICAgIEVJQzc3MDBfRVRIX1RYX0NM
S19TRUwgfAo+ID4gKwkJCSAgICAgIEVJQzc3MDBfRVRIX1BIWV9JTlRGX1NFTEkpOwo+ID4gKwlp
ZiAocmV0KQo+ID4gKwkJcmV0dXJuIHJldDsKPiAKPiBEb2VzIHRoaXMgY29kZSBsZWFrIHRoZSBl
bmFibGVkIGNsb2Nrcz8gVGhlIGZ1bmN0aW9uIGNhbGxzCj4gZWljNzcwMF9jbGtzX2NvbmZpZyhk
d2MsIHRydWUpIHRvIGVuYWJsZSB0aGUgY2xvY2tzLCB0aGVuIGxhdGVyIGNhbGxzCj4gcmVnbWFw
X3NldF9iaXRzKCkuIElmIHJlZ21hcF9zZXRfYml0cygpIGZhaWxzLCB0aGUgZnVuY3Rpb24gcmV0
dXJucwo+IHdpdGhvdXQgZGlzYWJsaW5nIHRoZSBjbG9ja3MuCj4gCj4gTG9va2luZyBhdCB0aGUg
Y2FsbGVyIGluIHN0bW1hY19tYWluLmM6c3RtbWFjX2R2cl9wcm9iZSgpOgo+IAo+ICAgICBpZiAo
cHJpdi0+cGxhdC0+aW5pdCkgewo+ICAgICAgICAgcmV0ID0gcHJpdi0+cGxhdC0+aW5pdChwcml2
LT5kZXZpY2UsIHByaXYtPnBsYXQtPmJzcF9wcml2KTsKPiAgICAgICAgIGlmIChyZXQpCj4gICAg
ICAgICAgICAgcmV0dXJuIHJldDsKPiAgICAgfQo+IAo+ICAgICByZXQgPSBfX3N0bW1hY19kdnJf
cHJvYmUocHJpdi0+ZGV2aWNlLCBwcml2LT5wbGF0LCAmcmVzKTsKPiAgICAgaWYgKHJldCkKPiAg
ICAgICAgIGdvdG8gZXJyb3JfZXhpdF9pbml0Owo+IAo+IFRoZSBleGl0IGhhbmRsZXIgaXMgb25s
eSBjYWxsZWQgd2hlbiBfX3N0bW1hY19kdnJfcHJvYmUoKSBmYWlscywgbm90Cj4gd2hlbiBpbml0
KCkgZmFpbHMuIFRoaXMgbGVhdmVzIHRoZSBidWxrIGNsb2NrcyBpbiB0aGUgcHJlcGFyZWQtYW5k
LWVuYWJsZWQKPiBzdGF0ZSBvbiB0aGlzIGVycm9yIHBhdGguCj4gClRoYW5rcyBmb3IgdGhlIHJl
dmlldyBhbmQgZm9yIGNhdGNoaW5nIHRoaXMuCgpZb3UncmUgcmlnaHQsIHRoZSBlcnJvciBwYXRo
IGluIGVpYzc3MDBfZHdtYWNfaW5pdCgpIHdvdWxkIGxlYWsgdGhlIGVuYWJsZWQKY2xvY2tzIGlm
IHJlZ21hcF9zZXRfYml0cygpIGZhaWxzLiBUaGlzIHdhcyBhbiBvdmVyc2lnaHQgZHVyaW5nIG15
IG93biByZXZpZXcuCgpJJ2xsIGZpeCB0aGUgZXJyb3IgaGFuZGxpbmcgYW5kIGluY2x1ZGUgdGhl
IHVwZGF0ZSBpbiB0aGUgbmV4dCB2ZXJzaW9uICh2NSkKb2YgdGhlIHBhdGNoIHNlcmllcy4KClRo
YW5rcyBhZ2Fpbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
