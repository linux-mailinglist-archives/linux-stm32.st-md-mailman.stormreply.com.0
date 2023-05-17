Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F6B706EFE
	for <lists+linux-stm32@lfdr.de>; Wed, 17 May 2023 19:05:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 273ECC6B442;
	Wed, 17 May 2023 17:05:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC44AC6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 May 2023 17:05:12 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34HDSQc4015581; Wed, 17 May 2023 19:04:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=9W/aSpUxJmkATSMYBkvf8JxR9pYleKOzKrYpx1aWW3s=;
 b=sF/xOCzBWtzRIa9NfQykUhAYW9bdpi4BfqVd+u0QM+zVm8BwtMKvt5RKwyLBIisrS0oR
 5gGnY7Tk3ad0uxOVO9gOGzmHbktlfijDg8n+xakYesyoDHksavafdBUG4gbZJqBvJ82W
 DFd7LXEkP+nJvqLj/AXc66wMlkIZ6uuXTfL4aNGT6+Nu7nQa6gzjVnNyBZzTPiAlc40t
 ESmdzGMpWoagJ8rmGzqP9CtRdN4NTq6zU5h2ZwLs3UmatRMz82aMZT2nvXJbUIUAtNUJ
 2smMikZsEJeBeTn9xzDO8cd7MnSbfV49yjoZkle6SriTjs45hAmzw6RAlJ904FVa7xbz mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qm7tfj1m6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 19:04:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 932B310002A;
 Wed, 17 May 2023 19:04:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8202924F270;
 Wed, 17 May 2023 19:04:39 +0200 (CEST)
Received: from [10.129.178.187] (10.129.178.187) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 17 May
 2023 19:04:39 +0200
Message-ID: <e963370c-7018-243a-712d-62ca8463bfd8@foss.st.com>
Date: Wed, 17 May 2023 19:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Yannick Fertre <yannick.fertre@foss.st.com>
References: <20230517143542.284029-1-raphael.gallais-pou@foss.st.com>
 <20230517143542.284029-4-raphael.gallais-pou@foss.st.com>
 <f64de05b-8854-4345-80c2-f424968defdc@denx.de>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <f64de05b-8854-4345-80c2-f424968defdc@denx.de>
X-Originating-IP: [10.129.178.187]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_02,2023-05-17_02,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/3] ARM: dts: stm32: fix several DT
 warnings on stm32mp15
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

SGkgTWFyZWsKCk9uIDUvMTcvMjMgMTc6NDEsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDUvMTcv
MjMgMTY6MzUsIFJhcGhhZWwgR2FsbGFpcy1Qb3Ugd3JvdGU6Cj4KPiBIaSwKPgo+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGt4LmR0c2kKPj4gYi9hcmNoL2Fy
bS9ib290L2R0cy9zdG0zMm1wMTV4eC1ka3guZHRzaQo+PiBpbmRleCAwZjExMTBlNDJjOTMuLmE2
ZTJlMjBmMTJmYSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgt
ZGt4LmR0c2kKPj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGt4LmR0c2kK
Pj4gQEAgLTQ1Nyw4ICs0NTcsNyBAQCAmbHRkYyB7Cj4+IMKgwqDCoMKgwqAgc3RhdHVzID0gIm9r
YXkiOwo+PiDCoCDCoMKgwqDCoMKgIHBvcnQgewo+PiAtwqDCoMKgwqDCoMKgwqAgbHRkY19lcDBf
b3V0OiBlbmRwb2ludEAwIHsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDA+Owo+
PiArwqDCoMKgwqDCoMKgwqAgbHRkY19lcDBfb3V0OiBlbmRwb2ludCB7Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJlbW90ZS1lbmRwb2ludCA9IDwmc2lpOTAyMl9pbj47Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCB9Owo+PiDCoMKgwqDCoMKgIH07Cj4KPiBUaGlzIExUREMgcG9ydC9lbmRw
b2ludCBzdHVmZiBhbHdheXMgc2NhcmVzIG1lLCBiZWNhdXNlIEkgYWx3YXlzIGZlZWwgSSBnZXQg
aXQKPiB3cm9uZy4KPgo+IEkgYmVsaWV2ZSB0aGUgTFREQyBkb2VzIGhhdmUgb25lICJwb3J0IiAs
IGNvcnJlY3QuCj4KPiBCdXQgSSB0aGluayAoPykgdGhhdCB0aGUgTFREQyBoYXMgdHdvIGVuZHBv
aW50cywgZW5kcG9pbnRAMCBmb3IgRFBJIChwYXJhbGxlbAo+IG91dHB1dCBvdXQgb2YgdGhlIFNv
QykgYW5kIGVuZHBvaW50QDEgZm9yIERTSSAoaW50ZXJuYWwgY29ubmVjdGlvbiBpbnRvIHRoZQo+
IERTSSBzZXJpYWxpemVyKSA/CgpZb3UgYXJlIGNvcnJlY3QgaW5kZWVkLCBJIHJ1c2hlZCB0aGUg
cGF0Y2ggYW5kIGRpZCBub3QgdGhvdWdodCBhYm91dCB0aGlzLiBJCmFncmVlIHRoYXQgdGhpcyBj
YW4gYmUgY29uZnVzaW5nLCBhcyBJIGFsc28gdGFrZSBzb21lIHRpbWUgdG8gdGhpbmsgdGhyb3Vn
aCBpdC4KCj4KPiBPbmx5IG9uZSBvZiB0aGUgZW5kcG9pbnRzIGNhbiBiZSBjb25uZWN0ZWQgYXQg
YSB0aW1lLCBidXQgdGhlcmUgYXJlIGFjdHVhbGx5Cj4gdHdvIGVuZHBvaW50cyBpbiB0aGUgTFRE
QyBwb3J0IHt9IG5vZGUsIGFyZW4ndCB0aGVyZSA/ClllcywgdGhleSBhcmUgbXV0dWFsbHkgZXhj
bHVzaXZlLgo+Cj4gU28gdGhlIG9yaWdpbmFsIGRlc2NyaXB0aW9uIHNob3VsZCBiZSBPSyBJIHRo
aW5rICwgbWF5YmUgI2FkZHJlc3MvI3NpemUtY2VsbHMKPiBhcmUgbWlzc2luZyBpbnN0ZWFkID8K
ClRoaW5nIGlzOiB0aGlzIGZpbGUgaXMgb25seSBpbmNsdWRlZCBpbiB0d28gZGV2aWNlLXRyZWVz
IDogc3RtMzJtcDE1N2MtZGsxLmR0cwphbmQgc3RtMzJtcDE1N2MtZGsyLmR0cy4KCkFtb25nIHRo
b3NlIHR3byBmaWxlcyB0aGVyZSBpcyBvbmx5IG9uZSB3aGljaCBhZGRzIGEgc2Vjb25kIGVuZHBv
aW50LiBUaHVzIGlmCnRoZSBmaWVsZHMgYXJlIHNldCBoaWdoZXIgaW4gdGhlIGhpZXJhcmNoeSwg
YSB3YXJuaW5nIHlpZWxkcy4KCk9uZSB3YXkgdG8gZG8gaXQgd291bGQgYmUgdG8gbWFrZSB0aGUg
ZW5kcG9pbnRAMCBnbyBkb3duIGluIHRoZSBkZXZpY2UtdHJlZSB3aXRoCml0cyBkZXBlbmRlbmNp
ZXMsIHNvIHRoYXQgYm90aCBlbmRwb2ludHMgYXJlIHRoZSBzYW1lIGxldmVsIHdpdGhvdXQgZ2Vu
ZXJhdGluZwpub2lzZS4KCgpSYXBoYcOrbAoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
