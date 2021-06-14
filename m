Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D50363A6B18
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Jun 2021 17:58:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7537EC597B0;
	Mon, 14 Jun 2021 15:58:06 +0000 (UTC)
Received: from out28-171.mail.aliyun.com (out28-171.mail.aliyun.com
 [115.124.28.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 163A9C58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jun 2021 15:58:03 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08197881|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0568616-0.00167767-0.941461;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=zhouyanjie@wanyeetech.com;
 NM=1; PH=DS; RN=21; RT=21; SR=0; TI=SMTPD_---.KS9PVcH_1623686276; 
Received: from zhouyanjie-virtual-machine(mailfrom:zhouyanjie@wanyeetech.com
 fp:SMTPD_---.KS9PVcH_1623686276)
 by smtp.aliyun-inc.com(10.147.41.137);
 Mon, 14 Jun 2021 23:57:57 +0800
Date: Mon, 14 Jun 2021 23:57:55 +0800
From: =?UTF-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20210614235755.6c1bd34e@zhouyanjie-virtual-machine>
In-Reply-To: <YMYy6JMSHm1Cqdt2@lunn.ch>
References: <1623260110-25842-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623260110-25842-3-git-send-email-zhouyanjie@wanyeetech.com>
 <YMGEutCet7fP1NZ9@lunn.ch>
 <405696cb-5987-0e56-87f8-5a1443eadc19@wanyeetech.com>
 <YMICTvjyEAgPMH9u@lunn.ch>
 <346f64d9-6949-b506-258f-4cfa7eb22784@wanyeetech.com>
 <12f35415-532e-5514-bc97-683fb9655091@wanyeetech.com>
 <YMIoWS57Ra19E1qT@lunn.ch>
 <20210613163452.1f01d418@zhouyanjie-virtual-machine>
 <YMYy6JMSHm1Cqdt2@lunn.ch>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: joabreu@synopsys.com, jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
 devicetree@vger.kernel.org, rick.tyliu@ingenic.com,
 linux-kernel@vger.kernel.org, sihui.liu@ingenic.com,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 linux-mips@vger.kernel.org, paul@crapouillou.net, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, kuba@kernel.org,
 netdev@vger.kernel.org, dongsheng.qiu@ingenic.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, aric.pzqi@ingenic.com
Subject: Re: [Linux-stm32] [PATCH v2 2/2] net: stmmac: Add Ingenic SoCs MAC
	support.
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

SGkgQW5kcmV3LAoK5LqOIFN1biwgMTMgSnVuIDIwMjEgMTg6MzE6MzYgKzAyMDAKQW5kcmV3IEx1
bm4gPGFuZHJld0BsdW5uLmNoPiDlhpnpgZM6Cgo+IE9uIFN1biwgSnVuIDEzLCAyMDIxIGF0IDA0
OjM0OjUyUE0gKzA4MDAsIOWRqOeQsOadsCB3cm90ZToKPiA+IOS6jiBUaHUsIDEwIEp1biAyMDIx
IDE2OjU3OjI5ICswMjAwCj4gPiBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+IOWGmemBkzoK
PiA+ICAgCj4gPiA+ID4gSGVyZSBpcyBJbmdlbmljJ3MgcmVwbHksIHRoZSB0aW1lIGxlbmd0aCBj
b3JyZXNwb25kaW5nIHRvIGEKPiA+ID4gPiB1bml0IGlzIDE5LjVwcyAoMTk1MDBmcykuICAgIAo+
ID4gPiAKPiA+ID4gU29tZXRpbWVzLCB0aGVyZSBpcyBhIG5lZ2F0aXZlIG9mZnNldCBpbiB0aGUg
ZGVsYXlzLiBTbyBhIGRlbGF5Cj4gPiA+IHZhbHVlIG9mIDAgd3JpdHRlbiB0byB0aGUgcmVnaXN0
ZXIgYWN0dWFsbHkgbWVhbnMgLTIwMHBzIG9yCj4gPiA+IHNvbWV0aGluZy4gIAo+ID4gCj4gPiBB
aCwgcGVyaGFwcyB0aGlzIGV4cGxhaW5zIHdoeSB3ZSBzdGlsbCBuZWVkIHRvIGFkZCBmaW5lLXR1
bmluZwo+ID4gcGFyYW1ldGVyIGluIHJnbWlpLWlkIGFuZCByZ21paS10eGlkIG1vZGVzIHRvIGVu
c3VyZSB0aGF0IHRoZQo+ID4gbmV0d29yayB3b3JrcyBwcm9wZXJseS4gIAo+IAo+IFBsZWFzZSB0
cnkgdG8gZmluZCB0aGlzIG91dC4gcmdtaWkgbWVhbnMgbm8gZGVsYXkuIElmIHRoZSBoYXJkd2Fy
ZSBpcwo+IGRvaW5nIC01MDBwUyBieSBkZWZhdWx0LCB5b3UgbmVlZCB0byB0YWtlIHRoaXMgaW50
byBhY2NvdW50LCBhbmQgYWRkCj4gdGhlIDUwMHBTIGJhY2sgb24uCgpJIHRoaW5rIEkgbWF5IGhh
dmUgZm91bmQgdGhlIHByb2JsZW0uIEF0IHByZXNlbnQsIG15IFBIWSB1c2VzIGEKZ2VuZXJhbCBk
cml2ZXIsIGFuZCB0aGVyZSBpcyBubyBzcGVjaWZpYyBzZXR0aW5nIGZvciBkZWxheS1yZWxhdGVk
CnJlZ2lzdGVycy4gVGhlIGRlZmF1bHQgZGVsYXkgdmFsdWUgb2YgUEhZIGlzIDFucywgd2hpY2gg
ZG9lcyBub3QgbWVldAp0aGUgZGVsYXkgcmVxdWlyZW1lbnQgb2YgMm5zLCBhZnRlciBhbmQgdGhl
IE1BQyBzaWRlIGFkZCA1MDBwcyBkZWxheQooYW5kIHBvc3NpYmx5IHNvbWUgZGVsYXlzIGludHJv
ZHVjZWQgb24gdGhlIGhhcmR3YXJlIGNpcmN1aXQpLCBpdCBqdXN0Cm1lZXRzIHRoZSByZXF1aXJl
bWVudCBvZiAybnMgZGVsYXkuCgo+IAo+ICAgICBBbmRyZXcKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
