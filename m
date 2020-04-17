Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DCB1AE622
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2020 21:43:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACFB2C36B0E;
	Fri, 17 Apr 2020 19:43:51 +0000 (UTC)
Received: from zimbra2.kalray.eu (zimbra2.kalray.eu [92.103.151.219])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C46AC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 19:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id A116127E0309;
 Fri, 17 Apr 2020 21:43:48 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id tV94W3F9OK5N; Fri, 17 Apr 2020 21:43:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 14D6027E1067;
 Fri, 17 Apr 2020 21:43:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 61DbgYq2xx3I; Fri, 17 Apr 2020 21:43:47 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id E9E3927E0309;
 Fri, 17 Apr 2020 21:43:47 +0200 (CEST)
Date: Fri, 17 Apr 2020 21:43:47 +0200 (CEST)
From: =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalrayinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Message-ID: <1280711269.16158926.1587152627279.JavaMail.zimbra@kalray.eu>
In-Reply-To: <20200417193837.GB6797@xps15>
References: <20200410102433.2672-1-cleger@kalray.eu>
 <20200410102433.2672-2-cleger@kalray.eu> <20200417193837.GB6797@xps15>
MIME-Version: 1.0
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 8.8.15_GA_3895 (ZimbraWebClient - FF68 (Linux)/8.8.15_GA_3895)
Thread-Topic: remoteproc: add rproc_coredump_set_elf_info
Thread-Index: ZRVka9xHHsh5gxO0cyYKwOr1nrpnPA==
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-remoteproc <linux-remoteproc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/2] remoteproc: add
	rproc_coredump_set_elf_info
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

LS0tLS0gT24gMTcgQXByLCAyMDIwLCBhdCAyMTozOCwgTWF0aGlldSBQb2lyaWVyIG1hdGhpZXUu
cG9pcmllckBsaW5hcm8ub3JnIHdyb3RlOgoKPiBPbiBGcmksIEFwciAxMCwgMjAyMCBhdCAxMjoy
NDozMlBNICswMjAwLCBDbGVtZW50IExlZ2VyIHdyb3RlOgo+PiBUaGlzIGZ1bmN0aW9uIGFsbG93
cyBkcml2ZXJzIHRvIGNvcnJlY3RseSBzZXR1cCB0aGUgY29yZWR1bXAgb3V0cHV0Cj4+IGVsZiBp
bmZvcm1hdGlvbi4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IENsZW1lbnQgTGVnZXIgPGNsZWdlckBr
YWxyYXkuZXU+Cj4+IC0tLQo+PiAgZHJpdmVycy9yZW1vdGVwcm9jL3JlbW90ZXByb2NfY29yZS5j
ICAgICAgIHwgMzIgKysrKysrKysrKysrKysrKysrKystLQo+PiAgZHJpdmVycy9yZW1vdGVwcm9j
L3JlbW90ZXByb2NfZWxmX2xvYWRlci5jIHwgIDMgLS0KPj4gIGluY2x1ZGUvbGludXgvcmVtb3Rl
cHJvYy5oICAgICAgICAgICAgICAgICB8ICAyICsrCj4+ICAzIGZpbGVzIGNoYW5nZWQsIDMyIGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9y
ZW1vdGVwcm9jL3JlbW90ZXByb2NfY29yZS5jCj4+IGIvZHJpdmVycy9yZW1vdGVwcm9jL3JlbW90
ZXByb2NfY29yZS5jCj4+IGluZGV4IGE5YWMxZDAxZTA5Yi4uMzgyNDQzYmFiNTgzIDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL3JlbW90ZXByb2MvcmVtb3RlcHJvY19jb3JlLmMKPj4gKysrIGIvZHJp
dmVycy9yZW1vdGVwcm9jL3JlbW90ZXByb2NfY29yZS5jCj4+IEBAIC0xNTYyLDYgKzE1NjIsMjgg
QEAgaW50IHJwcm9jX2NvcmVkdW1wX2FkZF9jdXN0b21fc2VnbWVudChzdHJ1Y3QgcnByb2MKPj4g
KnJwcm9jLAo+PiAgfQo+PiAgRVhQT1JUX1NZTUJPTChycHJvY19jb3JlZHVtcF9hZGRfY3VzdG9t
X3NlZ21lbnQpOwo+PiAgCj4+ICsvKioKPj4gKyAqIHJwcm9jX2NvcmVkdW1wX3NldF9lbGZfaW5m
bygpIC0gc2V0IGNvcmVkdW1wIGVsZiBpbmZvcm1hdGlvbgo+PiArICogQHJwcm9jOgloYW5kbGUg
b2YgYSByZW1vdGUgcHJvY2Vzc29yCj4+ICsgKiBAY2xhc3M6CWVsZiBjbGFzcyBmb3IgY29yZWR1
bXAgZWxmIGZpbGUKPj4gKyAqIEBzaXplOgllbGYgbWFjaGluZSBmb3IgY29yZWR1bXAgZWxmIGZp
bGUKCkkganVzdCBub3RpY2VkIHRoYXQgdGhlcmUgaXMgYSB0eXBvLCB0aGlzIHNob3VsZCBiZSAi
bWFjaGluZSIgYW5kIG5vdCAic2l6ZSIuCkxldCBtZSBrbm93IGlmIHlvdSdsbCBmaXggaXQgd2hl
biBhcHBseWluZy4KClRoYW5rcywKCkNsw6ltZW50Cgo+PiArICoKPj4gKyAqIFNldCBlbGYgaW5m
b3JtYXRpb24gd2hpY2ggd2lsbCBiZSB1c2VkIGZvciBjb3JlZHVtcCBlbGYgZmlsZS4KPj4gKyAq
Cj4+ICsgKiBSZXR1cm46IDAgb24gc3VjY2VzcywgbmVnYXRpdmUgZXJybm8gb24gZXJyb3IuCj4+
ICsgKi8KPj4gK2ludCBycHJvY19jb3JlZHVtcF9zZXRfZWxmX2luZm8oc3RydWN0IHJwcm9jICpy
cHJvYywgdTggY2xhc3MsIHUxNiBtYWNoaW5lKQo+PiArewo+PiArCWlmIChjbGFzcyAhPSBFTEZD
TEFTUzY0ICYmIGNsYXNzICE9IEVMRkNMQVNTMzIpCj4+ICsJCXJldHVybiAtRUlOVkFMOwo+PiAr
Cj4+ICsJcnByb2MtPmVsZl9jbGFzcyA9IGNsYXNzOwo+PiArCXJwcm9jLT5lbGZfbWFjaGluZSA9
IG1hY2hpbmU7Cj4+ICsKPj4gKwlyZXR1cm4gMDsKPj4gK30KPj4gK0VYUE9SVF9TWU1CT0wocnBy
b2NfY29yZWR1bXBfc2V0X2VsZl9pbmZvKTsKPj4gKwo+PiAgLyoqCj4+ICAgKiBycHJvY19jb3Jl
ZHVtcCgpIC0gcGVyZm9ybSBjb3JlZHVtcAo+PiAgICogQHJwcm9jOglycHJvYyBoYW5kbGUKPj4g
QEAgLTE1ODQsNiArMTYwNiwxMSBAQCBzdGF0aWMgdm9pZCBycHJvY19jb3JlZHVtcChzdHJ1Y3Qg
cnByb2MgKnJwcm9jKQo+PiAgCWlmIChsaXN0X2VtcHR5KCZycHJvYy0+ZHVtcF9zZWdtZW50cykp
Cj4+ICAJCXJldHVybjsKPj4gIAo+PiArCWlmIChjbGFzcyA9PSBFTEZDTEFTU05PTkUpIHsKPj4g
KwkJZGV2X2VycigmcnByb2MtPmRldiwgIkVsZiBjbGFzcyBpcyBub3Qgc2V0XG4iKTsKPj4gKwkJ
cmV0dXJuOwo+PiArCX0KPj4gKwo+PiAgCWRhdGFfc2l6ZSA9IGVsZl9zaXplX29mX2hkcihjbGFz
cyk7Cj4+ICAJbGlzdF9mb3JfZWFjaF9lbnRyeShzZWdtZW50LCAmcnByb2MtPmR1bXBfc2VnbWVu
dHMsIG5vZGUpIHsKPj4gIAkJZGF0YV9zaXplICs9IGVsZl9zaXplX29mX3BoZHIoY2xhc3MpICsg
c2VnbWVudC0+c2l6ZTsKPj4gQEAgLTE2MDIsNyArMTYyOSw3IEBAIHN0YXRpYyB2b2lkIHJwcm9j
X2NvcmVkdW1wKHN0cnVjdCBycHJvYyAqcnByb2MpCj4+ICAJZWxmX2hkcl9pbml0X2lkZW50KGVo
ZHIsIGNsYXNzKTsKPj4gIAo+PiAgCWVsZl9oZHJfc2V0X2VfdHlwZShjbGFzcywgZWhkciwgRVRf
Q09SRSk7Cj4+IC0JZWxmX2hkcl9zZXRfZV9tYWNoaW5lKGNsYXNzLCBlaGRyLCBFTV9OT05FKTsK
Pj4gKwllbGZfaGRyX3NldF9lX21hY2hpbmUoY2xhc3MsIGVoZHIsIHJwcm9jLT5lbGZfbWFjaGlu
ZSk7Cj4+ICAJZWxmX2hkcl9zZXRfZV92ZXJzaW9uKGNsYXNzLCBlaGRyLCBFVl9DVVJSRU5UKTsK
Pj4gIAllbGZfaGRyX3NldF9lX2VudHJ5KGNsYXNzLCBlaGRyLCBycHJvYy0+Ym9vdGFkZHIpOwo+
PiAgCWVsZl9oZHJfc2V0X2VfcGhvZmYoY2xhc3MsIGVoZHIsIGVsZl9zaXplX29mX2hkcihjbGFz
cykpOwo+PiBAQCAtMjA0Myw3ICsyMDcwLDggQEAgc3RydWN0IHJwcm9jICpycHJvY19hbGxvYyhz
dHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIKPj4gKm5hbWUsCj4+ICAJcnByb2MtPm5hbWUg
PSBuYW1lOwo+PiAgCXJwcm9jLT5wcml2ID0gJnJwcm9jWzFdOwo+PiAgCXJwcm9jLT5hdXRvX2Jv
b3QgPSB0cnVlOwo+PiAtCXJwcm9jLT5lbGZfY2xhc3MgPSBFTEZDTEFTUzMyOwo+PiArCXJwcm9j
LT5lbGZfY2xhc3MgPSBFTEZDTEFTU05PTkU7Cj4+ICsJcnByb2MtPmVsZl9tYWNoaW5lID0gRU1f
Tk9ORTsKPj4gIAo+PiAgCWRldmljZV9pbml0aWFsaXplKCZycHJvYy0+ZGV2KTsKPj4gIAlycHJv
Yy0+ZGV2LnBhcmVudCA9IGRldjsKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVtb3RlcHJvYy9y
ZW1vdGVwcm9jX2VsZl9sb2FkZXIuYwo+PiBiL2RyaXZlcnMvcmVtb3RlcHJvYy9yZW1vdGVwcm9j
X2VsZl9sb2FkZXIuYwo+PiBpbmRleCAxNmUyYzQ5NmZkNDUuLjQ4NjlmYjdkOGZlNCAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9yZW1vdGVwcm9jL3JlbW90ZXByb2NfZWxmX2xvYWRlci5jCj4+ICsr
KyBiL2RyaXZlcnMvcmVtb3RlcHJvYy9yZW1vdGVwcm9jX2VsZl9sb2FkZXIuYwo+PiBAQCAtMjQ4
LDkgKzI0OCw2IEBAIGludCBycHJvY19lbGZfbG9hZF9zZWdtZW50cyhzdHJ1Y3QgcnByb2MgKnJw
cm9jLCBjb25zdAo+PiBzdHJ1Y3QgZmlybXdhcmUgKmZ3KQo+PiAgCQkJbWVtc2V0KHB0ciArIGZp
bGVzeiwgMCwgbWVtc3ogLSBmaWxlc3opOwo+PiAgCX0KPj4gIAo+PiAtCWlmIChyZXQgPT0gMCkK
Pj4gLQkJcnByb2MtPmVsZl9jbGFzcyA9IGNsYXNzOwo+PiAtCj4+ICAJcmV0dXJuIHJldDsKPj4g
IH0KPj4gIEVYUE9SVF9TWU1CT0wocnByb2NfZWxmX2xvYWRfc2VnbWVudHMpOwo+PiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9yZW1vdGVwcm9jLmggYi9pbmNsdWRlL2xpbnV4L3JlbW90ZXBy
b2MuaAo+PiBpbmRleCBlZDEyN2IyZDM1Y2EuLmQ2N2ViNWE0MDQ3NiAxMDA2NDQKPj4gLS0tIGEv
aW5jbHVkZS9saW51eC9yZW1vdGVwcm9jLmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9yZW1vdGVw
cm9jLmgKPj4gQEAgLTUxNSw2ICs1MTUsNyBAQCBzdHJ1Y3QgcnByb2Mgewo+PiAgCXN0cnVjdCBs
aXN0X2hlYWQgZHVtcF9zZWdtZW50czsKPj4gIAlpbnQgbmJfdmRldjsKPj4gIAl1OCBlbGZfY2xh
c3M7Cj4+ICsJdTE2IGVsZl9tYWNoaW5lOwo+PiAgfTsKPiAKPiBSZXZpZXdlZC1ieTogTWF0aGll
dSBQb2lyaWVyIDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz4KPiAKPj4gIAo+PiAgLyoqCj4+
IEBAIC02MTksNiArNjIwLDcgQEAgaW50IHJwcm9jX2NvcmVkdW1wX2FkZF9jdXN0b21fc2VnbWVu
dChzdHJ1Y3QgcnByb2MgKnJwcm9jLAo+PiAgCQkJCQkJICAgICBzdHJ1Y3QgcnByb2NfZHVtcF9z
ZWdtZW50ICpzZWdtZW50LAo+PiAgCQkJCQkJICAgICB2b2lkICpkZXN0KSwKPj4gIAkJCQkgICAg
ICB2b2lkICpwcml2KTsKPj4gK2ludCBycHJvY19jb3JlZHVtcF9zZXRfZWxmX2luZm8oc3RydWN0
IHJwcm9jICpycHJvYywgdTggY2xhc3MsIHUxNiBtYWNoaW5lKTsKPj4gIAo+PiAgc3RhdGljIGlu
bGluZSBzdHJ1Y3QgcnByb2NfdmRldiAqdmRldl90b19ydmRldihzdHJ1Y3QgdmlydGlvX2Rldmlj
ZSAqdmRldikKPj4gIHsKPj4gLS0KPj4gMi4xNy4xCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
