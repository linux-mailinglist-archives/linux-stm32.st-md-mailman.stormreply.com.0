Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDeRCiR4/WnnegAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 07:44:04 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B58DC4F205F
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 07:44:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7FFAC03FCA;
	Fri,  8 May 2026 05:44:02 +0000 (UTC)
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net
 [207.46.229.174])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91EA8C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2026 05:44:01 +0000 (UTC)
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Fri, 8 May 2026 13:43:23 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Fri, 8 May 2026 13:43:23 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Conor Dooley" <conor@kernel.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260507-mural-moocher-ad6e07ef8ae0@spud>
References: <20260507083037.152-1-lizhi2@eswincomputing.com>
 <20260507083136.175-1-lizhi2@eswincomputing.com>
 <20260507-mural-moocher-ad6e07ef8ae0@spud>
MIME-Version: 1.0
Message-ID: <22d09a07.7cfd.19e061cacea.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgBnCXP8d_1ppNgXAA--.6687W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgEBDGn8vxER1gAAsy
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW3Jw
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
X-Rspamd-Queue-Id: B58DC4F205F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[eswincomputing.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:edumazet@google.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:pritesh.patel@einfochips.com,m:weishangjuan@eswincomputing.com,m:ningyu@eswincomputing.com,m:maxime.chevallier@bootlin.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:rmk+kernel@armlinux.org.uk,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,st-md-mailman.stormreply.com,kernel.org,einfochips.com,eswincomputing.com,bootlin.com,redhat.com,vger.kernel.org,armlinux.org.uk,lists.infradead.org,lunn.ch,gmail.com,davemloft.net];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.672];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiQ29ub3IgRG9vbGV5IiA8
Y29ub3JAa2VybmVsLm9yZz4KPiDlj5HpgIHml7bpl7Q6MjAyNi0wNS0wOCAwMToyNDowMiAo5pif
5pyf5LqUKQo+IOaUtuS7tuS6ujogbGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbQo+IOaKhOmAgTog
YW5kcmV3K25ldGRldkBsdW5uLmNoLCBkYXZlbUBkYXZlbWxvZnQubmV0LCBlZHVtYXpldEBnb29n
bGUuY29tLCBrdWJhQGtlcm5lbC5vcmcsIHBhYmVuaUByZWRoYXQuY29tLCByb2JoQGtlcm5lbC5v
cmcsIGtyemsrZHRAa2VybmVsLm9yZywgY29ub3IrZHRAa2VybmVsLm9yZywgbmV0ZGV2QHZnZXIu
a2VybmVsLm9yZywgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmcsIG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20sIGFsZXhhbmRyZS50b3JndWVA
Zm9zcy5zdC5jb20sIHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrLCBtYXhpbWUuY2hldmFsbGll
ckBib290bGluLmNvbSwgbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbSwg
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnLCBuaW5neXVAZXN3aW5jb21wdXRp
bmcuY29tLCBsaW5taW5AZXN3aW5jb21wdXRpbmcuY29tLCBwaW5rZXNoLnZhZ2hlbGFAZWluZm9j
aGlwcy5jb20sIHByaXRlc2gucGF0ZWxAZWluZm9jaGlwcy5jb20sIHdlaXNoYW5nanVhbkBlc3dp
bmNvbXB1dGluZy5jb20KPiDkuLvpopg6IFJlOiBbUEFUQ0ggbmV0IHYxIDEvMl0gZHQtYmluZGlu
Z3M6IGV0aGVybmV0OiBlc3dpbjogcmVmaW5lIGRlbGF5IG1vZGVsIGFuZCBIU1AgcmVnaXN0ZXIg
ZGVzY3JpcHRpb24KPiAKPiBPbiBUaHUsIE1heSAwNywgMjAyNiBhdCAwNDozMTozNlBNICswODAw
LCBsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tIHdyb3RlOgo+ID4gRnJvbTogWmhpIExpIDxsaXpo
aTJAZXN3aW5jb21wdXRpbmcuY29tPgo+ID4gCj4gPiBSZWZpbmUgdGhlIEVJQzc3MDAgRXRoZXJu
ZXQgZHQtYmluZGluZyBiYXNlZCBvbiBvYnNlcnZlZCBoYXJkd2FyZSBiZWhhdmlvcgo+ID4gYW5k
IGNsYXJpZnkgdGhlIG9yaWdpbmFsIGRlbGF5IG1vZGVsIGZvciBldGgwLgo+ID4gCj4gPiBUaGUg
cHJldmlvdXMgYmluZGluZyB1c2VkIGFuIGVudW0tYmFzZWQgZGVmaW5pdGlvbiBmb3IKPiA+IHJ4
LWludGVybmFsLWRlbGF5LXBzIGFuZCB0eC1pbnRlcm5hbC1kZWxheS1wcy4gUmVwbGFjZSBpdCB3
aXRoIGEKPiA+IHJhbmdlLWJhc2VkIG1vZGVsIHVzaW5nOgo+ID4gCj4gPiAgIC0gbWluaW11bTog
MAo+ID4gICAtIG1heGltdW06IDI1NDAKPiA+ICAgLSBtdWx0aXBsZU9mOiAyMAo+ID4gCj4gPiBU
aGlzIGJldHRlciByZWZsZWN0cyB0aGUgYWN0dWFsIGhhcmR3YXJlIGltcGxlbWVudGF0aW9uLCB3
aGljaAo+ID4gc3VwcG9ydHMgMjBwcyBncmFudWxhcml0eSBkZWxheSBzdGVwcyBpbiB0aGUgTUFD
IFJHTUlJIGludGVyZmFjZS4KPiA+IAo+ID4gVGhlIHR4L3J4IGludGVybmFsIGRlbGF5IHZhbHVl
cyBhcmUgY2xhcmlmaWVkIGFzIE1BQy1zaWRlIHByb2dyYW1tYWJsZQo+ID4gZGVsYXkgY29tcG9u
ZW50cyBhcHBsaWVkIG9uIHRoZSBSR01JSSBjbG9jay9kYXRhIHBhdGgsIHJlcHJlc2VudGluZwo+
ID4gdGhlIGVmZmVjdGl2ZSBkZWxheSBzZWVuIGF0IHRoZSBNQUMgaW50ZXJmYWNlLgo+ID4gCj4g
PiBUaGlzIGRvZXMgbm90IGNoYW5nZSB0aGUgaW50ZW5kZWQgaGFyZHdhcmUgc2VtYW50aWNzLCBi
dXQgYWxpZ25zIHRoZQo+ID4gYmluZGluZyB3aXRoIHRoZSBhY3R1YWwgaGFyZHdhcmUgaW1wbGVt
ZW50YXRpb24uCj4gPiAKPiA+IFRoZXNlIHByb3BlcnRpZXMgYXJlIG9wdGlvbmFsIGFuZCBvbmx5
IHJlcXVpcmVkIHdoZW4gTUFDLXNpZGUgZmluZQo+ID4gdHVuaW5nIGlzIG5lZWRlZDsgb3RoZXJ3
aXNlIGRlbGF5IGFsaWdubWVudCBpcyBwcm92aWRlZCBieSBQSFkgb3IKPiA+IGJvYXJkIGRlc2ln
bi4KPiA+IAo+ID4gRGVwZW5kaW5nIG9uIHRoZSBzZWxlY3RlZCBSR01JSSB0aW1pbmcgbW9kZSwg
ZGVsYXkgYWxpZ25tZW50IG1heSBiZQo+ID4gcHJvdmlkZWQgYnkgdGhlIFBIWSAoZS5nLiByZ21p
aS1pZCkgb3IgYnkgYm9hcmQvTUFDLXNpZGUgY29uZmlndXJhdGlvbi4KPiA+IFdoZW4gUEhZIG9y
IGJvYXJkIGRlc2lnbiBhbHJlYWR5IHByb3ZpZGVzIHRoZSByZXF1aXJlZCBkZWxheSwgdGhlc2UK
PiA+IE1BQy1zaWRlIHByb3BlcnRpZXMgbWF5IGJlIG9taXR0ZWQuIFdoZW4gTUFDLXNpZGUgZmlu
ZSB0dW5pbmcgaXMKPiA+IHJlcXVpcmVkLCB0aGV5IHNob3VsZCBiZSBwcm92aWRlZCB0byBkZXNj
cmliZSB0aGUgaW50ZXJuYWwgUkdNSUkKPiA+IHRpbWluZyBhZGp1c3RtZW50Lgo+ID4gCj4gPiBB
ZGRpdGlvbmFsbHksIGV4dGVuZCB0aGUgZGVzY3JpcHRpb24gb2YgdGhlIEhTUCBzdWJzeXN0ZW0g
cmVnaXN0ZXIKPiA+IGxheW91dCB1c2VkIGJ5IHRoZSBNQUMgZ2x1ZSBsb2dpYy4gVGhpcyBpbmNs
dWRlcyBleHBsaWNpdCBUWEQgYW5kIFJYRAo+ID4gZGVsYXkgY29udHJvbCByZWdpc3RlcnMgdG8g
ZW5zdXJlIGRldGVybWluaXN0aWMgaW5pdGlhbGl6YXRpb24gYW5kCj4gPiB0byBvdmVycmlkZSBh
bnkgcmVzaWR1YWwgY29uZmlndXJhdGlvbiBwb3RlbnRpYWxseSBsZWZ0IGJ5IGJvb3Rsb2FkZXJz
Lgo+ID4gCj4gPiBBZGQgcmVmZXJlbmNlIHRvIHRoZSBFSUM3NzAwWCBTb0MgVGVjaG5pY2FsIFJl
ZmVyZW5jZSBNYW51YWwsCj4gPiBDaGFwdGVyIDEwICgiSGlnaC1TcGVlZCBJbnRlcmZhY2UiKSwg
UGFydCA0IGZvciBiYWNrZ3JvdW5kIG9mIHRoZQo+ID4gSFNQIENTUiBibG9jazoKPiA+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9lc3dpbmNvbXB1dGluZy9FSUM3NzAwWC1Tb0MtVGVjaG5pY2FsLVJlZmVy
ZW5jZS1NYW51YWwvcmVsZWFzZXMKPiA+IAo+ID4gVGhlcmUgYXJlIG5vIGluLXRyZWUgdXNlcnMg
b2YgdGhpcyBiaW5kaW5nLCBzbyBubyBBQkkgaW1wYWN0IGlzCj4gPiBleHBlY3RlZC4KPiA+IAo+
ID4gRml4ZXM6IDg4OGJkMGVjYTkzYyAoImR0LWJpbmRpbmdzOiBldGhlcm5ldDogZXN3aW46IERv
Y3VtZW50IGZvciBFSUM3NzAwIFNvQyIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGkgTGkgPGxpemhp
MkBlc3dpbmNvbXB1dGluZy5jb20+Cj4gPiAtLS0KPiAKPiBXaGlsZSB0aGlzIGlzIHYxLCBpdCdz
IHJlYWxseSB2OCBhbmQgdGhlcmUgc2hvdWxkIHRoZXJlZm9yZSBiZSBhCj4gY2hhbmdlbG9nIHRo
YXQgZXhwbGFpbnMgd2hlcmUgbXkgYWNrIGFuZCB0aGUgbmV3IGNvbXBhdGlibGUgd2VudC4KPiAK
ClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCkJhc2VkIG9uIEpha3ViJ3MgZmVlZGJhY2sgb24gdGhl
IHByZXZpb3VzIHY3IHNlcmllcywgSSBwbGFuIHRvIHNwbGl0IHRoZQpjaGFuZ2VzIGludG8gdHdv
IHNlcGFyYXRlIHNlcmllczoKCi0gYSBzbWFsbGVyIGZpeCBzZXJpZXMgaW50ZW5kZWQgZm9yIG5l
dCwKLSBhbmQgYSBzZXBhcmF0ZSBldGgxIGZlYXR1cmUgc2VyaWVzIGludGVuZGVkIGZvciBuZXQt
bmV4dC4KCkFmdGVyIHRoZSBzcGxpdCwgdGhlIHNjb3BlIGFuZCB0YXJnZXQgdHJlZXMgb2YgdGhl
IHR3byBzZXJpZXMgd2lsbCBkaWZmZXIKZnJvbSB0aGUgb3JpZ2luYWwgY29tYmluZWQgc2VyaWVz
LCBzbyBJIHBsYW4gdG8gcmVzdGFydCB0aGUgcmV2aXNpb24KbnVtYmVyaW5nIGZyb20gdjEgZm9y
IGJvdGggc2VyaWVzLgoKVGhlIGFkZGl0aW9uYWwgY29tcGF0aWJsZSBzdHJpbmcgYW5kIHRoZSBl
dGgxLXNwZWNpZmljIERUIGJpbmRpbmcKZXh0ZW5zaW9ucyB3aWxsIGJlIG1vdmVkIGludG8gdGhl
IHNlcGFyYXRlIGZlYXR1cmUgc2VyaWVzLCBhbmQgSSB3aWxsCnJlZmxlY3QgdGhpcyBpbiB0aGUg
djIgY292ZXIgbGV0dGVyLgoKVGhlIERUIGJpbmRpbmcgY2hhbmdlcyBpbiB0aGlzIGZpeCBzZXJp
ZXMgdjEgYXJlIHNpbXBseSBleHRyYWN0ZWQgZnJvbSB0aGUKcHJldmlvdXMgdjcgc2VyaWVzIGFz
IHBhcnQgb2YgdGhlIHNwbGl0LgoKU2luY2UgdGhlIHNlcmllcyBoYXMgYmVlbiByZXN0cnVjdHVy
ZWQsIEkgd2lsbCBkcm9wIHRoZSBwcmV2aW91cwpBY2tlZC1ieSB0YWdzLgoKSSB3aWxsIGFsc28g
ZG9jdW1lbnQgdGhlIHJlYXNvbiBmb3IgZG9pbmcgc28gYW5kIHRoZSBpbXBhY3Qgb2YgdGhlIHNw
bGl0CmluIHRoZSB2MiBjb3ZlciBsZXR0ZXIuCgpJZiB5b3UgdGhpbmsgdGhlIGJpbmRpbmcgY2hh
bmdlcyBhcmUgc3RpbGwgZWZmZWN0aXZlbHkgdW5jaGFuZ2VkIGFuZCB0aGUKcHJldmlvdXMgQWNr
ZWQtYnkgY2FuIHN0aWxsIGFwcGx5LCBJIGFtIGhhcHB5IHRvIHJldGFpbiB0aGVtIG9yIHJlLWFw
cGx5CnRoZW0gYXMgYXBwcm9wcmlhdGUuIE90aGVyd2lzZSBJIHdpbGwgYXNzdW1lIGEgZnJlc2gg
cmV2aWV3IGlzIHByZWZlcnJlZC4KClBsZWFzZSBsZXQgbWUga25vdyB5b3VyIHByZWZlcmVuY2Uu
CgpUaGFua3MsClpoaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
