Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C83416AB37
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2020 17:20:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA723C36B0B;
	Mon, 24 Feb 2020 16:20:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C709C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2020 16:20:39 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01OGCfam007873; Mon, 24 Feb 2020 17:20:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=WOrB9zjTn0T7PtrYAJ4aCW7Dq+zTAEPFOtROr7XMOzo=;
 b=IkyaGR4EFtaiGt7dPLgTYVNiT5WVp0abgnGKHqvs5vb7jFPFo9CCfx7MR6GyWcYI94Pp
 vDjJlFTZxwfD7MgR7i+gIVXHFor29lRKAnyWX72QDjXyARdthSLlyUVR7OhnZdcm96nU
 gTLUdZkFVPS5qIqh+Kj+IHMY/TYLweul/f3DeoUbZbvsSXdVHpxWJe+L39GKH8vDCd5E
 jedIymmRP6bmhuo8z2+i2nkgF/8fGKuf3BH/8v2ZEcTYD0xQr72wxqPTBx6HiIdZArCU
 J864vOCt2r1/Ct0L3qydZ6kIHJVk9s2gQc3505UGe7Onar2sg6qbeYX9cf1t0eD9ltPv Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yatn5ts7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Feb 2020 17:20:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D7BD410002A;
 Mon, 24 Feb 2020 17:20:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C73DE2A7B2C;
 Mon, 24 Feb 2020 17:20:23 +0100 (CET)
Received: from lmecxl0923.lme.st.com (10.75.127.45) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 24 Feb
 2020 17:20:23 +0100
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20200128090636.13689-1-ludovic.barre@st.com>
 <CAPDyKFr+7SvRasPPjFDA2kwG0ERS-Qp3FGbVbRGLrscz5N=L2g@mail.gmail.com>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <86464a0a-d830-465e-b35b-8dd2e766db70@st.com>
Date: Mon, 24 Feb 2020 17:20:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFr+7SvRasPPjFDA2kwG0ERS-Qp3FGbVbRGLrscz5N=L2g@mail.gmail.com>
Content-Language: fr
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-24_04:2020-02-21,
 2020-02-24 signatures=0
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V2 0/9] mmc: mmci: sdmmc: add sdr104
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

aGkgVWxmCgpMZSAyLzE5LzIwIMOgIDExOjI4IEFNLCBVbGYgSGFuc3NvbiBhIMOpY3JpdMKgOgo+
IE9uIFR1ZSwgMjggSmFuIDIwMjAgYXQgMTA6MDYsIEx1ZG92aWMgQmFycmUgPGx1ZG92aWMuYmFy
cmVAc3QuY29tPiB3cm90ZToKPj4KPj4gVG8gc3VwcG9ydCB0aGUgc2RyMTA0IG1vZGUsIHNkbW1j
IHZhcmlhbnQgbmVlZHM6Cj4+IC1IYXJkd2FyZSBkZWxheSBibG9jayBzdXBwb3J0IGZvciBzZG1t
YyB2YXJpYW50Cj4+ICAgd2l0aCB0dW5pbmcgcHJvY2VkdXJlCj4+IC1Wb2x0YWdlIHN3aXRjaCBj
YWxsYmFja3MKPj4gLXNkbW1jIHJldmlzaW9uIDIuMAo+Pgo+PiBWMjoKPj4gLXJlZ3JvdXAgaG9z
dC0+bW1jX29wcyAmIG1tYy0+b3BzIGFzc2lnbm1lbnQKPj4gLWFkZCB0aW1lb3V0IGRlZmluZQo+
PiAtcmVuYW1lIHByZXBfdm9sdF9zd2l0Y2ggdG8gcHJlX3NpZ192b2x0X3N3aXRjaAo+PiAtcmVu
YW1lIHZvbHRfc3dpdGNoIHRvIHBvc3Rfc2lnX3ZvbHRfc3dpdGNoCj4+IC1hZGQgJ3doeScgY29t
bWVudCBmb3IgIm1tYzogbW1jaTogYWRkIHZvbHRfc3dpdGNoIGNhbGxiYWNrcyIKPj4KPj4gTHVk
b3ZpYyBCYXJyZSAoOSk6Cj4+ICAgIG1tYzogbW1jaTogc2RtbWM6IHJlcGxhY2Ugc2dfZG1hX3h4
eCBtYWNyb3MKPj4gICAgbW1jOiBtbWNpOiBzZG1tYzogcmVuYW1lIHNkbW1jX3ByaXYgc3RydWN0
IHRvIHNkbW1jX2lkbWEKPj4gICAgbW1jOiBtbWNpOiBhZGQgYSByZWZlcmVuY2UgYXQgbW1jX2hv
c3Rfb3BzIGluIG1tY2kgc3RydWN0Cj4+ICAgIG1tYzogbW1jaTogYWRkIHByaXZhdGUgcG9pbnRl
ciBmb3IgdmFyaWFudAo+PiAgICBkdC1iaW5kaW5nczogbW1jOiBtbWNpOiBhZGQgZGVsYXkgYmxv
Y2sgYmFzZSByZWdpc3RlciBmb3Igc2RtbWMKPj4gICAgbW1jOiBtbWNpOiBzZG1tYzogYWRkIGV4
ZWN1dGUgdHVuaW5nIHdpdGggZGVsYXkgYmxvY2sKPj4gICAgbW1jOiBtbWNpOiBhZGQgdm9sdF9z
d2l0Y2ggY2FsbGJhY2tzCj4+ICAgIG1tYzogbW1jaTogc2RtbWM6IGFkZCB2b2x0YWdlIHN3aXRj
aCBmdW5jdGlvbnMKPj4gICAgbW1jOiBtbWNpOiBhZGQgc2RtbWMgdmFyaWFudCByZXZpc2lvbiAy
LjAKPj4KPj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvbW1jaS50eHQgICAgICAgICAg
fCAgIDIgKwo+PiAgIGRyaXZlcnMvbW1jL2hvc3QvbW1jaS5jICAgICAgICAgICAgICAgICAgICAg
ICB8ICA0MiArKystCj4+ICAgZHJpdmVycy9tbWMvaG9zdC9tbWNpLmggICAgICAgICAgICAgICAg
ICAgICAgIHwgICA4ICsKPj4gICBkcml2ZXJzL21tYy9ob3N0L21tY2lfc3RtMzJfc2RtbWMuYyAg
ICAgICAgICAgfCAyMDQgKysrKysrKysrKysrKysrKystCj4+ICAgNCBmaWxlcyBjaGFuZ2VkLCAy
NDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPj4KPj4gLS0KPj4gMi4xNy4xCj4+Cj4g
Cj4gQXBwbGllZCBmb3IgbmV4dCwgdGhhbmtzIQoKdGhhbmtzIFVsZi4KCj4gCj4gSSB0b29rIHRo
ZSBsaWJlcnR5IHRvIGRvIG1pbm9yIGFtZW5kbWVudHMgdG8gc29tZSBvZiB0aGUgY2hhbmdlbG9n
cywKPiBidXQgaW4gcGFydGljdWxhciBJIGhhdmUgY2hhbmdlIHNvbWUgb2YgcHJlZml4ZXMgZm9y
IHRoZSBjb21taXQKPiBtZXNzYWdlIGhlYWRlcnMgaW50byAibW1jOiBtbWNpX3NkbW1jOiIuCgpP
aywgSSB1c2UgdGhpcyBwcmVmaXhlIGZvciBuZXh0IGNvbW1pdC4KCj4gCj4gUGxlYXNlIHRlbGws
IGlmIHRoZXJlIGlzIGFueXRoaW5nIHRoYXQgeW91IHdhbnQgbWUgdG8gdXBkYXRlLgoKSSB0ZXN0
ZWQgeW91ciBuZXh0IGJyYW5jaCwgYW5kIGl0J3Mgb2sgZm9yIG1lLgpzZG1tYyB1cHN0cmVhbSBp
cyBhbG1vc3QgZmluaXNoZWQsIEkganVzdCBzb21lIHJlY2VudCBmaXhlcyB0byBzZW5kLgoKPiAK
PiBLaW5kIHJlZ2FyZHMKPiBVZmZlCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
