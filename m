Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0544735522
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 13:01:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B825C6A60D;
	Mon, 19 Jun 2023 11:01:46 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56D2BC6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 11:01:45 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-bb2ffa1e235so3556724276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 04:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687172504; x=1689764504;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JFefUUpn1s6a7sJJBpPvKuxmZjNogUs0xOa+QZnqFw4=;
 b=SdRHTtBPelSA/gTKMa772eDiMFG1SNghdBlsxSp2Rs3hhMmvMPa5E9v+esTAq1QdY9
 K+406rprsK8aqTaDcp4fuD4yp7bRyTcDqvMkluqA25WjKVctNPcDX1Dki7Pxn2HNvoN+
 eLUXkp/PNCHCRtCB46RVh05uT/QqpmBM9ulnIPwM2kbhjNeZOSubJROQl6QaPGQcLsdh
 Umo2XYB6sEotu+XeeQR0tOLvaQOPTdGXyLGUFYRm3W/swUNF4R4fuTOH97GOd/snVCfZ
 kccZU4FM4PRr7biN4qCdp1Fh26xz386blriwRdYO+rOtPaK8vTFudKLF6UTxcqSLR5av
 GXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687172504; x=1689764504;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JFefUUpn1s6a7sJJBpPvKuxmZjNogUs0xOa+QZnqFw4=;
 b=TIzHRGQrua4R3xRGnNlwK/r2kRafBTBYxMlBKpBmVnBdIstx7w0h+qJz6wqfBgAwyg
 +Ycq+6S1D2giAxLjdrwE/aGAQR/kcdiItBxh19VxJMY3gi9iH31IV+3Gs6Xa8ZeMMtOp
 dPmlmuhIdEcAkvqVPf2seoKeaj2Qc0WyBAHjelfzcnHvHE9aYM+Thk4bjAJKDvCbIhUs
 Vqbu/NDrwa1L4T8l70yIHlW5vwONLlfEDr8HV1RMvuByZIvP2+b1rjWco7x3qWov7gtJ
 8N3frgbKmKEER8QbdAcv7kOJc0H8Baw3TuIJtlOzbHpUciJ6Hq/351ozICAgGwy0sfNH
 MN6w==
X-Gm-Message-State: AC+VfDy2dXz1AidFPHphjWrbnrXlOmd/JzYCYx1XpjOog6OUdisj3LaD
 PTqECDm8aALfAkVnRPQMLaN112sfepqaGzVBdKbQrA==
X-Google-Smtp-Source: ACHHUZ6yXD1YVYZsgvEzYDtnMbGbh5qM6C4D1UWyOOsBUjPqOujWNbk15CRXAKCKjGRyVYZdQo7HBjCr2cb2DJnTlZA=
X-Received: by 2002:a25:d4b:0:b0:bc7:21f:4ef6 with SMTP id
 72-20020a250d4b000000b00bc7021f4ef6mr6804080ybn.52.1687172504171; 
 Mon, 19 Jun 2023 04:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230615092001.1213132-1-yann.gautier@foss.st.com>
 <20230615092001.1213132-2-yann.gautier@foss.st.com>
 <CAPDyKFqJsqmNzeRg8hj55yUEMSycOWsmKVKsMWk4Qu7Y8_dNzg@mail.gmail.com>
 <3b6781cb-8f59-e70a-bcf8-9fb48fa47cbf@foss.st.com>
 <266de9f5-826a-c1bf-be8d-11f5e27c87dc@foss.st.com>
 <CACRpkdZLtCwPQsPw_Lp3Ppw2ed6gOo+-82_y2WPVJ_oZUHbLoQ@mail.gmail.com>
 <78f8bd3d-c4a7-7383-441d-69cd8f5c30fb@foss.st.com>
In-Reply-To: <78f8bd3d-c4a7-7383-441d-69cd8f5c30fb@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 Jun 2023 13:01:07 +0200
Message-ID: <CAPDyKFp5NwzyYJrX6zt9Gm0uNDy=YE3wuYR6dwq4mo1EncNwJQ@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Xiang wangx <wangxiang@cdjrlc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 1/6] dt-bindings: mmc: mmci: Add st,
	stm32mp25-sdmmc2 compatible
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

T24gTW9uLCAxOSBKdW4gMjAyMyBhdCAwOToyOSwgWWFubiBHYXV0aWVyIDx5YW5uLmdhdXRpZXJA
Zm9zcy5zdC5jb20+IHdyb3RlOgo+Cj4gT24gNi8xNS8yMyAyMDo1MSwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiA+IE9uIFRodSwgSnVuIDE1LCAyMDIzIGF0IDU6MTnigK9QTSBZYW5uIEdhdXRpZXIg
PHlhbm4uZ2F1dGllckBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4gPgo+ID4+PiAgICAgICAgIC0gZGVz
Y3JpcHRpb246IEVudHJ5IGZvciBTVE1pY3JvZWxlY3Ryb25pY3MgdmFyaWFudCBvZiBQTDE4eC4K
PiA+Pj4gICAgICAgICAgICAgVGhpcyBkZWRpY2F0ZWQgY29tcGF0aWJsZSBpcyB1c2VkIGJ5IGJv
b3Rsb2FkZXJzLgo+ID4gKC4uLikKPiA+Pj4gICAgICAgICAtIGRlc2NyaXB0aW9uOiBFbnRyeSBm
b3IgU1RNaWNyb2VsZWN0cm9uaWNzIHZhcmlhbnQgb2YgUEwxOHggZm9yCj4gPj4+ICAgICAgICAg
ICAgIFNUTTMyTVAyNS4gVGhpcyBkZWRpY2F0ZWQgY29tcGF0aWJsZSBpcyB1c2VkIGJ5IGJvb3Rs
b2FkZXJzLgo+ID4gKC4uLikKPiA+Pj4gU2hvdWxkIEkgcmVtb3ZlIChvciBhZGFwdCkgYm90aCBk
ZXNjcmlwdGlvbnM/Cj4gPj4+Cj4gPj4+Cj4gPj4KPiA+PiBBdCB0aGUgdGltZSB0aGUgcGF0Y2gg
d2FzIGRvbmUgaXQgd2FzIHJlYWxseSBqdXN0IHVzZWQgYnkgYm9vdGxvYWRlcnMuCj4gPj4gQnV0
IGFzIGl0IGlzIG5vdyB1c2VkIGluIHRoZSBkcml2ZXIgZm9yIGRlbGF5IGJsb2NrLCBJIHNob3Vs
ZCByZW1vdmUgdGhlCj4gPj4gc2Vjb25kIHNlbnRlbmNlLgo+ID4KPiA+IFJlbW92ZSBib3RoLgo+
ID4KPiA+IEFmdGVyICJUaGlzIGRlZGljYXRlZCBjb21wYXRpYmxlIGlzIHVzZWQgYnkgYm9vdGxv
YWRlcnMiIHRoZXJlIGlzCj4gPiBhbiBpbXBsaWNpdCAiaW4gdGhlIFNESyBwcm92aWRlZCBieSBT
VCBNaWNyb2VsZWN0cm9uaWNzIiwgYW5kIHRoYXQKPiA+IGlzIG9mIG5vIGNvbmNlcm4gZm9yIERU
IGJpbmRpbmdzLCB3aGljaCBhcmUgKHdlbGwsIGluIHRoZW9yeSkgdXNlZCBieQo+ID4gZS5nLiBC
U0Qgb3Igb3RoZXIgb3BlcmF0aW5nIHN5c3RlbXMgYW5kIHdobyBrbm93cyB3aGF0IHRoZXkgd2ls
bAo+ID4gdXNlIGFuZCBub3QsIHdlIGRvbid0IHB1dCBMaW51eCBzcGVjaWZpY3MgaW4gdGhlcmUs
IG5laXRoZXIgQm9vdAo+ID4gbG9hZGVyIHNwZWNpZmljcyBub3IgU1QgU0RLIHNwZWNpZmljcy4K
PiA+Cj4gPiBBdCBsZWFzdCB0aGF0IGlzIHRoZSBsaXR0bGUgYnVyZWF1Y3JhdGljIGFtYml0aW9u
IHdlIGhhdmUuCj4gPgo+ID4gWW91cnMsCj4gPiBMaW51cyBXYWxsZWlqCj4KPiBIaSwKPgo+IFRo
YW5rcyBmb3IgYWxsIHRoZSByZXZpZXdzLgo+IEknbGwgdXBkYXRlIHRoaXMgcGF0Y2ggaW4gdGhl
IHYyLCByZW1vdmluZyBib290bG9hZGVyIGxpbmUgYW5kIHVzaW5nIGVudW0uCj4KPiBVbGYsIHNo
b3VsZCBJIHNlbmQgdGhlIG5ldyBzZXJpZXMgbm93LCBvciBkbyB5b3UgcHJlZmVyIHRvIHJldmll
dyB0aGUKPiB3aG9sZSBzZXJpZXMgYmVmb3JlPwoKQWN0dWFsbHkgSSBoYXZlIGFscmVhZHkgbG9v
a2VkIHRocm91Z2ggdGhlIHNlcmllcyBhbmQgaXQgbG9va3MgZ29vZCB0bwptZSEgUGxlYXNlIHN1
Ym1pdCBhIG5ldyB2ZXJzaW9uIHNvIHdlIGNhbiBnZXQgdGhpcyBxdWV1ZWQgdXAgZm9yIHY2LjUu
CgpLaW5kIHJlZ2FyZHMKVWZmZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
