Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 996917B9B58
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Oct 2023 09:24:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AFF6C6C832;
	Thu,  5 Oct 2023 07:24:57 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B20DC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 23:41:22 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-3af5b26d599so273554b6e.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Oct 2023 16:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696462881; x=1697067681;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4C1iihc3EDnsL/rTdUR5Op9U6iZWDJfi2p6KDHXbMCg=;
 b=fkTiEcwrW98BysmQsL0uiWZS6ZScKT+l3ehjNjB/D5zdhtwgvM899xhzLqQ6BPIv+/
 3fxsVBXo6GNGQHbPIQeDzj+A8cz/TtHWtnUpUL/fysFtHSij1JtDYiFgvV+86IxGFl0j
 5WF7sA94dCLzheYB+OwPdxW42be9OJ2q2j8Ylp+BdeOpEpk9FPsMuVkzrW3b0F8LnNZf
 W0dvkv7ennbIldXNRmzC+F7O1keht5suG56CfGpphC/HE6qrcvG1yo89AXsDNqeHz3oZ
 8xHKCjnTlBGJs2ZY9RjTiH/MSlG4Yt6FC3pZ/paysqZRPQDW4M9mGYbrf72dFTANnrSe
 sP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696462881; x=1697067681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4C1iihc3EDnsL/rTdUR5Op9U6iZWDJfi2p6KDHXbMCg=;
 b=vSDCnluA4Vac/iM6ARkNpi3i3ZIf8IZoJP3DzToHSvS6iEsheJY8+Ugtb1/PggAP8Z
 yV1M6xHslXy9feWEsdBnuW+FfbdllEWcmlQ12/zZUpBz1oaSEW6NWiZmvwbndmlVhO98
 WJHeNCnbpDv12oyoelKEhIDIIif6X6XsfuUqSML8BbMIKkkRyQDyU6gKC9sdxEKu+z8L
 KnpJIw7oJjS8/gnK39zT/gsxwosrYlat4dTsP08p4NbjJGAjH2CToAHDNK8ysBL/B3b0
 3og8Eefcbsz37IOya0Cj1adXgKORzrD/5UuwR92IG+B2xJ+8WAg6h8wtjsSj9+4FdGCe
 l+OA==
X-Gm-Message-State: AOJu0YyLJMZmpJfPR2IYNTcCxEwb+u0GLvjhBSUmeGFl7Fz1fkvbfrEt
 D15b4h9ZNCZOe7Gk9EkYHR/Q5sPVrQcOVHEaxPc=
X-Google-Smtp-Source: AGHT+IF1G34r6cm8vMu/bXXwaMqnblKv3w1itMr8e1W0/KkBZ7RueirXtjIlAqju5LO/oQRnSsQ9D66zRw06dgwbdk8=
X-Received: by 2002:a05:6358:6f06:b0:13c:eea2:d021 with SMTP id
 r6-20020a0563586f0600b0013ceea2d021mr3677892rwn.9.1696462880856; Wed, 04 Oct
 2023 16:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231004091552.3531659-1-hugues.fruchet@foss.st.com>
 <20231004091552.3531659-4-hugues.fruchet@foss.st.com>
In-Reply-To: <20231004091552.3531659-4-hugues.fruchet@foss.st.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 4 Oct 2023 18:41:09 -0500
Message-ID: <CAHCN7xKrriTPaRMJ-r86cSgFDUUP1At08imLBr_zEP0g3fga_g@mail.gmail.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:24:56 +0000
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 3/7] dt-bindings: media: Document
	STM32MP25 VENC video encoder
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

T24gV2VkLCBPY3QgNCwgMjAyMyBhdCA0OjE24oCvQU0gSHVndWVzIEZydWNoZXQKPGh1Z3Vlcy5m
cnVjaGV0QGZvc3Muc3QuY29tPiB3cm90ZToKPgo+IEFkZCBTVE0zMk1QMjUgVkVOQyB2aWRlbyBl
bmNvZGVyIGJpbmRpbmdzLgo+Cj4gU2lnbmVkLW9mZi1ieTogSHVndWVzIEZydWNoZXQgPGh1Z3Vl
cy5mcnVjaGV0QGZvc3Muc3QuY29tPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvbWVkaWEvc3Qsc3Rt
MzJtcDI1LXZlbmMueWFtbCAgICAgfCA1NiArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvc3Qsc3RtMzJtcDI1LXZlbmMueWFtbAo+Cj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxz
dG0zMm1wMjUtdmVuYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL3N0LHN0bTMybXAyNS12ZW5jLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAwMC4uYzY5ZTBhMzRmNjc1Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMm1wMjUtdmVuYy55YW1s
Cj4gQEAgLTAsMCArMSw1NiBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MCBPUiBCU0QtMi1DbGF1c2UpCj4gKwo+ICslWUFNTCAxLjIKPiArLS0tCj4gKyRpZDogaHR0cDov
L2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVkaWEvc3Qsc3RtMzJtcDI1LXZlbmMueWFtbCMKCkNh
biB0aGlzIGR0LWJpbmRpbmcgYmUgbWFkZSBtb3JlIGdlbmVyaWMsIGxpa2Ugc29tZXRoaW5nIGxp
a2UKaGFudHJvLWgxIG9yIFZDODAwME5hbm9FPwoKSSB0aGluayB0aGVyZSB3aWxsIGJlIG1vcmUg
Ym9hcmRzIHRoYXQgbWF5IGluY29ycG9yYXRlIHRoZSBIYW50cm8tSDEKb3IgYSBWQzgwMDAgaW4g
dGhlIGZ1dHVyZSwgYmVjYXVzZSBJIGRvbid0IHRoaW5rIHRoaXMgSVAgaXMgdW5pcXVlIHRvCnRo
ZSBTVE0zMk1QMjUuCgphZGFtCgo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCMKPiArCj4gK3RpdGxlOiBTVE1pY3JvZWxlY3Ryb25pY3MgU1RN
MzJNUDI1IFZFTkMgdmlkZW8gZW5jb2Rlcgo+ICsKPiArbWFpbnRhaW5lcnM6Cj4gKyAgLSBIdWd1
ZXMgRnJ1Y2hldCA8aHVndWVzLmZydWNoZXRAZm9zcy5zdC5jb20+Cj4gKwo+ICtkZXNjcmlwdGlv
bjoKPiArICBUaGUgU1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyTVAyNSBTT0NzIGVtYmVkcyBhIFZF
TkMgdmlkZW8gaGFyZHdhcmUgZW5jb2Rlcgo+ICsgIHBlcmlwaGVyYWwgYmFzZWQgb24gVmVyaXNp
bGljb24gVkM4MDAwTmFub0UgSVAgKGZvcm1lciBIYW50cm8gSDEpLgo+ICsKPiArcHJvcGVydGll
czoKPiArICBjb21wYXRpYmxlOgo+ICsgICAgY29uc3Q6IHN0LHN0bTMybXAyNS12ZW5jCj4gKwo+
ICsgIHJlZzoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIGludGVycnVwdHM6Cj4gKyAgICBt
YXhJdGVtczogMQo+ICsKPiArICBpbnRlcnJ1cHQtbmFtZXM6Cj4gKyAgICBtYXhJdGVtczogMQo+
ICsKPiArICBjbG9ja3M6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICBjbG9jay1uYW1lczoK
PiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICtyZXF1aXJlZDoKPiArICAtIGNvbXBhdGlibGUKPiAr
ICAtIHJlZwo+ICsgIC0gaW50ZXJydXB0cwo+ICsgIC0gaW50ZXJydXB0LW5hbWVzCj4gKyAgLSBj
bG9ja3MKPiArICAtIGNsb2NrLW5hbWVzCj4gKwo+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFs
c2UKPiArCj4gK2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4KPiArICAgIHZlbmM6IHZlbmNANTgwZTAw
MDAgewo+ICsgICAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDI1LXZlbmMiOwo+ICsgICAg
ICAgIHJlZyA9IDwweDU4MGUwMDAwIDB4ODAwPjsKPiArICAgICAgICBpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgMTY3IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ICsgICAgICAgIGludGVycnVwdC1uYW1l
cyA9ICJ2ZW5jIjsKCgpJcyB0aGUgaW50ZXJydXB0LW5hbWVzIG5lZWRlZCBpZiB0aGVyZSBpcyBv
bmx5IG9uZT8KCj4gKyAgICAgICAgY2xvY2tzID0gPCZja19pY25fcF92ZW5jPjsKPiArICAgICAg
ICBjbG9jay1uYW1lcyA9ICJ2ZW5jLWNsayI7CgpTYW1lIHRoaW5nIGZvciB0aGUgY2xvY2suICBp
ZiB0aGVyZSBpcyBvbmx5IG9uZSBjbG9jaywgZG9lIHRoZXkgbmVlZCBuYW1lcz8KCmFkYW0KPiAr
ICAgIH07Cj4gLS0KPiAyLjI1LjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
