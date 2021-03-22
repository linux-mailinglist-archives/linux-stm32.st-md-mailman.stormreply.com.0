Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8083443EF
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Mar 2021 13:56:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F0FCC57B5B;
	Mon, 22 Mar 2021 12:56:42 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B04DC5662E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Mar 2021 12:56:41 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id o19so19186288edc.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Mar 2021 05:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jhMUMt47Qy3l4R1BzGhFrfV0S7KiLdr2F6jiJY4dFDk=;
 b=RgQ4iWT/PdFY/iZlFFqrrqi0NsFDqfJiPcx0MjPK+u4+kuaUEphxou0541X5gcuUMF
 B1ktR9sSf14DUUjdS0rW5w8wD+s/VdKafMEEQkRi7aQWYV5b5KfGZKTxQFTRDbe4o9Et
 ur3xdFTJjIxTzwcLMX32ZEz2BPQpN2lTEVU5C9FfagnQu9Kt63lX/o86KUyNJwwWmEVL
 9bqHchQm4AdOxvd75FJJlUYz8uV18VlRatZEQpudO8zj/lY5caWi7L9K4mB4eOTosnB6
 LfBOCquCbcDg8ikAMQEK37kKzWb5ncNrB45oh05JRRwL74UXV0fId213OdlAHLDmpyIm
 mZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jhMUMt47Qy3l4R1BzGhFrfV0S7KiLdr2F6jiJY4dFDk=;
 b=jshajyATfxWjvMdTEQvagggl205Ybz+fmLvE3CLDrfQyCBX67I2IbFCNdCT+wLZrTa
 hmO6VQPC3FHH57b51ekG+0BS3C2ZlMYmWRinebW4c//YfLmcN8rX/HYjeWUod1VhCCE2
 +Vc9iLPCQINEYBEhC7wtuPm4ks80imW50mylsac4RGTY5xmLh6wcosYqIetif0jqKeBI
 oX7rbJFvsDX1FhEHjDnvngMRfDMMlGp/zXC2uPdQVEEYz1FtwCz9mBrCfkAfjQ+8MLGW
 VdmlERqZ8EH1FNfkj6XrxIGXlfEWvQb+qEsUvPBtqU+TF0RkO+HWce2dL8kuipGg32B7
 Ze7Q==
X-Gm-Message-State: AOAM531qKCS3nyWNbu6Rq/CmlTiOgJUDPXZ7lUyqLYPNsvH6EYjoPXLT
 t2JkcxWO8qxjenAakZ8VDNtmNg==
X-Google-Smtp-Source: ABdhPJySqR19DC/hCxF0a+sQiHHOwFj/hBIjXHAzej6vqyeDzzJ7iRwppliBGYzEkkTG1KvIeKN+xQ==
X-Received: by 2002:aa7:cf17:: with SMTP id a23mr26254551edy.30.1616417800851; 
 Mon, 22 Mar 2021 05:56:40 -0700 (PDT)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id l18sm9686234ejk.86.2021.03.22.05.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 05:56:40 -0700 (PDT)
Date: Mon, 22 Mar 2021 12:56:38 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20210322125638.GP2916463@dell>
References: <1614793895-10504-1-git-send-email-fabrice.gasnier@foss.st.com>
 <ce30adb7-fe58-6b56-9cc9-3f19692b56c2@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce30adb7-fe58-6b56-9cc9-3f19692b56c2@foss.st.com>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, vilhelm.gray@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stm32-timers: avoid clearing auto
	reload register
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

T24gTW9uLCAyMiBNYXIgMjAyMSwgRmFicmljZSBHYXNuaWVyIHdyb3RlOgoKPiBPbiAzLzMvMjEg
Njo1MSBQTSwgRmFicmljZSBHYXNuaWVyIHdyb3RlOgo+ID4gVGhlIEFSUiByZWdpc3RlciBpcyBj
bGVhcmVkIHVuY29uZGl0aW9uYWxseSB1cG9uIHByb2JpbmcsIGFmdGVyIHRoZSBtYXhpbXVtCj4g
PiB2YWx1ZSBoYXMgYmVlbiByZWFkLiBUaGlzIGluaXRpYWwgY29uZGl0aW9uIGlzIHJhdGhlciBu
b3QgaW50dWl0aXZlLCB3aGVuCj4gPiBjb25zaWRlcmluZyB0aGUgY291bnRlciBjaGlsZCBkcml2
ZXIuIEl0IHJhdGhlciBleHBlY3RzIHRoZSBtYXhpbXVtIHZhbHVlCj4gPiBieSBkZWZhdWx0Ogo+
ID4gLSBUaGUgY291bnRlciBpbnRlcmZhY2Ugc2hvd3MgYSB6ZXJvIHZhbHVlIGJ5IGRlZmF1bHQg
Zm9yICdjZWlsaW5nJwo+ID4gICBhdHRyaWJ1dGUuCj4gPiAtIEVuYWJsaW5nIHRoZSBjb3VudGVy
IHdpdGhvdXQgYW55IHByaW9yIGNvbmZpZ3VyYXRpb24gbWFrZXMgaXQgZG9lc24ndAo+ID4gICBj
b3VudC4KPiA+IAo+ID4gVGhlIHJlc2V0IHZhbHVlIG9mIEFSUiByZWdpc3RlciBpcyB0aGUgbWF4
aW11bS4gU28gQ2hvaWNlIGhlcmUKPiA+IGlzIHRvIGJhY2t1cCBpdCwgYW5kIHJlc3RvcmUgaXQg
dGhlbiwgaW5zdGVhZCBvZiBjbGVhcmluZyBpdHMgdmFsdWUuCj4gPiBJdCBhbHNvIGZpeGVzIHRo
ZSBpbml0aWFsIGNvbmRpdGlvbiBzZWVuIGJ5IHRoZSBjb3VudGVyIGRyaXZlci4KPiA+IAo+ID4g
Rml4ZXM6IGQwZjk0OWUyMjBmZCAoIm1mZDogQWRkIFNUTTMyIFRpbWVycyBkcml2ZXIiKQo+ID4g
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEdhc25pZXIgPGZhYnJpY2UuZ2FzbmllckBmb3Nz
LnN0LmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbWZkL3N0bTMyLXRpbWVycy5jIHwgNyArKysr
KystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
IAo+IEhpLAo+IAo+IEl0J3MganVzdCBhIGdlbnRsZSByZW1pbmRlciB0byByZXZpZXcgdGhpcyBw
YXRjaC4KCkxvb2tzIGxpa2UgdGhpcyB3YXMgZWl0aGVyIGRyb3BwZWQsIG9yIGRpZG4ndCBtYWtl
IGl0IGludG8gbXkgcXVldWUuCgpJdCdzIG9uIHRoZSBsaXN0IG5vdywgSSB3aWxsIGRlYWwgd2l0
aCBpdCBzb29uLgoKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9zdG0zMi10aW1lcnMuYyBi
L2RyaXZlcnMvbWZkL3N0bTMyLXRpbWVycy5jCj4gPiBpbmRleCBhZGQ2MDMzLi40NGVkMmZjIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tZmQvc3RtMzItdGltZXJzLmMKPiA+ICsrKyBiL2RyaXZl
cnMvbWZkL3N0bTMyLXRpbWVycy5jCj4gPiBAQCAtMTU4LDEzICsxNTgsMTggQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCByZWdtYXBfY29uZmlnIHN0bTMyX3RpbWVyc19yZWdtYXBfY2ZnID0gewo+ID4g
IAo+ID4gIHN0YXRpYyB2b2lkIHN0bTMyX3RpbWVyc19nZXRfYXJyX3NpemUoc3RydWN0IHN0bTMy
X3RpbWVycyAqZGRhdGEpCj4gPiAgewo+ID4gKwl1MzIgYXJyOwo+ID4gKwo+ID4gKwkvKiBCYWNr
dXAgQVJSIHRvIHJlc3RvcmUgaXQgYWZ0ZXIgZ2V0dGluZyB0aGUgbWF4aW11bSB2YWx1ZSAqLwo+
ID4gKwlyZWdtYXBfcmVhZChkZGF0YS0+cmVnbWFwLCBUSU1fQVJSLCAmYXJyKTsKPiA+ICsKPiA+
ICAJLyoKPiA+ICAJICogT25seSB0aGUgYXZhaWxhYmxlIGJpdHMgd2lsbCBiZSB3cml0dGVuIHNv
IHdoZW4gcmVhZGJhY2sKPiA+ICAJICogd2UgZ2V0IHRoZSBtYXhpbXVtIHZhbHVlIG9mIGF1dG8g
cmVsb2FkIHJlZ2lzdGVyCj4gPiAgCSAqLwo+ID4gIAlyZWdtYXBfd3JpdGUoZGRhdGEtPnJlZ21h
cCwgVElNX0FSUiwgfjBMKTsKPiA+ICAJcmVnbWFwX3JlYWQoZGRhdGEtPnJlZ21hcCwgVElNX0FS
UiwgJmRkYXRhLT5tYXhfYXJyKTsKPiA+IC0JcmVnbWFwX3dyaXRlKGRkYXRhLT5yZWdtYXAsIFRJ
TV9BUlIsIDB4MCk7Cj4gPiArCXJlZ21hcF93cml0ZShkZGF0YS0+cmVnbWFwLCBUSU1fQVJSLCBh
cnIpOwo+ID4gIH0KPiA+ICAKPiA+ICBzdGF0aWMgaW50IHN0bTMyX3RpbWVyc19kbWFfcHJvYmUo
c3RydWN0IGRldmljZSAqZGV2LAo+ID4gCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlv
ciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVu
IHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBU
d2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
