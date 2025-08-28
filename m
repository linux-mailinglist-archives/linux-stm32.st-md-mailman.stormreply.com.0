Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FCCB3A471
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Aug 2025 17:30:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC479C30883;
	Thu, 28 Aug 2025 15:30:46 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7A12C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Aug 2025 15:30:45 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SExhLc008165;
 Thu, 28 Aug 2025 17:30:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 zcXQWGxBgys/9bCjZkggZ71XZareYPTP7nhInFsdrhI=; b=5PBWCHvR6BAKt5q+
 lSmK889rAu3TIDu9s/WZRuzmFV+Gg4W9dRRNh+dFL48D7OL1yQ9uItfsuYCCJXry
 vrCcbsqiVzolyGi9uQi7s67eFaWbOOdKpJqkM7vgmUybN1UI7yDHhkhF8hBSqVw1
 ZgmYXjB5wAQvrOjAnMXARAz3Pk1TFOm5IrFB2zSdjWwaHG/15BXsiJwUtw4hLUbD
 67O0xdpCSrc5deU6c+j0cJRrSUYpmQH2/Z/EHQNN/ZYcDmVo9q3kUGx2ZMLZ+usy
 MFhMEbct9nuPWN4qe5QQ/dYEEtaJqj/LbB0qNKG+pNcbnPblkvAzwJq9lYwzk1er
 ZBozVw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48qrkmtyc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Aug 2025 17:30:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D4EB940048;
 Thu, 28 Aug 2025 17:29:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0DB7976B31E;
 Thu, 28 Aug 2025 17:28:05 +0200 (CEST)
Received: from [10.252.2.182] (10.252.2.182) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 17:28:03 +0200
Message-ID: <ee447d45-a7af-4af4-ba6c-5341b8428db3@foss.st.com>
Date: Thu, 28 Aug 2025 17:28:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe ROULLIER <christophe.roullier@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
 <20250822-drm-misc-next-v5-6-9c825e28f733@foss.st.com>
 <4201bb6b-3ad8-4b35-b152-0d725310245b@foss.st.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <4201bb6b-3ad8-4b35-b152-0d725310245b@foss.st.com>
X-Originating-IP: [10.252.2.182]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 06/13] dt-bindings: arm: stm32: add
 required #clock-cells property
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

CgpPbiA4LzI4LzI1IDE3OjE4LCBDaHJpc3RvcGhlIFJPVUxMSUVSIHdyb3RlOgo+IE9uIDgvMjIv
MjUgMTY6MzQsIFJhcGhhZWwgR2FsbGFpcy1Qb3Ugd3JvdGU6Cj4+IE9uIFNUTTMyTVAyNSBTb0Ms
IHRoZSBzeXNjZmcgcGVyaXBoZXJhbCBwcm92aWRlcyBhIGNsb2NrIHRvIHRoZSBkaXNwbGF5Cj4+
IHN1YnN5c3RlbSB0aHJvdWdoIGEgbXVsdGlwbGV4ZXIuwqAgU2luY2UgaXQgb25seSBwcm92aWRl
cyBhIHNpbmdsZSBjbG9jaywKPj4gdGhlIGNlbGwgdmFsdWUgaXMgMC4KPj4KPj4gRG9pbmcgc28g
YWxsb3dzIHRoZSBjbG9jayBjb25zdW1lcnMgdG8gcmVhY2ggdGhlIHBlcmlwaGVyYWwgYW5kIGdh
dGUgdGhlCj4+IGNsb2NrIGFjY29yZGluZ2x5Lgo+Pgo+PiBSZXZpZXdlZC1ieTogUm9iIEhlcnJp
bmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KPj4gUmV2aWV3ZWQtYnk6IFlhbm5pY2sgRmVydHJl
IDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUmFwaGFlbCBH
YWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+IMKg
IC4uLi9iaW5kaW5ncy9hcm0vc3RtMzIvc3Qsc3RtMzItc3lzY29uLnlhbWzCoMKgwqDCoMKgwqDC
oCB8IDMxICsrKysrKysrKysrKysrKy0tLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIxIGlu
c2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdCxzdG0zMi1zeXNjb24ueWFtbAo+
PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3Qsc3RtMzIt
c3lzY29uLnlhbWwKPj4gaW5kZXgKPj4gZWQ5NzY1MmM4NDkyMjgxM2U5NGIxODE4YzA3ZmU4NzE0
ODkxYzA4OS4uOTVkMjMxOWFmZTIzNWZhODY5NzRkODBmODljOWRlZWFlMjI3NTIzMgo+PiAxMDA2
NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9z
dCxzdG0zMi1zeXNjb24ueWFtbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL3N0bTMyL3N0LHN0bTMyLXN5c2Nvbi55YW1sCj4+IEBAIC0zNiwyMCArMzYsMzEg
QEAgcHJvcGVydGllczoKPj4gwqDCoMKgIGNsb2NrczoKPj4gwqDCoMKgwqDCoCBtYXhJdGVtczog
MQo+PiDCoCArwqAgIiNjbG9jay1jZWxscyI6Cj4+ICvCoMKgwqAgY29uc3Q6IDAKPj4gKwo+PiDC
oCByZXF1aXJlZDoKPj4gwqDCoMKgIC0gY29tcGF0aWJsZQo+PiDCoMKgwqAgLSByZWcKPj4gwqAg
LWlmOgo+PiAtwqAgcHJvcGVydGllczoKPj4gLcKgwqDCoCBjb21wYXRpYmxlOgo+PiAtwqDCoMKg
wqDCoCBjb250YWluczoKPj4gLcKgwqDCoMKgwqDCoMKgIGVudW06Cj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqAgLSBzdCxzdG0zMm1wMTU3LXN5c2NmZwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgIC0gc3Qs
c3RtMzJmNC1nY2FuCj4+IC10aGVuOgo+PiAtwqAgcmVxdWlyZWQ6Cj4+IC3CoMKgwqAgLSBjbG9j
a3MKPj4gK2FsbE9mOgo+PiArwqAgLSBpZjoKPj4gK8KgwqDCoMKgwqAgcHJvcGVydGllczoKPj4g
K8KgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGU6Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgY29udGFp
bnM6Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudW06Cj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAtIHN0LHN0bTMybXAxNTctc3lzY2ZnCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtIHN0LHN0bTMyZjQtZ2Nhbgo+PiArwqDCoMKgIHRoZW46Cj4+ICvCoMKgwqDCoMKg
IHJlcXVpcmVkOgo+PiArwqDCoMKgwqDCoMKgwqAgLSBjbG9ja3MKPj4gK8KgIC0gaWY6Cj4+ICvC
oMKgwqDCoMKgIHByb3BlcnRpZXM6Cj4+ICvCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlOgo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0OiBzdCxzdG0zMm1wMjUtc3lzY2ZnCj4+ICvCoMKgwqAg
dGhlbjoKPj4gK8KgwqDCoMKgwqAgcmVxdWlyZWQ6Cj4+ICvCoMKgwqDCoMKgwqDCoCAtICIjY2xv
Y2stY2VsbHMiCj4+IMKgIMKgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+PiDCoAo+IEFj
a2VkLWJ5OiBDaHJpc3RvcGhlIFJvdWxsaWVyIDxjaHJpc3RvcGhlLnJvdWxsaWVyQGZvc3Muc3Qu
Y29tPgo+Cj4gWW91IGNhbiBtZXJnZSBpdCBvbiBEUk0gTUlTQy4KClRoYW5rcyBDaHJpc3RvcGhl
ICEgOikKCkJlc3QgcmVnYXJkcywKUmFwaGHDq2wKPgo+IEJlc3QgUmVnYXJkcywKPiDCoCBDaHJp
c3RvcGhlCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
