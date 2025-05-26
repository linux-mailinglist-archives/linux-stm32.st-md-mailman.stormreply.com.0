Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 047FCAC4294
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 17:52:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A874FC36B0F;
	Mon, 26 May 2025 15:52:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAABFC36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 15:52:07 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QB4fPp012749;
 Mon, 26 May 2025 17:51:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 rW5ZHuaPdfqfwDvrnkrsezcElkYLPA1vqOkoWGgulJw=; b=7KAOfWuSkxrfv3ap
 O/Sd902RG47wwlINI4gwwK7ogvvAsXgo4HKT2hcSwYMLVZjKAzZBh4Jqlzi3/DC5
 UB6qLfo2/9JVQ+w+LizQVutPccWnKsLldljzQ69yzezypqQbxJyyr8hVJzYHeatI
 oQsACu+tzGfsUuiODQFi8BxsiPO4RYcdPpA1/vVxdUGm0ctQj9dTvy0LQmJEi8C5
 1/Fh3z+pnmZpvX0jnyBWOQQpF2tGmN+Wr4rIn0Hz2Vlx6tQG4JnxtZVUoxjI70Tl
 PHa0sdv/yDXDIkr54h9okZ7Vov/saSr6jtTloRwKPzoo1SmxwjC7DfxqsfyozAlU
 tNr7oQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46uqp4dnhb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 May 2025 17:51:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E564F40056;
 Mon, 26 May 2025 17:50:19 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9BE99ACB869;
 Mon, 26 May 2025 17:48:33 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 17:48:33 +0200
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 17:48:32 +0200
Message-ID: <ab75c390-b172-4dbb-b46b-8cbf64d4600a@foss.st.com>
Date: Mon, 26 May 2025 17:48:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <noname.nuno@gmail.com>
References: <20250515083101.3811350-1-nichen@iscas.ac.cn>
 <229cf78caaa7e9f2bb4cfa62c019acd51a1cd684.camel@gmail.com>
 <20250525120703.5dd89fc2@jic23-huawei>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250525120703.5dd89fc2@jic23-huawei>
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_08,2025-05-26_02,2025-03-28_01
Cc: andy@kernel.org, robh@kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Chen Ni <nichen@iscas.ac.cn>, nuno.sa@analog.com,
 u.kleine-koenig@baylibre.com, mcoquelin.stm32@gmail.com, tglx@linutronix.de,
 dlechner@baylibre.com, jirislaby@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-adc: Fix race in
 installing chained IRQ handler
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

Ck9uIDUvMjUvMjUgMTM6MDcsIEpvbmF0aGFuIENhbWVyb24gd3JvdGU6Cj4gT24gVGh1LCAxNSBN
YXkgMjAyNSAxMToyNjo1NiArMDEwMAo+IE51bm8gU8OhIDxub25hbWUubnVub0BnbWFpbC5jb20+
IHdyb3RlOgo+IAo+PiBPbiBUaHUsIDIwMjUtMDUtMTUgYXQgMTY6MzEgKzA4MDAsIENoZW4gTmkg
d3JvdGU6Cj4+PiBGaXggYSByYWNlIHdoZXJlIGEgcGVuZGluZyBpbnRlcnJ1cHQgY291bGQgYmUg
cmVjZWl2ZWQgYW5kIHRoZSBoYW5kbGVyCj4+PiBjYWxsZWQgYmVmb3JlIHRoZSBoYW5kbGVyJ3Mg
ZGF0YSBoYXMgYmVlbiBzZXR1cCwgYnkgY29udmVydGluZyB0bwo+Pj4gaXJxX3NldF9jaGFpbmVk
X2hhbmRsZXJfYW5kX2RhdGEoKS4KPj4+Cj4+PiBGaXhlczogZDU4YzY3ZDFkODUxICgiaWlvOiBh
ZGM6IHN0bTMyLWFkYzogYWRkIHN1cHBvcnQgZm9yIFNUTTMyTVAxIikKPj4+IFNpZ25lZC1vZmYt
Ynk6IENoZW4gTmkgPG5pY2hlbkBpc2Nhcy5hYy5jbj4KPj4+IC0tLSAgCj4+Cj4+IFJldmlld2Vk
LWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgo+IExvb2tzIGdvb2QgdG8gbWUgYW5k
IEkndmUgcXVldWVkIGl0IHVwIGZvciBhZnRlciByYzEuICBJZiBhbnkKPiBTVCBmb2xrIGhhdmUg
dGltZSB0byB0YWtlIGEgbG9vayB0aGF0IHdvdWxkIGJlIGdyZWF0LgoKSGkgSm9uYXRoYW4sCgpP
bmUgbWlub3IgY29tbWVudCBhdCBteSBlbmQsIG5vdCBzdXJlIGlmIHRoYXQgY2hhbmdlcyBhIGxv
dC4uLgpUaGlzIGNvdWxkIGJlIGEgZml4IGZvciB0aGUgb2xkZXIgY29tbWl0OgoxYWRkNjk4ODAy
NDAgKCJpaW86IGFkYzogQWRkIHN1cHBvcnQgZm9yIFNUTTMyIEFEQyBjb3JlIikKCkFwYXJ0IGZy
b20gdGhhdCwgeW91IGNhbiBhZGQgbXk6ClRlc3RlZC1ieTogRmFicmljZSBHYXNuaWVyIDxmYWJy
aWNlLmdhc25pZXJAZm9zcy5zdC5jb20+ClJldmlld2VkLWJ5OiBGYWJyaWNlIEdhc25pZXIgPGZh
YnJpY2UuZ2FzbmllckBmb3NzLnN0LmNvbT4KCkJSLApGYWJyaWNlCgo+IAo+IEpvbmF0aGFuCj4g
Cj4+Cj4+PiBDaGFuZ2Vsb2c6Cj4+Pgo+Pj4gdjEgLT4gdjI6Cj4+Pgo+Pj4gMS4gQWRkIEZpeGVz
IHRhZy4KPj4+IC0tLQo+Pj4gwqBkcml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLWNvcmUuYyB8IDcg
KysrLS0tLQo+Pj4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLWNvcmUu
YyBiL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMtCj4+PiBjb3JlLmMKPj4+IGluZGV4IGJkMzQ1
ODk2NWJmZi4uMjFjMDRhOThiM2I2IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9paW8vYWRjL3N0
bTMyLWFkYy1jb3JlLmMKPj4+ICsrKyBiL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMtY29yZS5j
Cj4+PiBAQCAtNDMwLDEwICs0MzAsOSBAQCBzdGF0aWMgaW50IHN0bTMyX2FkY19pcnFfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZQo+Pj4gKnBkZXYsCj4+PiDCoAkJcmV0dXJuIC1FTk9NRU07
Cj4+PiDCoAl9Cj4+PiDCoAo+Pj4gLQlmb3IgKGkgPSAwOyBpIDwgcHJpdi0+Y2ZnLT5udW1faXJx
czsgaSsrKSB7Cj4+PiAtCQlpcnFfc2V0X2NoYWluZWRfaGFuZGxlcihwcml2LT5pcnFbaV0sIHN0
bTMyX2FkY19pcnFfaGFuZGxlcik7Cj4+PiAtCQlpcnFfc2V0X2hhbmRsZXJfZGF0YShwcml2LT5p
cnFbaV0sIHByaXYpOwo+Pj4gLQl9Cj4+PiArCWZvciAoaSA9IDA7IGkgPCBwcml2LT5jZmctPm51
bV9pcnFzOyBpKyspCj4+PiArCQlpcnFfc2V0X2NoYWluZWRfaGFuZGxlcl9hbmRfZGF0YShwcml2
LT5pcnFbaV0sCj4+PiArCQkJCQkJIHN0bTMyX2FkY19pcnFfaGFuZGxlciwKPj4+IHByaXYpOwo+
Pj4gwqAKPj4+IMKgCXJldHVybiAwOwo+Pj4gwqB9ICAKPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
