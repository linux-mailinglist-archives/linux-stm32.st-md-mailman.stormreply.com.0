Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE09821842E
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jul 2020 11:50:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 844B8C36B2A;
	Wed,  8 Jul 2020 09:50:13 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82D05C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2020 09:50:11 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id p7so20153087qvl.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jul 2020 02:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iieBKdbIkdmEuMGEGprBPwP4csgir63UCa7hLiCZa6M=;
 b=V0OXdErRBTLupYqEipOINuiPtJHpcBsQM7/vHKaEFnLr1pkYpzxqJ1o5kwevmUf51v
 ymvzDBTQSIilevzrrRUM4+4ipAZ9ih4hVe6ZrAzFnVeVEgMQ/k2aThSZ2/nQya1S7EDH
 Qd2TD6ya6A/5iK9oYR34gwpj0ux70WO/xXd5/m1+qP2Qi8PJapFMg38N6nIeKQA6F44a
 GguvxOE49pmpAi27JrlclXO/t4Bsy9Bg8cXEh7oBOU+iCPn7jMB2DEooEv/rQcEXDzPs
 oAO68G4VpK+E6o+siOv3ErW+s7llta1udcMF/FyfjlLVvSsUxmrp9eFPuQcV5fdzmHkU
 olmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iieBKdbIkdmEuMGEGprBPwP4csgir63UCa7hLiCZa6M=;
 b=G6d20F+OkMuT05mmPKjgE8KrpWtlaYc+CkRqO77BIxgi9fgGpv/iSVXe6JTsBuJNJP
 VIljJlm9PEg/rmH/bRRrJb7lloYuviT3yeoEoIe5GnlwI/19788+aKEMazLCPnDlw1u8
 9jo+HPc6FigVe2vGpC3mIS+AfiBmF8PTpVX9kIIEAB3X3GBQBg4OMv4B/DcVKsMYe6hC
 n+T6Zx9x+9OpgQxKprcmNZINyfOTUGYdcUe6TPDEXOivpCQQiK+EByS4EqQ+sI79s/w9
 sknet8gfqCwMHf7J0/F9cd6E2Ilp8nk6yQKLmhYw9JWoTwL4r2Gf9S6PAsSmnUhr9zEI
 h6Ug==
X-Gm-Message-State: AOAM531sA4eqm4uVEhrLV96HExKbmephR3kchmLFXRb+cPrFgM2XK/04
 JAtahyp12RA9SX9boP1IZCn6MNB/xmv9sSjATFNi8g==
X-Google-Smtp-Source: ABdhPJynDfM3uILfAaTGVj9hpsAurHgU0H8GJVeZIADk8ItE2celzPpaFYs9GExbIpvouqqha+/tw2oz4EiSUlwgghg=
X-Received: by 2002:a0c:ec04:: with SMTP id y4mr52177980qvo.148.1594201810456; 
 Wed, 08 Jul 2020 02:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200701120402.6444-1-yannick.fertre@st.com>
 <3b6e02b8-0f54-4eb0-9728-b304a1aa85d5@st.com>
In-Reply-To: <3b6e02b8-0f54-4eb0-9728-b304a1aa85d5@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Wed, 8 Jul 2020 11:49:59 +0200
Message-ID: <CA+M3ks4Bb8ZHzYSZ0v86PvE3x=C30Gmi+mDVJ=PQ7uzPZ8x-+w@mail.gmail.com>
To: Philippe CORNU <philippe.cornu@st.com>
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: remove call of pm-runtime
	functions
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

TGUgamV1LiAyIGp1aWwuIDIwMjAgw6AgMTQ6MTgsIFBoaWxpcHBlIENPUk5VIDxwaGlsaXBwZS5j
b3JudUBzdC5jb20+IGEgw6ljcml0IDoKPgo+Cj4KPiBPbiA3LzEvMjAgMjowNCBQTSwgWWFubmlj
ayBGZXJ0cmUgd3JvdGU6Cj4gPiBJdCBpcyBub3QgbmVjZXNzYXJ5IHRvIHN1c3BlbmQgb3Igc3Rv
cCB0aGUgbHRkYyBjbG9ja3MKPiA+IHRvIG1vZGlmeSB0aGUgcGl4ZWwgY2xvY2suCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KPiA+
IC0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8IDE2IC0tLS0tLS0tLS0tLS0t
LS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDE2IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRk
Yy5jCj4gPiBpbmRleCAzZjU5MGQ5MTZlOTEuLjZlMjhmNzA3MDkyZiAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3Rt
L2x0ZGMuYwo+ID4gQEAgLTUwNiwxNSArNTA2LDcgQEAgc3RhdGljIGJvb2wgbHRkY19jcnRjX21v
ZGVfZml4dXAoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICphZGp1c3RlZF9tb2RlKQo+ID4gICB7
Cj4gPiAgICAgICBzdHJ1Y3QgbHRkY19kZXZpY2UgKmxkZXYgPSBjcnRjX3RvX2x0ZGMoY3J0Yyk7
Cj4gPiAtICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiA9IGNydGMtPmRldjsKPiA+ICAgICAg
IGludCByYXRlID0gbW9kZS0+Y2xvY2sgKiAxMDAwOwo+ID4gLSAgICAgYm9vbCBydW50aW1lX2Fj
dGl2ZTsKPiA+IC0gICAgIGludCByZXQ7Cj4gPiAtCj4gPiAtICAgICBydW50aW1lX2FjdGl2ZSA9
IHBtX3J1bnRpbWVfYWN0aXZlKGRkZXYtPmRldik7Cj4gPiAtCj4gPiAtICAgICBpZiAocnVudGlt
ZV9hY3RpdmUpCj4gPiAtICAgICAgICAgICAgIHBtX3J1bnRpbWVfcHV0X3N5bmMoZGRldi0+ZGV2
KTsKPiA+Cj4gPiAgICAgICBpZiAoY2xrX3NldF9yYXRlKGxkZXYtPnBpeGVsX2NsaywgcmF0ZSkg
PCAwKSB7Cj4gPiAgICAgICAgICAgICAgIERSTV9FUlJPUigiQ2Fubm90IHNldCByYXRlICglZEh6
KSBmb3IgcGl4ZWwgY2xrXG4iLCByYXRlKTsKPiA+IEBAIC01MjMsMTQgKzUxNSw2IEBAIHN0YXRp
YyBib29sIGx0ZGNfY3J0Y19tb2RlX2ZpeHVwKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiA+Cj4g
PiAgICAgICBhZGp1c3RlZF9tb2RlLT5jbG9jayA9IGNsa19nZXRfcmF0ZShsZGV2LT5waXhlbF9j
bGspIC8gMTAwMDsKPiA+Cj4gPiAtICAgICBpZiAocnVudGltZV9hY3RpdmUpIHsKPiA+IC0gICAg
ICAgICAgICAgcmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyhkZGV2LT5kZXYpOwo+ID4gLSAgICAg
ICAgICAgICBpZiAocmV0KSB7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJG
YWlsZWQgdG8gZml4dXAgbW9kZSwgY2Fubm90IGdldCBzeW5jXG4iKTsKPiA+IC0gICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiAtICAgICAgICAgICAgIH0KPiA+IC0gICAgIH0K
PiA+IC0KPiA+ICAgICAgIERSTV9ERUJVR19EUklWRVIoInJlcXVlc3RlZCBjbG9jayAlZGtIeiwg
YWRqdXN0ZWQgY2xvY2sgJWRrSHpcbiIsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgIG1vZGUt
PmNsb2NrLCBhZGp1c3RlZF9tb2RlLT5jbG9jayk7Cj4gPgo+ID4KPiBIaSBZYW5uaWNrLAo+IE1h
bnkgdGhhbmtzIGZvciB5b3VyIHBhdGNoLAo+IEFja2VkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhp
bGlwcGUuY29ybnVAc3QuY29tPgo+IFBoaWxpcHBlIDotKQoKQXBwbGllZCBvbiBkcm0tbWlzYy1u
ZXh0LgoKVGhhbmtzLApCZW5qYW1pbgoKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
