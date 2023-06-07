Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C0172548C
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 08:43:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93C3DC6B455;
	Wed,  7 Jun 2023 06:43:05 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5D03C6A5FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 06:43:03 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-56974f42224so64308227b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Jun 2023 23:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1686120182; x=1688712182;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dsg7fMeOwWf6duFi3SL6qXsSugXJIk0Q5FLHDNP0ztQ=;
 b=kVd/MnqaoIb5oxrldwJ5KKFEpysXJo1vKiAhaP19lZrkPC6P9oUh93qci0bfIU3RYr
 FOzKnA6wBqU6vXDEPXVRMXQ54vUNAsclDBESzc7L+maa4WBFhljs6Xr+L827WRe4vcD/
 aB9DVry9wy72Eh4u11rbQThzzLKuFbWeSnLWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686120182; x=1688712182;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dsg7fMeOwWf6duFi3SL6qXsSugXJIk0Q5FLHDNP0ztQ=;
 b=EBA1zIpLVcN03rDQT4XDkPBAUbR5cD9WvLJT8Df/jbmuxQP6dMxrLIU8F/6x/vk2lt
 nznju5ZoimoFyWkwfWShlHOagKTZ6R6fZlZmpBmrsxllJ8iNsYfKA+iXL6S99tGEITM8
 Qly9H8GYeimo2NVwpPh3Q9ddpkl8ubR39wQAcIySamActObsP8rFwOGP+0CLRy8o+c13
 jlMTg1fi8XrB0Ose1ujf/PRjwKMwIRQC7dm3mdaZu4ViYAJu4ZyjsVfqibT6ovBdw4xq
 Q0D5zF0ATUpsT+FpyUL936aR/nXIS5xBupTdVac3jONjphbHrafwXQ2pgKja6f4M1/wv
 nf2g==
X-Gm-Message-State: AC+VfDwVyvU7eBS6TwQlNgUgsqWsHrBuMX6fKn7rVivu7OybWaXyBEUK
 v9Q38teNmahV3gijnPGxLuKU5pL634feq7V+VEjAsw==
X-Google-Smtp-Source: ACHHUZ6sjnQG6odBG4w0qQkBK4LJZGwQU7CqikJozkVHCbSGSE0jcdrkgzVwr1fXZBKKMsum+q741mo0WSCe/CRDp74=
X-Received: by 2002:a81:8450:0:b0:565:b22c:4165 with SMTP id
 u77-20020a818450000000b00565b22c4165mr5933812ywf.11.1686120181918; Tue, 06
 Jun 2023 23:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
 <20230607063139.621351-4-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20230607063139.621351-4-dario.binacchi@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 7 Jun 2023 12:12:50 +0530
Message-ID: <CAMty3ZDCkQ_T+j96iXtMAhkOLFBm=hZHk=sZzSGA=MOQQUOv7g@mail.gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v2 3/6] ARM: dts: stm32: support
 display on stm32f746-disco board
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

T24gV2VkLCBKdW4gNywgMjAyMyBhdCAxMjowMeKAr1BNIERhcmlvIEJpbmFjY2hpCjxkYXJpby5i
aW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBBZGQgc3VwcG9ydCB0byBS
b2NrdGVjaCBSSzA0M0ZONDhIIGRpc3BsYXkgb24gc3RtMzJmNzQ2LWRpc2NvIGJvYXJkLgo+Cj4g
U2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1
dGlvbnMuY29tPgo+IC0tLQo+Cj4gKG5vIGNoYW5nZXMgc2luY2UgdjEpCj4KPiAgYXJjaC9hcm0v
Ym9vdC9kdHMvc3RtMzJmNzQ2LWRpc2NvLmR0cyB8IDUxICsrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjc0Ni1kaXNjby5kdHMgYi9hcmNoL2FybS9ib290L2R0
cy9zdG0zMmY3NDYtZGlzY28uZHRzCj4gaW5kZXggYzExNjE2ZWQ1ZmM2Li5jZGE0MjNiNmE4NzQg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNzQ2LWRpc2NvLmR0cwo+ICsr
KyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjc0Ni1kaXNjby5kdHMKPiBAQCAtNjAsMTAgKzYw
LDQxIEBAIG1lbW9yeUBjMDAwMDAwMCB7Cj4gICAgICAgICAgICAgICAgIHJlZyA9IDwweEMwMDAw
MDAwIDB4ODAwMDAwPjsKPiAgICAgICAgIH07Cj4KPiArICAgICAgIHJlc2VydmVkLW1lbW9yeSB7
Cj4gKyAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsgICAgICAgICAgICAg
ICAjc2l6ZS1jZWxscyA9IDwxPjsKPiArICAgICAgICAgICAgICAgcmFuZ2VzOwo+ICsKPiArICAg
ICAgICAgICAgICAgbGludXgsY21hIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRp
YmxlID0gInNoYXJlZC1kbWEtcG9vbCI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgbm8tbWFw
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIHNpemUgPSA8MHg4MDAwMD47Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgbGludXgsZG1hLWRlZmF1bHQ7Cj4gKyAgICAgICAgICAgICAgIH07Cj4g
KyAgICAgICB9OwoKVGhpcyBsb29rcyB1bnJlbGF0ZWQgdG8gZGlzcGxheSBlbmFibGVtZW50LCBp
c24ndCBpdD8KCkphZ2FuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
