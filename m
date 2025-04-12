Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5959A86E99
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Apr 2025 20:08:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8617CC78F85;
	Sat, 12 Apr 2025 18:08:19 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FA7CC78F80
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Apr 2025 18:08:18 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-ac2dfdf3c38so595492666b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Apr 2025 11:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744481298; x=1745086098;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4dTqsGRTGY0t5K+LIOjuDzlZh6c2Mj0q/pqOoIFtsZM=;
 b=lG7G4rczbf7+n+aYp1cskfRC1fdtHQzlFS4lO5Bf0HXDges5lbS9MU2MXNKBUMQD3O
 dODDxIT6iPFVT0ZGsVgwunbqMcjKquhAlth8+XSUuc8xin57vl2/psUldfxjkbpSzygw
 OmoSnI1DJp0pes4qOL6ogFIOnO3MqAC0+6OBTexCw4P+lAnOiuUo9THb7gT2NlL8Qswb
 bg2Z+AFmAVTx7lvXnh+qIG/Kb4tpS8OCPb/MxBjLurYzgDyWdG2g2A6l/URYL5SO7SWe
 xA2OutEFRCGIziFi4Zptjy5lJ9YJOv/rBFsPQPpG0ydirXoRkg9Ruv3HT/iIPYiZjDEJ
 GPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744481298; x=1745086098;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4dTqsGRTGY0t5K+LIOjuDzlZh6c2Mj0q/pqOoIFtsZM=;
 b=pWwXn+jcHkslyAnbse83cnI/M0DxaJ5uDypApEL8SGbkNQr7KyFN0Kv9PrSU0+3W/p
 MlT/APWfM4eb3AQ8MlGG+Dcm3SGTQyWDW1xuWHvP1+q/yWU2BRqUPTMjn5NgjqUM4kIQ
 ovI47daOScWSH21HSUbx/AvcPu0pmvklExD7dKY2B/S8lMC2cGd5nB0S60+JmglLyHah
 6VgM+b7ZS7UDEWZemO9ztPOzD2eOG/RfUGv9Atm0mrZSBOxRR9n8nkDtLHT5ilf+L7jj
 b3jqwZjFCLu3rOesIJqnYoRj+cNedm7tQtCLVfdCvl/BEKhOEpIYtfuWfWtmLsaz7N6U
 VIMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmhypUdZgfbM7+T1bKAAC/B+neI1anRHQjWKDyjDW2RUFU1dOangCqNTRAksl8JkEpZfdOVVVvG0Oz6A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzWj/Btpp5Q3YDIlTo/wX555W8pT8H8HtA5u2OGa2Tt4BtAJOkj
 EC+NTmklt4ZCc+4RyBjClldPG/GHj9f0ldNTRFDLtzQ3GSUt4qMVvbBiB2j8UMQcsZ2zOjQkuVw
 LdSmPMt0zP6BM68wDGqRbhGBt2Ks=
X-Gm-Gg: ASbGncv/S7Z2BXRQjFsxohH2+FD3sL5RJ8yHD4qhMBV5ta6Em1hI6sF3RGXway4rX6V
 haI/PIaAuClDULPPYLEc9hxyHZh2OivGfuKilZ9R4nEY7U6UvwxyrvwsFfWwraARhXuPvJlPGiF
 Y3/c9uzCtBOjK4VP1j5pVj7Q==
X-Google-Smtp-Source: AGHT+IHwlMauSDYb3F4+xs9iOl49uDgO0Bqw97Xx22A+KavQlXG+0XcEY/aOXY8qAnhH/8FJz/p3UexMTPyWevIHvSk=
X-Received: by 2002:a17:907:8694:b0:aca:cc2c:862a with SMTP id
 a640c23a62f3a-acad3456e74mr687348866b.5.1744481297320; Sat, 12 Apr 2025
 11:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250410135836.2091238-1-olivier.moysan@foss.st.com>
 <20250412142606.66673634@jic23-huawei>
In-Reply-To: <20250412142606.66673634@jic23-huawei>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 12 Apr 2025 21:07:41 +0300
X-Gm-Features: ATxdqUHG8l2dJ0PpOTJX-K4td1_yt9Tsr0rZ-bQ6xLHZ1IHBrZe_mC4b0mFcaRk
Message-ID: <CAHp75VfUkStzq4zrKkaQ67REuuTSGhoD9o1LXU-YohUULBnd=w@mail.gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] iio: adc: stm32: add oversampling
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gU2F0LCBBcHIgMTIsIDIwMjUgYXQgNDoyNuKAr1BNIEpvbmF0aGFuIENhbWVyb24gPGppYzIz
QGtlcm5lbC5vcmc+IHdyb3RlOgo+IE9uIFRodSwgMTAgQXByIDIwMjUgMTU6NTg6MzUgKzAyMDAK
PiBPbGl2aWVyIE1veXNhbiA8b2xpdmllci5tb3lzYW5AZm9zcy5zdC5jb20+IHdyb3RlOgoKLi4u
Cgo+ID4gVGhlIGN1cnJlbnQgc3VwcG9ydCBvZiB0aGUgb3ZlcnNhbXBsaW5nIGZlYXR1cmUgYWlt
cyBhdCBpbmNyZWFzaW5nCj4gPiB0aGUgZGF0YSBTTlIsIHdpdGhvdXQgY2hhbmdpbmcgdGhlIGRh
dGEgcmVzb2x1dGlvbi4KPiA+IEFzIHRoZSBvdmVyc2FtcGxpbmcgYnkgaXRzZWxmIGluY3JlYXNl
cyBkYXRhIHJlc29sdXRpb24sCj4gPiBhIHJpZ2h0IHNoaWZ0IGlzIGFwcGxpZWQgdG8ga2VlcCBp
bml0aWFsIHJlc29sdXRpb24uCj4gPiBPbmx5IHRoZSBvdmVyc2FtcGxpbmcgcmF0aW8gY29ycmVz
cG9uZGluZyB0byBhIHBvd2VyIG9mIHR3byBhcmUKPiA+IHN1cHBvcnRlZCBoZXJlLCB0byBnZXQg
YSBkaXJlY3QgbGluayBiZXR3ZWVuIHJpZ2h0IHNoaWZ0IGFuZAo+ID4gb3ZlcnNhbXBsaW5nIHJh
dGlvLiAoMmV4cChuKSByYXRpbyA8PT4gbiByaWdodCBzaGlmdCkKCkkgaGF2ZSBqdXN0IG5vdGlj
ZWQgdGhlIGludGVyZXN0aW5nIChhbmQgcGVyaGFwcyBtaXNsZWFkaW5nKSBzeW1ib2xzCmluIGZv
cm11bGFzIGhlcmUgYW5kIGluIHRoZSBjb21tZW50IGluIHRoZSBjb2RlLgoKSSB3b3VsZCBleHBl
Y3QgdG8gc2VlIHRoZSBhYm92ZSBhcyAyXm4uIEJlY2F1c2UgZXhwIG1ha2VzIG1lIHRoaW5rCmFi
b3V0IGUgKG5hdHVyYWwgbG9nYXJpdGhtIGJhc2UpIHJhdGhlciB0aGFuIGFib3V0IHBvd2VyLgoK
LS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
