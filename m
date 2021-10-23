Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 619CE438528
	for <lists+linux-stm32@lfdr.de>; Sat, 23 Oct 2021 22:09:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12911C57B6C;
	Sat, 23 Oct 2021 20:09:18 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr
 [80.12.242.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AF9AC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Oct 2021 20:09:16 +0000 (UTC)
Received: from [192.168.1.18] ([92.140.161.106]) by smtp.orange.fr with ESMTPA
 id eNKMmCzHkTdRTeNKMmKPAW; Sat, 23 Oct 2021 22:09:16 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 23 Oct 2021 22:09:16 +0200
X-ME-IP: 92.140.161.106
To: Joe Perches <joe@perches.com>, mathieu.poirier@linaro.org,
 suzuki.poulose@arm.com, mike.leach@linaro.org, leo.yan@linaro.org,
 alexander.shishkin@linux.intel.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
References: <e5fe23370794e2f5442e11e7f8455ddb06e4b10a.1635016943.git.christophe.jaillet@wanadoo.fr>
 <663d3820f118c37a81529b3362b95e09c8e75e9f.camel@perches.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <bb913ce7-bae6-3b3e-180f-946786f7d300@wanadoo.fr>
Date: Sat, 23 Oct 2021 22:09:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <663d3820f118c37a81529b3362b95e09c8e75e9f.camel@perches.com>
Content-Language: en-US
Cc: coresight@lists.linaro.org, kernel-janitors@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] coresight: Use devm_bitmap_zalloc when
	applicable
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

TGUgMjMvMTAvMjAyMSDDoCAyMTozNiwgSm9lIFBlcmNoZXMgYSDDqWNyaXTCoDoKPiBPbiBTYXQs
IDIwMjEtMTAtMjMgYXQgMjE6MjQgKzAyMDAsIENocmlzdG9waGUgSkFJTExFVCB3cm90ZToKPj4g
J2RydmRhdGEtPmNocy5ndWFyYW50ZWVkJyBpcyBhIGJpdG1hcC4gU28gdXNlICdkZXZtX2JpdG1h
cF9remFsbG9jKCknIHRvCj4+IHNpbXBsaWZ5IGNvZGUsIGltcHJvdmUgdGhlIHNlbWFudGljIGFu
ZCBhdm9pZCBzb21lIG9wZW4tY29kZWQgYXJpdGhtZXRpYwo+PiBpbiBhbGxvY2F0b3IgYXJndW1l
bnRzLgo+IFtdCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29y
ZXNpZ2h0LXN0bS5jIGIvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1zdG0u
Ywo+IFtdCj4+IEBAIC04NjIsNyArODYyLDYgQEAgc3RhdGljIGludCBzdG1fcHJvYmUoc3RydWN0
IGFtYmFfZGV2aWNlICphZGV2LCBjb25zdCBzdHJ1Y3QgYW1iYV9pZCAqaWQpCj4+ICAgCXN0cnVj
dCBzdG1fZHJ2ZGF0YSAqZHJ2ZGF0YTsKPj4gICAJc3RydWN0IHJlc291cmNlICpyZXMgPSAmYWRl
di0+cmVzOwo+PiAgIAlzdHJ1Y3QgcmVzb3VyY2UgY2hfcmVzOwo+PiAtCXNpemVfdCBiaXRtYXBf
c2l6ZTsKPj4gICAJc3RydWN0IGNvcmVzaWdodF9kZXNjIGRlc2MgPSB7IDAgfTsKPj4gICAKPj4g
ICAJZGVzYy5uYW1lID0gY29yZXNpZ2h0X2FsbG9jX2RldmljZV9uYW1lKCZzdG1fZGV2cywgZGV2
KTsKPj4gQEAgLTkwNCw5ICs5MDMsNyBAQCBzdGF0aWMgaW50IHN0bV9wcm9iZShzdHJ1Y3QgYW1i
YV9kZXZpY2UgKmFkZXYsIGNvbnN0IHN0cnVjdCBhbWJhX2lkICppZCkKPj4gICAJZWxzZQo+PiAg
IAkJZHJ2ZGF0YS0+bnVtc3AgPSBzdG1fbnVtX3N0aW11bHVzX3BvcnQoZHJ2ZGF0YSk7Cj4+ICAg
Cj4+IC0JYml0bWFwX3NpemUgPSBCSVRTX1RPX0xPTkdTKGRydmRhdGEtPm51bXNwKSAqIHNpemVv
Zihsb25nKTsKPj4gLQo+PiAtCWd1YXJhbnRlZWQgPSBkZXZtX2t6YWxsb2MoZGV2LCBiaXRtYXBf
c2l6ZSwgR0ZQX0tFUk5FTCk7Cj4+ICsJZ3VhcmFudGVlZCA9IGRldm1fYml0bWFwX3phbGxvYyhk
ZXYsIGRydmRhdGEtPm51bXNwLCBHRlBfS0VSTkVMKTsKPj4gICAJaWYgKCFndWFyYW50ZWVkKQo+
PiAgIAkJcmV0dXJuIC1FTk9NRU07Cj4+ICAgCWRydmRhdGEtPmNocy5ndWFyYW50ZWVkID0gZ3Vh
cmFudGVlZDsKPiAKPiBndWFyYW50ZWVkIGlzIGFsc28gcHJldHR5IHVzZWxlc3MKPiAKCkkgYWdy
ZWUsIGJ1dCByZW1vdmluZyBpdCB3b3VsZCBtYWtlIHRoZSBsaW5lIHdpdGggZGV2bV9iaXRtYXBf
emFsbG9jKCkgCjg2IGNoYXJzLiBUaGlzIHdvdWxkIG5vdCBiZSBjb25zaXN0ZW50IHdpdGggdGhl
IHJlc3Qgb2YgdGhlIGZpbGUgYW5kIAp3b3VsZCAoSU1ITykgcmVxdWlyZSBzcGxpdHRpbmcuCgpM
ZXQgc2VlIGlmIHRoZSBtYWludGFpbmVyIHByZWZlciBzYXZpbmcgb25lIGFkZGl0aW9uYWwgbGlu
ZSBvZiBjb2RlLCBvciAKa2VlcGluZyB0aGUgbG9naWMgaW4gcGxhY2UuCgpDSgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
