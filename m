Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCqgHsq3eWl8ygEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 08:16:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6870F9DA56
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 08:16:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F88BC87EDC;
	Wed, 28 Jan 2026 07:16:21 +0000 (UTC)
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net
 [13.75.44.102])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D29D2C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 05:49:21 +0000 (UTC)
Received: from linmin$eswincomputing.com ( [10.10.96.205] ) by
 ajax-webmail-app2 (Coremail) ; Wed, 28 Jan 2026 13:48:59 +0800 (GMT+08:00)
X-Originating-IP: [10.10.96.205]
Date: Wed, 28 Jan 2026 13:48:59 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Min Lin" <linmin@eswincomputing.com>
To: "Bo Gan" <ganboing@gmail.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <973f2b4b-bf8d-4a77-a27a-47495bc21ff8@gmail.com>
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
 <32a1f814.2c79.19bfe173225.Coremail.linmin@eswincomputing.com>
 <973f2b4b-bf8d-4a77-a27a-47495bc21ff8@gmail.com>
MIME-Version: 1.0
Message-ID: <5c835fe9.2d60.19c0325df03.Coremail.linmin@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID: TQJkCgBXoa1Lo3lphmAAAA--.141W
X-CM-SenderInfo: 5olqzx3q6h245lqf0zpsxwx03jof0z/1tbiAgEBCWl46QEQVgABs1
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-Mailman-Approved-At: Wed, 28 Jan 2026 07:16:18 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, edumazet@google.com,
 =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, ningyu@eswincomputing.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[eswincomputing.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:ganboing@gmail.com,m:andrew@lunn.ch,m:edumazet@google.com,m:lizhi2@eswincomputing.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:ningyu@eswincomputing.com,m:linux@armlinux.org.uk,m:krzk@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linmin@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,google.com,eswincomputing.com,st-md-mailman.stormreply.com,kernel.org,armlinux.org.uk,redhat.com,vger.kernel.org,lists.infradead.org,einfochips.com,gmail.com,davemloft.net];
	HAS_X_PRIO_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linmin@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	URIBL_MULTI_FAIL(0.00)[stm-ict-prod-mailman-01.stormreply.prv:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[einfochips.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,infradead.org:email,eswincomputing.com:mid,eswincomputing.com:email,stormreply.com:url,stormreply.com:email,nxp.com:url]
X-Rspamd-Queue-Id: 6870F9DA56
X-Rspamd-Action: no action

SGkgQm8gR2FuLAoKCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlcy0tLS0tCj4gRnJvbTogIkJvIEdh
biIgPGdhbmJvaW5nQGdtYWlsLmNvbT4KPiBTZW5kIHRpbWU6V2VkbmVzZGF5LCAyOC8wMS8yMDI2
IDEwOjM4OjI4Cj4gVG86ICJNaW4gTGluIiA8bGlubWluQGVzd2luY29tcHV0aW5nLmNvbT4sICJS
dXNzZWxsIEtpbmcgKE9yYWNsZSkiIDxsaW51eEBhcm1saW51eC5vcmcudWs+Cj4gQ2M6ICJBbmRy
ZXcgTHVubiIgPGFuZHJld0BsdW5uLmNoPiwgIktyenlzenRvZiBLb3psb3dza2kiIDxrcnprQGtl
cm5lbC5vcmc+LCDmnY7lv5cgPGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20+LCBkZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZywgYW5kcmV3K25ldGRldkBsdW5uLmNoLCBkYXZlbUBkYXZlbWxvZnQu
bmV0LCBlZHVtYXpldEBnb29nbGUuY29tLCBrdWJhQGtlcm5lbC5vcmcsIHJvYmhAa2VybmVsLm9y
Zywga3J6aytkdEBrZXJuZWwub3JnLCBjb25vcitkdEBrZXJuZWwub3JnLCBuZXRkZXZAdmdlci5r
ZXJuZWwub3JnLCBwYWJlbmlAcmVkaGF0LmNvbSwgbWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbSwg
YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbSwgbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbSwgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBuaW5neXVAZXN3aW5jb21wdXRpbmcuY29tLCBwaW5r
ZXNoLnZhZ2hlbGFAZWluZm9jaGlwcy5jb20sIHdlaXNoYW5nanVhbkBlc3dpbmNvbXB1dGluZy5j
b20KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxIDEvMl0gZHQtYmluZGluZ3M6IGV0aGVybmV0OiBl
c3dpbjogYWRkIGNsb2NrIHNhbXBsaW5nIGNvbnRyb2wKPiAKPiBIaSBNaW4sIFJ1c3NlbGwsIEty
enlzenRvZiwKPiAKPiBPbiAxLzI2LzI2IDIyOjE0LCBNaW4gTGluIHdyb3RlOgo+ID4gSGkgUnVz
c2VsbCwKPiA+IAo+ID4gCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlcy0tLS0tCj4gPj4gRnJv
bTogIlJ1c3NlbGwgS2luZyAoT3JhY2xlKSIgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4KPiA+PiBT
ZW5kIHRpbWU6VHVlc2RheSwgMjcvMDEvMjAyNiAwMjoyOTowOQo+ID4+IFRvOiAiTWluIExpbiIg
PGxpbm1pbkBlc3dpbmNvbXB1dGluZy5jb20+Cj4gPj4gQ2M6ICJCbyBHYW4iIDxnYW5ib2luZ0Bn
bWFpbC5jb20+LCAiQW5kcmV3IEx1bm4iIDxhbmRyZXdAbHVubi5jaD4sICJLcnp5c3p0b2YgS296
bG93c2tpIiA8a3J6a0BrZXJuZWwub3JnPiwg5p2O5b+XIDxsaXpoaTJAZXN3aW5jb21wdXRpbmcu
Y29tPiwgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGFuZHJldytuZXRkZXZAbHVubi5jaCwg
ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldCwgZWR1bWF6ZXRAZ29vZ2xlLmNvbSwga3ViYUBrZXJuZWwub3Jn
LCByb2JoQGtlcm5lbC5vcmcsIGtyemsrZHRAa2VybmVsLm9yZywgY29ub3IrZHRAa2VybmVsLm9y
ZywgbmV0ZGV2QHZnZXIua2VybmVsLm9yZywgcGFiZW5pQHJlZGhhdC5jb20sIG1jb3F1ZWxpbi5z
dG0zMkBnbWFpbC5jb20sIGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20sIGxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20sIGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZywgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZywgbmluZ3l1QGVzd2luY29t
cHV0aW5nLmNvbSwgcGlua2VzaC52YWdoZWxhQGVpbmZvY2hpcHMuY29tLCB3ZWlzaGFuZ2p1YW5A
ZXN3aW5jb21wdXRpbmcuY29tCj4gPj4gU3ViamVjdDogUmU6IFJlOiBbUEFUQ0ggdjEgMS8yXSBk
dC1iaW5kaW5nczogZXRoZXJuZXQ6IGVzd2luOiBhZGQgY2xvY2sgc2FtcGxpbmcgY29udHJvbAo+
ID4+Cj4gPj4gT24gTW9uLCBKYW4gMjYsIDIwMjYgYXQgMTE6MTA6MTJBTSArMDgwMCwgTWluIExp
biB3cm90ZToKPiA+Pj4gRHVlIHRvIGNoaXAgYmFja2VuZCByZWFzb25zLCB0aGVyZSBpcyBhbHJl
YWR5IGEgfjQtNW5zIHNrZXcgYmV0d2VlbiB0aGUgUlgKPiA+Pj4gY2xvY2sgYW5kIGRhdGEgb2Yg
dGhlIGV0aDEgTUFDIGNvbnRyb2xsZXIgaW5zaWRlIHRoZSBzaWxpY29uLgo+ID4+Cj4gPj4gTGV0
J3MgYW5hbHlzZSB0aGlzLgo+ID4+Cj4gPj4gCVRYQyAvIFJYQwlUWEMgLyBSWEMKPiA+PiBTcGVl
ZAlDbG9jayByYXRlCUNsb2NrIHBlcmlvZAo+ID4+IDFHCTEyNU1IegkJOG5zCj4gPj4gMTAwTQky
NU1IegkJNDBucwo+ID4+IDEwTQkyLjVNSHoJCTQwMG5zCj4gPj4KPiA+PiBUaGUgcmVxdWlyZWQg
c2tldyBmb3IgVFhDIGFuZCBSWEMgYXQgdGhlIHJlY2VpdmVyIGlzIHNwZWNpZmllZCB0byBiZQo+
ID4+IGJldHdlZW4gMSBhbmQgMi42bnMgaXJyZXNwZWN0aXZlIG9mIHRoZSBzcGVlZC4gVGhlIGVk
Z2Ugb2YgdGhlIGNsb2NrCj4gPj4gaXMgYWxzbyBpbXBvcnRhbnQ6IHRoZSByaXNpbmcgZWRnZSBp
bmRpY2F0ZXMgdGhlIGxvd2VyIDQgYml0cywgYW5kCj4gPj4gdGhlIGZhbGxpbmcgZWRnZSBpbmRp
Y2F0ZXMgdGhlIHVwcGVyIDQgYml0cy4KPiA+Pgo+ID4+IEF0IDFHIHNwZWVkLCB3aXRoIGEgIjQg
dG8gNW5zIiBza2V3IGluIHRoZSBjaGlwLiBJZiB0aGlzIGlzIGFjY3VyYXRlLAo+ID4+IHRoZW4g
aW52ZXJ0aW5nIHRoZSBjbG9jayBhbmQgYWRkaW5nIDFucyBvZiBhZGRpdGlvbmFsIHNrZXcgYnkg
c29tZQo+ID4+IG1lYW5zIChQQ0IgdHJhY2UsIG9yIGF0IHRoZSBNQUMgb3IgUEhZKSB3aWxsIGdp
dmUgdGhlIHJlcXVpcmVkIGNsb2NrCj4gPj4gYXQgdGhlIHJlY2VpdmVyLgo+ID4+Cj4gPiAKPiA+
IFllcywgdGhhdCdzIGV4YWN0bHkgdGhlIGNhc2UuCj4gPiAKPiA+PiBUaGUgdGltaW5nIHRhYmxl
IGluIHRoZSBSR01JSSBzdGFuZGFyZCAoMy4zKSBhbGxvd3MgZm9yIFRjeWMgKHRoZQo+ID4+IGNs
b2NrIHJhdGUpIHRvIGJlIHNjYWxlZCwgYnV0IHRoZXJlIGlzIG5vIGFsbG93YW5jZSBmb3Igc2Nh
bGluZwo+ID4+IFRza2V3UiAodGhlIHJlcXVpcmVkIDEgdG8gMi42bnMgc2tldy4pIFRoaXMgc2tl
dyBwYXJhbWV0ZXIgaXMKPiA+PiBmaXhlZC4KPiA+Pgo+ID4+IFNvLCBhdCB0aGUgb3RoZXIgc3Bl
ZWRzLCB5b3UgYXJlIGNvbXBsZXRlbHkgdW5hYmxlIHRvIG1lZXQgdGhlIHRpbWluZwo+ID4+IHNw
ZWNpZmljYXRpb24sIHdoZXRoZXIgaXJyZXNwZWN0aXZlIG9mIHRoZSBjbG9jayBpbnZlcnNpb24u
IEluIGVmZmVjdCwKPiA+PiB0aGUgb25seSBzcGVlZCB0aGF0IHlvdSBjYW4gbWVldCB0aGUgc3Bl
Y2lmaWNhdGlvbiBpcyAxRy4KPiA+Pgo+ID4gCj4gPiBUaGUgdGltaW5nIHRhYmxlIGluIHRoZSBS
R01JSSBzdGFuZGFyZCgzLjMpIHNheXMgdGhlIG1heCB2YWx1ZSBvZiBUc2tldwo+ID4gZm9yIDEw
LzEwMCBpcyB1bnNwZWNpZmllZC4KPiA+IFF1b3RhdGlvbjoibm90ZTE6IC4uLixGb3IgMTAvMTAw
IHRoZSBNYXggdmFsdWUgaXMgdW5zcGVjaWZpZWQuIgo+ID4gCj4gPiBJIHRoaW5rIGZvciAxMC8x
MDAsIHRoZSAiNCB0byA1bnMiIHNrZXcgaW4gdGhlIGNoaXAgZG9lc24ndCBicmVhayB0aGUKPiA+
IHN0YW5kYXJkLiBBdCAxMC8xMDAgc3BlZWRzLCBpdCBtZWV0cyB0aGUgdGltaW5nIHNwZWNpZmlj
YXRpb24gd2l0aG91dAo+ID4gaGF2aW5nIHRvIHRvIGFkZCBjbG9jayBpbnZlcnNpb24uCj4gPiBJ
biBwcmFjdGljZSwgaXQgd29ya3MgYXQgMTAvMTAwIHNwZWVkcyBpbiB0aGUgcmdtaWktaWQgcGh5
IG1vZGUuCj4gPiAKPiA+PiBUaHVzLCBJIHRoaW5rIHRoaXMgaXMgc29tZXRoaW5nIHRoYXQgbmVl
ZHMgYSBsb3QgbW9yZSB0aGFuIGp1c3QgImRvCj4gPj4gd2UgbmVlZCB0byBpbnZlcnQgdGhlIGNs
b2NrIi4gWW91IGFsc28gbmVlZCB0byBwcmV2ZW50IDEwTSBhbmQgMTAwTQo+ID4+IGJlaW5nIHN1
cHBvcnRlZCBJTUhPLgo+ID4+Cgo+IAo+IEkgaGFkIGFuIG9mZmxpbmUgZGlzY3Vzc2lvbiB3aXRo
IFlhbyBaaSBhbmQgb3RoZXJzIHJlZ2FyZGluZyB0aGlzLiBXZSBmZWVsCj4gbGlrZSB0aGUgcHJv
cGVyIHdheSBmb3IgRVNXSU4gdG8gZGVhbCB3aXRoIHRoaXMgYnJva2VuIGV0aDEgaXMgdG8gaGF2
ZSBhCj4gZGlmZmVyZW50IGNvbXBhdGlibGUgc3RyaW5nIGp1c3QgZm9yIGV0aDEsIHdoZXJlIGl0
IGNhbiBiZSBhc3NvY2lhdGVkIHdpdGgKPiBwbGF0Zm9ybSBkYXRhIHdpdGggcXVpcmtzIHRvIGRv
IGVzd2luLHJ4LWNsay1pbnZlcnQgYXQgMUcuIFRoZSBwcm9wZXJ0eSBpcwo+IHRoZXJlZm9yZSBu
b3QgcmVxdWlyZWQgdG8gYmUgZXhwb3NlZCBpbiBEVC4gKFByZXRlbmQgaXQgY29uZm9ybXMgdG8g
c3BlYwo+IGZvciAxRykuIE5lZWQgY29uZmlybWF0aW9uIGZvciAxME0vMTAwTSwgdGhvdWdoLiBJ
IGRvdWJsZSBjaGVja2VkIExpbiBNaW4ncwo+IGNsYWltLCBhbmQgaW5kZWVkIHRoZSBzcGVjIHNh
eXMgIkZvciAxMC8xMDAgdGhlIE1heCB2YWx1ZSBpcyB1bnNwZWNpZmllZCI6Cj4gaHR0cHM6Ly9j
b21tdW5pdHkubnhwLmNvbS9wd214eTg3NjU0L2F0dGFjaG1lbnRzL3B3bXh5ODc2NTQvaW14LXBy
b2Nlc3NvcnMvMjA2NTUvMS9SR01JSXYyXzBfZmluYWxfaHAucGRmCj4gCj4gVGhvdWdodHM/CgpJ
IGFncmVlIHdpdGggeW91ciBhcHByb2FjaC4KClJlZ2FyZHMsCkxpbiBNaW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
