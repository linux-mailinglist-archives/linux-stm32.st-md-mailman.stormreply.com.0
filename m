Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB12712E3BA
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jan 2020 09:19:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7618FC36B14;
	Thu,  2 Jan 2020 08:19:17 +0000 (UTC)
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E297C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Dec 2019 02:29:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xBV2T0As012150
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
 Mon, 30 Dec 2019 18:29:00 -0800 (PST)
Received: from [128.224.162.195] (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
 Mon, 30 Dec 2019 18:28:59 -0800
To: Randy Dunlap <rdunlap@infradead.org>, <peppe.cavallaro@st.com>,
 <alexandre.torgue@st.com>
References: <20191231020302.71792-1-jiping.ma2@windriver.com>
 <5b10a5ff-8428-48c7-a60d-69dd62009716@infradead.org>
 <719d8dd3-0119-0c93-b299-d2b3d66b1e06@windriver.com>
 <adc6d2bc-a92c-703f-2e27-d905c6322c17@infradead.org>
From: Jiping Ma <Jiping.Ma2@windriver.com>
Message-ID: <93bebc7e-3a47-55f9-f48c-a4c1de6d62bc@windriver.com>
Date: Tue, 31 Dec 2019 10:28:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <adc6d2bc-a92c-703f-2e27-d905c6322c17@infradead.org>
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

CgpPbiAxMi8zMS8yMDE5IDEwOjIyIEFNLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4gT24gMTIvMzAv
MTkgNjoxNiBQTSwgSmlwaW5nIE1hIHdyb3RlOgo+Pgo+PiBPbiAxMi8zMS8yMDE5IDEwOjExIEFN
LCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBPbiAxMi8zMC8xOSA2OjAzIFBN
LCBKaXBpbmcgTWEgd3JvdGU6Cj4+Pj4gQWRkIG9uZSBub3RpZmllciBmb3IgdWRldiBjaGFuZ2Vz
IG5ldCBkZXZpY2UgbmFtZS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEppcGluZyBNYSA8amlw
aW5nLm1hMkB3aW5kcml2ZXIuY29tPgo+Pj4+IC0tLQo+Pj4+ICDCoCAuLi4vbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgfCAzOCArKysrKysrKysrKysrKysrKystCj4+
Pj4gIMKgIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+
Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
c3RtbWFjX21haW4uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1h
Y19tYWluLmMKPj4+PiBpbmRleCBiMTRmNDZhNTcxNTQuLmMxYzg3N2JiNDQyMSAxMDA2NDQKPj4+
PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5j
Cj4+Pj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21h
aW4uYwo+Pj4+IEBAIC00MDM4LDYgKzQwMzgsNDAgQEAgc3RhdGljIGludCBzdG1tYWNfZG1hX2Nh
cF9zaG93KHN0cnVjdCBzZXFfZmlsZSAqc2VxLCB2b2lkICp2KQo+Pj4+ICDCoCB9Cj4+Pj4gIMKg
IERFRklORV9TSE9XX0FUVFJJQlVURShzdG1tYWNfZG1hX2NhcCk7Cj4+Pj4gIMKgICsvKioKPj4+
IEp1c3QgdXNlIC8qIGhlcmUgc2luY2UgdGhpcyBpcyBub3QgYSBrZXJuZWwtZG9jIGNvbW1lbnQu
Cj4+PiAvKiogaXMgcmVzZXJ2ZWQgZm9yIGtlcm5lbC1kb2MgY29tbWVudHMvbm90YXRpb24uCj4+
IEkgdXNlIGNoZWNrcGF0Y2gucGwgdG8gY2hlY2sgbXkgcGF0Y2gsIGl0IHNob3cgb25lIHdhcm5p
bmcsIHRoZW4gSSBjaGFuZ2UgKiB0byAqKi7CoMKgIEkgd2lsbCBjaGFuZ2UgaXQgYmFjayB0byAq
Lgo+IEl0IHNob3VsZCBiZSBtb3JlIGxpa2U6Cj4KPiAvKiBVc2UgbmV0d29yayBkZXZpY2UgZXZl
bnRzIHRvIGNyZWF0ZS9yZW1vdmUvcmVuYW1lCj4gICAqIGRlYnVnZnMgZmlsZSBlbnRyaWVzLgo+
ICAgKi8KPgpHb3QgaXQuwqAgVGhhbmtzLgo+PiBXQVJOSU5HOiBuZXR3b3JraW5nIGJsb2NrIGNv
bW1lbnRzIGRvbid0IHVzZSBhbiBlbXB0eSAvKiBsaW5lLCB1c2UgLyogQ29tbWVudC4uLgo+PiAj
MjM6IEZJTEU6IGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWlu
LmM6NDA0MjoKPj4gKy8qCj4+ICsgKiBVc2UgbmV0d29yayBkZXZpY2UgZXZlbnRzIHRvIGNyZWF0
ZS9yZW1vdmUvcmVuYW1lCj4+Pj4gKyAqIFVzZSBuZXR3b3JrIGRldmljZSBldmVudHMgdG8gY3Jl
YXRlL3JlbW92ZS9yZW5hbWUKPj4+PiArICogZGVidWdmcyBmaWxlIGVudHJpZXMKPj4+PiArICov
Cj4+Pj4gK3N0YXRpYyBpbnQgc3RtbWFjX2RldmljZV9ldmVudChzdHJ1Y3Qgbm90aWZpZXJfYmxv
Y2sgKnVudXNlZCwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVu
c2lnbmVkIGxvbmcgZXZlbnQsIHZvaWQgKnB0cikKPj4+PiArewo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
