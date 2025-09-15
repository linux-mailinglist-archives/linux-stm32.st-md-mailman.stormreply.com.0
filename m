Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC3DB5753B
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Sep 2025 11:50:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2CBFC3F958;
	Mon, 15 Sep 2025 09:50:41 +0000 (UTC)
Received: from zg8tmty1ljiyny4xntuumtyw.icoremail.net
 (zg8tmty1ljiyny4xntuumtyw.icoremail.net [165.227.155.160])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3699CC3F957
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Sep 2025 09:50:40 +0000 (UTC)
Received: from weishangjuan$eswincomputing.com ( [10.12.96.155] ) by
 ajax-webmail-app2 (Coremail) ; Mon, 15 Sep 2025 17:50:01 +0800 (GMT+08:00)
X-Originating-IP: [10.12.96.155]
Date: Mon, 15 Sep 2025 17:50:01 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?6Z+m5bCa5aif?= <weishangjuan@eswincomputing.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <50496bf2-1d10-4d89-addb-f4fe774497d9@kernel.org>
References: <20250912055352.2832-1-weishangjuan@eswincomputing.com>
 <20250912055612.2884-1-weishangjuan@eswincomputing.com>
 <50496bf2-1d10-4d89-addb-f4fe774497d9@kernel.org>
MIME-Version: 1.0
Message-ID: <45afe6bc.1302.1994cc80846.Coremail.weishangjuan@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TQJkCgA31pRJ4cdoWlTRAA--.24971W
X-CM-SenderInfo: pzhl2xxdqjy31dq6v25zlqu0xpsx3x1qjou0bp/1tbiAQEGEGjG7f gnDAACsE
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Cc: vladimir.oltean@nxp.com, 0x1207@gmail.com, edumazet@google.com,
 jszhang@kernel.org, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 ningyu@eswincomputing.com, faizal.abdul.rahim@linux.intel.com,
 lizhi2@eswincomputing.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 jan.petrous@oss.nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, inochiama@gmail.com, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, p.zabel@pengutronix.de,
 netdev@vger.kernel.org, krzk+dt@kernel.org, emil.renner.berthing@canonical.com,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v6 1/2] dt-bindings: ethernet: eswin:
 Document for EIC7700 SoC
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

RGVhciBLcnp5c3p0b2YgS296bG93c2tpLAoKSSBhbSB3cml0aW5nIHRvIHNpbmNlcmVseSBhcG9s
b2dpemUgZm9yIG9taXR0aW5nIHlvdXIgIlJldmlld2VkLWJ5IiB0YWcKaW4gdGhlIHY2IHBhdGNo
IHNlcmllcyB3aXRob3V0IHByb3ZpZGluZyBhbiBleHBsYW5hdGlvbi4gVGhpcyB3YXMgYW4gb3Zl
cnNpZ2h0Cm9uIG15IHBhcnQsIGFuZCBJIHRydWx5IHJlZ3JldCBhbnkgaW5jb252ZW5pZW5jZSBv
ciBmcnVzdHJhdGlvbiBpdCBoYXMgY2F1c2VkLgoKVGhlIHJlYXNvbiB3aHkgSSBkaWRuJ3QgYWRk
IHRhZ3MgaXMgdGhhdCBJIG1hZGUgbW9kaWZpY2F0aW9ucyB0byB0aGUgZGVzY3JpcHRpb24KaW4g
dGhlIFlBTUwgZmlsZS4gRHVlIHRvIHRoZXNlIGNoYW5nZXMgdGhhdCBhbHRlciB0aGUgY29udGVu
dCB5b3UgaGF2ZSBwcmV2aW91c2x5CnZpZXdlZCwgSSBiZWxpZXZlIHRoZXNlIG1vZGlmaWNhdGlv
bnMgbWF5IHJlcXVpcmUgYSByZSBleGFtaW5hdGlvbiBhbmQgdGhlcmVmb3JlCnNob3VsZCBub3Qg
YmUgcmV0YWluZWQgd2l0aG91dCB5b3VyIGNvbmZpcm1hdGlvbi4KCkkgdW5kZXJzdGFuZCB0aGF0
IHdoZW4gc3VibWl0dGluZyB0aGUgcGF0Y2gsIEkgc2hvdWxkIGNsZWFybHkgc3RhdGUgdGhlIHJl
YXNvbi4KSSBoYXZlIGNhcmVmdWxseSByZWFkIHRoZSBzdWJtaXNzaW9uIGd1aWRlbGluZXMgYW5k
IHdpbGwgZW5zdXJlIGZ1bGwgY29tcGxpYW5jZQp3aXRoIHRoZSBwcm9jZXNzIGluIGFsbCBmdXR1
cmUgY29udHJpYnV0aW9ucywgaW5jbHVkaW5nIHByb3BlciB1c2Ugb2YgYjQgYW5kIGNsZWFyCmNv
bW11bmljYXRpb24gb2YgY2hhbmdlcy4KClRoYW5rIHlvdSBmb3IgeW91ciBwYXRpZW5jZSBhbmQg
Z3VpZGFuY2UuCgpCZXN0IHJlZ2FyZHMsClNoYW5nanVhbiBXZWkKCgo+IC0tLS0t5Y6f5aeL6YKu
5Lu2LS0tLS0KPiDlj5Hku7bkuro6ICJLcnp5c3p0b2YgS296bG93c2tpIiA8a3J6a0BrZXJuZWwu
b3JnPgo+IOWPkemAgeaXtumXtDoyMDI1LTA5LTEyIDIxOjE0OjI0ICjmmJ/mnJ/kupQpCj4g5pS2
5Lu25Lq6OiB3ZWlzaGFuZ2p1YW5AZXN3aW5jb21wdXRpbmcuY29tLCBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZywgYW5kcmV3K25ldGRldkBsdW5uLmNoLCBkYXZlbUBkYXZlbWxvZnQubmV0LCBl
ZHVtYXpldEBnb29nbGUuY29tLCBrdWJhQGtlcm5lbC5vcmcsIHBhYmVuaUByZWRoYXQuY29tLCBy
b2JoQGtlcm5lbC5vcmcsIGtyemsrZHRAa2VybmVsLm9yZywgY29ub3IrZHRAa2VybmVsLm9yZywg
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnLCBtY29xdWVsaW4uc3RtMzJAZ21h
aWwuY29tLCBhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tLCB5b25nLmxpYW5nLmNob29uZ0Bs
aW51eC5pbnRlbC5jb20sIHZsYWRpbWlyLm9sdGVhbkBueHAuY29tLCBybWsra2VybmVsQGFybWxp
bnV4Lm9yZy51aywgZmFpemFsLmFiZHVsLnJhaGltQGxpbnV4LmludGVsLmNvbSwgcHJhYmhha2Fy
Lm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tLCBpbm9jaGlhbWFAZ21haWwuY29tLCBqYW4u
cGV0cm91c0Bvc3MubnhwLmNvbSwganN6aGFuZ0BrZXJuZWwub3JnLCBwLnphYmVsQHBlbmd1dHJv
bml4LmRlLCBib29uLmtoYWkubmdAYWx0ZXJhLmNvbSwgMHgxMjA3QGdtYWlsLmNvbSwgbmV0ZGV2
QHZnZXIua2VybmVsLm9yZywgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZywgbGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbSwgZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fu
b25pY2FsLmNvbQo+IOaKhOmAgTogbmluZ3l1QGVzd2luY29tcHV0aW5nLmNvbSwgbGlubWluQGVz
d2luY29tcHV0aW5nLmNvbSwgbGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbSwgcGlua2VzaC52YWdo
ZWxhQGVpbmZvY2hpcHMuY29tCj4g5Li76aKYOiBSZTogW1BBVENIIHY2IDEvMl0gZHQtYmluZGlu
Z3M6IGV0aGVybmV0OiBlc3dpbjogRG9jdW1lbnQgZm9yIEVJQzc3MDAgU29DCj4gCj4gT24gMTIv
MDkvMjAyNSAwNzo1Niwgd2Vpc2hhbmdqdWFuQGVzd2luY29tcHV0aW5nLmNvbSB3cm90ZToKPiA+
IEZyb206IFNoYW5nanVhbiBXZWkgPHdlaXNoYW5nanVhbkBlc3dpbmNvbXB1dGluZy5jb20+Cj4g
PiAKPiA+IEFkZCBFU1dJTiBFSUM3NzAwIEV0aGVybmV0IGNvbnRyb2xsZXIsIHN1cHBvcnRpbmcg
Y2xvY2sKPiA+IGNvbmZpZ3VyYXRpb24sIGRlbGF5IGFkanVzdG1lbnQgYW5kIHNwZWVkIGFkYXB0
aXZlIGZ1bmN0aW9ucy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogWmhpIExpIDxsaXpoaTJAZXN3
aW5jb21wdXRpbmcuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogU2hhbmdqdWFuIFdlaSA8d2Vpc2hh
bmdqdWFuQGVzd2luY29tcHV0aW5nLmNvbT4KPiAKPiBUaGVyZSBpcyBubyBleHBsYW5hdGlvbiBv
ZiBkcm9wcGluZyB0aGUgdGFnLiBQbGVhc2UgcmVhZCBDQVJFRlVMTFkKPiBzdWJtaXR0aW5nIHBh
dGNoZXMuCj4gCj4gQ29tcGFyaW5nIGFsc28gZmFpbHM6Cj4gCj4gYjQgZGlmZiAnPDIwMjUwOTEy
MDU1MzUyLjI4MzItMS13ZWlzaGFuZ2p1YW5AZXN3aW5jb21wdXRpbmcuY29tPicKPiBVc2luZyBj
YWNoZWQgY29weSBvZiB0aGUgbG9va3VwCj4gLS0tCj4gQW5hbHl6aW5nIDU1IG1lc3NhZ2VzIGlu
IHRoZSB0aHJlYWQKPiBQcmVwYXJpbmcgZmFrZS1hbSBmb3IgdjY6IGR0LWJpbmRpbmdzOiBldGhl
cm5ldDogZXN3aW46IERvY3VtZW50IGZvcgo+IEVJQzc3MDAgU29DCj4gRVJST1I6IENvdWxkIG5v
dCBmYWtlLWFtIHZlcnNpb24gdjYKPiAtLS0KPiBDb3VsZCBub3QgY3JlYXRlIGZha2UtYW0gcmFu
Z2UgZm9yIHVwcGVyIHNlcmllcyB2Ngo+IAo+IEkgYW0gbm90IGdvaW5nIHRvIHJldmlldyB0d2lj
ZSwgc28geW91IGNhbiBkcm9wIG15IHRhZyBhZ2FpbiB3aXRob3V0Cj4gZXhwbGFuYXRpb24uCj4g
Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
