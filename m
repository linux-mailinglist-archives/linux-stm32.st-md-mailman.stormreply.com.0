Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E69AEB024
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Jun 2025 09:33:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA0C0C36B3E;
	Fri, 27 Jun 2025 07:33:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F5E9C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Jun 2025 07:33:38 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R2c6Rv030383;
 Fri, 27 Jun 2025 09:33:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 1Q285Yr3y+87stzQw+zewu692BZK8q52Hv1ctiichRc=; b=JciHfeKa47Iu6sv9
 VamsVMjg7X+3xY77tw1LBPC1uO0q239nBfbj9K2yYucT7DBEvknjB4ki34TlgIQM
 kT9l3BL9rSYIVPSOYQuuwFHPM8NLr0Sul81CP9YJTAxGEogTs5EQpBj/SeNjaoxn
 0uikTuHhBtYBklAU2vdyVdbr+IO3IxqUdINDgEtk1pxPdad87hoI9LFPtfSjBfwE
 uF4Yt94SE6OrzVJCx4Cn7OhQ/rcndL1sD1V79C0aCep5vlzfCb6dLLYyAsxutFaP
 W6aiOrLrzFTkaXNSUxw0RaatwVKHUpU21YKkwrxYPXwC/bd5b73z7Eag1onrHItW
 +GOw8A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dm33tthg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jun 2025 09:33:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 282D540044;
 Fri, 27 Jun 2025 09:31:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9DDC1BCF079;
 Fri, 27 Jun 2025 09:30:47 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Jun
 2025 09:30:46 +0200
Message-ID: <9bb4ab7d-afe2-4508-a18e-12cb1485a5a0@foss.st.com>
Date: Fri, 27 Jun 2025 09:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alain Volmat <alain.volmat@foss.st.com>
References: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
 <20250616-i2c-upstream-v1-1-42d3d5374e65@foss.st.com>
 <20250626083744.GA348766@gnbcxd0016.gnb.st.com>
 <20250626084356.GB348766@gnbcxd0016.gnb.st.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250626084356.GB348766@gnbcxd0016.gnb.st.com>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_02,2025-06-26_05,2025-03-28_01
Cc: linaro-mm-sig@lists.linaro.org, Andi Shyti <andi.shyti@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, Pierre-Yves
 MORDRET <pierre-yves.mordret@st.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/3] i2c: stm32: fix the device used for
	the DMA map
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

T24gNi8yNi8yNSAxMDo0MywgQWxhaW4gVm9sbWF0IHdyb3RlOgo+IEhpIENsw6ltZW50LAo+IAo+
IE91cHMsIEkgd2FzIHRvbyBmYXN0Lgo+IAo+IHRoZXJlIG1pZ2h0IGJlIGFub3RoZXIgcGxhY2Ug
dG8gY29ycmVjdCBpbiB0aGUgZHJpdmVyLCBkbWFfdW5tYXBfc2luZ2xlCj4gd2l0aGluIHRoZSBl
cnJvciBoYW5kbGluZyBvZiB0aGUgZnVuY3Rpb24gc3RtMzJfaTJjX3ByZXBfZG1hX3hmZXIuCj4g
Cj4gICAgIGVycjoKPiAgICAgICAgICAgICAgZG1hX3VubWFwX3NpbmdsZShjaGFuX2RldiwgZG1h
LT5kbWFfYnVmLCBkbWEtPmRtYV9sZW4sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZG1hLT5kbWFfZGF0YV9kaXIpOwo+IAo+IENvdWxkIHlvdSBhbHNvIGNvcnJlY3QgdGhpcyBvbmUg
YXMgd2VsbCA/Cj4gCj4gQWxhaW4KCkhpIEFsYWluLAoKT2ggeWVzIHlvdSdyZSByaWdodCwgSSds
bCBzZW5kIGEgdjIKCkJlc3QgcmVnYXJkLApDbMOpbWVudAo+IAo+IAo+IE9uIFRodSwgSnVuIDI2
LCAyMDI1IGF0IDEwOjM3OjUxQU0gKzAyMDAsIEFsYWluIFZvbG1hdCB3cm90ZToKPj4gSGkgQ2zD
qW1lbnQsCj4+Cj4+IE9uIE1vbiwgSnVuIDE2LCAyMDI1IGF0IDEwOjUzOjU0QU0gKzAyMDAsIENs
w6ltZW50IExlIEdvZmZpYyB3cm90ZToKPj4+IElmIHRoZSBETUEgbWFwcGluZyBmYWlsZWQsIGl0
IHByb2R1Y2VkIGFuIGVycm9yIGxvZyB3aXRoIHRoZSB3cm9uZwo+Pj4gZGV2aWNlIG5hbWU6Cj4+
PiAic3RtMzItZG1hMyA0MDQwMDAwMC5kbWEtY29udHJvbGxlcjogcmVqZWN0aW5nIERNQSBtYXAg
b2Ygdm1hbGxvYyBtZW1vcnkiCj4+PiBGaXggdGhpcyBpc3N1ZSBieSByZXBsYWNpbmcgdGhlIGRl
diB3aXRoIHRoZSBJMkMgZGV2Lgo+Pgo+PiBJbmRlZWQsIG5pY2UgY2F0Y2ggISBUaGFua3MgYSBs
b3QgIQo+Pgo+Pj4KPj4+IEZpeGVzOiBiYjg4MjJjYmJjNTMgKCJpMmM6IGkyYy1zdG0zMjogQWRk
IGdlbmVyaWMgRE1BIEFQSSIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMg
PGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Cj4+PiAtLS0KPj4+ICAgZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1zdG0zMi5jIHwgMiArLQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1zdG0zMi5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1zdG0zMi5jCj4+PiBpbmRl
eCAxNTdjNjRlMjdkMGIuLjVlMGIzMWFlZDc3NCAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtc3RtMzIuYwo+Pj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1zdG0z
Mi5jCj4+PiBAQCAtMTE4LDcgKzExOCw3IEBAIGludCBzdG0zMl9pMmNfcHJlcF9kbWFfeGZlcihz
dHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBzdG0zMl9pMmNfZG1hICpkbWEsCj4+PiAgIAlkbWEt
PmRtYV9sZW4gPSBsZW47Cj4+PiAgIAljaGFuX2RldiA9IGRtYS0+Y2hhbl91c2luZy0+ZGV2aWNl
LT5kZXY7Cj4+PiAgIAo+Pj4gLQlkbWEtPmRtYV9idWYgPSBkbWFfbWFwX3NpbmdsZShjaGFuX2Rl
diwgYnVmLCBkbWEtPmRtYV9sZW4sCj4+PiArCWRtYS0+ZG1hX2J1ZiA9IGRtYV9tYXBfc2luZ2xl
KGRldiwgYnVmLCBkbWEtPmRtYV9sZW4sCj4+PiAgIAkJCQkgICAgICBkbWEtPmRtYV9kYXRhX2Rp
cik7Cj4+PiAgIAlpZiAoZG1hX21hcHBpbmdfZXJyb3IoY2hhbl9kZXYsIGRtYS0+ZG1hX2J1Zikp
IHsKPj4+ICAgCQlkZXZfZXJyKGRldiwgIkRNQSBtYXBwaW5nIGZhaWxlZFxuIik7Cj4+Pgo+Pj4g
LS0gCj4+PiAyLjQzLjAKPj4+Cj4+Cj4+IEFja2VkLWJ5OiBBbGFpbiBWb2xtYXQgPGFsYWluLnZv
bG1hdEBmb3NzLnN0LmNvbT4KPj4KPj4gUmVnYXJkcywKPj4gQWxhaW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
