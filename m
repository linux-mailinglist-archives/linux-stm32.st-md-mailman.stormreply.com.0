Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0290B30C8A
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 05:26:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 347ECC3F95A;
	Fri, 22 Aug 2025 03:26:36 +0000 (UTC)
Received: from azure-sdnproxy.icoremail.net (l-sdnproxy.icoremail.net
 [20.188.111.126])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF00FC3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 03:26:33 +0000 (UTC)
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Fri, 22 Aug 2025 11:26:02 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Fri, 22 Aug 2025 11:26:02 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Andrew Lunn" <andrew@lunn.ch>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <548973df-2fa8-4502-9f7c-668d0eeb16c6@lunn.ch>
References: <c212c50e-52ae-4330-8e67-792e83ab29e4@lunn.ch>
 <7ccc507d.34b1.1980d6a26c0.Coremail.lizhi2@eswincomputing.com>
 <e734f2fd-b96f-4981-9f00-a94f3fd03213@lunn.ch>
 <6c5f12cd.37b0.1982ada38e5.Coremail.lizhi2@eswincomputing.com>
 <6b3c8130-77f0-4266-b1ed-2de80e0113b0@lunn.ch>
 <006c01dbfafb$3a99e0e0$afcda2a0$@eswincomputing.com>
 <28a48738-af05-41a4-be4c-5ca9ec2071d3@lunn.ch>
 <2b4deeba.3f61.1985fb2e8d4.Coremail.lizhi2@eswincomputing.com>
 <bad83fec-afca-4c41-bee4-e4e4f9ced57a@lunn.ch>
 <3261748c.629.198cfa3bc10.Coremail.lizhi2@eswincomputing.com>
 <548973df-2fa8-4502-9f7c-668d0eeb16c6@lunn.ch>
MIME-Version: 1.0
Message-ID: <1935a8ad.648.198cfcfdcb1.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgDH3g9L46do9c3BAA--.11720W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgECDGinSk8OdAABs8
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Cc: vladimir.oltean@nxp.com, edumazet@google.com, jszhang@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, ningyu@eswincomputing.com, 0x1207@gmail.com,
 kuba@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 jan.petrous@oss.nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 dfustini@tenstorrent.com, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com, inochiama@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v3 2/2] ethernet: eswin: Add eic7700
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

RGVhciBBbmRyZXcgTHVubiwKVGhhbmsgeW91IGZvciB5b3VyIHZhbHVhYmxlIGFuZCBwcm9mZXNz
aW9uYWwgc3VnZ2VzdGlvbnMuClBsZWFzZSBmaW5kIG91ciBleHBsYW5hdGlvbnMgZW1iZWRkZWQg
YmVsb3cgeW91ciBjb21tZW50cyBpbiB0aGUKb3JpZ2luYWwgZW1haWwuCgpCZXN0IHJlZ2FyZHMs
CgpMaSBaaGkKRXN3aW4gQ29tcHV0aW5nCgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R
5Lu25Lq6OiAiQW5kcmV3IEx1bm4iIDxhbmRyZXdAbHVubi5jaD4KPiDlj5HpgIHml7bpl7Q6MjAy
NS0wOC0yMiAxMToxNzozNyAo5pif5pyf5LqUKQo+IOaUtuS7tuS6ujog5p2O5b+XIDxsaXpoaTJA
ZXN3aW5jb21wdXRpbmcuY29tPgo+IOaKhOmAgTogd2Vpc2hhbmdqdWFuQGVzd2luY29tcHV0aW5n
LmNvbSwgYW5kcmV3K25ldGRldkBsdW5uLmNoLCBkYXZlbUBkYXZlbWxvZnQubmV0LCBlZHVtYXpl
dEBnb29nbGUuY29tLCBrdWJhQGtlcm5lbC5vcmcsIHJvYmhAa2VybmVsLm9yZywga3J6aytkdEBr
ZXJuZWwub3JnLCBjb25vcitkdEBrZXJuZWwub3JnLCBuZXRkZXZAdmdlci5rZXJuZWwub3JnLCBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZywgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZywg
bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbSwgYWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbSwg
cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWssIHlvbmcubGlhbmcuY2hvb25nQGxpbnV4LmludGVs
LmNvbSwgdmxhZGltaXIub2x0ZWFuQG54cC5jb20sIGpzemhhbmdAa2VybmVsLm9yZywgamFuLnBl
dHJvdXNAb3NzLm54cC5jb20sIHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNv
bSwgaW5vY2hpYW1hQGdtYWlsLmNvbSwgYm9vbi5raGFpLm5nQGFsdGVyYS5jb20sIGRmdXN0aW5p
QHRlbnN0b3JyZW50LmNvbSwgMHgxMjA3QGdtYWlsLmNvbSwgbGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbSwgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
LCBuaW5neXVAZXN3aW5jb21wdXRpbmcuY29tLCBsaW5taW5AZXN3aW5jb21wdXRpbmcuY29tLCBw
aW5rZXNoLnZhZ2hlbGFAZWluZm9jaGlwcy5jb20KPiDkuLvpopg6IFJlOiBSZTogUmU6IFJlOiBS
ZTogUmU6IFtQQVRDSCB2MyAyLzJdIGV0aGVybmV0OiBlc3dpbjogQWRkIGVpYzc3MDAgZXRoZXJu
ZXQgZHJpdmVyCj4gCj4gPiBXZSByZS10dW5lZCBhbmQgdmVyaWZpZWQgdGhhdCBzZXR0aW5nIHRo
ZSBUWEQgYW5kIFJYRCBkZWxheXMgdG8gMCBhbmQKPiA+IGNvbmZpZ3VyaW5nIFRYRU4gYW5kIFJY
RFYgdG8gMCB5aWVsZGVkIHRoZSBzYW1lIGhhcmR3YXJlIHBlcmZvcm1hbmNlIGFzCj4gPiBsb25n
IGFzIHdlIG9ubHkgYXBwbGllZCBkZWxheXMgKGUuZy4gMjAwcHMpIHRvIFRYQ0xLIGFuZCBSWENM
Sy4KPiAKPiBUaGlzIGlzIGluIGFkZGl0aW9uIHRvIHBoeS1tb2RlID0gJ3JnbWlpLWlkJz8KPiAK
Clllcywgb3VyIHJlLXR1bmluZyBhbmQgdmVyaWZpY2F0aW9uIHdlcmUgcGVyZm9ybWVkIHdpdGgg
cGh5LW1vZGUgc2V0IHRvCnJnbWlpLWlkLgoKPiA+IFRoZXJlZm9yZSwgaW4gdGhlIG5leHQgcGF0
Y2gsIHdlIHdpbGwgZHJvcCB0aGUgdmVuZG9yLXNwZWNpZmljIHByb3BlcnRpZXMKPiA+IChlLmcu
IGVzd2luLGRseS1wYXJhbS0qKSBhbmQga2VlcCBvbmx5IHRoZSBzdGFuZGFyZCBhdHRyaWJ1dGVz
LCBuYW1lbHkKPiA+IHJ4LWludGVybmFsLWRlbGF5LXBzIGFuZCB0eC1pbnRlcm5hbC1kZWxheS1w
cy4KPiA+IElzIHRoaXMgY29ycmVjdD8KPiAKPiBZZXMsIDIwMHBzIGlzIGEgc21hbGwgdHVuaW5n
IHZhbHVlLCB3aGVuIHRoZSBQSFkgYWRkcyB0aGUgMm5zLiBUaGlzIGlzCj4gTy5LLgo+IAo+IAlB
bmRyZXcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
