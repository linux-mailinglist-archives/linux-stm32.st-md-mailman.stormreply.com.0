Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C13FA02DA9
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jan 2025 17:22:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3974BC78025;
	Mon,  6 Jan 2025 16:22:22 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09240C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jan 2025 16:19:21 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506G54D8008507;
 Mon, 6 Jan 2025 17:18:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 2l6yGUMAqbBbwFW6T71mdO7jHSTqEhQG1rr7BQEsO6Q=; b=kGMFjM3h7NgVsYRH
 sTDFUvjsY7nRFqcWC41fapUVOOjxPxIzPV0GhJ6I76BTRvN3JRupEM12x5+WjuRE
 QGjPW4TGSpM34q/pVspvuA7KlWDb8sv+i0hJY1ilGF4blZPMmy4OSTa9IjF7s3nT
 73X1rNQwBuf609nv1iJLQif0j6BpLISUIV+diQ6c2gkbLtCFbWO7Cdh6ufa+faW1
 JlnYNM6c1efGaQRCa50UObTQ1IgYN42R+tiejmvE9/VrtTcZzetsNfvhiS0esDzJ
 y8QrhEzqbX8P+9bkzHXJdVpccSGQsOGTegWmBWtCfAsFU2JZi567zF3xx3MNLLuc
 sRJMmg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 440jcur1a3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2025 17:18:45 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1CB4340048;
 Mon,  6 Jan 2025 17:17:11 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E864E28EFA9;
 Mon,  6 Jan 2025 17:16:10 +0100 (CET)
Received: from [10.252.22.94] (10.252.22.94) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 6 Jan
 2025 17:16:09 +0100
Message-ID: <85acb818-43db-4d4e-aef2-33a2ce25a45b@foss.st.com>
Date: Mon, 6 Jan 2025 17:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sean Nyekjaer <sean@geanix.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Yannick
 Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
X-Originating-IP: [10.252.22.94]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Mailman-Approved-At: Mon, 06 Jan 2025 16:22:20 +0000
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
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

Ck9uIDExLzI1LzI0IDE0OjQ5LCBTZWFuIE55ZWtqYWVyIHdyb3RlOgo+IENoZWNrIGlmIHRoZSBy
ZXF1aXJlZCBwaXhlbCBjbG9jayBpcyBpbiB3aXRoaW4gLjUlIHJhbmdlIG9mIHRoZQo+IGRlc2ly
ZWQgcGl4ZWwgY2xvY2suCj4gVGhpcyB3aWxsIG1hdGNoIHRoZSByZXF1aXJlbWVudCBmb3IgSERN
SSB3aGVyZSBhIC41JSB0b2xlcmFuY2UgaXMgYWxsb3dlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFNl
YW4gTnlla2phZXIgPHNlYW5AZ2Vhbml4LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9tb2Rlcy5jIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNs
dWRlL2RybS9kcm1fbW9kZXMuaCAgICAgfCAgMiArKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDM2IGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKPiBpbmRleCA2YmExNjdhMzM0NjEzNDA3MmQx
MDBhZjBhZGJiZTliNDllOTcwNzY5Li40MDY4YjkwNDc1OWJmODA1MDJlZmRlNmU0ZDk3N2IyOTdm
NWQ1MzU5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwo+IEBAIC0xNjIzLDYgKzE2MjMsNDAgQEAgYm9v
bCBkcm1fbW9kZV9lcXVhbF9ub19jbG9ja3Nfbm9fc3RlcmVvKGNvbnN0IHN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlICptb2RlMSwKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGRybV9tb2RlX2VxdWFsX25v
X2Nsb2Nrc19ub19zdGVyZW8pOwo+ICAKPiArLyoqCj4gKyAqIGRybV9tb2RlX3ZhbGlkYXRlX21v
ZGUKPiArICogQG1vZGU6IG1vZGUgdG8gY2hlY2sKPiArICogQHJvdW5kZWRfcmF0ZTogb3V0cHV0
IHBpeGVsIGNsb2NrCj4gKyAqCj4gKyAqIFZFU0EgRE1UIGRlZmluZXMgYSB0b2xlcmFuY2Ugb2Yg
MC41JSBvbiB0aGUgcGl4ZWwgY2xvY2ssIHdoaWxlIHRoZQo+ICsgKiBDVlQgc3BlYyByZXVzZXMg
dGhhdCB0b2xlcmFuY2UgaW4gaXRzIGV4YW1wbGVzLCBzbyBpdCBsb29rcyB0byBiZSBhCj4gKyAq
IGdvb2QgZGVmYXVsdCB0b2xlcmFuY2UgZm9yIHRoZSBFRElELWJhc2VkIG1vZGVzLiBEZWZpbmUg
aXQgdG8gNSBwZXIKPiArICogbWlsbGUgdG8gYXZvaWQgZmxvYXRpbmcgcG9pbnQgb3BlcmF0aW9u
cy4KPiArICoKPiArICogUmV0dXJuczoKPiArICogVGhlIG1vZGUgc3RhdHVzCj4gKyAqLwo+ICtl
bnVtIGRybV9tb2RlX3N0YXR1cyBkcm1fbW9kZV92YWxpZGF0ZV9tb2RlKGNvbnN0IHN0cnVjdCBk
cm1fZGlzcGxheV9tb2RlICptb2RlLAo+ICsJCQkJCSAgICB1bnNpZ25lZCBsb25nIGxvbmcgcm91
bmRlZF9yYXRlKQo+ICt7Cj4gKwllbnVtIGRybV9tb2RlX3N0YXR1cyBzdGF0dXM7Cj4gKwl1bnNp
Z25lZCBsb25nIGxvbmcgcmF0ZSA9IG1vZGUtPmNsb2NrICogMTAwMDsKPiArCXVuc2lnbmVkIGxv
bmcgbG9uZyBsb3dlc3QsIGhpZ2hlc3Q7Cj4gKwo+ICsJbG93ZXN0ID0gcmF0ZSAqICgxMDAwIC0g
NSk7Cj4gKwlkb19kaXYobG93ZXN0LCAxMDAwKTsKPiArCWlmIChyb3VuZGVkX3JhdGUgPCBsb3dl
c3QpCj4gKwkJcmV0dXJuIE1PREVfQ0xPQ0tfTE9XOwo+ICsKPiArCWhpZ2hlc3QgPSByYXRlICog
KDEwMDAgKyA1KTsKPiArCWRvX2RpdihoaWdoZXN0LCAxMDAwKTsKPiArCWlmIChyb3VuZGVkX3Jh
dGUgPiBoaWdoZXN0KQo+ICsJCXJldHVybiBNT0RFX0NMT0NLX0hJR0g7Cj4gKwo+ICsJcmV0dXJu
IE1PREVfT0s7Cj4gK30KPiArRVhQT1JUX1NZTUJPTChkcm1fbW9kZV92YWxpZGF0ZV9tb2RlKTsK
CkhpLAoKV2l0aCBhbiBhZ3JlZW1lbnQgcmVhY2hlZCBieSBldmVyeW9uZSBvbiB0aGUgbmFtZSBv
ZiB0aGlzIGZ1bmN0aW9uOgoKUmV2aWV3ZWQtYnk6IFJhcGhhZWwgR2FsbGFpcy1Qb3UgPHJhcGhh
ZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+CgpSZWdhcmRzLApSYXBoYcOrbAoKPiArCj4gIHN0
YXRpYyBlbnVtIGRybV9tb2RlX3N0YXR1cwo+ICBkcm1fbW9kZV92YWxpZGF0ZV9iYXNpYyhjb25z
dCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKPiAgewo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9kcm1fbW9kZXMuaCBiL2luY2x1ZGUvZHJtL2RybV9tb2Rlcy5oCj4gaW5kZXggYjli
YjkyZTRiMDI5NWE1Y2JlMGViMGRhMTNlNzc0NDlmZjA0ZjUxZC4uNGI2Mzg5OTJmM2U1MGQyYWJh
NTA4ODY0NDc0NDQ1N2Q3MmRiZTEwYSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fbW9k
ZXMuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9tb2Rlcy5oCj4gQEAgLTU0OSw2ICs1NDksOCBA
QCBib29sIGRybV9tb2RlX2VxdWFsX25vX2Nsb2Nrcyhjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlf
bW9kZSAqbW9kZTEsCj4gIAkJCSAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpt
b2RlMik7Cj4gIGJvb2wgZHJtX21vZGVfZXF1YWxfbm9fY2xvY2tzX25vX3N0ZXJlbyhjb25zdCBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZTEsCj4gIAkJCQkJY29uc3Qgc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgKm1vZGUyKTsKPiArZW51bSBkcm1fbW9kZV9zdGF0dXMgZHJtX21vZGVfdmFs
aWRhdGVfbW9kZShjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwKPiArCQkJCQkg
ICAgdW5zaWduZWQgbG9uZyBsb25nIHJvdW5kZWRfcmF0ZSk7Cj4gIAo+ICAvKiBmb3IgdXNlIGJ5
IHRoZSBjcnRjIGhlbHBlciBwcm9iZSBmdW5jdGlvbnMgKi8KPiAgZW51bSBkcm1fbW9kZV9zdGF0
dXMgZHJtX21vZGVfdmFsaWRhdGVfZHJpdmVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
