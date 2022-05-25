Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E6853376A
	for <lists+linux-stm32@lfdr.de>; Wed, 25 May 2022 09:35:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45921C03FCA;
	Wed, 25 May 2022 07:35:32 +0000 (UTC)
Received: from cmccmta3.chinamobile.com (cmccmta3.chinamobile.com
 [221.176.66.81])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F141C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 May 2022 07:35:29 +0000 (UTC)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.3])
 by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee9628ddc3ff21-0327b;
 Wed, 25 May 2022 15:35:28 +0800 (CST)
X-RM-TRANSID: 2ee9628ddc3ff21-0327b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [192.168.26.114] (unknown[10.42.68.12])
 by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee2628ddc3e16d-c8e67;
 Wed, 25 May 2022 15:35:27 +0800 (CST)
X-RM-TRANSID: 2ee2628ddc3e16d-c8e67
To: Olivier MOYSAN <olivier.moysan@foss.st.com>,
 Mark Brown <broonie@kernel.org>
References: <20220519124235.21100-1-tangbin@cmss.chinamobile.com>
 <69d5cef3-57c0-9bc7-a83b-a85ef1c4cf29@foss.st.com>
 <YovZAf4S0XphBsco@sirena.org.uk>
 <3fb8d7f8-4506-3b28-22cb-863bda1f21c8@cmss.chinamobile.com>
 <d5ab354a-eb10-d31c-d55e-46a4c4d1a4ce@foss.st.com>
From: tangbin <tangbin@cmss.chinamobile.com>
Message-ID: <cd375914-a3e6-37c7-4a16-551937006f92@cmss.chinamobile.com>
Date: Wed, 25 May 2022 15:36:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d5ab354a-eb10-d31c-d55e-46a4c4d1a4ce@foss.st.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, mcoquelin.stm32@gmail.com,
 arnaud.pouliquen@foss.st.com, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm32: sai: Use
 of_device_get_match_data()tosimplify code
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

SGkgT2xpdmllcu+8mgoKT24gMjAyMi81LzI0IDIyOjMwLCBPbGl2aWVyIE1PWVNBTiB3cm90ZToK
PiBIaSBUYW5nLAo+Cj4gT24gNS8yNC8yMiAwMzo0NCwgdGFuZ2JpbiB3cm90ZToKPj4gSGkgTWFy
ayAmIE9saXZpZXLvvJoKPj4KPj4gT24gMjAyMi81LzI0IDI6NTcsIE1hcmsgQnJvd24gd3JvdGU6
Cj4+PiBPbiBNb24sIE1heSAyMywgMjAyMiBhdCAwMzoyODo0OFBNICswMjAwLCBPbGl2aWVyIE1P
WVNBTiB3cm90ZToKPj4+Cj4+Pj4gVGhlIGN1cnJlbnQgcGF0Y2ggcmVxdWlyZXMgYSBjaGFuZ2Ug
aW4gdGhlIGRyaXZlci4KPj4+PiBFaXRoZXIgY2hhbmdpbmcgU1RNX1NBSV94X0lEIGVudW1zLCBv
ciByZXBsYWNpbmcgZGF0YSBieSBhIHN0cnVjdC4KPj4+PiBGb3IgaW5zdGFuY2U6Cj4+Pj4gc3Ry
dWN0IHN0bTMyX3NhaV9jb21wX2RhdGEgewo+Pj4+IMKgwqDCoMKgdW5zaWduZWQgaW50IGlkOwo+
Pj4+IH0KPj4+PiBzdHJ1Y3Qgc3RtMzJfc2FpX2NvbXBfZGF0YSBzdG0zMl9zYWlfY29tcF9kYXRh
X2EgPSB7Cj4+Pj4gwqDCoMKgwqAuaWQgPSBTVE1fU0FJX0FfSUQ7Cj4+Pj4gfQo+Pj4+IHN0cnVj
dCBvZl9kZXZpY2VfaWQgc3RtMzJfc2FpX3N1Yl9pZHNbXSA9IHsKPj4+PiDCoMKgwqDCoC5kYXRh
ID0gJnN0bTMyX3NhaV9jb21wX2RhdGFfYX0sCj4+Pj4gfQo+Pj4gRWl0aGVyIGFwcHJvYWNoIHdv
cmtzIGZvciBtZSAob3IgYSByZXZlcnQgZm9yIHRoYXQgbWF0dGVyKS4KPj4KPj4gwqDCoMKgwqAg
VGhhbmtzIGZvciB5b3VyIGFkdmljZSwgSSB3YXMgdGhvdWdodGxlc3MuCj4+Cj4+IMKgwqDCoMKg
IEkgdGhpbmsgY2hhbmdlIHRoZSBkYXRlIG9mIFNUTV9TQUlfeF9JRCBtYXliZSBzaW1wbGUuIEJ1
dCBpZiB3ZSAKPj4gZG9uJ3QgY2hhbmdlIHRoZSBpZCwKPj4KPj4gd2hhdCBhYm91dCBhZGQgYSAi
I2RlZmluZSIgbGlrZSB0aGUgbGluZSA0NzoKPj4KPj4gI2RlZmluZSBTVE1fU0FJX0lTX1NVQih4
KSAoKHgpLT5pZCA9PSBTVE1fU0FJX0FfSUQgfHwgKHgpLT5pZCA9PSAKPj4gU1RNX1NBSV9CX0lE
KQo+Pgo+PiB0aGVuIGluIHRoZSBqdWRnZW1lbnQsIHd1IHVzZToKPj4KPj4gwqDCoMKgwqAgc2Fp
LT5pZCA9ICh1aW50cHRyX3Qpb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOwo+
Pgo+PiDCoMKgwqDCoCBpZiAoIVNUTV9TQUlfSVNfU1VCKHNhaSkpCj4+Cj4+IMKgwqDCoMKgIMKg
wqDCoCDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+Cj4+Cj4+IGlmIHlvdSB0aGluayB0aGF0J3Mg
b2ssIEkgd2lsbCBzZW5kIHBhdGNoIHYyIGZvciB5b3UgLgo+Pgo+Cj4gSWYgd2UgYWxsb3cgbnVs
bCB2YWx1ZSBpbiBTVE1fU0FJX0lTX1NVQihzYWkpIGNoZWNrLCB3ZSBjYW4gbWlzcyByZWFsIAo+
IE5VTEwgcG9pbnRlciBlcnJvciBmcm9tIG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgpLgo+Cj4g
VGhlIHNpbXBsZXN0IHdheSBpcyB0byBjaGFuZ2UgU1RNX1NBSV94X0lEIGVudW1zIEkgdGhpbmsu
Cj4gQnV0IGhvbm5lc3RseSwgSSBmZWVsIG1vcmUgY29tZm9ydGFibGUgdG8gbGV0IHRoZSBkcml2
ZXIgdW5jaGFuZ2VkLgo+Ck9o77yMeW91IGFyZSByaWdodCwgSSBhbSBzb3JyeS4KClBsZWFzZSBm
b3JnZXQgdGhpcyBwYXRjaCwgSSdtIHNvcnJ5IHRvIGhhdmUgd2FzdGVkIHlvdXIgdGltZS4KCkJ1
dCBJIHNhdyBzb21lIGNvZGVzIGlzIHVzZWxlc3MgaW4gdGhlIGxpbmUgNDggJiBsaW5lIDQ5LCBJ
IHRoaW5rIHdlIGNhbiAKcmVtb3ZlIGl0LgoKSWYgeW91IHRoaW5rIHNvLCBJIHdpbGwgc2VuZCB0
aGlzIHBhdGNoIGZvciB5b3UuCgoKVGhhbmtzCgpUYW5nIEJpbgoKCj4gQlJzCj4gT2xpdmllcgo+
Cj4+IFRoYW5rcwo+Pgo+PiBUYW5nIEJpbgo+Pgo+PgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
