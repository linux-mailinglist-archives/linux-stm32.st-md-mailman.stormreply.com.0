Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 739963FAF94
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Aug 2021 03:39:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE9CBC5A4D5;
	Mon, 30 Aug 2021 01:39:53 +0000 (UTC)
Received: from smtpproxy21.qq.com (smtpbg702.qq.com [203.205.195.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 144A5C5A4D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Aug 2021 01:39:51 +0000 (UTC)
X-QQ-mid: bizesmtp34t1630287580tpwocb0h
Received: from [10.10.254.146] (unknown [124.126.19.250])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 30 Aug 2021 09:39:39 +0800 (CST)
X-QQ-SSF: 0040000000200070D000B00A0000000
X-QQ-FEAT: Hy/JiwxnF51u8T2YaPDK6wqjNmyYBy4zZbFw16Ph7cYtVShChYDCsC/0Dmkex
 rC7FSQmOXKA/UTN6BboTXhVHPTrWeNrCL87rIpPH02aALh2WyOH1DBJVDnSURPIItdCJ5VB
 Y91lsqKsR9Dq4uWrvzC1iWgw4D/N/4if3/ktmGghxW4kaa0ChAZNsfu8rszZ0pYDnJHILlm
 HZ5vn+9f1mB7k0tQht8xXsUEDmLJqDKlPdszTlf2C4a5Ea+NeFKCStMAcquHb6MNBDb3sS9
 H/YkVBFtORGrIbE05/SlDcbO0vBoNtb4JkHLrPBReD/nP2+U+M45EkWHH+MPk3sxifomY9m
 /eLfeRDQEiVAF3TkbzL0tBxy1fD6A==
X-QQ-GoodBg: 2
To: Jakub Kicinski <kuba@kernel.org>
References: <20210827085550.13519-1-zhaoxiao@uniontech.com>
 <20210827070238.7586fb11@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: zhaoxiao <zhaoxiao@uniontech.com>
Message-ID: <70a8527d-d488-7d82-668f-9b43f9ef0951@uniontech.com>+4ACC63ED8D3FDBB2
Date: Mon, 30 Aug 2021 09:39:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20210827070238.7586fb11@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac: dwmac-loongson: change the
 pr_info() to dev_err() in loongson_dwmac_probe()
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

VGhhbmtzIGZvciB5b3VyIGFkdmljZXMsIGFuZCBJIGNoYW5nZSB0aGUgcGF0Y2ggYW5kIGNvbW1p
dCBhZ2Fpbi4KCtTaIDIwMjEvOC8yNyDPws7nMTA6MDIsIEpha3ViIEtpY2luc2tpINC0tcA6Cj4g
T24gRnJpLCAyNyBBdWcgMjAyMSAxNjo1NTo1MCArMDgwMCB6aGFveGlhbyB3cm90ZToKPj4gLSBD
aGFuZ2UgdGhlIHByX2luZm8vZGV2X2luZm8gdG8gZGV2X2Vyci4KPj4gLSBBZGQgdGhlIGRldl9l
cnIgdG8gaW1wcm92ZSByZWFkYWJpbGl0eS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogemhhb3hpYW8g
PHpoYW94aWFvQHVuaW9udGVjaC5jb20+Cj4+IC0tLQo+PiAgIC4uLi9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvZHdtYWMtbG9vbmdzb24uYyAgfCAxNSArKysrKysrKystLS0tLS0KPj4gICAx
IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbG9vbmdz
b24uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxvb25nc29u
LmMKPj4gaW5kZXggNGM5YTM3ZGQwZDNmLi40OTVjOTRlNzkyOWYgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxvb25nc29uLmMKPj4gKysr
IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbG9vbmdzb24uYwo+
PiBAQCAtNTQsMjAgKzU0LDIxIEBAIHN0YXRpYyBpbnQgbG9vbmdzb25fZHdtYWNfcHJvYmUoc3Ry
dWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkCj4+ICAgCWJvb2wg
bWRpbyA9IGZhbHNlOwo+PiAgIAo+PiAgIAlucCA9IGRldl9vZl9ub2RlKCZwZGV2LT5kZXYpOwo+
PiAtCj4+ICAgCWlmICghbnApIHsKPj4gLQkJcHJfaW5mbygiZHdtYWNfbG9vbmdzb25fcGNpOiBO
byBPRiBub2RlXG4iKTsKPj4gKwkJZGV2X2VycigmcGRldi0+ZGV2LCAiZHdtYWNfbG9vbmdzb25f
cGNpOiBObyBPRiBub2RlXG4iKTsKPj4gICAJCXJldHVybiAtRU5PREVWOwo+PiAgIAl9Cj4+ICAg
Cj4+ICAgCWlmICghb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsICJsb29uZ3NvbiwgcGNpLWdt
YWMiKSkgewo+PiAtCQlwcl9pbmZvKCJkd21hY19sb29uZ3Nvbl9wY2k6IEluY29tcGF0aWJsZSBP
RiBub2RlXG4iKTsKPj4gKwkJZGV2X2VycigmcGRldi0+ZGV2LCAiZHdtYWNfbG9vbmdzb25fcGNp
OiBJbmNvbXBhdGlibGUgT0Ygbm9kZVxuIik7Cj4+ICAgCQlyZXR1cm4gLUVOT0RFVjsKPj4gICAJ
fQo+PiAgIAo+PiAgIAlwbGF0ID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqcGxh
dCksIEdGUF9LRVJORUwpOwo+PiAtCWlmICghcGxhdCkKPj4gKwlpZiAoIXBsYXQpIHsKPj4gKwkJ
ZGV2X2VycigmcGRldi0+ZGV2LCAibWVtb3J5IGFsbG9jYXRpb24gZmFpbGVkXG4iKTsKPiBQbGVh
c2UgZG9uJ3QgYWRkIGVycm9yIG1lc3NhZ2VzIGFmdGVyIGFsbG9jYXRpb24gZmFpbHVyZXMuIE9P
TSB3aWxsCj4gcHJvZHVjZSBhIGxvdCBvZiBrZXJuZWwgbWVzc2FnZXMgYW5kIGEgc3RhY2sgdHJh
Y2UgYWxyZWFkeS4KPgo+PiAgIAkJcmV0dXJuIC1FTk9NRU07Cj4+ICsJfQo+PiAgIAo+PiAgIAlp
ZiAocGxhdC0+bWRpb19ub2RlKSB7Cj4+ICAgCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJGb3VuZCBN
RElPIHN1Ym5vZGVcbiIpOwo+PiBAQCAtMTA5LDggKzExMCwxMCBAQCBzdGF0aWMgaW50IGxvb25n
c29uX2R3bWFjX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2Rl
dmljZV9pZAo+PiAgIAkJcGxhdC0+YnVzX2lkID0gcGNpX2Rldl9pZChwZGV2KTsKPj4gICAKPj4g
ICAJcGh5X21vZGUgPSBkZXZpY2VfZ2V0X3BoeV9tb2RlKCZwZGV2LT5kZXYpOwo+PiAtCWlmIChw
aHlfbW9kZSA8IDApCj4+ICsJaWYgKHBoeV9tb2RlIDwgMCkgewo+PiAgIAkJZGV2X2VycigmcGRl
di0+ZGV2LCAicGh5X21vZGUgbm90IGZvdW5kXG4iKTsKPj4gKwkJcmV0dXJuIHBoeV9tb2RlOwo+
IFlvdSdyZSBhZGRpbmcgYSByZXR1cm4gaGVyZSwgaXQgc2hvdWxkIGJlIGEgc2VwYXJhdGUgcGF0
Y2ggd2l0aCBpdHMgb3duCj4ganVzdGlmaWNhdGlvbi4KPgo+PiArCX0KPj4gICAKPj4gICAJcGxh
dC0+cGh5X2ludGVyZmFjZSA9IHBoeV9tb2RlOwo+PiAgIAlwbGF0LT5pbnRlcmZhY2UgPSBQSFlf
SU5URVJGQUNFX01PREVfR01JSTsKPj4gQEAgLTEzMCw3ICsxMzMsNyBAQCBzdGF0aWMgaW50IGxv
b25nc29uX2R3bWFjX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25zdCBzdHJ1Y3QgcGNp
X2RldmljZV9pZAo+PiAgIAo+PiAgIAlyZXMud29sX2lycSA9IG9mX2lycV9nZXRfYnluYW1lKG5w
LCAiZXRoX3dha2VfaXJxIik7Cj4+ICAgCWlmIChyZXMud29sX2lycSA8IDApIHsKPj4gLQkJZGV2
X2luZm8oJnBkZXYtPmRldiwgIklSUSBldGhfd2FrZV9pcnEgbm90IGZvdW5kLCB1c2luZyBtYWNp
cnFcbiIpOwo+PiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJJUlEgZXRoX3dha2VfaXJxIG5vdCBm
b3VuZCwgdXNpbmcgbWFjaXJxXG4iKTsKPiBXaHkgdXBncmFkZSB0byBhbiBlcnJvciwgaXNuJ3Qg
d29sX2lycSBvcHRpb25hbD8KPgo+PiAgIAkJcmVzLndvbF9pcnEgPSByZXMuaXJxOwo+PiAgIAl9
Cj4+ICAgCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
