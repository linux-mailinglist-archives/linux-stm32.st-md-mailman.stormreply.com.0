Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEC2DA837
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2019 11:24:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2357C36B0B;
	Thu, 17 Oct 2019 09:24:14 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22B1AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2019 09:24:13 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2190D78F2197008800FB;
 Thu, 17 Oct 2019 17:24:10 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0;
 Thu, 17 Oct 2019 17:24:03 +0800
To: huangdaode <huangdaode@hisilicon.com>, Marc Zyngier <maz@kernel.org>
References: <1571296423-208359-1-git-send-email-huangdaode@hisilicon.com>
 <9bbcce19c777583815c92ce3c2ff2586@www.loen.fr>
 <E20AE017F0DBA04DA661272787510F9813D297B0@DGGEMM527-MBX.china.huawei.com>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <3a98da01-4f69-2624-e49f-5e2316c433e0@huawei.com>
Date: Thu, 17 Oct 2019 17:24:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <E20AE017F0DBA04DA661272787510F9813D297B0@DGGEMM527-MBX.china.huawei.com>
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: "nm@ti.com" <nm@ti.com>, "andrew@lunn.ch" <andrew@lunn.ch>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "t-kristo@ti.com" <t-kristo@ti.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "ssantosh@kernel.org" <ssantosh@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>
Subject: Re: [Linux-stm32]
 =?utf-8?b?562U5aSNOiBbUEFUQ0hdIHVzZSBkZXZtX3BsYXRm?=
 =?utf-8?q?orm=5Fioremap=5Fresource=28=29_for_irqchip_drivers?=
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

T24gMjAxOS8xMC8xNyAxNzoyMCwgaHVhbmdkYW9kZSB3cm90ZToKPiBIaSBNYXJjCj4gSSBhbSBq
dXN0IGRvaW5nIHRoZSBjb2NjaWNoZWNrIHVzaW5nIHRoZSBjb21tYW5kICJtYWtlIGNvY2NpY2hl
Y2sgTT1kcml2ZXJzL2lycWNoaXAvIiwgYW5kIGl0IHJlcG9ydCAKPiAkIG1ha2UgY29jY2ljaGVj
ayBNPWRyaXZlcnMvaXJxY2hpcC8KPiAuLi4uLi4uCj4gZHJpdmVycy9pcnFjaGlwLy9pcnEtbXZl
YnUtaWN1LmM6MzYxOjEtMTA6IFdBUk5JTkc6IFVzZSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVz
b3VyY2UgZm9yIGljdSAtPiBiYXNlCj4gZHJpdmVycy9pcnFjaGlwLy9pcnEtdHM0ODAwLmM6MTA1
OjEtMTE6IFdBUk5JTkc6IFVzZSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UgZm9yIGRh
dGEgLT4gYmFzZQo+IGRyaXZlcnMvaXJxY2hpcC8vaXJxLW12ZWJ1LXBpYy5jOjEzNDoxLTEwOiBX
QVJOSU5HOiBVc2UgZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlIGZvciBwaWMgLT4gYmFz
ZQo+IGRyaXZlcnMvaXJxY2hpcC8vaXJxLXRpLXNjaS1pbnRhLmM6NTcxOjEtMTE6IFdBUk5JTkc6
IFVzZSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UgZm9yIGludGEgLT4gYmFzZQo+IGRy
aXZlcnMvaXJxY2hpcC8vaXJxLXN0bTMyLWV4dGkuYzo4NTM6MS0xNjogV0FSTklORzogVXNlIGRl
dm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSBmb3IgaG9zdF9kYXRhIC0+IGJhc2UKPiAKPiBz
byBqdXN0IGZpeCB0aGUgV0FSTklORy4gCj4gCj4gQW5kIGFmdGVyICBhcHBseSB0aGUgcGF0Y2gs
IEkgZG8gdGhlIGNvbXBpbGUsIGl0J3MgT0ssIGJ1dCBJIGxhY2sgb2YgaGFyZHdhcmUgdG8gdGVz
dCBpdC4gCj4gVGhhdCdzIHRoZSBjYXNlLiAKPiAKPiBNQlIuCj4gVGhhbmtzCj4gCj4gLS0tLS3p
gq7ku7bljp/ku7YtLS0tLQo+IOWPkeS7tuS6ujogTWFyYyBaeW5naWVyIFttYWlsdG86bWF6QGtl
cm5lbC5vcmddIAo+IOWPkemAgeaXtumXtDogMjAxOeW5tDEw5pyIMTfml6UgMTY6MjQKPiDmlLbk
u7bkuro6IGh1YW5nZGFvZGUgPGh1YW5nZGFvZGVAaGlzaWxpY29uLmNvbT4KPiDmioTpgIE6IGph
c29uQGxha2VkYWVtb24ubmV0OyBhbmRyZXdAbHVubi5jaDsgZ3JlZ29yeS5jbGVtZW50QGJvb3Rs
aW4uY29tOyBzZWJhc3RpYW4uaGVzc2VsYmFydGhAZ21haWwuY29tOyB0Z2x4QGxpbnV0cm9uaXgu
ZGU7IG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb207IGFsZXhhbmRyZS50b3JndWVAc3QuY29tOyBu
bUB0aS5jb207IHQta3Jpc3RvQHRpLmNvbTsgc3NhbnRvc2hAa2VybmVsLm9yZzsgbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4g5Li76aKYOiBSZTog
W1BBVENIXSB1c2UgZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCkgZm9yIGlycWNoaXAg
ZHJpdmVycwo+IAo+IE9uIDIwMTktMTAtMTcgMDg6MTMsIERhb2RlIEh1YW5nIHdyb3RlOgo+PiBG
cm9tOiBEYW9kZSBIdWFuZyA8aHVhbmdkYW9kZUBoaXNsaWNvbi5jb20+Cj4+Cj4+IFVzZSB0aGUg
bmV3IGhlbHBlciB0aGF0IHdyYXBzIHRoZSBjYWxscyB0byBwbGF0Zm9ybV9nZXRfcmVzb3VyY2Uo
KSBhbmQgCj4+IGRldm1faW9yZW1hcF9yZXNvdXJjZSgpIHRvZ2V0aGVyCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IERhb2RlIEh1YW5nIDxodWFuZ2Rhb2RlQGhpc2xpY29uLmNvbT4KPj4gLS0tCj4+ICBk
cml2ZXJzL2lycWNoaXAvaXJxLW12ZWJ1LWljdS5jICAgfCAzICstLQo+PiAgZHJpdmVycy9pcnFj
aGlwL2lycS1tdmVidS1waWMuYyAgIHwgMyArLS0KPj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtc3Rt
MzItZXh0aS5jICB8IDMgKy0tICAKPj4gZHJpdmVycy9pcnFjaGlwL2lycS10aS1zY2ktaW50YS5j
IHwgMyArLS0KPj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtdHM0ODAwLmMgICAgICB8IDMgKy0tCj4+
ICA1IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLW12ZWJ1LWljdS5jIAo+PiBiL2RyaXZl
cnMvaXJxY2hpcC9pcnEtbXZlYnUtaWN1LmMgaW5kZXggNTQ3MDQ1ZC4uZGRmOWIwZCAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1tdmVidS1pY3UuYwo+PiArKysgYi9kcml2ZXJz
L2lycWNoaXAvaXJxLW12ZWJ1LWljdS5jCj4+IEBAIC0zNTcsOCArMzU3LDcgQEAgc3RhdGljIGlu
dCBtdmVidV9pY3VfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQo+PiAqcGRldikKPj4KPj4g
IAlpY3UtPmRldiA9ICZwZGV2LT5kZXY7Cj4+Cj4+IC0JcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291
cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsKPj4gLQlpY3UtPmJhc2UgPSBkZXZtX2lvcmVt
YXBfcmVzb3VyY2UoJnBkZXYtPmRldiwgcmVzKTsKPj4gKwlpY3UtPmJhc2UgPSBkZXZtX3BsYXRm
b3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgcmVzKTsKCkl0IHNob3VsZCBiZSA6CgorCWljdS0+
YmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKCj4gCj4gdm9p
ZCBfX2lvbWVtICpkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2Uoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IGluZGV4KQo+IAo+IFdoYXQgY291bGQgcG9zc2libHkgZ28gd3Jv
bmc/IEknZCBzdWdnZXN0IHlvdSBzdGFydCBjb21waWxpbmcgKGFuZCBwb3NzaWJseQo+IHRlc3Rp
bmcpIHRoZSBjb2RlIHlvdSBjaGFuZ2UgYmVmb3JlIHNlbmRpbmcgcGF0Y2hlcy4uLgo+IAo+ICAg
ICAgICAgIE0uCj4gLS0KPiBKYXp6IGlzIG5vdCBkZWFkLiBJdCBqdXN0IHNtZWxscyBmdW5ueS4u
Lgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
