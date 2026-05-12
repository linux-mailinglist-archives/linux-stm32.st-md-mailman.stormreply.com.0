Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNpPAzS9AmrKwAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 07:40:04 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A9351A43F
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 07:40:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27D05C87EC1;
	Tue, 12 May 2026 05:40:03 +0000 (UTC)
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net
 [52.175.55.52])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2418CC08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 05:40:00 +0000 (UTC)
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Tue, 12 May 2026 13:39:12 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Tue, 12 May 2026 13:39:12 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Jakub Kicinski" <kuba@kernel.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <38d052b7.7a70.19dfb0d782b.Coremail.lizhi2@eswincomputing.com>
References: <20260427072353.1114-1-lizhi2@eswincomputing.com>
 <20260427072508.1151-1-lizhi2@eswincomputing.com>
 <20260428180625.738223cf@kernel.org>
 <2117464.7991.19ddd2125d1.Coremail.lizhi2@eswincomputing.com>
 <20260430163551.7491407a@kernel.org>
 <38d052b7.7a70.19dfb0d782b.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
Message-ID: <446f69bd.7fe4.19e1ab248fb.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID: TAJkCgBnCXMAvQJqub8YAA--.6986W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgEFDGoCBREW-AAAsc
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
X-Rspamd-Queue-Id: 95A9351A43F
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
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

CgoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2VzLS0tLS0KPiBGcm9tOiDmnY7lv5cgPGxpemhpMkBl
c3dpbmNvbXB1dGluZy5jb20+Cj4gU2VuZCB0aW1lOldlZG5lc2RheSwgMDYvMDUvMjAyNiAxMDox
MDo1Nwo+IFRvOiAiSmFrdWIgS2ljaW5za2kiIDxrdWJhQGtlcm5lbC5vcmc+Cj4gQ2M6IGFuZHJl
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
b3JnCj4gU3ViamVjdDogUmU6IFJlOiBbUEFUQ0ggbmV0LW5leHQgdjcgMi80XSBuZXQ6IHN0bW1h
YzogZWljNzcwMDogZW5hYmxlIGNsb2NrcyBiZWZvcmUgc3lzY29uIGFjY2VzcyBhbmQgY29ycmVj
dCBSWCBzYW1wbGluZyB0aW1pbmcKPiAKPiAKPiAKPiAKPiA+IC0tLS0t5Y6f5aeL6YKu5Lu2LS0t
LS0KPiA+IOWPkeS7tuS6ujogIkpha3ViIEtpY2luc2tpIiA8a3ViYUBrZXJuZWwub3JnPgo+ID4g
5Y+R6YCB5pe26Ze0OjIwMjYtMDUtMDEgMDc6MzU6NTEgKOaYn+acn+S6lCkKPiA+IOaUtuS7tuS6
ujog5p2O5b+XIDxsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tPgo+ID4g5oqE6YCBOiBhbmRyZXcr
bmV0ZGV2QGx1bm4uY2gsIGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnLCBkYXZlbUBkYXZlbWxv
ZnQubmV0LCBlZHVtYXpldEBnb29nbGUuY29tLCByb2JoQGtlcm5lbC5vcmcsIGtyemsrZHRAa2Vy
bmVsLm9yZywgY29ub3IrZHRAa2VybmVsLm9yZywgbmV0ZGV2QHZnZXIua2VybmVsLm9yZywgcGFi
ZW5pQHJlZGhhdC5jb20sIG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20sIGFsZXhhbmRyZS50b3Jn
dWVAZm9zcy5zdC5jb20sIHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrLCBwandAa2VybmVsLm9y
ZywgcGFsbWVyQGRhYmJlbHQuY29tLCBhb3VAZWVjcy5iZXJrZWxleS5lZHUsIGFsZXhAZ2hpdGku
ZnIsIGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcsIGxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20sIGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZywgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZywgbWF4aW1lLmNoZXZhbGxpZXJAYm9vdGxp
bi5jb20sIG5pbmd5dUBlc3dpbmNvbXB1dGluZy5jb20sIGxpbm1pbkBlc3dpbmNvbXB1dGluZy5j
b20sIHBpbmtlc2gudmFnaGVsYUBlaW5mb2NoaXBzLmNvbSwgcHJpdGVzaC5wYXRlbEBlaW5mb2No
aXBzLmNvbSwgd2Vpc2hhbmdqdWFuQGVzd2luY29tcHV0aW5nLmNvbSwgaG9ybXNAa2VybmVsLm9y
Zwo+ID4g5Li76aKYOiBSZTogW1BBVENIIG5ldC1uZXh0IHY3IDIvNF0gbmV0OiBzdG1tYWM6IGVp
Yzc3MDA6IGVuYWJsZSBjbG9ja3MgYmVmb3JlIHN5c2NvbiBhY2Nlc3MgYW5kIGNvcnJlY3QgUlgg
c2FtcGxpbmcgdGltaW5nCj4gPiAKPiA+IE9uIFRodSwgMzAgQXByIDIwMjYgMTQ6NDM6NTAgKzA4
MDAgKEdNVCswODowMCkg5p2O5b+XIHdyb3RlOgo+ID4gPiA+IFdoeSBGaXhlcz8gSWYgZXRoMSBu
ZXZlciB3b3JrZWQgdGhpcyBpcyBub3QgYSBmaXggYnV0IG5ldyBmdW5jdGlvbmFsaXR5Cj4gPiA+
ID4gSWYgeW91IHdhbnQgdG8gbWFrZSB0aGlzIGEgZml4IHRvIHByZXZlbnQgaW5jb21wYXRpYmls
aXR5IC0gY3V0IGl0IGRvd24KPiA+ID4gPiBqdXN0IHRvIHRoZSBldGgwIGNoYW5nZXMuCj4gPiA+
ID4gICAKPiA+ID4gVGhhbmsgeW91IGZvciB0aGUgc3VnZ2VzdGlvbi4KPiA+ID4gCj4gPiA+IFlv
dSdyZSByaWdodCB0aGF0IGV0aDEgbmV2ZXIgd29ya2VkIGF0IEdpZ2FiaXQgc3BlZWQsIHNvIHRo
aXMgc2hvdWxkCj4gPiA+IG5vdCBiZSB0cmVhdGVkIGFzIGEgZml4Lgo+ID4gPiAKPiA+ID4gSW4g
djgsIEkgd2lsbCBzcGxpdCB0aGUgY2hhbmdlcyBpbnRvIHR3byBwYXRjaGVzIHdpdGhpbiB0aGUg
c2FtZSBzZXJpZXM6Cj4gPiA+IC0gUGF0Y2ggMSB3aWxsIGNvbnRhaW4gb25seSB0aGUgZml4ZXMg
YWZmZWN0aW5nIHRoZSBleGlzdGluZyBldGgwCj4gPiA+IGZ1bmN0aW9uYWxpdHksIGFuZCB3aWxs
IGtlZXAgdGhlIEZpeGVzIHRhZy4KPiA+ID4gLSBQYXRjaCAyIHdpbGwgYWRkIHRoZSBldGgxIHN1
cHBvcnQgKFJYIGNsb2NrIGludmVyc2lvbiB3b3JrYXJvdW5kKQo+ID4gPiBhcyBuZXcgZnVuY3Rp
b25hbGl0eSwgd2l0aG91dCBhIEZpeGVzIHRhZy4KPiA+ID4gCj4gPiA+IFBsZWFzZSBsZXQgbWUg
a25vdyBpZiB5b3Ugd291bGQgcHJlZmVyIGEgZGlmZmVyZW50IHNwbGl0IG9yIG9yZGVyaW5nLgo+
ID4gCj4gPiBJZiB5b3Ugd2FudCB0byBjb25zaWRlciBzb21lIHBhcnQgb2YgdGhpcyBjb21taXQg
YSBmaXggaXQgaGFzIHRvIGJlCj4gPiBwb3N0ZWQgc2VwYXJhdGVseSB0byB0aGUgbmV0IHRyZWUg
KHJhdGhlciB0aGFuIG5ldC1uZXh0KS4KPiA+IE9uY2UgaXQncyBtZXJnZWQgYW5kIG1ha2VzIGl0
IHdheSBvdmVyIHRvIHRoZSBuZXQtbmV4dCB0cmVlIChlYWNoCj4gPiBUaHVyc2RheSkgeW91IGNh
biBwb3N0IHRoZSBuZXQtbmV4dCBjaG5hZ2VzIGZvciBldGgxCj4gCj4gVGhhbmtzLCB1bmRlcnN0
b29kLgo+IAo+IEkgd2lsbCBzcGxpdCB0aGUgY2hhbmdlcyBhY2NvcmRpbmdseToKPiAtIFNlbmQg
dGhlIGV0aDAgZml4ZXMgYXMgYSBuZXcgdjEgc2VyaWVzIHRhcmdldGluZyBuZXQuCj4gLSBTZW5k
IHRoZSBldGgxIGVuYWJsZW1lbnQgYXMgYSBuZXcgdjEgc2VyaWVzIHRhcmdldGluZyBuZXQtbmV4
dC4KPiAKPiBUaGFua3MgZm9yIHRoZSBndWlkYW5jZS4KCkhpIEpha3ViLAoKSnVzdCB0byBjb25m
aXJtIHRoZSB2ZXJzaW9uaW5nIGZvciB0aGUgZXRoMSBwYXJ0IGFmdGVyIHNwbGl0dGluZyB0aGUK
b3JpZ2luYWwgdjcvdjggc2VyaWVzOgoKRm9yIHRoZSBuZXQgZml4IHBhcnQsIEkgaGF2ZSBhbHJl
YWR5IHBvc3RlZCBpdCBhcyBhIG5ldyB2MSBzZXJpZXMKdGFyZ2V0aW5nIG5ldC4KCkZvciB0aGUg
ZXRoMSBlbmFibGVtZW50IHBhcnQsIG15IGN1cnJlbnQgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGl0
CnNob3VsZCBiZSB0cmVhdGVkIGFzIGEgbmV3IGluZGVwZW5kZW50IHYxIHNlcmllcyBmb3IgbmV0
LW5leHQsCnNpbmNlIHRoZSBzY29wZSBhbmQgdGFyZ2V0IHRyZWUgaGF2ZSBjaGFuZ2VkIGFmdGVy
IHRoZSBzcGxpdC4KCldvdWxkIHlvdSBwcmVmZXIgdGhpcyBldGgxIHNlcmllcyB0byBzdGFydCBh
cyB2MSwgb3Igc2hvdWxkIGl0CmNvbnRpbnVlIGFzIHY4IGZvciBjb250aW51aXR5IHdpdGggdGhl
IG9yaWdpbmFsIHNlcmllcz8KCkkgd2lsbCBmb2xsb3cgeW91ciBwcmVmZXJyZWQgYXBwcm9hY2gg
YmVmb3JlIHBvc3RpbmcgaXQuCgpUaGFua3MsClpoaQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
