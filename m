Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6D69107D1
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 16:16:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DE9CC7128D;
	Thu, 20 Jun 2024 14:16:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86661C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 14:16:33 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KB2MX4007685;
 Thu, 20 Jun 2024 16:16:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 clsnqnGYNspuhGDr2c/1UM7m1dcz+B0wDouX15lm4dw=; b=ZzU7SFwk5jdALuKv
 zDbV1WdSUaQgi96MDPRyN6p0RWUahORQ5s9dIgJO8pY85h6CpZzn0ecw/q1mUKRS
 u9J46JOMTjTughtFje6bRUkKf2Ibuf1shI/5MKJTpueS1NH5b6OeLDZHikJtq2aK
 lJMJrJkf/N1vVzjKVLercEB4OLYuKAO30IQmDeodGUuoXCkgXYvlI3Ia25reI+Ic
 FrqnwPLJsdaYNL7ig1xdigb815ewoc3fR+RS1ExfI3lw2FDOq//UQ31SSv+U8hcZ
 04HPNLrkT+dbv/BRgZ3/psXCk2h/FBWASoEdK8pmDTuDKbiIfsSpp1PVLlk3BkvY
 Nsj9QQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yuj9t8qpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jun 2024 16:16:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D555240046;
 Thu, 20 Jun 2024 16:16:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 39DA720E034;
 Thu, 20 Jun 2024 16:15:32 +0200 (CEST)
Received: from [10.48.86.132] (10.48.86.132) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 20 Jun
 2024 16:15:31 +0200
Message-ID: <a76e16bc-bcb6-48eb-b6f7-2e4e68ded32b@foss.st.com>
Date: Thu, 20 Jun 2024 16:15:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20240618160836.945242-1-olivier.moysan@foss.st.com>
 <20240618160836.945242-9-olivier.moysan@foss.st.com>
 <a0bd26a9e159e54f1b6effcdd45756ecfddf973f.camel@gmail.com>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <a0bd26a9e159e54f1b6effcdd45756ecfddf973f.camel@gmail.com>
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_07,2024-06-20_04,2024-05-17_01
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 8/8] iio: adc: stm32-dfsdm: add scaling
	support to dfsdm
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

SGkgTnVubywKCk9uIDYvMTkvMjQgMDc6NDcsIE51bm8gU8OhIHdyb3RlOgo+IE9uIFR1ZSwgMjAy
NC0wNi0xOCBhdCAxODowOCArMDIwMCwgT2xpdmllciBNb3lzYW4gd3JvdGU6Cj4+IEFkZCBzY2Fs
aW5nIHN1cHBvcnQgdG8gU1RNMzIgREZTRE0uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE9saXZpZXIg
TW95c2FuIDxvbGl2aWVyLm1veXNhbkBmb3NzLnN0LmNvbT4KPj4gLS0tCj4gCj4gSnVzdCBzb21l
IGdlbmVyYWwgY29tbWVudHMuLi4KPiAKPiBBY2tlZC1ieTogTnVubyBTYSA8bnVuby5zYUBhbmFs
b2cuY29tPgo+IAo+PiAgwqBkcml2ZXJzL2lpby9hZGMvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAxICsKPj4gIMKgZHJpdmVycy9paW8vYWRjL3N0bTMyLWRmc2RtLWFkYy5jIHwgOTQg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+PiAgwqAyIGZpbGVzIGNoYW5nZWQsIDky
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2lpby9hZGMvS2NvbmZpZyBiL2RyaXZlcnMvaWlvL2FkYy9LY29uZmlnCj4+IGluZGV4IGYzZGZk
YWE4MDY3OC4uODU4YWU4MTYxZmE0IDEwMDY0NAo+Pgo+IAo+IC4uLgo+IAo+PiBAQCAtMTMwMSw2
ICsxMzM5LDggQEAgc3RhdGljIGludCBzdG0zMl9kZnNkbV9yZWFkX3JhdyhzdHJ1Y3QgaWlvX2Rl
diAqaW5kaW9fZGV2LAo+PiAgwqAJCXJldCA9IHN0bTMyX2Rmc2RtX3NpbmdsZV9jb252KGluZGlv
X2RldiwgY2hhbiwgdmFsKTsKPj4gIMKgCQlpZiAoYWRjLT5od2MpCj4+ICDCoAkJCWlpb19od19j
b25zdW1lcl9kaXNhYmxlKGFkYy0+aHdjKTsKPj4gKwkJaWYgKGFkYy0+YmFja2VuZFtpZHhdKQo+
PiArCQkJaWlvX2JhY2tlbmRfZGlzYWJsZSgmaW5kaW9fZGV2LT5kZXYsIGFkYy0+YmFja2VuZFtp
ZHhdKTsKPj4gIMKgCQlpZiAocmV0IDwgMCkgewo+PiAgwqAJCQlkZXZfZXJyKCZpbmRpb19kZXYt
PmRldiwKPj4gIMKgCQkJCSIlczogQ29udmVyc2lvbiBmYWlsZWQgKGNoYW5uZWwgJWQpXG4iLAo+
PiBAQCAtMTMyMCw2ICsxMzYwLDQ1IEBAIHN0YXRpYyBpbnQgc3RtMzJfZGZzZG1fcmVhZF9yYXco
c3RydWN0IGlpb19kZXYgKmluZGlvX2RldiwKPj4gIMKgCQkqdmFsID0gYWRjLT5zYW1wbGVfZnJl
cTsKPj4gICAKPj4gIMKgCQlyZXR1cm4gSUlPX1ZBTF9JTlQ7Cj4+ICsKPj4gKwljYXNlIElJT19D
SEFOX0lORk9fU0NBTEU6Cj4+ICsJCS8qCj4+ICsJCSAqIFNjYWxlIGlzIGV4cHJlc3NlZCBpbiBt
Vi4KPj4gKwkJICogV2hlbiBmYXN0IG1vZGUgaXMgZGlzYWJsZWQsIGFjdHVhbCByZXNvbHV0aW9u
IG1heSBiZSBsb3dlcgo+PiArCQkgKiB0aGFuIDJebiwgd2hlcmUgbj1yZWFsYml0cy0xLgo+PiAr
CQkgKiBUaGlzIGxlYWRzIHRvIHVuZGVyZXN0aW1hdGluZyBpbnB1dCB2b2x0YWdlLiBUbwo+PiAr
CQkgKiBjb21wZW5zYXRlIHRoaXMgZGV2aWF0aW9uLCB0aGUgdm9sdGFnZSByZWZlcmVuY2UgY2Fu
IGJlCj4+ICsJCSAqIGNvcnJlY3RlZCB3aXRoIGEgZmFjdG9yID0gcmVhbGJpdHMgcmVzb2x1dGlv
biAvIGFjdHVhbCBtYXgKPj4gKwkJICovCj4+ICsJCWlmIChhZGMtPmJhY2tlbmRbaWR4XSkgewo+
PiArCQkJaWlvX2JhY2tlbmRfcmVhZF9yYXcoYWRjLT5iYWNrZW5kW2lkeF0sIHZhbCwgdmFsMiwg
bWFzayk7Cj4+ICsKPiAKPiBUaGlzIGlzIHNvbWV0aGluZyB0aGF0IEkndmUgYmVlbiB0aGlua2lu
ZyBhYm91dCBzaW5jZSB0aGUgYmVnaW5uaW5nIG9mIGJhY2tlbmRzCj4gc3VwcG9ydC4gQmFzaWNh
bGx5IGhhdmluZyB0aGUgImNhdGNoIGFsbCIgcmVhZF9yYXcoKS93cml0ZV9yYXcoKSBvciBtb3Jl
IGRlZGljYXRlZAo+IGludGVyZmFjZXMuIEZvciBleGFtcGxlLCBpbiB5b3VyIHVzZWNhc2UgSSB0
aGluayBpdCB3b3VsZCBtYWtlIG1vcmUgc2Vuc2UgdG8gaGF2ZQo+IGRlZGljYXRlZCBBUEkncyBs
aWtlIGlpb19iYWNrZW5kX3JlYWRfc2NhbGUoKSBhbmQgaWlvX2JhY2tlbmRfcmVhZF9vZmZzZXQo
KSBhcyB5b3UncmUKPiBleHRlbmRpbmcgdGhhdCBmdW5jdGlvbmFsaXR5LiBDYWxsaW5nIGlpb19i
YWNrZW5kX3JlYWRfcmF3KCkgc2VlbXMgYSBiaXQgd2VpcmQgdG8gbWUuCj4gCj4gT1RPSCwgaWlv
X2JhY2tlbmRfcmVhZF9yYXcoKSBjb3VsZCBiZSB1c2VmdWwgaW4gY2FzZXMgd2hlcmUgZnJvbnRl
bmRzIGNhbGwKPiBpaW9fYmFja2VuZF9leHRlbmRfY2hhbl9zcGVjKCkgYW5kIG1heSBnZXQgc29t
ZSBmdW5jdGlvbmFsaXR5IHRoZXkgYXJlIG5vdCBhd2FyZSBvZi4KPiBBbmQgc28sIGluIHRoZSBk
ZWZhdWx0OiBzdGF0ZW1lbnQgdGhpcyAiY2F0Y2ggYWxsIiBBUEkgY291bGQgYmUgdXNlZC4KPiAK
PiBBbnl3YXlzLCB0aGlzIGFyZSByZWFsbHkgbWlub3IgKGxpa2VseSBwZWRhbnRpYykgZGV0YWls
cyBhbmQgeW91IGtpbmQgb2YgY2FtZSBmaXJzdAo+IGFuZCBtYWRlIHRoZSBkZWNpc2lvbiBmb3Ig
bWUuIEFzIEkgZG9uJ3QgcmVhbGx5IGhhdmUgc3Ryb25nIGZlZWxpbmdzIGFib3V0IGl0LCBJJ20K
PiBmaW5lIHdpdGggaXQgYXMtaXMuCj4gCgpNeSBmaXJzdCBpZGVhIHdhcyB0byBzdGljayB0byBJ
SU8gcmVhZF9yYXcgQVBJICgnc3RydWN0IGlpb19jaGFuX3NwZWMgCmNvbnN0ICpjaGFuJyBzaG91
bGQgYXQgbGVhc3QgYmUgYWRkZWQgdG8gcHJvdG90eXBlIGFzIHlvdSBwb2ludGVkIGl0IApvdXQp
LiBCdXQgSSBhZ3JlZSB0aGF0IGlpb19iYWNrZW5kX3JlYWRfcmF3KCkgaXMgbm90IGV4cGxpY2l0
IHJlZ2FyZGluZyAKdGhlIHJlcXVlc3RlZCBpbmZvLgpJIGNvbnNpZGVyIHVzaW5nIHRoZSBleGlz
dGluZyBBUEkgaWlvX2JhY2tlbmRfZXh0X2luZm9fZ2V0KCkgZm9yIHYyLCBhcyAKeW91IHN1Z2dl
c3RlZC4KCkJScwpPbGl2aWVyCgo+PiArCQkJKnZhbCA9IGRpdl91NjQoKHU2NCkqdmFsICogKHU2
NClCSVQoREZTRE1fREFUQV9SRVMgLSAxKSwKPj4gbWF4KTsKPj4gKwkJCSp2YWwyID0gY2hhbi0+
c2Nhbl90eXBlLnJlYWxiaXRzOwo+PiArCQkJaWYgKGNoYW4tPmRpZmZlcmVudGlhbCkKPj4gKwkJ
CQkqdmFsICo9IDI7Cj4+ICsJCX0KPj4gKwkJcmV0dXJuIElJT19WQUxfRlJBQ1RJT05BTF9MT0cy
Owo+PiArCj4+ICsJY2FzZSBJSU9fQ0hBTl9JTkZPX09GRlNFVDoKPj4gKwkJLyoKPj4gKwkJICog
REZTRE0gb3V0cHV0IGRhdGEgYXJlIGluIHRoZSByYW5nZSBbLTJebiwyXm5dLAo+PiArCQkgKiB3
aXRoIG49cmVhbGJpdHMtMS4KPj4gKwkJICogLSBEaWZmZXJlbnRpYWwgbW9kdWxhdG9yOgo+PiAr
CQkgKiBPZmZzZXQgY29ycmVzcG9uZCB0byBTRCBtb2R1bGF0b3Igb2Zmc2V0Lgo+PiArCQkgKiAt
IFNpbmdsZSBlbmRlZCBtb2R1bGF0b3I6Cj4+ICsJCSAqIElucHV0IGlzIGluIFswVixWcmVmXSBy
YW5nZSwgd2hlcmUgMFYgY29ycmVzcG9uZHMgdG8gLTJebiwgYW5kCj4+IFZyZWYgdG8gMl5uLgo+
PiArCQkgKiBBZGQgMl5uIHRvIG9mZnNldC4gKGkuZS4gbWlkZGxlIG9mIGlucHV0IHJhbmdlKQo+
PiArCQkgKiBvZmZzZXQgPSBvZmZzZXQoc2QpICogdnJlZiAvIHJlcyhzZCkgKiBtYXggLyB2cmVm
Lgo+PiArCQkgKi8KPj4gKwkJaWYgKGFkYy0+YmFja2VuZFtpZHhdKSB7Cj4+ICsJCQlpaW9fYmFj
a2VuZF9yZWFkX3JhdyhhZGMtPmJhY2tlbmRbaWR4XSwgdmFsLCB2YWwyLCBtYXNrKTsKPj4gKwo+
PiArCQkJKnZhbCA9IGRpdl91NjQoKHU2NCltYXggKiAqdmFsLCBCSVQoKnZhbDIgLSAxKSk7Cj4+
ICsJCQlpZiAoIWNoYW4tPmRpZmZlcmVudGlhbCkKPj4gKwkJCQkqdmFsICs9IG1heDsKPj4gKwkJ
fQo+PiArCQlyZXR1cm4gSUlPX1ZBTF9JTlQ7Cj4+ICDCoAl9Cj4+ICAgCj4+ICDCoAlyZXR1cm4g
LUVJTlZBTDsKPj4gQEAgLTE0NDksNyArMTUyOCwxNSBAQCBzdGF0aWMgaW50IHN0bTMyX2Rmc2Rt
X2FkY19jaGFuX2luaXRfb25lKHN0cnVjdCBpaW9fZGV2Cj4+ICppbmRpb19kZXYsIHN0cnVjdCBp
aW9fYwo+PiAgwqAJICogSUlPX0NIQU5fSU5GT19SQVc6IHVzZWQgdG8gY29tcHV0ZSByZWd1bGFy
IGNvbnZlcnNpb24KPj4gIMKgCSAqIElJT19DSEFOX0lORk9fT1ZFUlNBTVBMSU5HX1JBVElPOiB1
c2VkIHRvIHNldCBvdmVyc2FtcGxpbmcKPj4gIMKgCSAqLwo+PiAtCWNoLT5pbmZvX21hc2tfc2Vw
YXJhdGUgPSBCSVQoSUlPX0NIQU5fSU5GT19SQVcpOwo+PiArCWlmIChjaGlsZCkgewo+PiArCQlj
aC0+aW5mb19tYXNrX3NlcGFyYXRlID0gQklUKElJT19DSEFOX0lORk9fUkFXKSB8Cj4+ICsJCQkJ
CUJJVChJSU9fQ0hBTl9JTkZPX1NDQUxFKSB8Cj4+ICsJCQkJCUJJVChJSU9fQ0hBTl9JTkZPX09G
RlNFVCk7Cj4gCj4gTm90IHN1cmUgaWYgdGhlIGFib3ZlIFNDQUxFIGFuZCBPRkZTRVQgYXJlIHNv
bGVseSBwcm9wZXJ0aWVzIGlmIHRoZSBiYWNrZW5kLiBJZiBzbywKPiB5b3UgY291bGQgbWF5YmUg
dXNlIGlpb19iYWNrZW5kX2V4dGVuZF9jaGFuX3NwZWMoKS4KPiAKPiAtIE51bm8gU8OhCj4gCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
