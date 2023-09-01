Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8589778FFF8
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Sep 2023 17:33:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34FA9C6B444;
	Fri,  1 Sep 2023 15:33:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6193C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Sep 2023 15:33:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 381C2pZb024661; Fri, 1 Sep 2023 17:33:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=bi3VYNViQtJCdjL7dyg53UF58C/uOQWQ7xolLTOM3Vc=; b=dy
 na2h6N0tXT2dNWEVshdFvkivlGm5yguKrqAa/Wlione68+uhdIjBCIGadoHpSAiu
 VO2jmtriOl70sTfaToMBUw1nWmalzq4HlIG0WtJt7XMcoNsJApu9tgAFhVJRTqzH
 ELJU0Zda/5YHFsxoXi8mK6v4k4xHRnjMlclH+F342FHct2K9tpQtPEvQ6itB/PCt
 91AhO/HqtQpmbhGju+IQnO1twFV7dBy0dVDSDAKQc3cbh6i+/dgct2/fMfegV0XL
 f2nD1j0FX9Jwqs+E7Qjl/NH5IhHgSo3PgpcJvaKiKVDu7tHI5srrU5JEdqAXV4/x
 amxE1E5R7+4pxpaZXfcQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sq6h4kp3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Sep 2023 17:33:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5B57A100056;
 Fri,  1 Sep 2023 17:33:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 503C423D3F2;
 Fri,  1 Sep 2023 17:33:07 +0200 (CEST)
Received: from [10.201.20.125] (10.201.20.125) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 1 Sep
 2023 17:33:04 +0200
Message-ID: <3eed1865-d70d-c89a-fcaf-7b0e2bb6da98@foss.st.com>
Date: Fri, 1 Sep 2023 17:33:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Linus Walleij <linus.walleij@linaro.org>
References: <20230901120836.1057900-1-yann.gautier@foss.st.com>
 <CACRpkdacRe5cPoSFJyEdo6nZrtmUHTNqMxf55CntvsdpFqhhrQ@mail.gmail.com>
Content-Language: en-US
From: Yann Gautier <yann.gautier@foss.st.com>
In-Reply-To: <CACRpkdacRe5cPoSFJyEdo6nZrtmUHTNqMxf55CntvsdpFqhhrQ@mail.gmail.com>
X-Originating-IP: [10.201.20.125]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_13,2023-08-31_01,2023-05-22_02
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mmc: mmci: stm32: add SDIO in-band
	interrupt mode
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

T24gOS8xLzIzIDE2OjEwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+IEhpIFlhbm4vQ2hyaXN0b3Bo
ZSwKPiAKPiB0aGFua3MgZm9yIHlvdXIgcGF0Y2ghCgpIaSBMaW51cwoKVGhhbmtzIGZvciB0aGUg
cmV2aWV3LCBJIGFncmVlIHdpdGggdGhlIHByb3Bvc2VkIGNoYW5nZXMuCkknbGwgcHJlcGFyZSBh
IG5ldyB2ZXJzaW9uIGFuZCBzZW5kIGl0IG5leHQgd2VlayEKCkJlc3QgcmVnYXJkcywKWWFubgo+
IAo+IE9uIEZyaSwgU2VwIDEsIDIwMjMgYXQgMjowOOKAr1BNIFlhbm4gR2F1dGllciA8eWFubi5n
YXV0aWVyQGZvc3Muc3QuY29tPiB3cm90ZToKPiAKPj4gRnJvbTogQ2hyaXN0b3BoZSBLZXJlbGxv
IDxjaHJpc3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20+Cj4+Cj4+IEFkZCB0aGUgc3VwcG9ydCBv
ZiBTRElPIGluLWJhbmQgaW50ZXJydXB0IG1vZGUgZm9yIFNUTTMyIHZhcmlhbnQuCj4+IEl0IGFs
bG93cyB0aGUgU0QgSS9PIGNhcmQgdG8gaW50ZXJydXB0IHRoZSBob3N0IG9uIFNETU1DX0QxIGRh
dGEgbGluZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3Rv
cGhlLmtlcmVsbG9AZm9zcy5zdC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFlhbm4gR2F1dGllciA8
eWFubi5nYXV0aWVyQGZvc3Muc3QuY29tPgo+ICguLi4pCj4+ICsrKyBiL2RyaXZlcnMvbW1jL2hv
c3QvbW1jaS5oCj4+IEBAIC0zMzIsNiArMzMyLDcgQEAgZW51bSBtbWNpX2J1c3lfc3RhdGUgewo+
PiAgICAqIEBvcGVuZHJhaW46IGJpdG1hc2sgaWRlbnRpZnlpbmcgdGhlIE9QRU5EUkFJTiBiaXQg
aW5zaWRlIE1NQ0lQT1dFUiByZWdpc3Rlcgo+PiAgICAqIEBkbWFfbGxpOiB0cnVlIGlmIHZhcmlh
bnQgaGFzIGRtYSBsaW5rIGxpc3QgZmVhdHVyZS4KPj4gICAgKiBAc3RtMzJfaWRtYWJzaXplX21h
c2s6IHN0bTMyIHNkbW1jIGlkbWEgYnVmZmVyIHNpemUuCj4+ICsgKiBAdXNlX3NkaW9faXJxOiBh
bGxvdyBTRCBJL08gY2FyZCB0byBpbnRlcnJ1cHQgdGhlIGhvc3QKPiAKPiBUaGUgZG9jdW1lbnRh
dGlvbiB0YWcgc2hvdWxkIGJlIG9uZSBsaW5lIHVwIChjb21wYXJlIHRvIHRoZSBtZW1iZXJzLi4u
KQo+IAo+PiBAQCAtMzc2LDYgKzM3Nyw3IEBAIHN0cnVjdCB2YXJpYW50X2RhdGEgewo+PiAgICAg
ICAgICB1MzIgICAgICAgICAgICAgICAgICAgICBzdGFydF9lcnI7Cj4+ICAgICAgICAgIHUzMiAg
ICAgICAgICAgICAgICAgICAgIG9wZW5kcmFpbjsKPj4gICAgICAgICAgdTggICAgICAgICAgICAg
ICAgICAgICAgZG1hX2xsaToxOwo+PiArICAgICAgIHU4ICAgICAgICAgICAgICAgICAgICAgIHVz
ZV9zZGlvX2lycToxOwo+IAo+IDEuIGJvb2wgdXNlX3NkaW9faXJxOwo+IAo+IDIuIHN1cHBvcnRz
X3NkaW9faXJxIGlzIG1vcmUgdG8gdGhlIHBvaW50IGRvbid0IHlvdSB0aGluaz8KPiAgICAgIEVz
cGVjaWFsbHkgc2luY2UgaXQgYWN0aXZhdGVzIHRoZXNlIHR3byBjYWxsYmFja3M6Cj4gCj4+ICsg
ICAgICAgdm9pZCAoKmVuYWJsZV9zZGlvX2lycSkoc3RydWN0IG1tY2lfaG9zdCAqaG9zdCwgaW50
IGVuYWJsZSk7Cj4+ICsgICAgICAgdm9pZCAoKnNkaW9faXJxKShzdHJ1Y3QgbW1jaV9ob3N0ICpo
b3N0LCB1MzIgc3RhdHVzKTsKPiAKPiBGdXJ0aGVyOiBhbGwgdGhlIFV4NTAwIHZhcmlhbnRzIHN1
cHBvcnQgdGhpcyAoYml0IDIyKSBhcyB3ZWxsLCBzbyBlbmFibGUgdGhvc2UKPiB0b28gaW4gdGhl
aXIgdmVuZG9yIGRhdGEuIEFsbCBJIGhhdmUgaXMgb3V0LW9mLWJhbmQgc2lnbmFsaW5nIHdpdGgg
YW4gR1BJTyBJUlEKPiBvbiBteSBCcm9hZGNvbSBjaGlwcyBidXQgSSB0aGluayBpdCB3b3JrcyAo
bWF5YmUgVWxmIGhhcyB0ZXN0ZWQgaXQgaW4gdGhlCj4gZmFyIHBhc3QpLgo+IAo+IFlvdXJzLAo+
IExpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
