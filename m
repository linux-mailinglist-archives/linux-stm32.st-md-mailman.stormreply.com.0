Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FFAB17025
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Jul 2025 13:09:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64F6BC36B3C;
	Thu, 31 Jul 2025 11:09:16 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3F22C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Jul 2025 11:09:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EE334601F0;
 Thu, 31 Jul 2025 11:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B74C4CEEF;
 Thu, 31 Jul 2025 11:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753960153;
 bh=A1QiLFsWkLOne69flYjxRji6b6Am/6hybG4NGr+X1Gg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eq7cm8edGkoGi5Z4FYjfHo2kfBz7kdjZ8gZnbMlHsFJZ9GpJ160ANP36pAiPhDGgx
 iSBRb9D8F7+YbYqseUEpRsE63h0uqHBH01Uq2J1uPpafcHOZhF4KTe2YNGlJtUzKHL
 iB5+szXDjW87D6zwKwO3ejN4+vhRb6yJj+sGXe6+xpj52OdlEzIwBprztPVvRNP9c2
 PLPwNZp6qxfLgeMYhH+UA1pDV+wfT2P9utoPe0+jzebjPRub1Yghs+ZdE4iF1UUXCB
 amjkeVJfPiPJDx5TmmyaUmFj+PBG+X127oT0+Vmh7jkNVD3e0eJBq5CW7ekvCaZorT
 g9j8GQxvmThvA==
Date: Thu, 31 Jul 2025 12:09:09 +0100
From: Lee Jones <lee@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Message-ID: <20250731110909.GE1049189@google.com>
References: <20250725071153.338912-1-alexander.stein@ew.tq-group.com>
 <20250725071153.338912-4-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250725071153.338912-4-alexander.stein@ew.tq-group.com>
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 3/3] mfd: stmpe: Allow building as module
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

T24gRnJpLCAyNSBKdWwgMjAyNSwgQWxleGFuZGVyIFN0ZWluIHdyb3RlOgoKPiBFeHBvcnQgdGhl
IGNvcmUgcHJvYmUgYW5kIHJlbW92ZSBmdW5jdGlvbiB0byBiZSB1c2VkIGJ5IG1vZHVsZXMuIEFk
ZAo+IG5lY2Vzc2FyeSBtb2R1bGUgaW5mb3JtYXRpb24gc28gdGhlIGRyaXZlciBjYW4gYmUgYnVp
bHQgYXMgYSBtb2R1bGUuCgpiZWNhdXNlIC4uLgoKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIg
U3RlaW4gPGFsZXhhbmRlci5zdGVpbkBldy50cS1ncm91cC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
bWZkL0tjb25maWcgfCAxMCArKysrKy0tLS0tCj4gIGRyaXZlcnMvbWZkL3N0bXBlLmMgfCAgNiAr
KysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9LY29uZmlnIGIvZHJpdmVycy9tZmQvS2Nv
bmZpZwo+IGluZGV4IDhmMTFiMmRmMTQ3MDQuLmE1OGM5NWU1YjgwNzIgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9tZmQvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvbWZkL0tjb25maWcKPiBAQCAtMTUz
OSw4ICsxNTM5LDggQEAgY29uZmlnIE1GRF9EQjg1MDBfUFJDTVUKPiAgCSAgdGhyb3VnaCBhIHJl
Z2lzdGVyIG1hcC4KPiAgCj4gIGNvbmZpZyBNRkRfU1RNUEUKPiAtCWJvb2wgIlNUTWljcm9lbGVj
dHJvbmljcyBTVE1QRSIKPiAtCWRlcGVuZHMgb24gSTJDPXkgfHwgU1BJX01BU1RFUj15Cj4gKwl0
cmlzdGF0ZSAiU1RNaWNyb2VsZWN0cm9uaWNzIFNUTVBFIgo+ICsJZGVwZW5kcyBvbiBJMkMgfHwg
U1BJX01BU1RFUgo+ICAJZGVwZW5kcyBvbiBPRgo+ICAJc2VsZWN0IE1GRF9DT1JFCj4gIAloZWxw
Cj4gQEAgLTE1NjgsMTQgKzE1NjgsMTQgQEAgbWVudSAiU1RNaWNyb2VsZWN0cm9uaWNzIFNUTVBF
IEludGVyZmFjZSBEcml2ZXJzIgo+ICBkZXBlbmRzIG9uIE1GRF9TVE1QRQo+ICAKPiAgY29uZmln
IFNUTVBFX0kyQwo+IC0JYm9vbCAiU1RNaWNyb2VsZWN0cm9uaWNzIFNUTVBFIEkyQyBJbnRlcmZh
Y2UiCj4gLQlkZXBlbmRzIG9uIEkyQz15Cj4gKwl0cmlzdGF0ZSAiU1RNaWNyb2VsZWN0cm9uaWNz
IFNUTVBFIEkyQyBJbnRlcmZhY2UiCj4gKwlkZXBlbmRzIG9uIEkyQwo+ICAJZGVmYXVsdCB5Cj4g
IAloZWxwCj4gIAkgIFRoaXMgaXMgdXNlZCB0byBlbmFibGUgSTJDIGludGVyZmFjZSBvZiBTVE1Q
RQo+ICAKPiAgY29uZmlnIFNUTVBFX1NQSQo+IC0JYm9vbCAiU1RNaWNyb2VsZWN0cm9uaWNzIFNU
TVBFIFNQSSBJbnRlcmZhY2UiCj4gKwl0cmlzdGF0ZSAiU1RNaWNyb2VsZWN0cm9uaWNzIFNUTVBF
IFNQSSBJbnRlcmZhY2UiCj4gIAlkZXBlbmRzIG9uIFNQSV9NQVNURVIKPiAgCWhlbHAKPiAgCSAg
VGhpcyBpcyB1c2VkIHRvIGVuYWJsZSBTUEkgaW50ZXJmYWNlIG9mIFNUTVBFCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbWZkL3N0bXBlLmMgYi9kcml2ZXJzL21mZC9zdG1wZS5jCj4gaW5kZXggZTEx
NjVmNjNhZWRhZS4uNWZhZjEzZmQ2Y2Y4MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21mZC9zdG1w
ZS5jCj4gKysrIGIvZHJpdmVycy9tZmQvc3RtcGUuYwo+IEBAIC0xNDgyLDYgKzE0ODIsNyBAQCBp
bnQgc3RtcGVfcHJvYmUoc3RydWN0IHN0bXBlX2NsaWVudF9pbmZvICpjaSwgZW51bSBzdG1wZV9w
YXJ0bnVtIHBhcnRudW0pCj4gIAo+ICAJcmV0dXJuIHJldDsKPiAgfQo+ICtFWFBPUlRfU1lNQk9M
X0dQTChzdG1wZV9wcm9iZSk7Cj4gIAo+ICB2b2lkIHN0bXBlX3JlbW92ZShzdHJ1Y3Qgc3RtcGUg
KnN0bXBlKQo+ICB7Cj4gQEAgLTE0OTcsNiArMTQ5OCw3IEBAIHZvaWQgc3RtcGVfcmVtb3ZlKHN0
cnVjdCBzdG1wZSAqc3RtcGUpCj4gIAo+ICAJbWZkX3JlbW92ZV9kZXZpY2VzKHN0bXBlLT5kZXYp
Owo+ICB9Cj4gK0VYUE9SVF9TWU1CT0xfR1BMKHN0bXBlX3JlbW92ZSk7Cj4gIAo+ICBzdGF0aWMg
aW50IHN0bXBlX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICB7Cj4gQEAgLTE1MjAsMyAr
MTUyMiw3IEBAIHN0YXRpYyBpbnQgc3RtcGVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPiAg
Cj4gIEVYUE9SVF9HUExfU0lNUExFX0RFVl9QTV9PUFMoc3RtcGVfZGV2X3BtX29wcywKPiAgCQkJ
ICAgICBzdG1wZV9zdXNwZW5kLCBzdG1wZV9yZXN1bWUpOwo+ICsKPiArTU9EVUxFX0RFU0NSSVBU
SU9OKCJTVE1QRSBNRkQgQ29yZSBkcml2ZXIiKTsKCkRyb3AgdGhlIE1GRCBwYXJ0LgoKPiArTU9E
VUxFX0FVVEhPUigiUmFiaW4gVmluY2VudCA8cmFiaW4udmluY2VudEBzdGVyaWNzc29uLmNvbT4i
KTsKPiArTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOwo+IC0tIAo+IDIuNDMuMAo+IAoKLS0gCkxlZSBK
b25lcyBb5p2O55C85pavXQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
