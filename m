Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFC16CA218
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 13:07:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84FE8C6905A;
	Mon, 27 Mar 2023 11:07:02 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B778C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 11:07:01 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id e18so8308011wra.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 04:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679915220;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qitJTqC1V5NX4sqdWfyfOSl5R7cjvJjk8ZEy1hQzGYw=;
 b=uZKetoWJiYs++Fgjpf9n+9rMID4at3FHq8zR9UT1O/0uo5hUok59vw/gaUyKRIF9lh
 eZ+W/gt0HbWb5I+4PoOaU9DSMdUhmndm2Ou669CxfJ3AfCzZ/tUYxzZuwZgQdKjet0z5
 aMWIXxPMmPGhfnPrCx+kFJ/zcZZvn2MLkD+jfzbCw6J0SefC9ForEtNmAn4LfUsA/JUt
 FdZ6kDn3PvmE3GsEyBw4xW3MaG15fka/zB7iP+q4VN8KJbOoaS8JhYkUJBHIj4McJTQ+
 nft4zMNSISkqF6667a6kUzxfz3JKI7HBEWDiL46dHbaNKPTGPJa1GdL53w5ZX6WT+7Xb
 ofxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679915220;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qitJTqC1V5NX4sqdWfyfOSl5R7cjvJjk8ZEy1hQzGYw=;
 b=5OPYhtDcfnmgv3KmYn4UAbNL+IXgVdOd1HM2UTy+W3gWUnV0sssu8ON5mgMnHjE3In
 ba/4Pp+2SYRaOX/cgfYTMfpT72x7JMHwNMeZGCFDqRehrEzFTqHU59cPPNle6Stw3Yfb
 PjEJERmf4dF7hamcJKeD4i8cRfxV1aiGGeBcZZEbCXRieVg7VMeh0yXcRpZNKroKsx2h
 BWFEskJ/ojJuT21zw1EUX7rfedM0RMKfbfYxfyBspiK7HnLq3uhYGKY49HZweFvhtO3K
 9hC3YWmA8DiQITqQ/QUx3VDAUZKQy362gv1+QBYsjUii+TqFWMmDy5TyhyTjkRR7W4AN
 C2mg==
X-Gm-Message-State: AAQBX9evummYA7flowq2J6g9K5CLJBkEyuV1q61U0AHC/GsQkBZYWH0d
 zhg3m9WYDL+YAwNGRrvHJ9TpjA==
X-Google-Smtp-Source: AKy350YWw4DxoHkP05YdbwUNjWA9N5HHoPz6vmYEJISihg2trk7/De13x7ewKuibreEd0BHOEXJ70A==
X-Received: by 2002:adf:fe08:0:b0:2d6:a357:f138 with SMTP id
 n8-20020adffe08000000b002d6a357f138mr9284325wrr.18.1679915220550; 
 Mon, 27 Mar 2023 04:07:00 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
 by smtp.gmail.com with ESMTPSA id
 f9-20020adff989000000b002cea392f000sm24774833wrr.69.2023.03.27.04.06.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 04:07:00 -0700 (PDT)
Message-ID: <70d0a8b6-62c2-fa3e-df5c-f86ba75484d0@linaro.org>
Date: Mon, 27 Mar 2023 12:06:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20230327094742.38856-1-christophe.kerello@foss.st.com>
 <20230327094742.38856-3-christophe.kerello@foss.st.com>
 <75dcd205-5432-7103-370c-d65d792631ea@linaro.org>
 <20230327124313.1ccd3d66@xps-13>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230327124313.1ccd3d66@xps-13>
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 2/2] mtd: rawnand: stm32_fmc2: use
 timings.mode instead of checking tRC_min
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

CgpPbiAzLzI3LzIzIDExOjQzLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIFR1ZG9yLAo+IAo+
IHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZyB3cm90ZSBvbiBNb24sIDI3IE1hciAyMDIzIDExOjMw
OjUxICswMTAwOgo+IAo+PiBPbiAzLzI3LzIzIDEwOjQ3LCBDaHJpc3RvcGhlIEtlcmVsbG8gd3Jv
dGU6Cj4+PiBUaGlzIHBhdGNoIGlzIHVzaW5nIHRpbWluZ3MubW9kZSB2YWx1ZSBpbnN0ZWFkIG9m
IGNoZWNraW5nIHRSQ19taW4gdGltaW5nCj4+PiBmb3IgRURPIG1vZGUgc3VwcG9ydC4KPj4+ICAg
Cj4+Cj4+IEZpeGVzIGFuZCBDYyB0byBzdGFibGUgaGVyZSB0b28sIGFzIHlvdSdkIGxpa2UgdG8g
aGF2ZSB0aGlzIGJhY2twb3J0ZWQKPj4gYXMgd2VsbCwgZG9uJ3QgeW91Pwo+IAo+IEFjdHVhbGx5
IHRoZSByZWFzb24gd2h5IENocmlzdG9waGUgc3BsaXQgdGhpcyBpbnRvIHR3byBwYXRjaGVzIGlz
Cj4gYmVjYXVzZSB0aW1pbmdzLm1vZGUgd2FzIGludHJvZHVjZWQgcmF0aGVyIGxhdGVseSwgaGUg
d2FudGVkIHRoZSBzYW1lCj4gcGF0Y2ggdG8gYXBwbHkgb24gYWxsIHN0YWJsZSBrZXJuZWxzLCBo
ZSBhY3R1YWxseSBhc2tlZCBmb3IgdGhhdCBzcGxpdAo+IGFuZCBJIGFncmVlZCAoYW5vdGhlciBz
b2x1dGlvbiB3b3VsZCBoYXZlIGJlZW4gdG8gc2VuZCB0aGlzIGN1cnJlbnQKPiBwYXRjaCB0byBM
aW51cyBhbmQgaGF2ZSB0aGUgb3RoZXIgdmVyc2lvbiBzZW50IHRvIHN0YWJsZSwgYnV0IGl0Cj4g
cmVxdWlyZXMgYSBiaXQgb2Ygc2NoZWR1bGluZyBvbiBib3RoIGVuZHMpLgo+IAo+IExpbms6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIzMDMyNzEwMTE1Ni4wZWMyODE2YUB4
cHMtMTMvVC8jdAoKUmlnaHQsIEkgdW5kZXJzdG9vZCB0aGF0IGZyb20gdGhlIGJlZ2lubmluZy4g
SWYgaXQgd2VyZSB0byBtZSwgSSB3b3VsZApDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjdjUu
NCsgZm9yIHRoZSBmaXJzdCBwYXRjaCBhbmQKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgI3Y1
LjEwKyBmb3IgdGhlIHNlY29uZC4KClNvIGZpcnN0IHdvdWxkIGJlIGFsb25lIGp1c3QgaW4gdjUu
NCwgYW5kIHN0YXJ0aW5nIHdpdGggdjUuMTAgd2UnbGwgaGF2ZQpib3RoIGFuZCB3ZSdsbCBtaW1p
YyB3aGF0IHdlIGN1cnJlbnRseSBoYXZlIGluIHVwc3RyZWFtIG1haW5saW5lLgoKPiAKPj4KPj4+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQGZv
c3Muc3QuY29tPiAgCj4+Cj4+IFJldmlld2VkLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJh
cnVzQGxpbmFyby5vcmc+Cj4+Cj4+PiAtLS0KPj4+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0z
Ml9mbWMyX25hbmQuYyB8IDIgKy0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
c3RtMzJfZm1jMl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQu
Ywo+Pj4gaW5kZXggM2FiYjYzZDAwYTBiLi45ZTc0YmNkOTBhYWEgMTAwNjQ0Cj4+PiAtLS0gYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+Pj4gKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMKPj4+IEBAIC0xNTMxLDcgKzE1MzEsNyBAQCBz
dGF0aWMgaW50IHN0bTMyX2ZtYzJfbmZjX3NldHVwX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlw
ICpjaGlwLCBpbnQgY2hpcG5yLAo+Pj4gIAlpZiAoSVNfRVJSKHNkcnQpKQo+Pj4gIAkJcmV0dXJu
IFBUUl9FUlIoc2RydCk7Cj4+PiAgCj4+PiAtCWlmIChzZHJ0LT50UkNfbWluIDwgMzAwMDApCj4+
PiArCWlmIChjb25mLT50aW1pbmdzLm1vZGUgPiAzKQo+Pj4gIAkJcmV0dXJuIC1FT1BOT1RTVVBQ
Owo+Pj4gIAo+Pj4gIAlpZiAoY2hpcG5yID09IE5BTkRfREFUQV9JRkFDRV9DSEVDS19PTkxZKSAg
Cj4gCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
