Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B025036D9
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Apr 2022 15:49:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A925C60490;
	Sat, 16 Apr 2022 13:49:05 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 224C6C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Apr 2022 13:49:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D85DA60F19;
 Sat, 16 Apr 2022 13:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44EB5C385A3;
 Sat, 16 Apr 2022 13:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650116941;
 bh=UzrW4DH+G8Dj0UuJ/PNKT5uOU2E+a30RNW44fCHWJNc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WJY7d0fzGD9z8rEWIgPmHGwsmNVd9Xs4GizkmfHhSZTdXpeOzmuNzSEDDlWtvaAUh
 ouYerMh4rSVxXcQOtlh12advFnrZ3w0xQsVws8nqwg6zv8lwqjU8HRiXLrrg+vmhRq
 TqPqu2WKsrMm06dcs+P1dhrReRzGadl/5lkQPCFMn21K0IVEgGrdJmhL8/SLdvmhE6
 LnXD05Y6BVdxXqk6/T8tE4lLRIBV2CEwp1ujOfZgOxHbdpMNaBwXH4rYi564xDggwv
 3j1FRgik6hAttx1qxP4sAcM5GEu+BOlOEStUl9ttE1BQPB2jA+a0w+5sFc/3f4+1q8
 Pb18ra+GYxNXQ==
Date: Sat, 16 Apr 2022 14:56:58 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Philippe Schenker <philippe.schenker@toradex.com>
Message-ID: <20220416145658.6b1b4947@jic23-huawei>
In-Reply-To: <adf0c8de5fc7770023acbd2c9aab478b3a9ccf50.camel@toradex.com>
References: <PH0PR03MB6786157EDA63137DF0071D1F99ED9@PH0PR03MB6786.namprd03.prod.outlook.com>
 <20220412065150.14486-1-linmq006@gmail.com>
 <adf0c8de5fc7770023acbd2c9aab478b3a9ccf50.camel@toradex.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "linmq006@gmail.com" <linmq006@gmail.com>,
	"          <linux-arm-kernel@lists.infradead.org>, "@stm-ict-prod-mailman-01.stormreply.prv,
	linux-kernel@vger.kernel.org,
	"  <keescook@chromium.org>, "@stm-ict-prod-mailman-01.stormreply.prv,
	lars@metafoo.de,
	" <linux-iio@vger.kernel.org>,  "@stm-ict-prod-mailman-01.stormreply.prv,
	linux-arm-kernel@lists.infradead.org,,
	"linux-stm32@st-md-mailman.stormreply.com\"          <linux-stm32@st-md-mailman.stormreply.com>, "@stm-ict-prod-mailman-01.stormreply.prv,
	keescook@chromium.org, <linux-kernel@vger.kernel.org>,
	" <mcoquelin.stm32@gmail.com>,  "@stm-ict-prod-mailman-01.stormreply.prv,
	linux-iio@vger.kernel.org,
	" <lars@metafoo.de>, "@stm-ict-prod-mailman-01.stormreply.prv,
	mcoquelin.stm32@gmail.com
Subject: Re: [Linux-stm32] [PATCH v3] iio: adc: stmpe-adc: Fix
 wait_for_completion_timeout return value check
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

T24gVHVlLCAxMiBBcHIgMjAyMiAwODo1MjoxMyArMDAwMApQaGlsaXBwZSBTY2hlbmtlciA8cGhp
bGlwcGUuc2NoZW5rZXJAdG9yYWRleC5jb20+IHdyb3RlOgoKPiBPbiBUdWUsIDIwMjItMDQtMTIg
YXQgMDY6NTEgKzAwMDAsIE1pYW9xaWFuIExpbiB3cm90ZToKPiA+IHdhaXRfZm9yX2NvbXBsZXRp
b25fdGltZW91dCgpIHJldHVybnMgdW5zaWduZWQgbG9uZyBub3QgbG9uZy4KPiA+IGl0IHJldHVy
bnMgMCBpZiB0aW1lZCBvdXQsIGFuZCBwb3NpdGl2ZSBpZiBjb21wbGV0ZWQuCj4gPiBUaGUgY2hl
Y2sgZm9yIDw9IDAgaXMgYW1iaWd1b3VzIGFuZCBzaG91bGQgYmUgPT0gMCBoZXJlCj4gPiBpbmRp
Y2F0aW5nIHRpbWVvdXQgd2hpY2ggaXMgdGhlIG9ubHkgZXJyb3IgY2FzZQo+ID4gCj4gPiBGaXhl
czogZTgxM2RkZTZmODMzICgiaWlvOiBzdG1wZS1hZGM6IFVzZQo+ID4gd2FpdF9mb3JfY29tcGxl
dGlvbl90aW1lb3V0IikKPiA+IFNpZ25lZC1vZmYtYnk6IE1pYW9xaWFuIExpbiA8bGlubXEwMDZA
Z21haWwuY29tPiAgCj4gCj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIFNjaGVua2VyIDxwaGlsaXBw
ZS5zY2hlbmtlckB0b3JhZGV4LmNvbT4KQXBwbGllZCB0byB0aGUgdG9ncmVnIGJyYW5jaCBvZiBp
aW8uZ2l0IGFuZCBwdXNoZWQgb3V0IGFzIHRlc3RpbmcKdG8gc2VlIGlmIDAtZGF5IGNhbiBmaW5k
IGFueSBwcm9ibGVtcyB3ZSBtaXNzZWQuCgpJJ20gbm90IHB1c2hpbmcgdGhpcyBiYWNrIHRvIHN0
YWJsZSBob3dldmVyIGJlY2F1c2UgdGhlCmN1cnJlbnQgY29kZSBpc24ndCBzdHJpY3RseSBzcGVh
a2luZyBidWdneSBpdCdzIGp1c3Qgb2RkCi8gbWlzbGVhZGluZy4KCkpvbmF0aGFuCgo+IAo+ID4g
LS0tCj4gPiBjaGFuZ2VzIGluIHYyOgo+ID4gLSBGaXggc2FtZSBpc3N1ZSBpbiBzdG1wZV9yZWFk
X3RlbXAuCj4gPiAtLS0KPiA+IGNoYW5nZXMgaW4gdjM6Cj4gPiAtIHVwZGF0ZSB0aGUgcGF0Y2gg
c3ViamVjdC4KPiA+IC0tLQo+ID4gwqBkcml2ZXJzL2lpby9hZGMvc3RtcGUtYWRjLmMgfCA4ICsr
KystLS0tCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvc3RtcGUtYWRjLmMgYi9k
cml2ZXJzL2lpby9hZGMvc3RtcGUtYWRjLmMKPiA+IGluZGV4IGQyZDQwNTM4ODQ5OS4uODNlMGFj
NDQ2N2NhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9paW8vYWRjL3N0bXBlLWFkYy5jCj4gPiAr
KysgYi9kcml2ZXJzL2lpby9hZGMvc3RtcGUtYWRjLmMKPiA+IEBAIC02MSw3ICs2MSw3IEBAIHN0
cnVjdCBzdG1wZV9hZGMgewo+ID4gwqBzdGF0aWMgaW50IHN0bXBlX3JlYWRfdm9sdGFnZShzdHJ1
Y3Qgc3RtcGVfYWRjICppbmZvLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgaWlvX2NoYW5fc3BlYyBjb25zdCAqY2hhbiwgaW50ICp2YWwpCj4gPiDCoHsKPiA+IC3C
oMKgwqDCoMKgwqDCoGxvbmcgcmV0Owo+ID4gK8KgwqDCoMKgwqDCoMKgdW5zaWduZWQgbG9uZyBy
ZXQ7Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoG11dGV4X2xvY2soJmluZm8tPmxvY2spOwo+
ID4gwqAKPiA+IEBAIC03OSw3ICs3OSw3IEBAIHN0YXRpYyBpbnQgc3RtcGVfcmVhZF92b2x0YWdl
KHN0cnVjdCBzdG1wZV9hZGMKPiA+ICppbmZvLAo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqBy
ZXQgPSB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJmluZm8tPmNvbXBsZXRpb24sCj4gPiBT
VE1QRV9BRENfVElNRU9VVCk7Cj4gPiDCoAo+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKHJldCA8PSAw
KSB7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAocmV0ID09IDApIHsKPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgc3RtcGVfcmVnX3dyaXRlKGluZm8tPnN0bXBlLCBTVE1QRV9SRUdf
QURDX0lOVF9TVEEsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgU1RNUEVfQURDX0NIKGluZm8tPmNoYW5uZWwpKTsKPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbXV0ZXhfdW5sb2NrKCZpbmZvLT5sb2Nr
KTsKPiA+IEBAIC05Niw3ICs5Niw3IEBAIHN0YXRpYyBpbnQgc3RtcGVfcmVhZF92b2x0YWdlKHN0
cnVjdCBzdG1wZV9hZGMKPiA+ICppbmZvLAo+ID4gwqBzdGF0aWMgaW50IHN0bXBlX3JlYWRfdGVt
cChzdHJ1Y3Qgc3RtcGVfYWRjICppbmZvLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBzdHJ1Y3QgaWlvX2NoYW5fc3BlYyBjb25zdCAqY2hhbiwgaW50ICp2YWwpCj4gPiDCoHsK
PiA+IC3CoMKgwqDCoMKgwqDCoGxvbmcgcmV0Owo+ID4gK8KgwqDCoMKgwqDCoMKgdW5zaWduZWQg
bG9uZyByZXQ7Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoG11dGV4X2xvY2soJmluZm8tPmxv
Y2spOwo+ID4gwqAKPiA+IEBAIC0xMTQsNyArMTE0LDcgQEAgc3RhdGljIGludCBzdG1wZV9yZWFk
X3RlbXAoc3RydWN0IHN0bXBlX2FkYyAqaW5mbywKPiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKg
cmV0ID0gd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZpbmZvLT5jb21wbGV0aW9uLAo+ID4g
U1RNUEVfQURDX1RJTUVPVVQpOwo+ID4gwqAKPiA+IC3CoMKgwqDCoMKgwqDCoGlmIChyZXQgPD0g
MCkgewo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHJldCA9PSAwKSB7Cj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoG11dGV4X3VubG9jaygmaW5mby0+bG9jayk7Cj4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRVRJTUVET1VUOwo+ID4gwqDCoMKgwqDC
oMKgwqDCoH0gIAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
