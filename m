Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C221790B78
	for <lists+linux-stm32@lfdr.de>; Sun,  3 Sep 2023 12:41:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EB92C6B44C;
	Sun,  3 Sep 2023 10:41:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98840C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Sep 2023 10:41:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 644C260B60;
 Sun,  3 Sep 2023 10:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091F9C433C7;
 Sun,  3 Sep 2023 10:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693737659;
 bh=zU/syJkqVXrCaKtAJvjb3McyZip5Q8QhWuhY8Smkpio=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bbt287BifbGZW7Fy7egymUk6EKGDR7K+bPbW4j1eo4EP3EteJ6H+EjlIrBIM/R5Kg
 ahl5vGYlIgBT0lOrQjyI7LzCD2VmPIpYclTAzZDUYdTl3rYLxl95ftrpm/YbaoymXC
 aATDcrEx5Zm51w+ffq/Ao3hgSHV6JbqKmCIap9gKHAOcFkBb/YqDzI6XpJXkUryxbk
 b70ysikUW1h5ANXWFBxXSO2Ruc3i//FP7cBPWMDubvO2ggNGr36pUqIltamEQXGoM4
 9txR8m+V6nnt+EIhjuCW9S489tcaAjb7K7eV3ONXq3WeWKDHujLoXU+uruOQhcvzRT
 mFDwgk7dWYqpw==
Date: Sun, 3 Sep 2023 11:41:26 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Zhang Shurong <zhang_shurong@foxmail.com>
Message-ID: <20230903114126.30ed4159@jic23-huawei>
In-Reply-To: <tencent_273D6814AA50AF24126F966A3DB684C0FE09@qq.com>
References: <tencent_994DA85912C937E3B5405BA960B31ED90A08@qq.com>
 <tencent_CF6E986A75B63EC09E3D98143650B5241809@qq.com>
 <20230828171605.15c51c28@jic23-huawei>
 <tencent_273D6814AA50AF24126F966A3DB684C0FE09@qq.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] io: adc: stm32-adc: fix potential NULL
 pointer dereference in stm32_adc_probe()
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

T24gVHVlLCAyOSBBdWcgMjAyMyAwMDozNTozNiArMDgwMApaaGFuZyBTaHVyb25nIDx6aGFuZ19z
aHVyb25nQGZveG1haWwuY29tPiB3cm90ZToKCj4g5ZyoIDIwMjPlubQ45pyIMjnml6XmmJ/mnJ/k
uowgQ1NUIOS4iuWNiDEyOjE2OjA177yMSm9uYXRoYW4gQ2FtZXJvbiDlhpnpgZPvvJoKPiA+IE9u
IE1vbiwgMjggQXVnIDIwMjMgMjM6MDI6MDcgKzA4MDAKPiA+IAo+ID4gWmhhbmcgU2h1cm9uZyA8
emhhbmdfc2h1cm9uZ0Bmb3htYWlsLmNvbT4gd3JvdGU6ICAKPiA+ID4g5ZyoIDIwMjPlubQ35pyI
MTfml6XmmJ/mnJ/kuIAgQ1NUIOS4iuWNiDEyOjA4OjIx77yMSm9uYXRoYW4gQ2FtZXJvbiDlhpnp
gZPvvJoKPiA+ID4gICAKPiA+ID4gPiBPbiBTYXQsIDE1IEp1bCAyMDIzIDIzOjU1OjUwICswODAw
Cj4gPiA+ID4gCj4gPiA+ID4gWmhhbmcgU2h1cm9uZyA8emhhbmdfc2h1cm9uZ0Bmb3htYWlsLmNv
bT4gd3JvdGU6ICAKPiA+ID4gPiA+IG9mX21hdGNoX2RldmljZSgpIG1heSBmYWlsIGFuZCByZXR1
cm5zIGEgTlVMTCBwb2ludGVyLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBGaXggdGhpcyBieSBjaGVj
a2luZyB0aGUgcmV0dXJuIHZhbHVlIG9mIG9mX21hdGNoX2RldmljZSgpLgo+ID4gPiA+ID4gCj4g
PiA+ID4gPiBGaXhlczogNjRhZDdmNjQzOGYzICgiaWlvOiBhZGM6IHN0bTMyOiBpbnRyb2R1Y2Ug
Y29tcGF0aWJsZSBkYXRhIGNmZyIpCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBaaGFuZyBTaHVy
b25nIDx6aGFuZ19zaHVyb25nQGZveG1haWwuY29tPiAgCj4gPiA+ID4gCj4gPiA+ID4gSGkgWmhh
bmcsCj4gPiA+ID4gCj4gPiA+ID4gSSdtIG5vdCBzdXJlIHdlIGNhbiBhY3R1YWxseSBtYWtlIHRo
aXMgYnVnIGhhcHBlbi4gRG8geW91IGhhdmUKPiA+ID4gPiBhIHdheSBvZiB0cmlnZ2VyaW5nIGl0
PyAgVGhlIGRyaXZlciBpcyBvbmx5IHByb2JlZCBvbiBkZXZpY2VzIHdoZXJlCj4gPiA+ID4gdGhh
dCBtYXRjaCB3aWxsIHdvcmsuCj4gPiA+ID4gCj4gPiA+ID4gQWxzbywgYXNzdW1pbmcgdGhlIG1h
dGNoIHRhYmxlIGlzIHRoZSBzYW1lIG9uZSBhc3NvY2lhdGVkIHdpdGggdGhpcwo+ID4gPiA+IHBy
b2JlCj4gPiA+ID4gZnVuY3Rpb24sIHRoZW4gdXMgcHJpdi0+Y2ZnID0gb2ZfZGV2aWNlX2dldF9t
YXRjaF9kYXRhKCkgYW5kIGNoZWNrIHRoZQo+ID4gPiA+IG91dHB1dCBvZiB0aGF0IHdoaWNoIGlz
IHdoYXQgd2UgcmVhbGx5IGNhcmUgYWJvdXQuCj4gPiA+ID4gCj4gPiA+ID4gSm9uYXRoYW4KPiA+
ID4gPiAgIAo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAKPiA+ID4gPiA+ICBkcml2ZXJzL2lpby9h
ZGMvc3RtMzItYWRjLWNvcmUuYyB8IDkgKysrKysrKy0tCj4gPiA+ID4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+ID4gPiA+IAo+ID4gPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMtY29yZS5jCj4gPiA+ID4gPiBi
L2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMtY29yZS5jIGluZGV4IDQ4ZjAyZGNjODFjMS4uNzAw
MTFmZGJmNWY2Cj4gPiA+ID4gPiAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvaWlvL2Fk
Yy9zdG0zMi1hZGMtY29yZS5jCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2lpby9hZGMvc3RtMzIt
YWRjLWNvcmUuYwo+ID4gPiA+ID4gQEAgLTcwNiw2ICs3MDYsOCBAQCBzdGF0aWMgaW50IHN0bTMy
X2FkY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICAKPiA+ID4gPiA+ICpwZGV2KT4gIAo+
ID4gPiA+ID4gCj4gPiA+ID4gPiAgCXN0cnVjdCBzdG0zMl9hZGNfcHJpdiAqcHJpdjsKPiA+ID4g
PiA+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiA+ID4gPiA+ICAJc3RydWN0
IGRldmljZV9ub2RlICpucCA9IHBkZXYtPmRldi5vZl9ub2RlOwo+ID4gPiA+ID4gCj4gPiA+ID4g
PiArCWNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm9mX2lkOwo+ID4gPiA+ID4gKwo+ID4gPiA+
ID4gCj4gPiA+ID4gPiAgCXN0cnVjdCByZXNvdXJjZSAqcmVzOwo+ID4gPiA+ID4gIAl1MzIgbWF4
X3JhdGU7Cj4gPiA+ID4gPiAgCWludCByZXQ7Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IEBAIC03MTgs
OCArNzIwLDExIEBAIHN0YXRpYyBpbnQgc3RtMzJfYWRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgIAo+ID4gPiA+ID4gKnBkZXYpPiAgCj4gPiA+ID4gPiAKPiA+ID4gPiA+ICAJCXJldHVy
biAtRU5PTUVNOwo+ID4gPiA+ID4gIAkKPiA+ID4gPiA+ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEo
cGRldiwgJnByaXYtPmNvbW1vbik7Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IC0JcHJpdi0+Y2ZnID0g
KGNvbnN0IHN0cnVjdCBzdG0zMl9hZGNfcHJpdl9jZmcgKikKPiA+ID4gPiA+IC0JCW9mX21hdGNo
X2RldmljZShkZXYtPmRyaXZlci0+b2ZfbWF0Y2hfdGFibGUsIGRldiktPmRhdGE7Cj4gPiA+ID4g
PiArCW9mX2lkID0gb2ZfbWF0Y2hfZGV2aWNlKGRldi0+ZHJpdmVyLT5vZl9tYXRjaF90YWJsZSwg
ZGV2KTsKPiA+ID4gPiA+ICsJaWYgKCFvZl9pZCkKPiA+ID4gPiA+ICsJCXJldHVybiAtRU5PREVW
Owo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKwlwcml2LT5jZmcgPSAoY29uc3Qgc3RydWN0IHN0bTMy
X2FkY19wcml2X2NmZyAqKW9mX2lkLT5kYXRhOwo+ID4gPiA+ID4gCj4gPiA+ID4gPiAgCXByaXYt
Pm5iX2FkY19tYXggPSBwcml2LT5jZmctPm51bV9hZGNzOwo+ID4gPiA+ID4gIAlzcGluX2xvY2tf
aW5pdCgmcHJpdi0+Y29tbW9uLmxvY2spOyAgCj4gPiA+IAo+ID4gPiBIZWxsbyBKb25hdGhhbiwK
PiA+ID4gCj4gPiA+IEkgdGhpbmsgd2UgY2FuIG1ha2UgaXQgaGFwcGVuIGJ5IGRlc2lnbmluZyB0
aGUgcGxhdGZvcm0gZGV2aWNlIGluIGEgd2F5Cj4gPiA+IHRoYXQgaXRzIG5hbWUgYWxpZ25zIHdp
dGggdGhhdCBvZiB0aGUgZHJpdmVyLiBJbiBzdWNoIGEgc2NlbmFyaW8sIHdoZW4KPiA+ID4gdGhl
IGRyaXZlciBpcyBwcm9iZWQsIHRoZSBvZl9tYXRjaF9kZXZpY2UgZnVuY3Rpb24gd2lsbCByZXR1
cm4gbnVsbC4gWW91Cj4gPiA+IGNhbiB2ZXJpZnkgdGhpcyBmdW5jdGlvbmFsaXR5IGJ5IHJldmll
d2luZyB0aGUgZm9sbG93aW5nIGZ1bmN0aW9uOgo+ID4gPiAKPiA+ID4gc3RhdGljIGludCBwbGF0
Zm9ybV9tYXRjaChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfZHJpdmVyICpkcnYp
ICAKPiA+IAo+ID4gSSBkb24ndCB0aGluayB3ZSBjYXJlIGFib3V0IHRoYXQgY2FzZS4gIElmIHRo
ZXJlIGlzIGEgcmVhbCBleGFtcGxlIG9mCj4gPiB3aHkgc29tZW9uZSB3b3VsZCBkbyB0aGlzIHRo
ZW4gdGhhdCB3b3VsZCBiZSBhIGRpZmZlcmVudCBtYXR0ZXIuCj4gPiAKPiA+IEpvbmF0aGFuCj4g
PiAgIAo+ID4gPiBCZXN0IHJlZ2FyZHMsCj4gPiA+IFNodXJvbmcgIAo+IEkganVzdCB0aGluayBp
dCBtaWdodCBiZSBtb3JlIGFwcHJvcHJpYXRlIHRvIHJldHVybiB0aGUgY29ycmVjdCBlcnJvciBj
b2RlIGluIAo+IHRoaXMgc2l0dWF0aW9uLiBJIGFncmVlIHdpdGggeW91ciBhc3Nlc3NtZW50IHRo
YXQgaXQgaXMgYW4gYWJub3JtYWwgY2FzZS4gCj4gVGhlcmVmb3JlLCBpdCBpcyBwZXJmZWN0bHkg
ZmluZSBpZiB5b3UgZGVjaWRlIG5vdCB0byBzZWxlY3QgdGhpcyBwYXRjaC4KPiAKPiBUaGFua3Mg
Zm9yIHlvdXIga2luZCByZXBseS4KPiAKQXBwbGllZCBidXQgd2l0aCBhIG1vZGlmaWVkIGNvbW1p
dCBtZXNzYWdlIHRvIGRlc2NyaWJlIHRoaXMgYXMgaGFyZGVuaW5nIHJhdGhlcgp0aGFuIGEgZml4
LiAgQWxzbyBkcm9wcGVkIHRoZSBmaXhlcyB0YWcgYXMgSSBkb24ndCByZWFsbHkgd2FudCB0aGlz
IHRvIGJlCnBpY2tlZCB1cCBmb3Igc3RhYmxlLgoKVGhhbmtzLAoKSm9uYXRoYW4KCj4gU2h1cm9u
Zwo+IAo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
