Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BD655BA10
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jun 2022 15:30:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98D36C04004;
	Mon, 27 Jun 2022 13:30:23 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A041BC035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 13:30:22 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28C971C82;
 Mon, 27 Jun 2022 15:30:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1656336621;
 bh=zLlmoxf66qaWQT370p2CS4eQLa681tT2iL2yvsfFIa8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GZ7c9yxkaqQlFds3EFrEa8od2JyxO3LDbtc8kNTm2VNWXkPw8ifck3OqYL70lW6dK
 pU8sVe32VBF6AJL+g+0AT0ZSv4GtJgsoOTyb3UeuXw16JuJZL2HxmbKtGfm+cYF0rO
 5KxMA/cuuKBgoaG9Z0LNjSgJ6+nUqKU7fn4t0r8o=
Message-ID: <b9c450b1-96d2-1ac5-0dec-04387903ebf2@ideasonboard.com>
Date: Mon, 27 Jun 2022 16:30:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Hugues FRUCHET <hugues.fruchet@foss.st.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
References: <20220618222442.478285-1-marex@denx.de>
 <Yq5c6dObTlmZr95P@pendragon.ideasonboard.com>
 <0dc2d603-586e-be49-8f8d-1f52f1915813@ideasonboard.com>
 <4d5b5c59-f3d5-ad5a-ae61-73277b4adefa@denx.de>
 <5ee6c0c0-8ab0-561c-e1f6-b26e4ec438af@foss.st.com>
 <39657445-e5ac-bfd6-c122-b18088fa4b41@denx.de>
 <733f9689-b4d7-8f23-37d3-920aa6a5a7ea@foss.st.com>
 <c92f1a8d-6439-d494-5779-70619ec94760@denx.de>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <c92f1a8d-6439-d494-5779-70619ec94760@denx.de>
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

T24gMjcvMDYvMjAyMiAxNjowMSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gNi8yNy8yMiAxNDo1
MywgSHVndWVzIEZSVUNIRVQgd3JvdGU6Cj4+IEhpIE1hcmVrLAo+IAo+IEhpLAo+IAo+PiBUaGFu
a3MgZm9yIGV4cGxhbmF0aW9uLCBJIHVuZGVyc3RhbmQgbm93Lgo+Pgo+PiBQbGVhc2Ugbm90ZSB0
aGF0IGRjbWkgaXMgbm90IGF0bWVsLWlzaS5jIGhhcyBzYW1lIGNvZGUgc3RydWN0dXJlLCAKPj4g
aGVuY2Ugc2FtZSBwcm9ibGVtOgo+Pgo+PiBzdGF0aWMgaW50IGlzaV90cnlfZm10KHN0cnVjdCBh
dG1lbF9pc2kgKmlzaSwgc3RydWN0IHY0bDJfZm9ybWF0ICpmLAo+PiDCoMKgwqDCoMKgc3RydWN0
IHY0bDJfc3ViZGV2X3N0YXRlIHBhZF9zdGF0ZSA9IHsKPj4gwqDCoMKgwqDCoMKgwqDCoCAucGFk
cyA9ICZwYWRfY2ZnCj4+IMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4gWy4uLl0KPj4gwqDCoMKgwqDC
oHJldCA9IHY0bDJfc3ViZGV2X2NhbGwoaXNpLT5lbnRpdHkuc3ViZGV2LCBwYWQsIHNldF9mbXQs
Cj4+Cj4+Cj4+IE1vcmVvdmVyLCBzZWFyY2hpbmcgZm9yIF9fdjRsMl9zdWJkZXZfc3RhdGVfYWxs
b2MoKSBJIHNlZSB0aG9zZSAiRklYTUUiOgo+Pgo+PiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Jl
bmVzYXMvdnNwMS92c3AxX2VudGl0eS5jCj4+IMKgwqDCoMKgwqAvKgo+PiDCoMKgwqDCoMKgICog
RklYTUU6IERyb3AgdGhpcyBjYWxsLCBkcml2ZXJzIGFyZSBub3Qgc3VwcG9zZWQgdG8gdXNlCj4+
IMKgwqDCoMKgwqAgKiBfX3Y0bDJfc3ViZGV2X3N0YXRlX2FsbG9jKCkuCj4+IMKgwqDCoMKgwqAg
Ki8KPj4gwqDCoMKgwqDCoGVudGl0eS0+Y29uZmlnID0gX192NGwyX3N1YmRldl9zdGF0ZV9hbGxv
YygmZW50aXR5LT5zdWJkZXYsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAidnNwMTpjb25maWctPmxvY2siLCAma2V5KTsKPj4KPj4KPj4g
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3JjYXItdmluL3JjYXItdjRsMi5jCj4+IMKg
wqDCoMKgwqAvKgo+PiDCoMKgwqDCoMKgICogRklYTUU6IERyb3AgdGhpcyBjYWxsLCBkcml2ZXJz
IGFyZSBub3Qgc3VwcG9zZWQgdG8gdXNlCj4+IMKgwqDCoMKgwqAgKiBfX3Y0bDJfc3ViZGV2X3N0
YXRlX2FsbG9jKCkuCj4+IMKgwqDCoMKgwqAgKi8KPj4gwqDCoMKgwqDCoHNkX3N0YXRlID0gX192
NGwyX3N1YmRldl9zdGF0ZV9hbGxvYyhzZCwgInJ2aW46c3RhdGUtPmxvY2siLCAma2V5KTsKPj4K
Pj4KPj4gU28gSSB3b25kZXIgYWJvdXQgaW50cm9kdWNpbmcgdGhpcyBuZXcgY2hhbmdlIGluIGRj
bWkgd2hpbGUgaXQgaXMgCj4+IG1hcmtlZCBhcyAiRklYTUUiIGluIG90aGVyIGNhbWVyYSBpbnRl
cmZhY2UgZHJpdmVycyA/Cj4gCj4gVGhpcyBpcyBwcm9iYWJseSBzb21ldGhpbmcgVG9taS9MYXVy
ZW50IGNhbiBhbnN3ZXIgYmV0dGVyLiBJdCBzaG91bGQgYmUgCj4gT0sgZm9yIHRoaXMgZHJpdmVy
IGFzIGZhciBhcyBJIHVuZGVyc3RhbmQgdGhlIGRpc2N1c3Npb24gaW4gdGhpcyB0aHJlYWQuCgpZ
ZXMgYW5kIG5vLiBXZSBzaG91bGRuJ3QgdXNlIF9fIGZ1bmNzIGluIHRoZSBkcml2ZXJzLiAKX192
NGwyX3N1YmRldl9zdGF0ZV9hbGxvYygpIGNhbGxzIGV4aXN0IGluIHRoZSBjdXJyZW50IGRyaXZl
cnMgYXMgaXQgCndhc24ndCB0cml2aWFsIHRvIGNoYW5nZSB0aGUgZHJpdmVyIHRvIGRvIGl0IG90
aGVyd2lzZSB3aGlsZSBhZGRpbmcgdGhlIApzdWJkZXYgc3RhdGUgZmVhdHVyZS4KCklmIEkgcmVj
YWxsIHJpZ2h0LCB0aGUgb3RoZXIgdXNlcnMgKGF0IGxlYXN0IHNvbWUgb2YgdGhlbSkgd2VyZSBz
dG9yaW5nIAppbnRlcm5hbCBzdGF0ZSBpbiB0aGUgc3RhdGUsIG5vdCBwYXNzaW5nIGl0IGZvcndh
cmQuIEFuZCwgb2YgY291cnNlLCB0aGUgCmRyaXZlcnMgd2VyZSB0aGVtc2VsdmVzIGludGVyZXN0
ZWQgaW4gdGhlIHN0YXRlIHN0b3JlZCB0aGVyZS4KCkhlcmUsIHdlIG9ubHkgbmVlZCB0byBhbGxv
Y2F0ZSB0aGUgc3RhdGUgc28gdGhhdCB0aGUgZHJpdmVyIGlzIGFibGUgdG8gCmNhbGwgc2V0X2Zt
dCBvbiBhbm90aGVyIHN1YmRldiwgc28gaXQncyBhIGJpdCBkaWZmZXJlbnQgY2FzZS4KCkFueXdh
eSwgSSB0aGluayBpdCdzIF9ub3RfIG9rIHRvIGFkZCBfX3Y0bDJfc3ViZGV2X3N0YXRlX2FsbG9j
KCkgd2l0aG91dCAKYSBGSVhNRSBjb21tZW50LiBIb3dldmVyLCBJIHRoaW5rIGl0J3Mgb2sgdG8g
YWRkIGEgaGVscGVyIGZ1bmMsIHNpbWlsYXIgCnRvIHY0bDJfc3ViZGV2X2NhbGxfc3RhdGVfYWN0
aXZlKCksIHdoaWNoIGluIHR1cm4gdXNlcyAKX192NGwyX3N1YmRldl9zdGF0ZV9hbGxvYy4KCkhv
d2V2ZXIsIGlmIHdlIGVuZCB1cCBpbiBhIHNpdHVhdGlvbiB3aGVyZSB3ZSB0aGluayBpdCdzICJu
b3JtYWwiIGZvciAKZHJpdmVycyB0byBjYWxsIF9fdjRsMl9zdWJkZXZfc3RhdGVfYWxsb2MsIHdl
IG5lZWQgdG8gcmVuYW1lIGl0IGFuZCBkcm9wIAp0aGUgdHdvIHVuZGVyc2NvcmVzLiBCdXQgSSB0
aGluayB3ZSdyZSBub3QgdGhlcmUgeWV0IChhbmQgaG9wZWZ1bGx5IG5ldmVyKS4KCiAgVG9taQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
