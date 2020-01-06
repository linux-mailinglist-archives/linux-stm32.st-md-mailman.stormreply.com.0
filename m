Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80083130B7F
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jan 2020 02:31:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29750C36B0B;
	Mon,  6 Jan 2020 01:31:09 +0000 (UTC)
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3A40C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jan 2020 01:31:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0061UvG4010178
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
 Sun, 5 Jan 2020 17:30:57 -0800 (PST)
Received: from [128.224.162.195] (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
 Sun, 5 Jan 2020 17:30:56 -0800
To: David Miller <davem@davemloft.net>
References: <20200102013544.19271-1-jiping.ma2@windriver.com>
 <20200104.201833.91020607861340266.davem@davemloft.net>
From: Jiping Ma <Jiping.Ma2@windriver.com>
Message-ID: <dd27bae8-46d0-6802-90b9-475d8489d528@windriver.com>
Date: Mon, 6 Jan 2020 09:30:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20200104.201833.91020607861340266.davem@davemloft.net>
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, ytao <yue.tao@windriver.com>,
 peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com,
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

CgpPbiAwMS8wNS8yMDIwIDEyOjE4IFBNLCBEYXZpZCBNaWxsZXIgd3JvdGU6Cj4gRnJvbTogSmlw
aW5nIE1hIDxqaXBpbmcubWEyQHdpbmRyaXZlci5jb20+Cj4gRGF0ZTogVGh1LCAyIEphbiAyMDIw
IDA5OjM1OjQ0ICswODAwCj4KPj4gQWRkIG9uZSBub3RpZmllciBmb3IgdWRldiBjaGFuZ2VzIG5l
dCBkZXZpY2UgbmFtZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmlwaW5nIE1hIDxqaXBpbmcubWEy
QHdpbmRyaXZlci5jb20+Cj4+IC0tLQo+PiAgIC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvc3RtbWFjX21haW4uYyB8IDI4ICsrKysrKysrKysrKysrKysrKysKPj4gICAxIGZpbGUgY2hh
bmdlZCwgMjggaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPj4gaW5kZXggYjE0ZjQ2YTU3MTU0Li4zYjA1
Y2I4MGVlZDcgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL3N0bW1hY19tYWluLmMKPj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvc3RtbWFjX21haW4uYwo+PiBAQCAtNDAzOCw2ICs0MDM4LDMxIEBAIHN0YXRpYyBpbnQg
c3RtbWFjX2RtYV9jYXBfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKnNlcSwgdm9pZCAqdikKPj4gICB9
Cj4+ICAgREVGSU5FX1NIT1dfQVRUUklCVVRFKHN0bW1hY19kbWFfY2FwKTsKPj4gICAKPj4gKy8q
IFVzZSBuZXR3b3JrIGRldmljZSBldmVudHMgdG8gcmVuYW1lIGRlYnVnZnMgZmlsZSBlbnRyaWVz
Lgo+PiArICovCj4+ICtzdGF0aWMgaW50IHN0bW1hY19kZXZpY2VfZXZlbnQoc3RydWN0IG5vdGlm
aWVyX2Jsb2NrICp1bnVzZWQsCj4+ICsJCQkgICAgICAgdW5zaWduZWQgbG9uZyBldmVudCwgdm9p
ZCAqcHRyKQo+PiArewo+PiArCXN0cnVjdCBuZXRfZGV2aWNlICpkZXYgPSBuZXRkZXZfbm90aWZp
ZXJfaW5mb190b19kZXYocHRyKTsKPj4gKwlzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYgPSBuZXRk
ZXZfcHJpdihkZXYpOwo+PiArCj4+ICsJc3dpdGNoIChldmVudCkgewo+PiArCWNhc2UgTkVUREVW
X0NIQU5HRU5BTUU6Cj4gVGhpcyBub3RpZmllciBnZXRzIGNhbGxlZCBmb3IgZXZlcnkgc2luZ2xl
IG5ldGRldmljZSBpbiB0aGUgZW50aXJlCj4gc3lzdGVtLgo+Cj4gWW91IGNhbm5vdCBqdXN0IGFz
c3VtZSB0aGF0IHRoZSBkZXZpY2UgdGhhdCBnZXRzIHBhc3NlZCBpbiBoZXJlIGlzCj4gYW4gc3Rt
bWFjIGRldmljZS4KPgo+IExvb2sgYXQgaG93IG90aGVyIGRyaXZlcnMgaGFuZGxlIHRoaXMgdG8g
c2VlIGhvdyB0byBkbyBpdCBjb3JyZWN0bHkuCj4KPiBUaGFuayB5b3UuClRoYW5rcyB0byByZW1p
bmQuwqAgSSB3aWxsIG1vZGlmeSBpdCBhbmQgc2VuZCBpdCByZXZpZXcgYWdhaW4uCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
