Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F489D94F0
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 10:56:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F309C78020;
	Tue, 26 Nov 2024 09:56:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68FE9C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 08:52:20 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ0l64w000476;
 Tue, 26 Nov 2024 09:51:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 8jxIHGeNhIdRyq1hTjMruj+uZWn6hIrTILsLNytxbPs=; b=8Els/mG8lomYzWTA
 SH/GmSoMEy8/ORL68+wQ8SuoxcDHsKn1HY1YWW0pJrw/wTmlYhPdNFAylL+JCxZC
 cPDGnBtAjc4bPIdZSO53tmt4ifuSMZvzbgr/PjN96mlKOPQQO9owzHALyvO2jHBC
 yPUnnRmZE7wi9FmqxwPasCjyTDp6sMpO1jXWPzgjlx/OElCaLBGjCAqL45Bh3dKM
 mZCyBOcNr7Ea3CQNRSirzFdh8K14zEpy8wOKNwE9fUJUaP/PkT2lRSBKjDxomNVP
 D9yF3Oy6GkOSje7ITKMQNDgo8FSMyN/fScqkkyeS7hHMKBtyfRhab2Jn+FkXCd/P
 5y7Imw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4335bkv4tp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2024 09:51:25 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 21B2440057;
 Tue, 26 Nov 2024 09:49:44 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 33D08269E1E;
 Tue, 26 Nov 2024 09:47:19 +0100 (CET)
Received: from [10.129.178.23] (10.129.178.23) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 26 Nov
 2024 09:47:18 +0100
Message-ID: <725aafb8-abfa-40c0-967a-62122206f736@foss.st.com>
Date: Tue, 26 Nov 2024 09:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sean Nyekjaer <sean@geanix.com>, Maxime Ripard <mripard@kernel.org>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <bfuj6w6hsbfpdw24th6dl3ugvj45op6jb45gx5ab5pulud7hiz@o2zbn45z3lt4>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <bfuj6w6hsbfpdw24th6dl3ugvj45op6jb45gx5ab5pulud7hiz@o2zbn45z3lt4>
X-Originating-IP: [10.129.178.23]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Mailman-Approved-At: Tue, 26 Nov 2024 09:56:28 +0000
Cc: Simona Vetter <simona@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dri-devel@lists.freedesktop.org,
 Samuel Holland <samuel@sholland.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] drm/modes: introduce
 drm_mode_validate_mode() helper function
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

Ck9uIDExLzI2LzI0IDA4OjM2LCBTZWFuIE55ZWtqYWVyIHdyb3RlOgo+IEhpIE1heGltZSwKPgo+
IE9uIE1vbiwgTm92IDI1LCAyMDI0IGF0IDA1OjAwOjU2UE0gKzAxMDAsIE1heGltZSBSaXBhcmQg
d3JvdGU6Cj4+IEhpIFNlYW4sCj4+Cj4+IE9uIE1vbiwgTm92IDI1LCAyMDI0IGF0IDAyOjQ5OjI2
UE0gKzAxMDAsIFNlYW4gTnlla2phZXIgd3JvdGU6Cj4+PiBDaGVjayBpZiB0aGUgcmVxdWlyZWQg
cGl4ZWwgY2xvY2sgaXMgaW4gd2l0aGluIC41JSByYW5nZSBvZiB0aGUKPj4+IGRlc2lyZWQgcGl4
ZWwgY2xvY2suCj4+PiBUaGlzIHdpbGwgbWF0Y2ggdGhlIHJlcXVpcmVtZW50IGZvciBIRE1JIHdo
ZXJlIGEgLjUlIHRvbGVyYW5jZSBpcyBhbGxvd2VkLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFNl
YW4gTnlla2phZXIgPHNlYW5AZ2Vhbml4LmNvbT4KPj4+IC0tLQo+Pj4gIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fbW9kZXMuYyB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+
ICBpbmNsdWRlL2RybS9kcm1fbW9kZXMuaCAgICAgfCAgMiArKwo+Pj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMzYgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX21vZGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKPj4+IGluZGV4IDZiYTE2
N2EzMzQ2MTM0MDcyZDEwMGFmMGFkYmJlOWI0OWU5NzA3NjkuLjQwNjhiOTA0NzU5YmY4MDUwMmVm
ZGU2ZTRkOTc3YjI5N2Y1ZDUzNTkgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X21vZGVzLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwo+Pj4gQEAgLTE2
MjMsNiArMTYyMyw0MCBAQCBib29sIGRybV9tb2RlX2VxdWFsX25vX2Nsb2Nrc19ub19zdGVyZW8o
Y29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUxLAo+Pj4gIH0KPj4+ICBFWFBPUlRf
U1lNQk9MKGRybV9tb2RlX2VxdWFsX25vX2Nsb2Nrc19ub19zdGVyZW8pOwo+Pj4gIAo+Pj4gKy8q
Kgo+Pj4gKyAqIGRybV9tb2RlX3ZhbGlkYXRlX21vZGUKPj4+ICsgKiBAbW9kZTogbW9kZSB0byBj
aGVjawo+Pj4gKyAqIEByb3VuZGVkX3JhdGU6IG91dHB1dCBwaXhlbCBjbG9jawo+Pj4gKyAqCj4+
PiArICogVkVTQSBETVQgZGVmaW5lcyBhIHRvbGVyYW5jZSBvZiAwLjUlIG9uIHRoZSBwaXhlbCBj
bG9jaywgd2hpbGUgdGhlCj4+PiArICogQ1ZUIHNwZWMgcmV1c2VzIHRoYXQgdG9sZXJhbmNlIGlu
IGl0cyBleGFtcGxlcywgc28gaXQgbG9va3MgdG8gYmUgYQo+Pj4gKyAqIGdvb2QgZGVmYXVsdCB0
b2xlcmFuY2UgZm9yIHRoZSBFRElELWJhc2VkIG1vZGVzLiBEZWZpbmUgaXQgdG8gNSBwZXIKPj4+
ICsgKiBtaWxsZSB0byBhdm9pZCBmbG9hdGluZyBwb2ludCBvcGVyYXRpb25zLgo+Pj4gKyAqCj4+
PiArICogUmV0dXJuczoKPj4+ICsgKiBUaGUgbW9kZSBzdGF0dXMKPj4+ICsgKi8KPj4+ICtlbnVt
IGRybV9tb2RlX3N0YXR1cyBkcm1fbW9kZV92YWxpZGF0ZV9tb2RlKGNvbnN0IHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlICptb2RlLAo+Pj4gKwkJCQkJICAgIHVuc2lnbmVkIGxvbmcgbG9uZyByb3Vu
ZGVkX3JhdGUpCj4+PiArewo+Pj4gKwllbnVtIGRybV9tb2RlX3N0YXR1cyBzdGF0dXM7Cj4+PiAr
CXVuc2lnbmVkIGxvbmcgbG9uZyByYXRlID0gbW9kZS0+Y2xvY2sgKiAxMDAwOwo+Pj4gKwl1bnNp
Z25lZCBsb25nIGxvbmcgbG93ZXN0LCBoaWdoZXN0Owo+Pj4gKwo+Pj4gKwlsb3dlc3QgPSByYXRl
ICogKDEwMDAgLSA1KTsKPj4+ICsJZG9fZGl2KGxvd2VzdCwgMTAwMCk7Cj4+PiArCWlmIChyb3Vu
ZGVkX3JhdGUgPCBsb3dlc3QpCj4+PiArCQlyZXR1cm4gTU9ERV9DTE9DS19MT1c7Cj4+PiArCj4+
PiArCWhpZ2hlc3QgPSByYXRlICogKDEwMDAgKyA1KTsKPj4+ICsJZG9fZGl2KGhpZ2hlc3QsIDEw
MDApOwo+Pj4gKwlpZiAocm91bmRlZF9yYXRlID4gaGlnaGVzdCkKPj4+ICsJCXJldHVybiBNT0RF
X0NMT0NLX0hJR0g7Cj4+PiArCj4+PiArCXJldHVybiBNT0RFX09LOwo+Pj4gK30KPj4+ICtFWFBP
UlRfU1lNQk9MKGRybV9tb2RlX3ZhbGlkYXRlX21vZGUpOwpIaSBTZWFuLCBNYXhpbWUsCj4+IFRo
YW5rcyBhIGxvdCBmb3IgZG9pbmcgdGhhdCEKPj4KPj4gSSB3b25kZXIgYWJvdXQgdGhlIG5hbWlu
ZyB0aG91Z2ggKGFuZCBwcm90b3R5cGUpLiBJIGRvZXNuJ3QgcmVhbGx5Cj4+IHZhbGlkYXRlcyBh
IG1vZGUsIGJ1dCByYXRoZXIgbWFrZXMgc3VyZSB0aGF0IGEgZ2l2ZW4gcmF0ZSBpcyBhIGdvb2QK
Pj4gYXBwcm94aW1hdGlvbiBvZiBhIHBpeGVsIGNsb2NrLiBTbyBtYXliZSBzb21ldGhpbmcgbGlr
ZQo+PiBkcm1fbW9kZV9jaGVja19waXhlbF9jbG9jaz8KPiBOYW1pbmcgaXMgaGFyZCA6KSBJIHdp
bGwgdXNlIGRybV9tb2RlX2NoZWNrX3BpeGVsX2Nsb2NrKCkgZm9yIFYyLgo+Cj4gV291bGQgaXQg
bWFrZSBzZW5zZSB0byBoYXZlIHRoZSBwaXhlbCBjbG9jayByZXF1aXJlbWVudCBhcyBhIGlucHV0
Cj4gcGFyYW1ldGVyPyBGb3IgSERNSSBpdCBpcyAwLjUlIGFuZCBpbiBteSBjYXNlIHRoZSBMVkRT
IHBhbmVsIDEwJS4KPgo+IGVudW0gZHJtX21vZGVfc3RhdHVzIGRybV9tb2RlX3ZhbGlkYXRlX21v
ZGUoY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUsCj4gCQkJCQkgICAgdW5zaWdu
ZWQgbG9uZyBsb25nIHJvdW5kZWRfcmF0ZSwgdW5zaWduZWQgdG9sZXJhbmNlKQo+ID8KCgpJTU8g
YWRkaW5nIHRoZSB0b2xlcmFuY2UgYXMgaW5wdXQgcGFyYW1ldGVyIGlzIGEgZ29vZCBpZGVhLsKg
IFRoaXMgd291bGQgdXNlZnVsCm90aGVyIHRoYW4gZm9yIEhETUkgcGl4ZWwgY2xvY2sgdmFsaWRh
dGlvbiAoYW5kIExWRFMgaW4geW91ciBjYXNlKS4KCkJlc3QgcmVnYXJkcywKUmFwaGHDq2wKCj4K
PiBBbmQgbWF5YmUgYSBkcm1fbW9kZV92YWxpZGF0ZV9tb2RlX2hkbWkoKSB3aXRoIHRoZSBkZWZh
dWx0IHRvbGVyYW5jZSBvZgo+IC41JT8KPj4gV2UgcHJvYmFibHkgbmVlZCBzb21lIGt1bml0IHRl
c3RzIGhlcmUgdG9vLgo+IEdvb2QgaWRlYSwgd2lsbCBiZSBteSBmaXJzdCA6KQo+Cj4gL1NlYW4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
