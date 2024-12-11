Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D01BE9EC84A
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Dec 2024 10:05:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75319C7801C;
	Wed, 11 Dec 2024 09:05:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77147C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Dec 2024 09:05:00 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB8NwD6022707;
 Wed, 11 Dec 2024 10:04:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 JVWhcdluQn/FeGJzOFzMGBVEMEf9xzbqzGk72elgCUI=; b=b0A9E4AuMNTnvg0I
 wkXfLf5kOc1qMYjpI+7kMEvKiCLeWQ/tTfDobuCf8sJiWEzTcSvlIe4c6/Y6m60j
 +8H64t25TQsnAYMDPAhDFtdoUX+fYSW+8sEHjUyPZzQEqy8lsD/zN+dW4+n4RDN1
 yh0Gzt0r50ahgltqWcfUL93VHZNLuZ6j7nyCag/Ewn+gDA5qhow+UDvyDPsJB8Ei
 z/Pu78ZlxuZN8ZbUIJCm7EVUI+9j1y87d6ISz+lv0p0ulFgg0EfEn/O4WAUoDHB8
 IGv9C6nxkj6MqS1XlJZOPXlXS+mtsoEyPCsxMxH69uDpZjPh724dpIAGjrVGO+/I
 ra/fCA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43d0t5f4b8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2024 10:04:37 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 93AC640074;
 Wed, 11 Dec 2024 10:03:17 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BDF5227FEF5;
 Wed, 11 Dec 2024 10:02:18 +0100 (CET)
Received: from [10.48.86.108] (10.48.86.108) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 11 Dec
 2024 10:02:17 +0100
Message-ID: <49ccec07-4d4c-4582-814b-d4a60adbbfe1@foss.st.com>
Date: Wed, 11 Dec 2024 10:02:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-watchdog@vger.kernel.org>
References: <20240415134903.8084-1-marex@denx.de>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20240415134903.8084-1-marex@denx.de>
X-Originating-IP: [10.48.86.108]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] watchdog: stm32_iwdg: Add pretimeout
	support
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

T24gNC8xNS8yNCAxNTo0OCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gVGhlIFNUTTMyTVAxNXh4IElX
REcgYWRkcyByZWdpc3RlcnMgd2hpY2ggcGVybWl0IHRoaXMgSVAgdG8gZ2VuZXJhdGUKPiBwcmV0
aW1lb3V0IGludGVycnVwdC4gVGhpcyBpbnRlcnJ1cHQgY2FuIGFsc28gYmUgdXNlZCB0byB3YWtl
IHRoZSBDUFUKPiBmcm9tIHN1c3BlbmQuIEltcGxlbWVudCBzdXBwb3J0IGZvciBnZW5lcmF0aW5n
IHRoaXMgaW50ZXJydXB0IGFuZCBsZXQKPiB1c2Vyc3BhY2UgY29uZmlndXJlIHRoZSBwcmV0aW1l
b3V0LiBJbiBjYXNlIHRoZSBwcmV0aW1lb3V0IGlzIG5vdAo+IGNvbmZpZ3VyZWQgYnkgdXNlciwg
c2V0IHByZXRpbWVvdXQgdG8gMy80IG9mIHRoZSBXRFQgdGltZW91dCBjeWNsZS4KPiAKPiBSZXZp
ZXdlZC1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29t
Pgo+IFRlc3RlZC1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Mu
c3QuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+IC0t
LQo+IENjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPgo+
IENjOiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Cj4gQ2M6IE1heGltZSBDb3F1
ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4KPiBDYzogV2ltIFZhbiBTZWJyb2VjayA8
d2ltQGxpbnV4LXdhdGNoZG9nLm9yZz4KPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
PiBDYzogbGludXgtd2F0Y2hkb2dAdmdlci5rZXJuZWwub3JnCj4gLS0tCj4gVjI6IC0gU3VidHJh
Y3QgdGhlIHByZXRpbWVvdXQgdmFsdWUgZnJvbSB0aW1lb3V0IHZhbHVlIGJlZm9yZSB3cml0aW5n
IGl0Cj4gICAgICAgIGludG8gdGhlIElXREcgcHJldGltZW91dCByZWdpc3RlciwgYmVjYXVzZSB0
aGUgd2F0Y2hkb2cgY291bnRlcgo+ICAgICAgICByZWdpc3RlciBpcyBjb3VudGluZyBkb3duLCBh
bmQgdGhlIHByZXRpbWVvdXQgaW50ZXJydXB0IHRyaWdnZXJzCj4gICAgICAgIHdoZW4gd2F0Y2hk
b2cgY291bnRlciByZWdpc3RlciBtYXRjaGVzIHRoZSBwcmV0aW1lb3V0IHJlZ2lzdGVyCj4gICAg
ICAgIGNvbnRlbnQuCj4gICAgICAtIFNldCBkZWZhdWx0IHByZXRpbWVvdXQgdG8gMy80IG9mIHRp
bWVvdXQgLgo+IFYzOiAtIFVzZSBkZXYgaW5zdGVhZCBvZiBwZGV2LT5kZXYKPiAgICAgIC0gU3dh
cCBvcmRlciBvZiByZXQvcmV0dXJuIDAKPiAgICAgIC0gU3BsaXQgdGhpcyBmcm9tIHRoZSBEVCBj
aGFuZ2VzLCB3aGljaCBhcmUgb3J0aG9nb25hbAo+ICAgICAgLSBVaCwgdGhpcyBwYXRjaCBnb3Qg
c3R1Y2sgaW4gdXBzdHJlYW1pbmcgcXVldWUsIHNvcnJ5Cj4gVjQ6IC0gVXBkYXRlIGNvbW1pdCBt
ZXNzYWdlIHRvIG1hdGNoIFYyIGRlZmF1bHQgcHJldGltZW91dCB0byAzLzQKPiAgICAgIC0gQWRk
IFJCL1RCIGZyb20gQ2zDqW1lbnQKPiAtLS0KPiAgIGRyaXZlcnMvd2F0Y2hkb2cvc3RtMzJfaXdk
Zy5jIHwgOTUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCA5NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvd2F0Y2hkb2cvc3RtMzJfaXdkZy5jIGIvZHJpdmVycy93YXRjaGRvZy9zdG0zMl9p
d2RnLmMKPiBpbmRleCA1NDA0ZTAzODc2MjAyLi5kNzAwZTBkNDliYjk1IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvd2F0Y2hkb2cvc3RtMzJfaXdkZy5jCj4gKysrIGIvZHJpdmVycy93YXRjaGRvZy9z
dG0zMl9pd2RnLmMKPiAgCj4gIFsuLi4uLl0KPiAgCj4gKwo+ICsJaXJxID0gcGxhdGZvcm1fZ2V0
X2lycShwZGV2LCAwKTsKPiArCWlmIChpcnEgPD0gMCkKPiArCQlyZXR1cm4gMDsKCkhpIE1hcmVr
LAoKQWZ0ZXIgcmUtZXZhbHVhdGluZyB0aGlzIHBhdGNoLCBpdCBzZWVtcyBpdCBsYWNrcyBvZiBh
IGR0LWJpbmRpbmdzIAp1cGRhdGUgdGhhdCB0YWNrbGVzIHRoZSAnaW50ZXJydXB0cycgcHJvcGVy
dHkgeW91IGFyZSBhZGRpbmcuCgpUaGF0IHNhaWQsIHRoZSBpbnRlcnJ1cHQgbGluZSBzaG91bGQg
bm90IGJlIG1hbmRhdG9yeSBmb3IgdGhlIGRyaXZlciB0byAKcHJvYmUuIEZvciBiYWNrd2FyZCBj
b21wYXRpYmlsaXR5IHdpdGggZXhpc3RpbmcgRFQsIEkgcmVjb21tZW5kIHRvIHVzZSAKdGhlICdw
bGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKCknIEFQSSB0byBub3QgZmFpbCBkdXJpbmcgdGhlIHBy
b2JlIG9mIAp0aGUgZHJpdmVyLgoKQmVzdCByZWdhcmRzLAoKQ2zDqW1lbnQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
