Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE98ABF138
	for <lists+linux-stm32@lfdr.de>; Wed, 21 May 2025 12:16:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5762C78F8C;
	Wed, 21 May 2025 10:16:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B015C78F6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 May 2025 10:16:17 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9l708029646;
 Wed, 21 May 2025 12:16:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 mzFSpe7hA7gsH1lLUxy+lsRSjB0E3F7awJ9YqjsAY4c=; b=L9Lrz04iPTNTANgU
 AKn3QsTq5dcgGz47H847d41uhxzoY61n5IoRI0nrz4Co/AAerPLM1nXJl+Gka6Mc
 xpuoprRQrzPLxjwWcHd9ywcv89aIa8MmPt+Uy52O5UtBbHAlI3XGZRunVv4vpF5T
 zoLxA2NfNvHX6g/Qp+eIgppFFmFngRtaNv7H2b5BG3ao/A0ir6Ne6QOhq1UU4MwP
 dMw0y5vMCCR+2d5Cce7ik92e1mbry3KRzGFu/EMaQIJG+1Tj1ohirKJRub5LVpxF
 K19jwKBV9gMhfIVdLueGckH8Dmzc9uU7fB4TW8smZAsFyOZNmin++aI5/zBp2a03
 Ni/JnA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwff3fgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 May 2025 12:16:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B70F940045;
 Wed, 21 May 2025 12:14:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14265BAEB1E;
 Wed, 21 May 2025 12:14:10 +0200 (CEST)
Received: from [10.48.81.67] (10.48.81.67) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 12:14:09 +0200
Message-ID: <929f6f1f-d47f-4954-8c8b-91c932127975@foss.st.com>
Date: Wed, 21 May 2025 12:14:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
 <20250520-hdp-upstream-v2-2-53f6b8b5ffc8@foss.st.com>
 <CACRpkdZp6D-duzyVRLv5+PURb3Nu69njJx_33D-2aYS4DjmsoQ@mail.gmail.com>
 <94795d0c-0c73-41eb-ada6-9a01b2ac5892@foss.st.com>
Content-Language: en-US
In-Reply-To: <94795d0c-0c73-41eb-ada6-9a01b2ac5892@foss.st.com>
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

T24gNS8yMS8yNSAxMTo0OSwgQ2xlbWVudCBMRSBHT0ZGSUMgd3JvdGU6Cj4gT24gNS8yMS8yNSAw
MDozNCwgTGludXMgV2FsbGVpaiB3cm90ZToKPj4gSGkgQ2zDqW1lbnQsCj4+Cj4+IHRoYW5rcyBm
b3IgeW91ciBwYXRjaCEKPj4KPj4gT24gVHVlLCBNYXkgMjAsIDIwMjUgYXQgNTowNOKAr1BNIENs
w6ltZW50IExlIEdvZmZpYwo+PiA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4gd3JvdGU6
Cj4+Cj4+PiBUaGlzIHBhdGNoIGludHJvZHVjZSB0aGUgZHJpdmVyIGZvciB0aGUgSGFyZHdhcmUg
RGVidWcgUG9ydCBhdmFpbGFibGUgb24KPj4+IFNUTTMyTVAgcGxhdGZvcm1zLiBUaGUgSERQIGFs
bG93cyB0aGUgb2JzZXJ2YXRpb24gb2YgaW50ZXJuYWwgU29DCj4+PiBzaWduYWxzIGJ5IHVzaW5n
IG11bHRpcGxleGVycy4gRWFjaCBIRFAgcG9ydCBjYW4gcHJvdmlkZSB1cCB0byAxNgo+Pj4gaW50
ZXJuYWwgc2lnbmFscyAob25lIG9mIHRoZW0gY2FuIGJlIHNvZnR3YXJlIGNvbnRyb2xsZWQgYXMg
YSBHUE8pLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVu
dC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KPj4KPj4gKC4uLikKPj4+ICtzdGF0aWMgaW50IHN0bTMy
X2hkcF9ncGlvX2dldF9kaXJlY3Rpb24oc3RydWN0IGdwaW9fY2hpcCAqZ2MsIAo+Pj4gdW5zaWdu
ZWQgaW50IG9mZnNldCkKPj4+ICt7Cj4+PiArwqDCoMKgwqDCoMKgIHJldHVybiBHUElPX0xJTkVf
RElSRUNUSU9OX09VVDsKPj4+ICt9Cj4+Cj4+IFRoYXQncyByZWFzb25hYmxlLgo+Pgo+Pj4gK3N0
YXRpYyBpbnQgc3RtMzJfaGRwX2dwaW9fZ2V0KHN0cnVjdCBncGlvX2NoaXAgKmdjLCB1bnNpZ25l
ZCBpbnQgCj4+PiBvZmZzZXQpCj4+PiArewo+Pj4gK8KgwqDCoMKgwqDCoCBzdHJ1Y3Qgc3RtMzJf
aGRwICpoZHAgPSBncGlvY2hpcF9nZXRfZGF0YShnYyk7Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKg
IGlmICgoKGhkcC0+bXV4X2NvbmYgJiBIRFBfTVVYX01BU0sob2Zmc2V0KSkpID09IAo+Pj4gSERQ
X01VWF9HUE9WQUwob2Zmc2V0KSkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiAhIShyZWFkbF9yZWxheGVkKGhkcC0+YmFzZSArIEhEUF9HUE9WQUwpICYgCj4+PiBCSVQo
b2Zmc2V0KSk7Cj4+PiArwqDCoMKgwqDCoMKgIGVsc2UKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAhIShyZWFkbF9yZWxheGVkKGhkcC0+YmFzZSArIEhEUF9WQUwpICYg
Cj4+PiBCSVQob2Zmc2V0KSk7Cj4+PiArfQo+Pgo+PiAuLi5idXQgeW91IHN0aWxsIG1ha2UgaXQg
cG9zc2libGUgdG8gcmVhZCB0aGUgdmFsdWUgb2YgdGhlIGxpbmUKPj4gaWYgaXQncyBub3QgbXV4
ZWQgYXMgR1BPPwo+Pgo+PiBTaG91bGQgaXQgbm90IHN0bTMyX2hkcF9ncGlvX2dldF9kaXJlY3Rp
b24oKSByZXR1cm4KPj4gR1BJT19MSU5FX0RJUkVDVElPTl9JTiBpZiBIRFBfTVVYX01BU0sob2Zm
c2V0KSkpICE9IAo+PiBIRFBfTVVYX0dQT1ZBTChvZmZzZXQpPwo+IAo+IEhpLCBvb3BzLCB5b3Un
cmUgcmlnaHQgIQoKSSd2ZSBhbnN3ZXIgdG9vIHF1aWNrbHkuIEFsbCB0aGUgcGlucyBhcmUgIm91
dCIgaW4gZmFjdC4KVGhlIGhhcmR3YXJlIGlzIG5vdCBhYmxlIHRvIHJlYWQgaW5wdXQgc2lnbmFs
LgpJIHdhbnRlZCB0byBpbXBsZW1lbnQgYSB3YXkgdG8gcmVhZCB0aGUgcmVnaXN0ZXIgdmFsdWUg
aW4gYW55IGNhc2UgYnkgCmxlYXZpbmcgdGhlIGxpbmUgZGlyZWN0aW9uIHVuY2hhbmdlZC4KCj4+
Cj4+PiArc3RhdGljIHZvaWQgc3RtMzJfaGRwX2dwaW9fc2V0KHN0cnVjdCBncGlvX2NoaXAgKmdj
LCB1bnNpZ25lZCBpbnQgCj4+PiBvZmZzZXQsIGludCB2YWx1ZSkKPj4+ICt7Cj4+PiArwqDCoMKg
wqDCoMKgIHN0cnVjdCBzdG0zMl9oZHAgKmhkcCA9IGdwaW9jaGlwX2dldF9kYXRhKGdjKTsKPj4+
ICsKPj4+ICvCoMKgwqDCoMKgwqAgaWYgKHZhbHVlKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgd3JpdGVsX3JlbGF4ZWQoQklUKG9mZnNldCksIGhkcC0+YmFzZSArIEhEUF9HUE9T
RVQpOwo+Pj4gK8KgwqDCoMKgwqDCoCBlbHNlCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB3cml0ZWxfcmVsYXhlZChCSVQob2Zmc2V0KSwgaGRwLT5iYXNlICsgSERQX0dQT0NMUik7
Cj4+PiArfQo+Pgo+PiBDYW4ndCB5b3UganVzdCB1c2UgR1BJT19HRU5FUklDIGZvciB0aGlzPwo+
Pgo+PiBiZ3Bpb19pbml0KGdjLCBkZXYsIEFSUkFZX1NJWkUoc3RtMzJfaGRwX3BpbnMpLCAvLyA9
PSA4Cj4+IMKgwqDCoMKgIGhkcC0+YmFzZSArIEhEUF9WQUwsCj4+IMKgwqDCoMKgIGhkcC0+YmFz
ZSArIEhEUF9HUE9TRVQsCj4+IMKgwqDCoMKgIGhkcC0+YmFzZSArIEhEUF9HUE9DTFIsCj4+IMKg
wqDCoMKgIE5VTEwsCj4+IMKgwqDCoMKgIE5VTEwsCj4+IMKgwqDCoMKgIDApOwo+Pgo+PiBUaGUg
ZGVmYXVsdCBiZWhhdmlvdXIgb2YgR1BJTyBNTUlPIGlzIHRvIHJlYWQgdGhlIG91dHB1dCByZWdp
c3Rlcgo+PiBmb3IgdGhlIHZhbHVlIGlmIHRoZSBsaW5lIGlzIGluIG91dHB1dCBtb2RlLgo+Pgo+
PiBZb3UgbWF5IHdhbm5hIG92ZXJyaWRlIHRoZSAuZ2V0X2RpcmVjdGlvbigpIGNhbGxiYWNrIGFm
dGVyIGJncGlvX2luaXQoKQo+PiBhbmQgYmVmb3JlIHJlZ2lzdGVyaW5nIHRoZSBjaGlwLCBlaXRo
ZXIgd2l0aCB3aGF0IHlvdSBoYXZlIG9yIHdoYXQKPj4gSSBkZXNjcmliZWQgYWJvdmUuCj4gCj4g
SSBkaWRuJ3Qga25vdyBhYm91dCBpdCwgSSdsbCB0YWtlIGEgbG9vayBhbmQgcHJvdmlkZSBhIFYz
Lgo+IAo+IFRoYW5rIHlvdSwKPiAKPiBDbMOpbWVudAo+IAo+PiBZb3VycywKPj4gTGludXMgV2Fs
bGVpago+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
