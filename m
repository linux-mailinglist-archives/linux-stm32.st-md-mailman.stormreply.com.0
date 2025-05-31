Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0495CAC9B98
	for <lists+linux-stm32@lfdr.de>; Sat, 31 May 2025 17:56:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CB14C36B14;
	Sat, 31 May 2025 15:56:47 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D61AFC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 May 2025 15:56:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C9BBAA4ED36;
 Sat, 31 May 2025 15:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90EBC4CEE3;
 Sat, 31 May 2025 15:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748707004;
 bh=Si0gaSTIfmA9UreI5SjdzlMFGHES65UvOtKJTsLJWeU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lWQZrisGAesr6zhFA4NExGYhOrZS8k5bUecjEphb+vIBGYHPwTBeqB50DJHsFf6g4
 wJxcUDzXyg1sxo6zg2VhlpzelUyteHsGQe+xpjCMwTNt6RAtOIMqj3U8BWjIr/DyUT
 IPhro+M4iwUH/6LIylWdCUwzGsn0F9dLfWkPG2TYSh7RTMG47E+L3rAByuJ0r4H2IF
 tDBBmefxYoGefboyx6ohp3VOOuFovzk7k2hrr1+Bv9p97h0Avkiix4mJTt/tQj0YUk
 Sz2d7f0wxpd54jYj04AszohRxesb3wcEnk1uA7PKDsRxNm57yZq/br3R+EVNXAH0ok
 sxQwY08AnAQkw==
Date: Sat, 31 May 2025 16:56:35 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20250531165635.262839dc@jic23-huawei>
In-Reply-To: <ab75c390-b172-4dbb-b46b-8cbf64d4600a@foss.st.com>
References: <20250515083101.3811350-1-nichen@iscas.ac.cn>
 <229cf78caaa7e9f2bb4cfa62c019acd51a1cd684.camel@gmail.com>
 <20250525120703.5dd89fc2@jic23-huawei>
 <ab75c390-b172-4dbb-b46b-8cbf64d4600a@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: andy@kernel.org, robh@kernel.org, linux-kernel@vger.kernel.org,
 Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>, linux-iio@vger.kernel.org,
 Chen Ni <nichen@iscas.ac.cn>, nuno.sa@analog.com, u.kleine-koenig@baylibre.com,
 mcoquelin.stm32@gmail.com, tglx@linutronix.de, dlechner@baylibre.com,
 jirislaby@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-adc: Fix race in
 installing chained IRQ handler
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

T24gTW9uLCAyNiBNYXkgMjAyNSAxNzo0ODozMSArMDIwMApGYWJyaWNlIEdhc25pZXIgPGZhYnJp
Y2UuZ2FzbmllckBmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IE9uIDUvMjUvMjUgMTM6MDcsIEpvbmF0
aGFuIENhbWVyb24gd3JvdGU6Cj4gPiBPbiBUaHUsIDE1IE1heSAyMDI1IDExOjI2OjU2ICswMTAw
Cj4gPiBOdW5vIFPDoSA8bm9uYW1lLm51bm9AZ21haWwuY29tPiB3cm90ZToKPiA+ICAgCj4gPj4g
T24gVGh1LCAyMDI1LTA1LTE1IGF0IDE2OjMxICswODAwLCBDaGVuIE5pIHdyb3RlOiAgCj4gPj4+
IEZpeCBhIHJhY2Ugd2hlcmUgYSBwZW5kaW5nIGludGVycnVwdCBjb3VsZCBiZSByZWNlaXZlZCBh
bmQgdGhlIGhhbmRsZXIKPiA+Pj4gY2FsbGVkIGJlZm9yZSB0aGUgaGFuZGxlcidzIGRhdGEgaGFz
IGJlZW4gc2V0dXAsIGJ5IGNvbnZlcnRpbmcgdG8KPiA+Pj4gaXJxX3NldF9jaGFpbmVkX2hhbmRs
ZXJfYW5kX2RhdGEoKS4KPiA+Pj4KPiA+Pj4gRml4ZXM6IGQ1OGM2N2QxZDg1MSAoImlpbzogYWRj
OiBzdG0zMi1hZGM6IGFkZCBzdXBwb3J0IGZvciBTVE0zMk1QMSIpCj4gPj4+IFNpZ25lZC1vZmYt
Ynk6IENoZW4gTmkgPG5pY2hlbkBpc2Nhcy5hYy5jbj4KPiA+Pj4gLS0tICAgIAo+ID4+Cj4gPj4g
UmV2aWV3ZWQtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+ICAKPiA+IExvb2tzIGdv
b2QgdG8gbWUgYW5kIEkndmUgcXVldWVkIGl0IHVwIGZvciBhZnRlciByYzEuICBJZiBhbnkKPiA+
IFNUIGZvbGsgaGF2ZSB0aW1lIHRvIHRha2UgYSBsb29rIHRoYXQgd291bGQgYmUgZ3JlYXQuICAK
PiAKPiBIaSBKb25hdGhhbiwKPiAKPiBPbmUgbWlub3IgY29tbWVudCBhdCBteSBlbmQsIG5vdCBz
dXJlIGlmIHRoYXQgY2hhbmdlcyBhIGxvdC4uLgo+IFRoaXMgY291bGQgYmUgYSBmaXggZm9yIHRo
ZSBvbGRlciBjb21taXQ6Cj4gMWFkZDY5ODgwMjQwICgiaWlvOiBhZGM6IEFkZCBzdXBwb3J0IGZv
ciBTVE0zMiBBREMgY29yZSIpCgpBZ3JlZWQuIEkndmUgdHdlYWtlZCB0aGUgbWVzc2FnZS4gIEl0
IHdvbid0IGFwcGx5IGNsZWFubHkgYWxsIHRoYXQgd2F5CmJ1dCBhdCBsZWFzdCB3ZSBmbGFnZ2Vk
IGl0IGZvciBhbnlvbmUgd2hvIGNhcmVzIHRvIGJhY2twb3J0IHBhc3QgdGhlIGNvZGUKbW92ZW1l
bnQgaW4gdGhlIEZpeGVzIHRhZyBDaGVuIHVzZWQuCgo+IAo+IEFwYXJ0IGZyb20gdGhhdCwgeW91
IGNhbiBhZGQgbXk6Cj4gVGVzdGVkLWJ5OiBGYWJyaWNlIEdhc25pZXIgPGZhYnJpY2UuZ2Fzbmll
ckBmb3NzLnN0LmNvbT4KPiBSZXZpZXdlZC1ieTogRmFicmljZSBHYXNuaWVyIDxmYWJyaWNlLmdh
c25pZXJAZm9zcy5zdC5jb20+CkFkZGVkLgo+IAo+IEJSLAo+IEZhYnJpY2UKPiAKPiA+IAo+ID4g
Sm9uYXRoYW4KPiA+ICAgCj4gPj4gIAo+ID4+PiBDaGFuZ2Vsb2c6Cj4gPj4+Cj4gPj4+IHYxIC0+
IHYyOgo+ID4+Pgo+ID4+PiAxLiBBZGQgRml4ZXMgdGFnLgo+ID4+PiAtLS0KPiA+Pj4gwqBkcml2
ZXJzL2lpby9hZGMvc3RtMzItYWRjLWNvcmUuYyB8IDcgKysrLS0tLQo+ID4+PiDCoDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPj4+Cj4gPj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLWNvcmUuYyBiL2RyaXZlcnMvaWlvL2Fk
Yy9zdG0zMi1hZGMtCj4gPj4+IGNvcmUuYwo+ID4+PiBpbmRleCBiZDM0NTg5NjViZmYuLjIxYzA0
YTk4YjNiNiAxMDA2NDQKPiA+Pj4gLS0tIGEvZHJpdmVycy9paW8vYWRjL3N0bTMyLWFkYy1jb3Jl
LmMKPiA+Pj4gKysrIGIvZHJpdmVycy9paW8vYWRjL3N0bTMyLWFkYy1jb3JlLmMKPiA+Pj4gQEAg
LTQzMCwxMCArNDMwLDkgQEAgc3RhdGljIGludCBzdG0zMl9hZGNfaXJxX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UKPiA+Pj4gKnBkZXYsCj4gPj4+IMKgCQlyZXR1cm4gLUVOT01FTTsKPiA+
Pj4gwqAJfQo+ID4+PiDCoAo+ID4+PiAtCWZvciAoaSA9IDA7IGkgPCBwcml2LT5jZmctPm51bV9p
cnFzOyBpKyspIHsKPiA+Pj4gLQkJaXJxX3NldF9jaGFpbmVkX2hhbmRsZXIocHJpdi0+aXJxW2ld
LCBzdG0zMl9hZGNfaXJxX2hhbmRsZXIpOwo+ID4+PiAtCQlpcnFfc2V0X2hhbmRsZXJfZGF0YShw
cml2LT5pcnFbaV0sIHByaXYpOwo+ID4+PiAtCX0KPiA+Pj4gKwlmb3IgKGkgPSAwOyBpIDwgcHJp
di0+Y2ZnLT5udW1faXJxczsgaSsrKQo+ID4+PiArCQlpcnFfc2V0X2NoYWluZWRfaGFuZGxlcl9h
bmRfZGF0YShwcml2LT5pcnFbaV0sCj4gPj4+ICsJCQkJCQkgc3RtMzJfYWRjX2lycV9oYW5kbGVy
LAo+ID4+PiBwcml2KTsKPiA+Pj4gwqAKPiA+Pj4gwqAJcmV0dXJuIDA7Cj4gPj4+IMKgfSAgICAK
PiA+ICAgCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
