Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9106BA073F5
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2025 11:58:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F4E4C78F67;
	Thu,  9 Jan 2025 10:58:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A61EC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 10:58:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB11413D5;
 Thu,  9 Jan 2025 02:58:33 -0800 (PST)
Received: from [10.57.32.219] (unknown [10.57.32.219])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A96303F673;
 Thu,  9 Jan 2025 02:58:03 -0800 (PST)
Message-ID: <b1beee50-2f7d-4f5a-9bb0-20f0659a1240@arm.com>
Date: Thu, 9 Jan 2025 10:58:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20241111110922.334610-2-u.kleine-koenig@baylibre.com>
 <87h68duaez.fsf@ubik.fi.intel.com>
 <a4168463-98e3-4048-bb38-ffc96983766f@arm.com>
In-Reply-To: <a4168463-98e3-4048-bb38-ffc96983766f@arm.com>
Cc: coresight@lists.linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 James Clark <james.clark@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] hwtracing: Switch back to struct
 platform_driver::remove()
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

T24gMTEvMTEvMjAyNCAxNDo0NywgU3V6dWtpIEsgUG91bG9zZSB3cm90ZToKPiBIaQo+IAo+IE9u
IDExLzExLzIwMjQgMTQ6MTIsIEFsZXhhbmRlciBTaGlzaGtpbiB3cm90ZToKPj4gVXdlIEtsZWlu
ZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+IHdyaXRlczoKPj4KPj4+IEFm
dGVyIGNvbW1pdCAwZWRiNTU1YTY1ZDEgKCJwbGF0Zm9ybTogTWFrZSBwbGF0Zm9ybV9kcml2ZXI6
OnJlbW92ZSgpCj4+PiByZXR1cm4gdm9pZCIpIC5yZW1vdmUoKSBpcyAoYWdhaW4pIHRoZSByaWdo
dCBjYWxsYmFjayB0byBpbXBsZW1lbnQgZm9yCj4+PiBwbGF0Zm9ybSBkcml2ZXJzLgo+Pj4KPj4+
IENvbnZlcnQgYWxsIHBsYXRmb3JtIGRyaXZlcnMgYmVsb3cgZHJpdmVycy9od3RyYWNpbmcgdG8g
dXNlIC5yZW1vdmUoKSwKPj4+IHdpdGggdGhlIGV2ZW50dWFsIGdvYWwgdG8gZHJvcCBzdHJ1Y3Qg
cGxhdGZvcm1fZHJpdmVyOjpyZW1vdmVfbmV3KCkuIEFzCj4+PiAucmVtb3ZlKCkgYW5kIC5yZW1v
dmVfbmV3KCkgaGF2ZSB0aGUgc2FtZSBwcm90b3R5cGVzLCBjb252ZXJzaW9uIGlzIGRvbmUKPj4+
IGJ5IGp1c3QgY2hhbmdpbmcgdGhlIHN0cnVjdHVyZSBtZW1iZXIgbmFtZSBpbiB0aGUgZHJpdmVy
IGluaXRpYWxpemVyLgo+Pj4KPj4+IEFsc28gYWRhcHQgc29tZSB3aGl0ZXNwYWNlIHRvIG1ha2Ug
aW5kZW50aW9uIGNvbnNpc3RlbnQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1L
w7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+Cj4+Cj4+IEFja2VkLWJ5OiBBbGV4
YW5kZXIgU2hpc2hraW4gPGFsZXhhbmRlci5zaGlzaGtpbkBsaW51eC5pbnRlbC5jb20+Cj4+Cj4+
PiAtLS0KPj4+IEhlbGxvLAo+Pj4KPj4+IEkgZGlkIGEgc2luZ2xlIHBhdGNoIGZvciBhbGwgb2Yg
ZHJpdmVycy9od3RyYWNpbmcuIFdoaWxlIEkgdXN1YWxseQo+Pj4gcHJlZmVyIHRvIGRvIG9uZSBs
b2dpY2FsIGNoYW5nZSBwZXIgcGF0Y2gsIHRoaXMgc2VlbXMgdG8gYmUKPj4+IG92ZXJlbmdpbmVl
cmluZyBoZXJlIGFzIHRoZSBpbmRpdmlkdWFsIGNoYW5nZXMgYXJlIHJlYWxseSB0cml2aWFsIGFu
ZAo+Pj4gc2hvdWxkbid0IGJlIG11Y2ggaW4gdGhlIHdheSBmb3Igc3RhYmxlIGJhY2twb3J0cy4g
QnV0IEknbGwgaGFwcGlseQo+Pj4gc3BsaXQgdGhlIHBhdGNoIGlmIHlvdSBwcmVmZXIgaXQgc3Bs
aXQuIE1heWJlIHNwbGl0IGZvciBjb3Jlc2lnaHQgdnMuCj4+PiBpbnRlbF90aD8gQWxzbyBpZiB5
b3Ugb2JqZWN0IHRoZSBpbmRlbnRhdGlvbiBzdHVmZiwgSSBjYW4gcmV3b3JrIHRoYXQuCj4+Cj4+
IEknbSBmaW5lIHdpdGggaXQgYXMgaXMuCj4+Cj4+PiBUaGlzIGlzIGJhc2VkIG9uIHRvZGF5J3Mg
bmV4dCwgaWYgY29uZmxpY3RzIGFyaXNlIHdoZW4geW91IGFwcGx5IGl0IGF0Cj4+PiBzb21lIGxh
dGVyIHRpbWUgYW5kIGRvbid0IHdhbnQgdG8gcmVzb2x2ZSB0aGVtLCBmZWVsIGZyZWUgdG8ganVz
dCBkcm9wCj4+PiB0aGUgY2hhbmdlcyB0byB0aGUgY29uZmxpY3RpbmcgZmlsZXMuIEknbGwgbm90
aWNlIGFuZCBmb2xsb3d1cCBhdCBhCj4+PiBsYXRlciB0aW1lIHRoZW4uIE9yIGFzayBtZSBmb3Ig
YSBmaXhlZCByZXNlbmQuIChIYXZpbmcgc2FpZCB0aGF0LCBJCj4+PiByZWNvbW1lbmQgYjQgYW0g
LTMgKyBnaXQgYW0gLTMgd2hpY2ggc2hvdWxkIHJlc29sdmUgbW9zdCBjb25mbGljdHMganVzdAo+
Pj4gZmluZS4pCj4+Cj4+IERvZXMgYW55Ym9keSB3YW50IHRvIHBpY2sgdGhpcyB1cCBvciBzaG91
bGQgST8gSSdtIGZpbmUgZWl0aGVyIHdheSwgYnV0Cj4+IGlmIHRoZXJlIGFyZSBhbnkgY29uZmxp
Y3RzIHRoZXkgd29uJ3QgYmUgZnJvbSBteSBlbmQgb2YgdGhpbmdzLCBzbyBpdAo+PiBtaWdodCBt
YWtlIHNlbnNlIHRvIHRha2UgaXQgdmlhIHRoZSBjb3Jlc2lnaHQgcGF0aC4KPiAKPiBJIGFtIGhh
cHB5IHRvIHRha2UgdGhlbSB2aWEgY29yZXNpZ2h0IHRyZWUgYW5kIHF1ZXVlIHRoZW0gZm9yIHY2
LjE0CgoKSSBzZWUgdGhhdCBMaW51cyBoYXMgcXVldWVkIHRoaXMgYWxyZWFkeQoKU3V6dWtpCgoK
PiAKPiBTdXp1a2kKPiAKPj4KPj4gVGhhbmtzLAo+PiAtLSAKPj4gQWxleAo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
