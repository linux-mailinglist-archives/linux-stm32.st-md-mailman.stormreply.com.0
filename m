Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBDE72F491
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 08:17:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE288C6A61A;
	Wed, 14 Jun 2023 06:17:37 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28C92C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 14:52:28 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-977d0ee1736so798263366b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 07:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1686667947; x=1689259947;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RFhCpdPvurTrFPKgPmFt8+QcF+4GExHDsuu6/kU2tGo=;
 b=rJfY6khakkCcjLrkOBOLEN5jvJ/ZWcfTP0mYmealr9tzzIOFitpHJgdODVW0JWXrUe
 nvrT+NJQAqA23L3yJRes/kELb3Z4sXNXuA9Y1JZat6bvMXVKfA1OoLmSW3k7KCzT4V0q
 hLZuXqRTJvhGxLMi2oAkyoXB2NUunjEVL3OAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686667947; x=1689259947;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RFhCpdPvurTrFPKgPmFt8+QcF+4GExHDsuu6/kU2tGo=;
 b=JVbVwTNk8nWXqA//bHjCwa3JE7p4WgkKwYGiSHnegyAyuz2sGey46oiVP8pGl9thQo
 K9Fjj4ehiE0yHH1F4WslgfQeqbcLKCoP4Ev35Yp1AiT9oZsPbzcHdliL2srQJhYRXQ6r
 xpOGZEpBSI1zrXvoaJfPHfwNWxf2+sk189lDGbXFlJhHODYqik0CI5ftdC5L1Cu8wtPc
 G4LGsCWRbrGdaBXEJirV+BdI4YkzJeI6Hxrzaap8X6ZXuMbUVTuO95DFuvDKaFQXYGec
 cjzATYHm/AAvtp0oNKC0SCx9O+N9IpHKrf8X9iCKMLhNX3BwpinKGk7bX9Ls6Xn8erC5
 yxgw==
X-Gm-Message-State: AC+VfDzGJaV8eVGitg0+A3emYuUkLXpNLBjL5pglz/I5lsYLzd5jYnvZ
 /r0/kIEGM1XuyNaK+LWnb5ydoLXSPaJezMdG3jcwvw==
X-Google-Smtp-Source: ACHHUZ58hojL5RiV0RaxLfiHLOIkvZMvcRGhgnaQ2b6hHAYY5+XTiYIhvar1ClxhS/9K8rpRZFSX4eHhuLQBl13DGtg=
X-Received: by 2002:a17:906:da82:b0:979:7624:1f71 with SMTP id
 xh2-20020a170906da8200b0097976241f71mr11633694ejb.26.1686667947447; Tue, 13
 Jun 2023 07:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230609062050.2107143-1-dario.binacchi@amarulasolutions.com>
 <20230609062050.2107143-5-dario.binacchi@amarulasolutions.com>
 <376dc16d-8896-0a47-b8dd-3f919c1e50bf@foss.st.com>
In-Reply-To: <376dc16d-8896-0a47-b8dd-3f919c1e50bf@foss.st.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 13 Jun 2023 16:52:16 +0200
Message-ID: <CAOf5uwmpAZeO=w-+cQNfy4VHS80NK-_HpDv5koZfTB8cRHOECQ@mail.gmail.com>
To: Philippe CORNU <philippe.cornu@foss.st.com>
X-Mailman-Approved-At: Wed, 14 Jun 2023 06:17:37 +0000
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 4/4] drm/stm: add an option to change
	FB bpp
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

SGkKCk9uIFR1ZSwgSnVuIDEzLCAyMDIzIGF0IDQ6NDHigK9QTSBQaGlsaXBwZSBDT1JOVQo8cGhp
bGlwcGUuY29ybnVAZm9zcy5zdC5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDYvOS8yMyAwODoyMCwg
RGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gPiBCb2FyZHMgdGhhdCB1c2UgdGhlIFNUTTMyRns0LDd9
IHNlcmllcyBoYXZlIGxpbWl0ZWQgYW1vdW50cyBvZiBSQU0uIFRoZQo+ID4gYWRkZWQgcGFyYW1l
dGVyIGFsbG93cyB1c2VycyB0byBzaXplLCB3aXRoaW4gY2VydGFpbiBsaW1pdHMsIHRoZSBtZW1v
cnkKPiA+IGZvb3RwcmludCByZXF1aXJlZCBieSB0aGUgZnJhbWVidWZmZXIuCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlv
bnMuY29tPgo+ID4KPiA+IC0tLQo+ID4KPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiAtIGRyb3AgWzQv
Nl0gZHQtYmluZGluZ3M6IGRpc3BsYXk6IHNpbXBsZTogYWRkIFJvY2t0ZWNoIFJLMDQzRk40OEgK
PiA+ICAgIEFwcGxpZWQgdG8gaHR0cHM6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9naXQvZHJt
L2RybS1taXNjLmdpdCAoZHJtLW1pc2MtbmV4dCk6Cj4gPiAgICBodHRwczovL2NnaXQuZnJlZWRl
c2t0b3Aub3JnL2RybS9kcm0tbWlzYy9jb21taXQvP2lkPWM0MmEzN2EyN2M3NzdkNjM5NjFkZDYz
NGEzMGY3Yzg4Nzk0OTQ5MWEKPiA+IC0gZHJvcCBbNS82XSBkcm0vcGFuZWw6IHNpbXBsZTogYWRk
IHN1cHBvcnQgZm9yIFJvY2t0ZWNoIFJLMDQzRk40OEggcGFuZWwKPiA+ICAgIEFwcGxpZWQgdG8g
aHR0cHM6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9naXQvZHJtL2RybS1taXNjLmdpdCAoZHJt
LW1pc2MtbmV4dCkKPiA+ICAgIGh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1t
aXNjL2NvbW1pdC8/aWQ9MTNjZGQxMmE5ZjkzNDE1OGY0ZWM4MTdjZjA0OGZjYjQzODRhYTlkYwo+
ID4KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYyB8IDggKysrKysrKy0KPiA+ICAgMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9k
cnYuYwo+ID4gaW5kZXggNDIyMjIwZGY3ZDhjLi42NWJlMmI0NDJhNmEgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3Rt
L2Rydi5jCj4gPiBAQCAtMzAsNiArMzAsMTEgQEAKPiA+ICAgI2RlZmluZSBTVE1fTUFYX0ZCX1dJ
RFRIICAgIDIwNDgKPiA+ICAgI2RlZmluZSBTVE1fTUFYX0ZCX0hFSUdIVCAgIDIwNDggLyogc2Ft
ZSBhcyB3aWR0aCB0byBoYW5kbGUgb3JpZW50YXRpb24gKi8KPiA+Cj4gPiArc3RhdGljIHVpbnQg
c3RtX2JwcCA9IDE2Owo+ID4gKwo+ID4gK01PRFVMRV9QQVJNX0RFU0MoYnBwLCAiYml0cy1wZXIt
cGl4ZWwgKGRlZmF1bHQ6IDE2KSIpOwo+ID4gK21vZHVsZV9wYXJhbV9uYW1lZChicHAsIHN0bV9i
cHAsIHVpbnQsIDA2NDQpOwo+ID4gKwo+ID4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9tb2Rl
X2NvbmZpZ19mdW5jcyBkcnZfbW9kZV9jb25maWdfZnVuY3MgPSB7Cj4gPiAgICAgICAuZmJfY3Jl
YXRlID0gZHJtX2dlbV9mYl9jcmVhdGUsCj4gPiAgICAgICAuYXRvbWljX2NoZWNrID0gZHJtX2F0
b21pY19oZWxwZXJfY2hlY2ssCj4gPiBAQCAtOTMsNiArOTgsNyBAQCBzdGF0aWMgaW50IGRydl9s
b2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2KQo+ID4gICAgICAgZGRldi0+bW9kZV9jb25maWcu
bWluX2hlaWdodCA9IDA7Cj4gPiAgICAgICBkZGV2LT5tb2RlX2NvbmZpZy5tYXhfd2lkdGggPSBT
VE1fTUFYX0ZCX1dJRFRIOwo+ID4gICAgICAgZGRldi0+bW9kZV9jb25maWcubWF4X2hlaWdodCA9
IFNUTV9NQVhfRkJfSEVJR0hUOwo+ID4gKyAgICAgZGRldi0+bW9kZV9jb25maWcucHJlZmVycmVk
X2RlcHRoID0gc3RtX2JwcDsKPiA+ICAgICAgIGRkZXYtPm1vZGVfY29uZmlnLmZ1bmNzID0gJmRy
dl9tb2RlX2NvbmZpZ19mdW5jczsKPiA+ICAgICAgIGRkZXYtPm1vZGVfY29uZmlnLm5vcm1hbGl6
ZV96cG9zID0gdHJ1ZTsKPiA+Cj4gPiBAQCAtMjAzLDcgKzIwOSw3IEBAIHN0YXRpYyBpbnQgc3Rt
X2RybV9wbGF0Zm9ybV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gICAg
ICAgaWYgKHJldCkKPiA+ICAgICAgICAgICAgICAgZ290byBlcnJfcHV0Owo+ID4KPiA+IC0gICAg
IGRybV9mYmRldl9kbWFfc2V0dXAoZGRldiwgMTYpOwo+ID4gKyAgICAgZHJtX2ZiZGV2X2RtYV9z
ZXR1cChkZGV2LCBzdG1fYnBwKTsKPiA+Cj4gPiAgICAgICByZXR1cm4gMDsKPiA+Cj4KPiBBY2tl
ZC1ieTogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QGZvc3Muc3QuY29tPgo+IE1hbnkg
dGhhbmtzLAo+IFBoaWxpcHBlIDotKQo+CgpBY2NvcmRpbmcgdG8gdGhlIGxhdGVzdCByZXZpZXcg
b24gdXNiIHBhdGNoc2V0OiAiUGxlYXNlIGRvIG5vdCBhZGQgbmV3Cm1vZHVsZSBwYXJhbWV0ZXJz
LCB0aGlzIGlzIG5vdCB0aGUgMTk5MCdzIGFueW1vcmUuCldlIGhhdmUgcGVyLWRldmljZSBzZXR0
aW5ncyBldmVyeXdoZXJlLCB0aGlzIG1ha2VzIHRoYXQgaW1wb3NzaWJsZS4KSnVzdCB1c2UgYSBE
VCB2YWx1ZSwgaWYgaXQgaXMgd3JvbmcsIHRoZW4gZml4IHRoZSBEVCB2YWx1ZSEgIE5vIG5lZWQg
dG8KaGF2ZSB0aGUga2VybmVsIG92ZXJyaWRlIGl0LCB0aGF0J3Mgbm90IHdoYXQgRFQgZmlsZXMg
YXJlIGZvci4iCgpJIHRoaW5rIGl0IG1ha2VzIG1vcmUgc2Vuc2UgdG8gaGF2ZSBkdHMgcGFyYW1l
dGVycy4gU2hvdWxkIG1heWJlIGFwcGx5IGhlcmUgdG9vCgpNaWNoYWVsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
