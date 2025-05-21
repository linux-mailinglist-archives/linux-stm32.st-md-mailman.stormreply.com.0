Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C43ABF080
	for <lists+linux-stm32@lfdr.de>; Wed, 21 May 2025 11:52:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FB8CC78F8C;
	Wed, 21 May 2025 09:52:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26E69C78F6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 May 2025 09:52:53 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L8WjP4012800;
 Wed, 21 May 2025 11:52:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 OHCrVLLAGlouvcMb1tlHih+m6bTWke9YqMBcp1oO9Vk=; b=BkFXkMX3H7zyFr2c
 MHSey3reiprVN7T5LDv3bR145OYKa3jLTzqo6ZvVVG0MOCQfX9xz9Truk0PRXnIZ
 PVpBQFkKBA5SdRd1GRC0esDMHsHJaY+5divF1lcfn5u31ygADHmFlwQf9a7QljDt
 8PAWIi5OHHuMTewIp/LFRr8vsGKSu+f5gxeyY3WypE6sjvKRgC3d8t2fV24hz1Om
 h2rKVlpD81IjyL5pgJoTiQsK44nA2S9BBIN0Pxv1X7yljLUSerjndCAxcMPcD9F+
 e7+RDbpF++ZyEl8es1kMy9w6TFj7GsI7UKhT/Jv7pValL+DykGrCRuO++OGn27SE
 Dz5Igw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfabc0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 May 2025 11:52:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EA0E74004B;
 Wed, 21 May 2025 11:51:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 486ECAA8652;
 Wed, 21 May 2025 11:49:49 +0200 (CEST)
Received: from [10.48.81.67] (10.48.81.67) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 11:49:48 +0200
Message-ID: <94795d0c-0c73-41eb-ada6-9a01b2ac5892@foss.st.com>
Date: Wed, 21 May 2025 11:49:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Linus Walleij <linus.walleij@linaro.org>
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
 <20250520-hdp-upstream-v2-2-53f6b8b5ffc8@foss.st.com>
 <CACRpkdZp6D-duzyVRLv5+PURb3Nu69njJx_33D-2aYS4DjmsoQ@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CACRpkdZp6D-duzyVRLv5+PURb3Nu69njJx_33D-2aYS4DjmsoQ@mail.gmail.com>
X-Originating-IP: [10.48.81.67]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_03,2025-05-20_03,2025-03-28_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/8] pinctrl: stm32: Introduce HDP
	driver
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

T24gNS8yMS8yNSAwMDozNCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiBIaSBDbMOpbWVudCwKPiAK
PiB0aGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4gCj4gT24gVHVlLCBNYXkgMjAsIDIwMjUgYXQgNTow
NOKAr1BNIENsw6ltZW50IExlIEdvZmZpYwo+IDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29t
PiB3cm90ZToKPiAKPj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2UgdGhlIGRyaXZlciBmb3IgdGhlIEhh
cmR3YXJlIERlYnVnIFBvcnQgYXZhaWxhYmxlIG9uCj4+IFNUTTMyTVAgcGxhdGZvcm1zLiBUaGUg
SERQIGFsbG93cyB0aGUgb2JzZXJ2YXRpb24gb2YgaW50ZXJuYWwgU29DCj4+IHNpZ25hbHMgYnkg
dXNpbmcgbXVsdGlwbGV4ZXJzLiBFYWNoIEhEUCBwb3J0IGNhbiBwcm92aWRlIHVwIHRvIDE2Cj4+
IGludGVybmFsIHNpZ25hbHMgKG9uZSBvZiB0aGVtIGNhbiBiZSBzb2Z0d2FyZSBjb250cm9sbGVk
IGFzIGEgR1BPKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVt
ZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgo+IAo+ICguLi4pCj4+ICtzdGF0aWMgaW50IHN0bTMy
X2hkcF9ncGlvX2dldF9kaXJlY3Rpb24oc3RydWN0IGdwaW9fY2hpcCAqZ2MsIHVuc2lnbmVkIGlu
dCBvZmZzZXQpCj4+ICt7Cj4+ICsgICAgICAgcmV0dXJuIEdQSU9fTElORV9ESVJFQ1RJT05fT1VU
Owo+PiArfQo+IAo+IFRoYXQncyByZWFzb25hYmxlLgo+IAo+PiArc3RhdGljIGludCBzdG0zMl9o
ZHBfZ3Bpb19nZXQoc3RydWN0IGdwaW9fY2hpcCAqZ2MsIHVuc2lnbmVkIGludCBvZmZzZXQpCj4+
ICt7Cj4+ICsgICAgICAgc3RydWN0IHN0bTMyX2hkcCAqaGRwID0gZ3Bpb2NoaXBfZ2V0X2RhdGEo
Z2MpOwo+PiArCj4+ICsgICAgICAgaWYgKCgoaGRwLT5tdXhfY29uZiAmIEhEUF9NVVhfTUFTSyhv
ZmZzZXQpKSkgPT0gSERQX01VWF9HUE9WQUwob2Zmc2V0KSkKPj4gKyAgICAgICAgICAgICAgIHJl
dHVybiAhIShyZWFkbF9yZWxheGVkKGhkcC0+YmFzZSArIEhEUF9HUE9WQUwpICYgQklUKG9mZnNl
dCkpOwo+PiArICAgICAgIGVsc2UKPj4gKyAgICAgICAgICAgICAgIHJldHVybiAhIShyZWFkbF9y
ZWxheGVkKGhkcC0+YmFzZSArIEhEUF9WQUwpICYgQklUKG9mZnNldCkpOwo+PiArfQo+IAo+IC4u
LmJ1dCB5b3Ugc3RpbGwgbWFrZSBpdCBwb3NzaWJsZSB0byByZWFkIHRoZSB2YWx1ZSBvZiB0aGUg
bGluZQo+IGlmIGl0J3Mgbm90IG11eGVkIGFzIEdQTz8KPiAKPiBTaG91bGQgaXQgbm90IHN0bTMy
X2hkcF9ncGlvX2dldF9kaXJlY3Rpb24oKSByZXR1cm4KPiBHUElPX0xJTkVfRElSRUNUSU9OX0lO
IGlmIEhEUF9NVVhfTUFTSyhvZmZzZXQpKSkgIT0gSERQX01VWF9HUE9WQUwob2Zmc2V0KT8KCkhp
LCBvb3BzLCB5b3UncmUgcmlnaHQgIQoKPiAKPj4gK3N0YXRpYyB2b2lkIHN0bTMyX2hkcF9ncGlv
X3NldChzdHJ1Y3QgZ3Bpb19jaGlwICpnYywgdW5zaWduZWQgaW50IG9mZnNldCwgaW50IHZhbHVl
KQo+PiArewo+PiArICAgICAgIHN0cnVjdCBzdG0zMl9oZHAgKmhkcCA9IGdwaW9jaGlwX2dldF9k
YXRhKGdjKTsKPj4gKwo+PiArICAgICAgIGlmICh2YWx1ZSkKPj4gKyAgICAgICAgICAgICAgIHdy
aXRlbF9yZWxheGVkKEJJVChvZmZzZXQpLCBoZHAtPmJhc2UgKyBIRFBfR1BPU0VUKTsKPj4gKyAg
ICAgICBlbHNlCj4+ICsgICAgICAgICAgICAgICB3cml0ZWxfcmVsYXhlZChCSVQob2Zmc2V0KSwg
aGRwLT5iYXNlICsgSERQX0dQT0NMUik7Cj4+ICt9Cj4gCj4gQ2FuJ3QgeW91IGp1c3QgdXNlIEdQ
SU9fR0VORVJJQyBmb3IgdGhpcz8KPiAKPiBiZ3Bpb19pbml0KGdjLCBkZXYsIEFSUkFZX1NJWkUo
c3RtMzJfaGRwX3BpbnMpLCAvLyA9PSA4Cj4gICAgICBoZHAtPmJhc2UgKyBIRFBfVkFMLAo+ICAg
ICAgaGRwLT5iYXNlICsgSERQX0dQT1NFVCwKPiAgICAgIGhkcC0+YmFzZSArIEhEUF9HUE9DTFIs
Cj4gICAgICBOVUxMLAo+ICAgICAgTlVMTCwKPiAgICAgIDApOwo+IAo+IFRoZSBkZWZhdWx0IGJl
aGF2aW91ciBvZiBHUElPIE1NSU8gaXMgdG8gcmVhZCB0aGUgb3V0cHV0IHJlZ2lzdGVyCj4gZm9y
IHRoZSB2YWx1ZSBpZiB0aGUgbGluZSBpcyBpbiBvdXRwdXQgbW9kZS4KPiAKPiBZb3UgbWF5IHdh
bm5hIG92ZXJyaWRlIHRoZSAuZ2V0X2RpcmVjdGlvbigpIGNhbGxiYWNrIGFmdGVyIGJncGlvX2lu
aXQoKQo+IGFuZCBiZWZvcmUgcmVnaXN0ZXJpbmcgdGhlIGNoaXAsIGVpdGhlciB3aXRoIHdoYXQg
eW91IGhhdmUgb3Igd2hhdAo+IEkgZGVzY3JpYmVkIGFib3ZlLgoKSSBkaWRuJ3Qga25vdyBhYm91
dCBpdCwgSSdsbCB0YWtlIGEgbG9vayBhbmQgcHJvdmlkZSBhIFYzLgoKVGhhbmsgeW91LAoKQ2zD
qW1lbnQKCj4gWW91cnMsCj4gTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
