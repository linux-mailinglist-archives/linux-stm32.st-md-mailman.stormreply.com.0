Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 454B4AF6E78
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jul 2025 11:21:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE57EC3F943;
	Thu,  3 Jul 2025 09:21:54 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98B0DC3F93E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jul 2025 09:21:53 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5639KN7v012395;
 Thu, 3 Jul 2025 11:21:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 U8/3UFXjScc/VhoP6EsW6/w+rmVzUP3VLZMHXQEnMOc=; b=Rg6zIqxXVN/lfQGs
 fKnQFf0q/7ilTG9vRlVMMzqP/IgJ92tkaLQr0rS2KExqysC3Gy6bGWQZhiSg9SRA
 jPXgr7nCkK63QVKuTpnMDT6fg8jn97ZefaBY+hOB+VJ8t3DSDHOupGONAyg8dHE5
 sHbhWZGSOr88smm5nf3mNdHedMB6jSUpHqp2dRgtTQQp53Pt5zv7CgCk5S74shfW
 u0lGL8pRyaqSKir+pjJ/47XtcfNMHjAG6Q2vykONLC6UkAYpCthqqASIIu8KvJa5
 w2Gvkb2yRzCfgbdOCIrjV6GU3SY6XNIPh/8VDNxIlmXv6nxOEC/QwvH+yk5bCZws
 8I56Bg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47jubp3tx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Jul 2025 11:21:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 570B54002D;
 Thu,  3 Jul 2025 11:20:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BD797B2B8A3;
 Thu,  3 Jul 2025 11:19:06 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Jul
 2025 11:19:05 +0200
Message-ID: <01d03052-4d9b-4d71-9781-a050ee669d45@foss.st.com>
Date: Thu, 3 Jul 2025 11:19:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andi Shyti <andi.shyti@kernel.org>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-2-7a23ab26683a@foss.st.com>
 <zp3pagbojmu67o4sjm65a44ovvui5uvybs32nayvhtewfbm4el@n5lro4v5iq36>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <zp3pagbojmu67o4sjm65a44ovvui5uvybs32nayvhtewfbm4el@n5lro4v5iq36>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_02,2025-07-02_04,2025-03-28_01
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Pierre-Yves
 MORDRET <pierre-yves.mordret@st.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 2/3] i2c: stm32f7: unmap DMA mapped
	buffer
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

SGkgQW5kaSwKCk9uIDcvMi8yNSAxOTowOCwgQW5kaSBTaHl0aSB3cm90ZToKPiBIaSBDbGVtZW50
LAo+IAo+IE9uIE1vbiwgSnVuIDMwLCAyMDI1IGF0IDAyOjU1OjE0UE0gKzAyMDAsIENsw6ltZW50
IExlIEdvZmZpYyB3cm90ZToKPj4gRml4IGFuIGlzc3VlIHdoZXJlIHRoZSBtYXBwZWQgRE1BIGJ1
ZmZlciB3YXMgbm90IHVubWFwcGVkLgo+IAo+ICJGaXggYW4gaXNzdWUuLi4iIGlzIHRvbyBnZW5l
cmljLiBDYW4geW91IGJlIG1vcmUgc3BlY2lmaWM/IFdoZXJlCj4gd2FzIGl0IG1hcHBlZD8gV2hl
cmUgd2FzIGl0IGxlZnQgdW5tYXBwZWQ/Cj4gCj4gUGxlYXNlLCBkbyBjb25zaWRlciB0aGF0IHRo
ZSB1c2VyIG5lZWRzIHRvIHVuZGVyc3RhbmQgd2hhdAo+IGhhcHBlbnMgaW4gdGhlIHBhdGNoIHdp
dGhvdXQgbmVlZGluZyB0byBsb29rIGludG8gdGhlIHBhdGNoLgoKT2sgc3VyZSBJJ2xsIHJlZmlu
ZSB0aGUgY29tbWl0IG1lc3NhZ2UuCgo+IAo+PiBGaXhlczogN2VjYzhjZmRlNTUzICgiaTJjOiBp
MmMtc3RtMzJmNzogQWRkIERNQSBzdXBwb3J0IikKPj4gQWNrZWQtYnk6IEFsYWluIFZvbG1hdCA8
YWxhaW4udm9sbWF0QGZvc3Muc3QuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBH
b2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jIHwgNiArKysrKysKPj4gICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LXN0bTMyZjcuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jCj4+IGluZGV4IGU0
YWFlYjIyNjJkMC4uMDQyMzg2YjRjYWJlIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLXN0bTMyZjcuYwo+PiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcu
Ywo+PiBAQCAtMTU1NCw2ICsxNTU0LDggQEAgc3RhdGljIGlycXJldHVybl90IHN0bTMyZjdfaTJj
X2hhbmRsZV9pc3JfZXJycyhzdHJ1Y3Qgc3RtMzJmN19pMmNfZGV2ICppMmNfZGV2LAo+PiAgIAlp
ZiAoaTJjX2Rldi0+dXNlX2RtYSkgewo+PiAgIAkJc3RtMzJmN19pMmNfZGlzYWJsZV9kbWFfcmVx
KGkyY19kZXYpOwo+PiAgIAkJZG1hZW5naW5lX3Rlcm1pbmF0ZV9hc3luYyhkbWEtPmNoYW5fdXNp
bmcpOwo+PiArCQlkbWFfdW5tYXBfc2luZ2xlKGkyY19kZXYtPmRldiwgZG1hLT5kbWFfYnVmLCBk
bWEtPmRtYV9sZW4sCj4+ICsJCQkJIGRtYS0+ZG1hX2RhdGFfZGlyKTsKPj4gICAJfQo+PiAgIAo+
PiAgIAlpMmNfZGV2LT5tYXN0ZXJfbW9kZSA9IGZhbHNlOwo+PiBAQCAtMTYyMiw2ICsxNjI0LDgg
QEAgc3RhdGljIGlycXJldHVybl90IHN0bTMyZjdfaTJjX2lzcl9ldmVudF90aHJlYWQoaW50IGly
cSwgdm9pZCAqZGF0YSkKPj4gICAJCWlmIChpMmNfZGV2LT51c2VfZG1hKSB7Cj4+ICAgCQkJc3Rt
MzJmN19pMmNfZGlzYWJsZV9kbWFfcmVxKGkyY19kZXYpOwo+PiAgIAkJCWRtYWVuZ2luZV90ZXJt
aW5hdGVfYXN5bmMoZG1hLT5jaGFuX3VzaW5nKTsKPj4gKwkJCWRtYV91bm1hcF9zaW5nbGUoaTJj
X2Rldi0+ZGV2LCBkbWEtPmRtYV9idWYsIGRtYS0+ZG1hX2xlbiwKPj4gKwkJCQkJIGRtYS0+ZG1h
X2RhdGFfZGlyKTsKPj4gICAJCX0KPj4gICAJCWY3X21zZy0+cmVzdWx0ID0gLUVOWElPOwo+PiAg
IAl9Cj4+IEBAIC0xNjQyLDYgKzE2NDYsOCBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qgc3RtMzJmN19p
MmNfaXNyX2V2ZW50X3RocmVhZChpbnQgaXJxLCB2b2lkICpkYXRhKQo+PiAgIAkJCQlkZXZfZGJn
KGkyY19kZXYtPmRldiwgIjwlcz46IFRpbWVkIG91dFxuIiwgX19mdW5jX18pOwo+PiAgIAkJCQlz
dG0zMmY3X2kyY19kaXNhYmxlX2RtYV9yZXEoaTJjX2Rldik7Cj4+ICAgCQkJCWRtYWVuZ2luZV90
ZXJtaW5hdGVfYXN5bmMoZG1hLT5jaGFuX3VzaW5nKTsKPj4gKwkJCQlkbWFfdW5tYXBfc2luZ2xl
KGkyY19kZXYtPmRldiwgZG1hLT5kbWFfYnVmLCBkbWEtPmRtYV9sZW4sCj4+ICsJCQkJCQkgZG1h
LT5kbWFfZGF0YV9kaXIpOwo+IAo+IENhbid0IHdlIHVzZSB0aGUgZG1hX2NhbGxiYWNrIGhlcmUs
IG9yIHNpbWlsYXI/IEkgc2VlIHNvbWUKPiBzaW1pbGFyIHBhdHRlcm5zIGFuZCBJIHRoaW5rIHRo
ZSBjb2RlIGNhbiBiZSBpbXByb3ZlZC4KClllcywgaXQgc2VlbXMgdGhlIGNvZGUgY2FuIGJlIGZh
Y3Rvcml6ZWQuCkknbGwgc3VibWl0IGEgbmV3IHZlcnNpb24gd2l0aCB0aGUgZmFjdG9yaXphdGlv
bi4KCkJlc3QgcmVnYXJkcywKQ2zDqW1lbnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
