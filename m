Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBCEA9F4D9
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Apr 2025 17:45:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC11CC78011;
	Mon, 28 Apr 2025 15:45:27 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D84C0C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 15:45:25 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e6df1419f94so3843034276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 08:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1745855124; x=1746459924;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PU/sixtY71LvEi4Fz6DQo24QLlRpV93TUetQH3mfBu0=;
 b=E3ZrmAc4kZwLCfJv9j6KE0hIz9VaCmh7+g+MEpmWUFt9hVKXomtnDhcSDZ+zpLlitN
 tM8OCycXlG0FQbWVwVTSpYwMvp66rZfh9LG66NS9A6RTJMVBlsNuzckQ10IrSWJe4+yz
 9tGEfxpYlTb82iEjTemtA3sW6dAkzM1fEnCqGZflcY4KDYz/Ww2Ct2PxjnL22Mnm5R9X
 zRqrCItPuEEdpGs8ei1K7sHTYo+WxO5GEEtN1Q+JxKEIJ2p/FBGjysx1HvT+uAYvAs8h
 gx+SomFQIuwcazPHO7bxTrROTXpL+m+/k+7uLzITBPLhZKsTgpnk9i7yAOK96CtTq2yb
 08Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745855124; x=1746459924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PU/sixtY71LvEi4Fz6DQo24QLlRpV93TUetQH3mfBu0=;
 b=j6jdUV/FUmTFV4clcF8WlH9+csNNUAapVe2m4sGb3lUjxPH5lp+VC6AdYlPXpz9a6X
 rhktcwbd7Xzwol6ENnttS9J/OZKxVA86jT2hBDT2o7XsLiOPwwgC/6TsfYOO/Ty3+TVg
 F/+smMl9Zk167+O8ReoHQ9v3vygiZF9BYyLFkkdse1XnfNcvOia9iXqe58YddR3BeD61
 GyK/mtMhWawpgUOrOi4agyPflY/IgW58MyyAluEvM/BvXoVLButZ3l9/uYQT0NBdRRjr
 klEjl94kNMvfT8gJQBAUr1wwEOpeeMQ3QkpSV4sLNCsoIng3LUlYi0EsldMHCOyD4TeX
 0cNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOwTe3PU7bh61pVpWJLRx/ALIuAPQThpUbydiftJ6Z6vJuyiPMCsbYMh3xeyzFCFrjxmEJTegrje+PkA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy3wEt98JQ6WBkdY4xa5vXrzk8GebUnFaqokIR0J+rFqvjpghR0
 jhElZUC+l26p0Dzwt3PdM2caC3Z/DrmO7hfUaW4kcZkOWmKNp5DaG7R9fyT+VQs8Lja10U8tGHx
 feUd50K4/5eKont5SRYoo0YNpWliB5tPXx45HMg==
X-Gm-Gg: ASbGnct01qIIc/xQ0gFZY1X2LYwRM2nJ4dwMK16VP5BLeJt6aYuEaDrnBghs0r/NGQ4
 dcDuQylj7nkulF10650WmsJb6VOSynIsxmVbIvXAsYi5XDNJySZ7SVEIS9ZCa3/uGDn0KxMQMiD
 LNlS3be/92JNMpQe1p9CLOOZ3wMq9CNgHOWtfZyFs7dkDIv6Mbtr+afkkPyuaksPE=
X-Google-Smtp-Source: AGHT+IEF9MSlc844cuGTIRN/jaSQKExcmjeU1UeJwf54mw2x30vI+iBpqqWrdgOqbrjU+FD8mBfkUxmgGRAbgf2Y+6M=
X-Received: by 2002:a05:6902:2701:b0:e72:d88e:7a9a with SMTP id
 3f1490d57ef6-e73500e777emr136870276.45.1745855124717; Mon, 28 Apr 2025
 08:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-27-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-27-8f91a404d86b@bootlin.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 28 Apr 2025 16:45:08 +0100
X-Gm-Features: ATxdqUF8zRJ18UCRRqpYogjOFDok1I-AvafpDPPJcxH-STXodhofR9H1CLM8tQg
Message-ID: <CAPY8ntDwK0DZ6sThryDRBUgjTb+muNHtRNp+LohTs6+FWeB5TQ@mail.gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: imx@lists.linux.dev, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 27/34] drm/vc4: convert to
	devm_drm_bridge_alloc() API
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

T24gVGh1LCAyNCBBcHIgMjAyNSBhdCAyMDowMSwgTHVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29s
aUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGlzIHRoZSBuZXcgQVBJIGZvciBhbGxvY2F0
aW5nIERSTSBicmlkZ2VzLgo+Cj4gVGhpcyBkcml2ZXIgYWxyZWFkeSBpbXBsZW1lbnRzIHJlZmNv
dW50aW5nIG9mIHRoZSBzdHJ1Y3QgdmM0X2RzaSwgd2hpY2gKPiBlbWJlZHMgc3RydWN0IGRybV9i
cmlkZ2UuIE5vdyB0aGlzIGlzIGEgZHVwbGljYXRlIG9mIHRoZSByZWZjb3VudGluZwo+IGltcGxl
bWVudGVkIGJ5IHRoZSBEUk0gYnJpZGdlIGNvcmUsIHNvIGNvbnZlcnQgdGhlIHZjNF9kc2lfZ2V0
L3B1dCgpIGNhbGxzCj4gaW50byBkcm1fYnJpZGdlX2dldC9wdXQoKSBjYWxscyBhbmQgZ2V0IHJp
ZCBvZiB0aGUgZHJpdmVyLXNwZWNpZmljCj4gcmVmY291bnRpbmcgaW1wbGVtZW50YXRpb24uCj4K
PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29t
PgoKQWNrZWQtYnk6IERhdmUgU3RldmVuc29uIDxkYXZlLnN0ZXZlbnNvbkByYXNwYmVycnlwaS5j
b20+CgpUaGFua3MuCgo+IC0tLQo+Cj4gQ2M6ICJNYcOtcmEgQ2FuYWwiIDxtY2FuYWxAaWdhbGlh
LmNvbT4KPiBDYzogRGF2ZSBTdGV2ZW5zb24gPGRhdmUuc3RldmVuc29uQHJhc3BiZXJyeXBpLmNv
bT4KPiBDYzogUmFzcGJlcnJ5IFBpIEtlcm5lbCBNYWludGVuYW5jZSA8a2VybmVsLWxpc3RAcmFz
cGJlcnJ5cGkuY29tPgo+Cj4gQ2hhbmdlZCBpbiB2MjoKPiAtIGZpeCBlcnJvciBjb2RlIGNoZWNr
aW5nCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5jIHwgMzQgKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCAyOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0
L3ZjNF9kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5jCj4gaW5kZXggZWZjNmY2
MDc4YjAyNjc2NGM1OWNmYjJhMzNiMjhhODhiNzAxOGMzYS4uNDU4ZTVkOTg3OTY0NWYxOGJjYmNh
ZWViNzFiNWYxMDM4Zjk1ODFkYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3Zj
NF9kc2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5jCj4gQEAgLTU1Miw4
ICs1NTIsNiBAQCBzdHJ1Y3QgdmM0X2RzaSB7Cj4gICAgICAgICBzdHJ1Y3QgdmM0X2VuY29kZXIg
ZW5jb2RlcjsKPiAgICAgICAgIHN0cnVjdCBtaXBpX2RzaV9ob3N0IGRzaV9ob3N0Owo+Cj4gLSAg
ICAgICBzdHJ1Y3Qga3JlZiBrcmVmOwo+IC0KPiAgICAgICAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXY7Cj4KPiAgICAgICAgIHN0cnVjdCBkcm1fYnJpZGdlICpvdXRfYnJpZGdlOwo+IEBA
IC0xNjIyLDI5ICsxNjIwLDExIEBAIHN0YXRpYyB2b2lkIHZjNF9kc2lfZG1hX2NoYW5fcmVsZWFz
ZSh2b2lkICpwdHIpCj4gICAgICAgICBkc2ktPnJlZ19kbWFfY2hhbiA9IE5VTEw7Cj4gIH0KPgo+
IC1zdGF0aWMgdm9pZCB2YzRfZHNpX3JlbGVhc2Uoc3RydWN0IGtyZWYgKmtyZWYpCj4gLXsKPiAt
ICAgICAgIHN0cnVjdCB2YzRfZHNpICpkc2kgPQo+IC0gICAgICAgICAgICAgICBjb250YWluZXJf
b2Yoa3JlZiwgc3RydWN0IHZjNF9kc2ksIGtyZWYpOwo+IC0KPiAtICAgICAgIGtmcmVlKGRzaSk7
Cj4gLX0KPiAtCj4gLXN0YXRpYyB2b2lkIHZjNF9kc2lfZ2V0KHN0cnVjdCB2YzRfZHNpICpkc2kp
Cj4gLXsKPiAtICAgICAgIGtyZWZfZ2V0KCZkc2ktPmtyZWYpOwo+IC19Cj4gLQo+IC1zdGF0aWMg
dm9pZCB2YzRfZHNpX3B1dChzdHJ1Y3QgdmM0X2RzaSAqZHNpKQo+IC17Cj4gLSAgICAgICBrcmVm
X3B1dCgmZHNpLT5rcmVmLCAmdmM0X2RzaV9yZWxlYXNlKTsKPiAtfQo+IC0KPiAgc3RhdGljIHZv
aWQgdmM0X2RzaV9yZWxlYXNlX2FjdGlvbihzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB2b2lkICpw
dHIpCj4gIHsKPiAgICAgICAgIHN0cnVjdCB2YzRfZHNpICpkc2kgPSBwdHI7Cj4KPiAtICAgICAg
IHZjNF9kc2lfcHV0KGRzaSk7Cj4gKyAgICAgICBkcm1fYnJpZGdlX3B1dCgmZHNpLT5icmlkZ2Up
Owo+ICB9Cj4KPiAgc3RhdGljIGludCB2YzRfZHNpX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBz
dHJ1Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEpCj4gQEAgLTE2NTUsNyArMTYzNSw3IEBA
IHN0YXRpYyBpbnQgdmM0X2RzaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmlj
ZSAqbWFzdGVyLCB2b2lkICpkYXRhKQo+ICAgICAgICAgc3RydWN0IGRybV9lbmNvZGVyICplbmNv
ZGVyID0gJmRzaS0+ZW5jb2Rlci5iYXNlOwo+ICAgICAgICAgaW50IHJldDsKPgo+IC0gICAgICAg
dmM0X2RzaV9nZXQoZHNpKTsKPiArICAgICAgIGRybV9icmlkZ2VfZ2V0KCZkc2ktPmJyaWRnZSk7
Cj4KPiAgICAgICAgIHJldCA9IGRybW1fYWRkX2FjdGlvbl9vcl9yZXNldChkcm0sIHZjNF9kc2lf
cmVsZWFzZV9hY3Rpb24sIGRzaSk7Cj4gICAgICAgICBpZiAocmV0KQo+IEBAIC0xODEwLDE1ICsx
NzkwLDEyIEBAIHN0YXRpYyBpbnQgdmM0X2RzaV9kZXZfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKPiAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4g
ICAgICAgICBzdHJ1Y3QgdmM0X2RzaSAqZHNpOwo+Cj4gLSAgICAgICBkc2kgPSBremFsbG9jKHNp
emVvZigqZHNpKSwgR0ZQX0tFUk5FTCk7Cj4gLSAgICAgICBpZiAoIWRzaSkKPiAtICAgICAgICAg
ICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gKyAgICAgICBkc2kgPSBkZXZtX2RybV9icmlkZ2VfYWxs
b2MoJnBkZXYtPmRldiwgc3RydWN0IHZjNF9kc2ksIGJyaWRnZSwgJnZjNF9kc2lfYnJpZGdlX2Z1
bmNzKTsKPiArICAgICAgIGlmIChJU19FUlIoZHNpKSkKPiArICAgICAgICAgICAgICAgcmV0dXJu
IFBUUl9FUlIoZHNpKTsKPiAgICAgICAgIGRldl9zZXRfZHJ2ZGF0YShkZXYsIGRzaSk7Cj4KPiAt
ICAgICAgIGtyZWZfaW5pdCgmZHNpLT5rcmVmKTsKPiAtCj4gICAgICAgICBkc2ktPnBkZXYgPSBw
ZGV2Owo+IC0gICAgICAgZHNpLT5icmlkZ2UuZnVuY3MgPSAmdmM0X2RzaV9icmlkZ2VfZnVuY3M7
Cj4gICNpZmRlZiBDT05GSUdfT0YKPiAgICAgICAgIGRzaS0+YnJpZGdlLm9mX25vZGUgPSBkZXYt
Pm9mX25vZGU7Cj4gICNlbmRpZgo+IEBAIC0xODM2LDcgKzE4MTMsNiBAQCBzdGF0aWMgdm9pZCB2
YzRfZHNpX2Rldl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAgICAg
IHN0cnVjdCB2YzRfZHNpICpkc2kgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPgo+ICAgICAgICAg
bWlwaV9kc2lfaG9zdF91bnJlZ2lzdGVyKCZkc2ktPmRzaV9ob3N0KTsKPiAtICAgICAgIHZjNF9k
c2lfcHV0KGRzaSk7Cj4gIH0KPgo+ICBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHZjNF9kc2lfZHJp
dmVyID0gewo+Cj4gLS0KPiAyLjQ5LjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
