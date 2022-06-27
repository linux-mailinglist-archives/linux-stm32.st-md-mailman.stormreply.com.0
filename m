Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B5355B9A9
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jun 2022 15:01:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A5AFC04004;
	Mon, 27 Jun 2022 13:01:17 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 916D6C03FC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 13:01:15 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 673B583C70;
 Mon, 27 Jun 2022 15:01:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656334875;
 bh=fvsZdqOHcEHLRk+gSlC5dE2r+9LJ3zFrX01feX2Y0/k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nZDGZbgTtVIBvlnkupAv0AJrRcJABnmt2HpTmD2KMGUIuUXYabCr8VMNS++nMogEU
 dIQ1VRl9/XPG3TWCFzRO6M5NcMVzXcHwKz08ddyVRGHIHGUmF6G7MQ7Uoo/fv5I9HZ
 DLXhjW5vGNHtNKdzOR3qwqEjAOGgdHcdR2lTqTiC9tr+z6Mti+q0cOuRMcRiJrlRvD
 gswIZGfEDWZJb8RxU4n+8m22ke2RIz7FFQpEpCGwbE+EX8xK+a5Hr2SqCKMnIpvAVo
 fJuf6YCnpPxGvfraL3po50bTmaTZB+DBilHSi73r0AsBnnjB2ne86U6Vdn8CvaqYgJ
 9IVAemzDSa3ZA==
Message-ID: <c92f1a8d-6439-d494-5779-70619ec94760@denx.de>
Date: Mon, 27 Jun 2022 15:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Hugues FRUCHET <hugues.fruchet@foss.st.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
References: <20220618222442.478285-1-marex@denx.de>
 <Yq5c6dObTlmZr95P@pendragon.ideasonboard.com>
 <0dc2d603-586e-be49-8f8d-1f52f1915813@ideasonboard.com>
 <4d5b5c59-f3d5-ad5a-ae61-73277b4adefa@denx.de>
 <5ee6c0c0-8ab0-561c-e1f6-b26e4ec438af@foss.st.com>
 <39657445-e5ac-bfd6-c122-b18088fa4b41@denx.de>
 <733f9689-b4d7-8f23-37d3-920aa6a5a7ea@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <733f9689-b4d7-8f23-37d3-920aa6a5a7ea@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: stm32: dcmi: Switch to
	__v4l2_subdev_state_alloc()
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

T24gNi8yNy8yMiAxNDo1MywgSHVndWVzIEZSVUNIRVQgd3JvdGU6Cj4gSGkgTWFyZWssCgpIaSwK
Cj4gVGhhbmtzIGZvciBleHBsYW5hdGlvbiwgSSB1bmRlcnN0YW5kIG5vdy4KPiAKPiBQbGVhc2Ug
bm90ZSB0aGF0IGRjbWkgaXMgbm90IGF0bWVsLWlzaS5jIGhhcyBzYW1lIGNvZGUgc3RydWN0dXJl
LCBoZW5jZSAKPiBzYW1lIHByb2JsZW06Cj4gCj4gc3RhdGljIGludCBpc2lfdHJ5X2ZtdChzdHJ1
Y3QgYXRtZWxfaXNpICppc2ksIHN0cnVjdCB2NGwyX2Zvcm1hdCAqZiwKPiAgwqDCoMKgwqBzdHJ1
Y3QgdjRsMl9zdWJkZXZfc3RhdGUgcGFkX3N0YXRlID0gewo+ICDCoMKgwqDCoMKgwqDCoCAucGFk
cyA9ICZwYWRfY2ZnCj4gIMKgwqDCoMKgwqDCoMKgIH07Cj4gWy4uLl0KPiAgwqDCoMKgwqByZXQg
PSB2NGwyX3N1YmRldl9jYWxsKGlzaS0+ZW50aXR5LnN1YmRldiwgcGFkLCBzZXRfZm10LAo+IAo+
IAo+IE1vcmVvdmVyLCBzZWFyY2hpbmcgZm9yIF9fdjRsMl9zdWJkZXZfc3RhdGVfYWxsb2MoKSBJ
IHNlZSB0aG9zZSAiRklYTUUiOgo+IAo+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy92
c3AxL3ZzcDFfZW50aXR5LmMKPiAgwqDCoMKgwqAvKgo+ICDCoMKgwqDCoCAqIEZJWE1FOiBEcm9w
IHRoaXMgY2FsbCwgZHJpdmVycyBhcmUgbm90IHN1cHBvc2VkIHRvIHVzZQo+ICDCoMKgwqDCoCAq
IF9fdjRsMl9zdWJkZXZfc3RhdGVfYWxsb2MoKS4KPiAgwqDCoMKgwqAgKi8KPiAgwqDCoMKgwqBl
bnRpdHktPmNvbmZpZyA9IF9fdjRsMl9zdWJkZXZfc3RhdGVfYWxsb2MoJmVudGl0eS0+c3ViZGV2
LAo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICJ2c3AxOmNvbmZpZy0+bG9jayIsICZrZXkpOwo+IAo+IAo+IGRyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vcmVuZXNhcy9yY2FyLXZpbi9yY2FyLXY0bDIuYwo+ICDCoMKgwqDCoC8qCj4gIMKgwqDCoMKg
ICogRklYTUU6IERyb3AgdGhpcyBjYWxsLCBkcml2ZXJzIGFyZSBub3Qgc3VwcG9zZWQgdG8gdXNl
Cj4gIMKgwqDCoMKgICogX192NGwyX3N1YmRldl9zdGF0ZV9hbGxvYygpLgo+ICDCoMKgwqDCoCAq
Lwo+ICDCoMKgwqDCoHNkX3N0YXRlID0gX192NGwyX3N1YmRldl9zdGF0ZV9hbGxvYyhzZCwgInJ2
aW46c3RhdGUtPmxvY2siLCAma2V5KTsKPiAKPiAKPiBTbyBJIHdvbmRlciBhYm91dCBpbnRyb2R1
Y2luZyB0aGlzIG5ldyBjaGFuZ2UgaW4gZGNtaSB3aGlsZSBpdCBpcyBtYXJrZWQgCj4gYXMgIkZJ
WE1FIiBpbiBvdGhlciBjYW1lcmEgaW50ZXJmYWNlIGRyaXZlcnMgPwoKVGhpcyBpcyBwcm9iYWJs
eSBzb21ldGhpbmcgVG9taS9MYXVyZW50IGNhbiBhbnN3ZXIgYmV0dGVyLiBJdCBzaG91bGQgYmUg
Ck9LIGZvciB0aGlzIGRyaXZlciBhcyBmYXIgYXMgSSB1bmRlcnN0YW5kIHRoZSBkaXNjdXNzaW9u
IGluIHRoaXMgdGhyZWFkLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
