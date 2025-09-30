Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C94BAC64B
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Sep 2025 12:02:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 730DDC424C3;
	Tue, 30 Sep 2025 10:02:18 +0000 (UTC)
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net
 (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0172C36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 10:02:16 +0000 (UTC)
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Tue, 30 Sep 2025 18:01:32 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Tue, 30 Sep 2025 18:01:32 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <aNJjshm4Z8H2Z8_V@shell.armlinux.org.uk>
References: <20250918085612.3176-1-weishangjuan@eswincomputing.com>
 <20250918090026.3280-1-weishangjuan@eswincomputing.com>
 <aMw-dgNiXgPeqeSz@shell.armlinux.org.uk>
 <30080c70.16e1.199748921d3.Coremail.weishangjuan@eswincomputing.com>
 <aNJjshm4Z8H2Z8_V@shell.armlinux.org.uk>
MIME-Version: 1.0
Message-ID: <7a5436bb.2377.1999a11f6b3.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgAHLBJ9qttoIeXuAA--.18724W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgEBDGjatNUciwABsL
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Cc: vladimir.oltean@nxp.com, edumazet@google.com, anthony.l.nguyen@intel.com,
 jszhang@kernel.org, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 =?UTF-8?B?6Z+m5bCa5aif?= <weishangjuan@eswincomputing.com>,
 ningyu@eswincomputing.com, 0x1207@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 jan.petrous@oss.nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 yong.liang.choong@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com, inochiama@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v7 2/2] ethernet: eswin: Add eic7700
 ethernet driver
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

SGkgUnVzc2VsbCBLaW5nLAoKVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb25zLiB3ZeKAmXZlIGRv
bmUgc29tZSB0cmlhbHMgYW5kIGludmVzdGlnYXRpb25zLApidXQgd2XigJlkIGxpa2UgdG8gY2xh
cmlmeSBhIGZldyBwb2ludHM6CgpNb3ZpbmcgZWljNzcwMF9jbGtzX2NvbmZpZygpIGludG8gcGxh
dF9kYXQtPmluaXQgYW5kIHBsYXRfZGF0LT5leGl0IGRvZXMKYWxsb3cgdXMgdG8gZHJvcCBlaWM3
NzAwX2R3bWFjX3JlbW92ZSgpIGFuZCB1c2UgZGV2bV9zdG1tYWNfcGx0Zm1fcHJvYmUoKQp0byBz
aW1wbGlmeSB0aGUgY29kZS4KCkhvd2V2ZXIsIHdlIGRvbuKAmXQgd2FudCBjbGtzX2NvbmZpZygp
IHRvIGJlIGludm9rZWQgYWdhaW4gZHVyaW5nCnN0bW1hY19wbHRmbV9yZXN1bWUoKSBhbmQgc3Rt
bWFjX3BsdGZtX3N1c3BlbmQoKS4gRm9sbG93aW5nIHlvdXIKc3VnZ2VzdGlvbiwgdGhpcyBtZWFu
cyB3ZSB3b3VsZCBuZWVkIHRvIHByb3ZpZGUgZW1wdHkgcGxhdF9kYXQtPnN1c3BlbmQoKQphbmQg
cGxhdF9kYXQtPnJlc3VtZSgpIG1ldGhvZHMuCgpDb3VsZCB5b3UgY29uZmlybSB3aGV0aGVyIHlv
deKAmXJlIHBsYW5uaW5nIHRvIGFkZCB0aGUgc3VzcGVuZCBhbmQgcmVzdW1lCmhvb2tzIGludG8g
dGhlIHBsYXRfc3RtbWFjZW5ldF9kYXRhIHN0cnVjdHVyZT8KQWxzbywgcmVnYXJkaW5nIHRoZSBj
bGVhbnVwcyB5b3UgbWVudGlvbmVkIGZvciBvdGhlciBzdG1tYWMgZ2x1ZSBkcml2ZXJzLApkbyB5
b3UgaGF2ZSBzb21lIGxpbmtzIG9yIHJlZmVyZW5jZSBjb21taXRzIHNvIHdlIGNhbiByZXZpZXcg
dGhlIGFwcHJvYWNoCnlvdSB0b29rPwoKVGhhbmtzIQoKQmVzdCByZWdhcmRzLApMaSBaaGkKCj4g
LS0tLS3ljp/lp4vpgq7ku7YtLS0tLQo+IOWPkeS7tuS6ujogIlJ1c3NlbGwgS2luZyAoT3JhY2xl
KSIgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4KPiDlj5HpgIHml7bpl7Q6MjAyNS0wOS0yMyAxNzow
OTowNiAo5pif5pyf5LqMKQo+IOaUtuS7tuS6ujog6Z+m5bCa5aifIDx3ZWlzaGFuZ2p1YW5AZXN3
aW5jb21wdXRpbmcuY29tPgo+IOaKhOmAgTogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGFu
ZHJldytuZXRkZXZAbHVubi5jaCwgZGF2ZW1AZGF2ZW1sb2Z0Lm5ldCwgZWR1bWF6ZXRAZ29vZ2xl
LmNvbSwga3ViYUBrZXJuZWwub3JnLCByb2JoQGtlcm5lbC5vcmcsIGtyemsrZHRAa2VybmVsLm9y
ZywgY29ub3IrZHRAa2VybmVsLm9yZywgbmV0ZGV2QHZnZXIua2VybmVsLm9yZywgcGFiZW5pQHJl
ZGhhdC5jb20sIG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20sIGFsZXhhbmRyZS50b3JndWVAZm9z
cy5zdC5jb20sIHZsYWRpbWlyLm9sdGVhbkBueHAuY29tLCB5b25nLmxpYW5nLmNob29uZ0BsaW51
eC5pbnRlbC5jb20sIGFudGhvbnkubC5uZ3V5ZW5AaW50ZWwuY29tLCBwcmFiaGFrYXIubWFoYWRl
di1sYWQucmpAYnAucmVuZXNhcy5jb20sIGphbi5wZXRyb3VzQG9zcy5ueHAuY29tLCBqc3poYW5n
QGtlcm5lbC5vcmcsIGlub2NoaWFtYUBnbWFpbC5jb20sIDB4MTIwN0BnbWFpbC5jb20sIGJvb24u
a2hhaS5uZ0BhbHRlcmEuY29tLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBsaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tLCBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcsIG5pbmd5dUBlc3dpbmNvbXB1dGluZy5jb20sIGxpbm1pbkBlc3dpbmNv
bXB1dGluZy5jb20sIGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20sIHBpbmtlc2gudmFnaGVsYUBl
aW5mb2NoaXBzLmNvbQo+IOS4u+mimDogUmU6IFJlOiBbUEFUQ0ggdjcgMi8yXSBldGhlcm5ldDog
ZXN3aW46IEFkZCBlaWM3NzAwIGV0aGVybmV0IGRyaXZlcgo+IAo+IE9uIFR1ZSwgU2VwIDIzLCAy
MDI1IGF0IDExOjA2OjA4QU0gKzA4MDAsIOmfpuWwmuWonyB3cm90ZToKPiA+IEluIHRoZSBjdXJy
ZW50IGVpYzc3MDBfZHdtYWMgZ2x1ZSBkcml2ZXIsIHRoZSByZWdtYXBfcmVhZCgpL3dyaXRlKCkK
PiA+IG9wZXJhdGlvbnMoZm9yIHBoeV9jdHJsMSwgYXhpX2xwX2N0cmwxLCBhbmQgdGhlIFJYL1RY
IGRlbGF5IHJlZ2lzdGVycykpYXJlwqAKPiA+IHBlcmZvcm1lZCBkaXJlY3RseSBpbiB0aGUgcHJv
YmUoKSBmdW5jdGlvbi4gV291bGQgaXQgYmUgY2xlYW5lciB0byBtb3ZlIHRoZXNlCj4gPiByZWdp
c3RlciBjb25maWd1cmF0aW9ucyBpbnRvIHRoZSBpbml0KCkgY2FsbGJhY2sgaW5zdGVhZCwgc28g
dGhhdCB0aGV5IGFyZQo+ID4gYWxzbyByZWFwcGxpZWQgZHVyaW5nIHJlc3VtZSgpPwo+IAo+IFRo
aXMgaXMgYSBxdWVzdGlvbiBJIGNhbid0IGFuc3dlciBkZWZpbml0aXZlbHkgYXMgSSBkb24ndCBr
bm93IHdoYXQKPiBoYXBwZW5zIGR1cmluZyBhIHN1c3BlbmQgb24geW91ciBoYXJkd2FyZSwgYW5k
IHRodXMgd2hpY2ggcmVnaXN0ZXJzCj4gYXJlIGxvc3QgLyByZXNldCBieSB0aGUgdGltZSB0aGUg
c3lzdGVtIHJlc3VtZXMuIFNvIEkgY2FuIG9ubHkgZ2l2ZQo+IHRoZSBvYnZpb3VzIGd1aWRhbmNl
Lgo+IAo+IElmIHRoZSBzZXR0aW5ncyBpbiB0aGUgZGVsYXkgcmVnaXN0ZXJzIGFyZSBsb3N0IG92
ZXIgYSBzdXNwZW5kL3Jlc3VtZQo+IHRoZW4gdGhleSBuZWVkIHRvIGJlIHJlLWluaXRpYWxpc2Vk
IGFmdGVyIHJlc3VtZS4KPiAKPiAtLSAKPiBSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3
LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KPiBGVFRQIGlzIGhlcmUhIDgwTWJw
cyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
