Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A552B12D5C5
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Dec 2019 03:22:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57F88C36B0B;
	Tue, 31 Dec 2019 02:22:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D32FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Dec 2019 02:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=58v/ii0gXmhprKWGTsyF0arcFN3stGWSym0mBK9JFjs=; b=hxr4BDI6FxfK5HLfr82SeUKc1
 FrWVE4KJov7sXIoQgeGU0QRUUdULRJE/lfe+g5B5o1i5mkZn4pTt+SRDRW/gMRGyIBj0YmXVAbWyN
 tna05XxbJzTlSMgInkLWWeKhS1N9kV3hg2nagHYivpr27coS3OOAljbxfOnuWndHU1yN+ira1rBoG
 cexVQ3rJYoIOd9pHmXyWk+TjFBoL1nRJbS1yQLZ4cv5b37SI2Sx7cCJtuxqePfLnh6mUBrayuwiL0
 UyfzV0v5wPSmdgR8U2vqoEZNBD1N5NXglw4dTC+KObm+OsMAg0iscur/KXlPVgyyvhAIsHnuoXc/h
 xyt0HpK+w==;
Received: from [2601:1c0:6280:3f0::34d9]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1im7B6-00075R-5O; Tue, 31 Dec 2019 02:22:36 +0000
To: Jiping Ma <Jiping.Ma2@windriver.com>, peppe.cavallaro@st.com,
 alexandre.torgue@st.com
References: <20191231020302.71792-1-jiping.ma2@windriver.com>
 <5b10a5ff-8428-48c7-a60d-69dd62009716@infradead.org>
 <719d8dd3-0119-0c93-b299-d2b3d66b1e06@windriver.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <adc6d2bc-a92c-703f-2e27-d905c6322c17@infradead.org>
Date: Mon, 30 Dec 2019 18:22:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <719d8dd3-0119-0c93-b299-d2b3d66b1e06@windriver.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMTIvMzAvMTkgNjoxNiBQTSwgSmlwaW5nIE1hIHdyb3RlOgo+IAo+IAo+IE9uIDEyLzMxLzIw
MTkgMTA6MTEgQU0sIFJhbmR5IER1bmxhcCB3cm90ZToKPj4gSGksCj4+Cj4+IE9uIDEyLzMwLzE5
IDY6MDMgUE0sIEppcGluZyBNYSB3cm90ZToKPj4+IEFkZCBvbmUgbm90aWZpZXIgZm9yIHVkZXYg
Y2hhbmdlcyBuZXQgZGV2aWNlIG5hbWUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSmlwaW5nIE1h
IDxqaXBpbmcubWEyQHdpbmRyaXZlci5jb20+Cj4+PiAtLS0KPj4+IMKgIC4uLi9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyB8IDM4ICsrKysrKysrKysrKysrKysrKy0K
Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+
Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0
bW1hY19tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNf
bWFpbi5jCj4+PiBpbmRleCBiMTRmNDZhNTcxNTQuLmMxYzg3N2JiNDQyMSAxMDA2NDQKPj4+IC0t
LSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPj4+
ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMK
Pj4+IEBAIC00MDM4LDYgKzQwMzgsNDAgQEAgc3RhdGljIGludCBzdG1tYWNfZG1hX2NhcF9zaG93
KHN0cnVjdCBzZXFfZmlsZSAqc2VxLCB2b2lkICp2KQo+Pj4gwqAgfQo+Pj4gwqAgREVGSU5FX1NI
T1dfQVRUUklCVVRFKHN0bW1hY19kbWFfY2FwKTsKPj4+IMKgICsvKioKPj4gSnVzdCB1c2UgLyog
aGVyZSBzaW5jZSB0aGlzIGlzIG5vdCBhIGtlcm5lbC1kb2MgY29tbWVudC4KPj4gLyoqIGlzIHJl
c2VydmVkIGZvciBrZXJuZWwtZG9jIGNvbW1lbnRzL25vdGF0aW9uLgo+IEkgdXNlIGNoZWNrcGF0
Y2gucGwgdG8gY2hlY2sgbXkgcGF0Y2gsIGl0IHNob3cgb25lIHdhcm5pbmcsIHRoZW4gSSBjaGFu
Z2UgKiB0byAqKi7CoMKgIEkgd2lsbCBjaGFuZ2UgaXQgYmFjayB0byAqLgoKSXQgc2hvdWxkIGJl
IG1vcmUgbGlrZToKCi8qIFVzZSBuZXR3b3JrIGRldmljZSBldmVudHMgdG8gY3JlYXRlL3JlbW92
ZS9yZW5hbWUKICogZGVidWdmcyBmaWxlIGVudHJpZXMuCiAqLwoKPiBXQVJOSU5HOiBuZXR3b3Jr
aW5nIGJsb2NrIGNvbW1lbnRzIGRvbid0IHVzZSBhbiBlbXB0eSAvKiBsaW5lLCB1c2UgLyogQ29t
bWVudC4uLgo+ICMyMzogRklMRTogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
c3RtbWFjX21haW4uYzo0MDQyOgo+ICsvKgo+ICsgKiBVc2UgbmV0d29yayBkZXZpY2UgZXZlbnRz
IHRvIGNyZWF0ZS9yZW1vdmUvcmVuYW1lCj4+Cj4+PiArICogVXNlIG5ldHdvcmsgZGV2aWNlIGV2
ZW50cyB0byBjcmVhdGUvcmVtb3ZlL3JlbmFtZQo+Pj4gKyAqIGRlYnVnZnMgZmlsZSBlbnRyaWVz
Cj4+PiArICovCj4+PiArc3RhdGljIGludCBzdG1tYWNfZGV2aWNlX2V2ZW50KHN0cnVjdCBub3Rp
Zmllcl9ibG9jayAqdW51c2VkLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB1bnNpZ25lZCBsb25nIGV2ZW50LCB2b2lkICpwdHIpCj4+PiArewo+PgoKCi0tIAp+UmFu
ZHkKUmVwb3J0ZWQtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
