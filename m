Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9355E8A9665
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Apr 2024 11:41:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3703DC6DD66;
	Thu, 18 Apr 2024 09:41:10 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56A8EC6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 09:41:09 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-617e42a3f94so6677177b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 02:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713433266; x=1714038066;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kkbR5FG9nHCaDQQ83/fhCPl692MGBzI0gOcU1PXseUQ=;
 b=Hh2lVpItvqTlVSlhALfPxeYPvNX3bpxpZtgoj9H3AmXJqkjwQ6HQtPyGx9kpEeEoOK
 GPfi25IGVLqAbobGvNlE+TZ3sMv+/SSwA+SJh9wU5jOv3++n59gKL9+2h8qCeu78sBxD
 sCTZXKK2/+R8f9Tqu3AlzzyxSs4g8GVQwdjWeTzvqTuzLX5OBxECR8pyRzt1omcvXR5e
 wMJHWYpa9o6YEHyWEhJZA7iHLf/r9MKsUvAFn+T9MHBI/COoAw1e0q06SAw49NOtiGw5
 v5G09ihYkRV4csnjNPljVud4+YtoEPIGRLju+BkSR31K+cLY7cJKAfXGyuNqghyDeEQ/
 NLcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU17ZupROlssdEQj9hSX/ZgXlj88xyC+myGByG62BhbDyYS0h28M7YnlWI2D/LC9hVY+9l52qs+CrBxJ1TI1zwmcIaDLWyeGIRxCXSR1e0lwWh1taWoZnFX
X-Gm-Message-State: AOJu0YzucZUyK5ZcURSp28TUht+Z7xz/I3t7thh1KuZZS0rMWu+VuLCq
 5+jn9qyM0wRk/nPS+P+pZPBCp1oK9MD+ls7Ksli2wg7OJrKPFk/UrqEgfyBtozs=
X-Google-Smtp-Source: AGHT+IHZJh0imQbmCjYV6fI2RKP0Nc//E8ur5Y929V4rieCnnSzJgLqeMFFUguvafhum8YZf6Rl+Hg==
X-Received: by 2002:a81:4c89:0:b0:615:27b6:762f with SMTP id
 z131-20020a814c89000000b0061527b6762fmr1821069ywa.49.1713433266122; 
 Thu, 18 Apr 2024 02:41:06 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 z72-20020a0dd74b000000b006184c829e9asm141416ywd.23.2024.04.18.02.41.04
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 02:41:05 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-de45d4ca525so716241276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 02:41:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXeTZ6NaoYyuul9UhmJu+mSXxpKDom36bvSys0TsQWTEG6sj2txrD7cdh8Yjiql3tqfXU/vH0BsC1EunKFPWAxjxIFbouZG0xq13vdkRZjEy/7D5r6ZbiwX
X-Received: by 2002:a25:4a46:0:b0:de0:de85:e388 with SMTP id
 x67-20020a254a46000000b00de0de85e388mr1985378yba.24.1713433264294; Thu, 18
 Apr 2024 02:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240415-rzn1-gmac1-v3-0-ab12f2c4401d@bootlin.com>
 <20240415-rzn1-gmac1-v3-1-ab12f2c4401d@bootlin.com>
In-Reply-To: <20240415-rzn1-gmac1-v3-1-ab12f2c4401d@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Apr 2024 11:40:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZJf=mL4bNik6ausMi9jOb9DegwX4ovLjdVLmnf7Sobg@mail.gmail.com>
Message-ID: <CAMuHMdUZJf=mL4bNik6ausMi9jOb9DegwX4ovLjdVLmnf7Sobg@mail.gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/5] dt-bindings: net: renesas,
 rzn1-gmac: Document RZ/N1 GMAC support
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

T24gTW9uLCBBcHIgMTUsIDIwMjQgYXQgMTE6MTjigK9BTSBSb21haW4gR2FudG9pcwo8cm9tYWlu
LmdhbnRvaXNAYm9vdGxpbi5jb20+IHdyb3RlOgo+IEZyb206IENsw6ltZW50IEzDqWdlciA8Y2xl
bWVudC5sZWdlckBib290bGluLmNvbT4KPgo+IFRoZSBSWi9OMSBzZXJpZXMgb2YgTVBVcyBmZWF0
dXJlIHVwIHRvIHR3byBHaWdhYml0IEV0aGVybmV0IGNvbnRyb2xsZXJzLgo+IFRoZXNlIGNvbnRy
b2xsZXJzIGFyZSBiYXNlZCBvbiBTeW5vcHN5cyBJUHMuIFRoZXkgY2FuIGJlIGNvbm5lY3RlZCB0
bwo+IFJaL04xIFJHTUlJL1JNSUkgY29udmVydGVycy4KPgo+IEFkZCBhIGJpbmRpbmcgdGhhdCBk
ZXNjcmliZXMgdGhlc2UgR01BQyBkZXZpY2VzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQg
TMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgo+IFtyZ2FudG9pczogY29tbWl0IGxv
Z10KPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiBTaWduZWQt
b2ZmLWJ5OiBSb21haW4gR2FudG9pcyA8cm9tYWluLmdhbnRvaXNAYm9vdGxpbi5jb20+CgpMR1RN
LCBzbwpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQK
Ci0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBp
YTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdp
dGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBU
b3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
