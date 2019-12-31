Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A850212E3B9
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jan 2020 09:19:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63A5BC36B11;
	Thu,  2 Jan 2020 08:19:17 +0000 (UTC)
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15D70C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Dec 2019 02:16:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xBV2GOY1022853
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
 Mon, 30 Dec 2019 18:16:24 -0800 (PST)
Received: from [128.224.162.195] (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
 Mon, 30 Dec 2019 18:16:24 -0800
To: Randy Dunlap <rdunlap@infradead.org>, <peppe.cavallaro@st.com>,
 <alexandre.torgue@st.com>
References: <20191231020302.71792-1-jiping.ma2@windriver.com>
 <5b10a5ff-8428-48c7-a60d-69dd62009716@infradead.org>
From: Jiping Ma <Jiping.Ma2@windriver.com>
Message-ID: <719d8dd3-0119-0c93-b299-d2b3d66b1e06@windriver.com>
Date: Tue, 31 Dec 2019 10:16:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <5b10a5ff-8428-48c7-a60d-69dd62009716@infradead.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 02 Jan 2020 08:19:16 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac: debugfs entry name is not be
 changed when udev rename device name.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAxMi8zMS8yMDE5IDEwOjExIEFNLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4gSGksCj4KPiBP
biAxMi8zMC8xOSA2OjAzIFBNLCBKaXBpbmcgTWEgd3JvdGU6Cj4+IEFkZCBvbmUgbm90aWZpZXIg
Zm9yIHVkZXYgY2hhbmdlcyBuZXQgZGV2aWNlIG5hbWUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEpp
cGluZyBNYSA8amlwaW5nLm1hMkB3aW5kcml2ZXIuY29tPgo+PiAtLS0KPj4gICAuLi4vbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgfCAzOCArKysrKysrKysrKysrKysr
KystCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0
bW1hY19tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNf
bWFpbi5jCj4+IGluZGV4IGIxNGY0NmE1NzE1NC4uYzFjODc3YmI0NDIxIDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCj4+ICsr
KyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPj4g
QEAgLTQwMzgsNiArNDAzOCw0MCBAQCBzdGF0aWMgaW50IHN0bW1hY19kbWFfY2FwX3Nob3coc3Ry
dWN0IHNlcV9maWxlICpzZXEsIHZvaWQgKnYpCj4+ICAgfQo+PiAgIERFRklORV9TSE9XX0FUVFJJ
QlVURShzdG1tYWNfZG1hX2NhcCk7Cj4+ICAgCj4+ICsvKioKPiBKdXN0IHVzZSAvKiBoZXJlIHNp
bmNlIHRoaXMgaXMgbm90IGEga2VybmVsLWRvYyBjb21tZW50Lgo+IC8qKiBpcyByZXNlcnZlZCBm
b3Iga2VybmVsLWRvYyBjb21tZW50cy9ub3RhdGlvbi4KSSB1c2UgY2hlY2twYXRjaC5wbCB0byBj
aGVjayBteSBwYXRjaCwgaXQgc2hvdyBvbmUgd2FybmluZywgdGhlbiBJIApjaGFuZ2UgKiB0byAq
Ki7CoMKgIEkgd2lsbCBjaGFuZ2UgaXQgYmFjayB0byAqLgpXQVJOSU5HOiBuZXR3b3JraW5nIGJs
b2NrIGNvbW1lbnRzIGRvbid0IHVzZSBhbiBlbXB0eSAvKiBsaW5lLCB1c2UgLyogCkNvbW1lbnQu
Li4KIzIzOiBGSUxFOiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNf
bWFpbi5jOjQwNDI6CisvKgorICogVXNlIG5ldHdvcmsgZGV2aWNlIGV2ZW50cyB0byBjcmVhdGUv
cmVtb3ZlL3JlbmFtZQo+Cj4+ICsgKiBVc2UgbmV0d29yayBkZXZpY2UgZXZlbnRzIHRvIGNyZWF0
ZS9yZW1vdmUvcmVuYW1lCj4+ICsgKiBkZWJ1Z2ZzIGZpbGUgZW50cmllcwo+PiArICovCj4+ICtz
dGF0aWMgaW50IHN0bW1hY19kZXZpY2VfZXZlbnQoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICp1bnVz
ZWQsCj4+ICsJCQkgICAgICAgdW5zaWduZWQgbG9uZyBldmVudCwgdm9pZCAqcHRyKQo+PiArewo+
Cj4+IEBAIC00MDUwLDcgKzQwODQsNiBAQCBzdGF0aWMgaW50IHN0bW1hY19pbml0X2ZzKHN0cnVj
dCBuZXRfZGV2aWNlICpkZXYpCj4+ICAgCj4+ICAgCQlyZXR1cm4gLUVOT01FTTsKPj4gICAJfQo+
PiAtCj4+ICAgCS8qIEVudHJ5IHRvIHJlcG9ydCBETUEgUlgvVFggcmluZ3MgKi8KPj4gICAJcHJp
di0+ZGJnZnNfcmluZ3Nfc3RhdHVzID0KPj4gICAJCWRlYnVnZnNfY3JlYXRlX2ZpbGUoImRlc2Ny
aXB0b3JzX3N0YXR1cyIsIDA0NDQsCj4gSSBkb24ndCBzZWUgYSBwcm9ibGVtIHdpdGggdGhlIGJs
YW5rIGxpbmUuICBXaHkgcmVtb3ZlIGl0PwpJIHdpbGwgY2hhbmdlIGl0IGJhY2suCj4KPgo+IHRo
YW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
