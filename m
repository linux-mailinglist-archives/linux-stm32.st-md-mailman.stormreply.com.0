Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A135C14517
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2019 09:25:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D175C78F66
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2019 07:25:47 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 493CAC78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 May 2019 07:25:46 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id p19so3630315qkm.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 May 2019 00:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pO57+WHM9icAQXA84tNTYrkL98PNEsC+5xBzFAyNyVg=;
 b=Q4sRowf0YZqref5eztkLd8S7ufHGsFLRndJMSOMuqY3b4S0MmgjZiYllijIxccx3+i
 d8qqm5j/vpnQrGZwJxPwwlWKsTrjEKWY6V1DThjLxMKK0nJ3OLFoyeqykRh4uzGe/OfR
 dByViWZvEs33mHGK/JVSuWGgxQUZHf262x09TCQPzgdAysQkppKolZRuF8gPsb228h1n
 iZNxlwS9hfyLFHgtVphlUl3yYDAaS0SGzHvmBgn3v+C0jrO4dnMBQekgtaTwTwxTYNQj
 JDN9iFu/x6u/ntfRt42Z+55u5TsUjZFp48zR3MbdjmPhULajgsdi4kI1dK6BPdNnQTjK
 OxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pO57+WHM9icAQXA84tNTYrkL98PNEsC+5xBzFAyNyVg=;
 b=m+p2TgaHRU7o+SX3ZHdi6kZZ8TGM4/KupU7CLpRuM+G4xm6CWOU/STFVP5SK3IyY8x
 8o1+qhfkvga8n3VRWqKoBYiNhON+o1dLPKv7uAJ/q2qnwcjOdMwdqJYo6YabADyMnBmo
 6zu9dk6N9I4GZRcRUL69Ud40EQ36I0/1C/jtdYhyEF9D/NexrcoY/B47ayuwh/xYjcPr
 okJM9yPuR5S8nPsn4ozqOeOigqLKsZqWnIPnBfQ6yQpsCu7LLAXP5Ik6ECn9v6zB6CpV
 g8e/cQdT6JMXXSjes4vWuXXPdpCvGr7ndZrxAcyBY00DIx1qHxsYpMYVVU0s9BD6dejl
 8nDQ==
X-Gm-Message-State: APjAAAUz3h0iCiObOyFax+34LIAMX4WLDk2TXrYMh6dxrxt7etlH6D8r
 rbZk4qyLnPyk6kH5eL+rCUONcC0KBNp19Uv6IzTqmQ==
X-Google-Smtp-Source: APXvYqzi6kaFJ7dpE+n+VOhA31cBwTt9A6DfQSW/RJ6FOD2P+M23nMnX4FFbt/nvMku6Ns54SMrMIRxJijtROfat5M4=
X-Received: by 2002:a37:8843:: with SMTP id k64mr18569492qkd.8.1557127545107; 
 Mon, 06 May 2019 00:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <1556114601-30936-1-git-send-email-fabien.dessenne@st.com>
 <1556114601-30936-2-git-send-email-fabien.dessenne@st.com>
 <c445397b-36a7-3511-603a-e94ae6ddcf12@st.com>
In-Reply-To: <c445397b-36a7-3511-603a-e94ae6ddcf12@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Mon, 6 May 2019 09:25:34 +0200
Message-ID: <CA+M3ks6M7BC3VP-4O7suVucnYySJps4CxyAyVz_ra5EVDUzrag@mail.gmail.com>
To: Philippe CORNU <philippe.cornu@st.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 Yannick FERTRE <yannick.fertre@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/2] drm/stm: ltdc: manage the get_irq
	probe defer case
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

TGUgdmVuLiAyNiBhdnIuIDIwMTkgw6AgMTQ6MzAsIFBoaWxpcHBlIENPUk5VIDxwaGlsaXBwZS5j
b3JudUBzdC5jb20+IGEgw6ljcml0IDoKPgo+IEhpIEZhYmllbiwKPiBhbmQgdGhhbmsgeW91IGZv
ciB5b3VyIHBhdGNoLAo+Cj4gQWNrZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3Ju
dUBzdC5jb20+Cj4KPiBQaGlsaXBwZSA6LSkKPgo+IE9uIDQvMjQvMTkgNDowMyBQTSwgRmFiaWVu
IERlc3Nlbm5lIHdyb3RlOgo+ID4gTWFuYWdlIHRoZSAtRVBST0JFX0RFRkVSIGVycm9yIGNhc2Ug
Zm9yIHRoZSBsdGRjIElSUS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJpZW4gRGVzc2VubmUg
PGZhYmllbi5kZXNzZW5uZUBzdC5jb20+CgpBcHBsaWVkIG9uIGRybS1taXNjLW5leHQuClRoYW5r
cywKQmVuamFtaW4KCj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCAz
ICsrKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9s
dGRjLmMKPiA+IGluZGV4IDU2NmIwZDguLjUyMWJhODMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vc3RtL2x0ZGMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMK
PiA+IEBAIC0xMTc0LDYgKzExNzQsOSBAQCBpbnQgbHRkY19sb2FkKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZGV2KQo+ID4KPiA+ICAgICAgIGZvciAoaSA9IDA7IGkgPCBNQVhfSVJROyBpKyspIHsKPiA+
ICAgICAgICAgICAgICAgaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCBpKTsKPiA+ICsgICAg
ICAgICAgICAgaWYgKGlycSA9PSAtRVBST0JFX0RFRkVSKQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIGdvdG8gZXJyOwo+ID4gKwo+ID4gICAgICAgICAgICAgICBpZiAoaXJxIDwgMCkKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+Cj4gPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
