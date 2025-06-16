Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBC3ADAD98
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 12:42:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62B58C36B2C;
	Mon, 16 Jun 2025 10:42:33 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E4EAC36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 10:42:32 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-3134c67a173so4945323a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 03:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750070551; x=1750675351;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WTabLOpgCLwYv8rCyGl7CwHdWBc3RbnKBwJmaj/inH4=;
 b=TJAL0kltZUKB4XP/5W0osKtEjc4uRYPFLHla/bzbo/GjysEPvu//QJQYD7N9B9xgFN
 urJj4vNENeiOabM0R+qP8vaGlEg3Abnr8qo2YBjeHoDgBSoK67O6CxaZVCTpUULvtvGx
 Uv2+kY77CYdBQNpFLPFXPtXQhTBO38UckhD4QSmZrtctn3dKa0ZLTP6Q1Ehu8VfgD0sn
 uVOU/fBMMs3Fpx1HnMKlZe30R2z7Yh+UVtkK6Sgz8Mnd9iQS/9Qip5P+49i4GXM6NoDX
 ExBl+0lHNbm7PmreDwwAJ0LNkF86y+zgGHWpL8qpdbI00DLtJXHaAZaAMeZSjgTAXfF+
 5sbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750070551; x=1750675351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WTabLOpgCLwYv8rCyGl7CwHdWBc3RbnKBwJmaj/inH4=;
 b=aCHR2ena39lZhp2h+vvAITD/YZGbSIqkeTGUu7MVqUcAzbSFVxwpp9+IIGNfhbiSHc
 bWP9UKR30tg9sCP4gRxSy42DznqZQHzMjr+aRg7v383vHfLqiQg4UC77PVktpRGQeKtt
 KeRMTpU3nAnOK7lEbbvIajbK2lwML7/qi0iTxvJMyES+Ouar8fCDny2/etQU5rftV9if
 cFy5bSRXB7soEMMlS4brvqJRsft8R5RT2H/Fr6Vk/ItfVXk0AKX/xPM4KXYLS1R86pDc
 gsyrp6Jvvh3zMA7K+4n710fZ8Y0rfx+fJ6+O4fFE1xTrFd4aEFxSw81SZeWI2VVOIVtn
 Cr9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDu8hWE0t/VjrlsDQ1OIIJ8wKVugwjh1qx2na+lxpZgtW78S5DgycLDPch5oAkXKecvKOFk/U1y269Lw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxsO/uXPaytgNqTJvMoUc/uIHjvSMoIbiBznRFOtjAr8IWfSgRg
 9WC+K112fJMXN5vC4XmqoSyApeUQ7fYAuVwny4/8DyHXqtdGunx4v58JN8jxKBPRadzH2kcHfaL
 IozHUp0sfswLYUPlruWcUdmWiiha7ENs=
X-Gm-Gg: ASbGncs74ylirXtw66oh14BALx4rcWaCfXkJgBIJ6zEgm56sHQNI2X0F2maX7Ky832b
 HMyruMF5F6nICyRVSoXCquVLUqwkADYIjtFys+VvvKzytqTKqDL83o2SIn3sxJ0bN3CQmiDwlaj
 nAbeVZQHpcqtMIqJnwurKV5foAUiQvbuHz56lWkrWJ
X-Google-Smtp-Source: AGHT+IGdvq4Jz7wCl7O5nLF8AdUqsnNZK/jUgiSEfeGbfX1YCA4ekJ6+LuyEXZu02NW4N5RvWGmagNrrauMC8JexM5M=
X-Received: by 2002:a17:90b:274d:b0:311:9e59:7aba with SMTP id
 98e67ed59e1d1-313f1be899bmr14937709a91.2.1750070550782; Mon, 16 Jun 2025
 03:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250613100255.2131800-1-joy.zou@nxp.com>
 <20250613100255.2131800-5-joy.zou@nxp.com>
In-Reply-To: <20250613100255.2131800-5-joy.zou@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 16 Jun 2025 13:44:31 +0300
X-Gm-Features: AX0GCFu6L7Akim9BySCPjWCa7aS9JinLbW1qVZSuSXFVwqMzcBMNsyM6unHsnmE
Message-ID: <CAEnQRZAp8TX84AygSjWGx-cNiLyZXZwUx5C-DLDuyB6hO3gXMw@mail.gmail.com>
To: Joy Zou <joy.zou@nxp.com>
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, ping.bai@nxp.com,
 catalin.marinas@arm.com, frank.li@nxp.com, edumazet@google.com,
 peng.fan@nxp.com, festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, will@kernel.org, xiaoning.wang@nxp.com, kuba@kernel.org,
 pabeni@redhat.com, s.hauer@pengutronix.de, devicetree@vger.kernel.org,
 conor+dt@kernel.org, ye.li@nxp.com, mcoquelin.stm32@gmail.com,
 linux-pm@vger.kernel.org, richardcochran@gmail.com,
 linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 kernel@pengutronix.de, krzk+dt@kernel.org, shawnguo@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v5 4/9] arm64: dts: imx93: move i.MX93
 specific part from imx91_93_common.dtsi to imx93.dtsi
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

T24gRnJpLCBKdW4gMTMsIDIwMjUgYXQgMTowOOKAr1BNIEpveSBab3UgPGpveS56b3VAbnhwLmNv
bT4gd3JvdGU6Cj4KPiBNb3ZlIGkuTVg5MyBzcGVjaWZpYyBwYXJ0IGZyb20gaW14OTFfOTNfY29t
bW9uLmR0c2kgdG8gaW14OTMuZHRzaS4KPgo+IFNpZ25lZC1vZmYtYnk6IEpveSBab3UgPGpveS56
b3VAbnhwLmNvbT4KPiAtLS0KPiAgLi4uL2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5MV85M19jb21t
b24uZHRzaSAgIHwgMTQwICstLS0tLS0tLS0tLS0tLS0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9m
cmVlc2NhbGUvaW14OTMuZHRzaSAgICAgIHwgMTU1ICsrKysrKysrKysrKysrKysrKwo+ICAyIGZp
bGVzIGNoYW5nZWQsIDE1NyBpbnNlcnRpb25zKCspLCAxMzggZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTFfOTNfY29tbW9uLmR0
c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5MV85M19jb21tb24uZHRzaQo+
IGluZGV4IDY0Y2QwNzc2YjQzZC4uZGE0YzFjMDY5OWIzIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDkxXzkzX2NvbW1vbi5kdHNpCj4gKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTFfOTNfY29tbW9uLmR0c2kKPiBAQCAtMSw2ICsx
LDYgQEAKPiAgLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBPUiBNSVQpCj4g
IC8qCj4gLSAqIENvcHlyaWdodCAyMDIyIE5YUAo+ICsgKiBDb3B5cmlnaHQgMjAyNSBOWFAKClRo
aXMgc2hvdWxkICBiZSBDb3B5cmlnaHQgMjAyMiwyMDI1IE5YUCwgIGFzIHBlciBOWFAgaW50ZXJu
YWwgZ3VpZGVsaW5lcy4KCkFtIEkgbWlzc2luZyBzb21ldGhpbmc/Cgp0aGFua3MsCkRhbmllbC4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
