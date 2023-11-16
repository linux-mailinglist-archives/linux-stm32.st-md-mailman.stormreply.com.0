Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2F87EE1E2
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Nov 2023 14:49:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C03C3C6B44F;
	Thu, 16 Nov 2023 13:49:12 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 804E5C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 13:49:11 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-5a7d9d357faso8785627b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 05:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700142550; x=1700747350;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P1Ku/zmxTW3EJ14ZGSPwQJRq9NOGMsjfK91kYUMoPFQ=;
 b=l2RKzTowT3JxI/QgJ+YfodtqsBGWyFZU6o06rd4tPnSmG9h0kSraPYthslrzQYE896
 0rBivmbWCcB/HzLF6wz0JY+4MLI+xS1+QZSG5RbZJGtUqujzWgEA4pUHQRTa4ho3pNWF
 afJg4cK7EgGvt4yWOac4iKcXYjJZiM2hmp0JUHMV9P8F9uKjkuJ2YL/I5pkq44TIumZC
 AKV0ewd9H18gBRNhUArR2HEnRnnXpJY9gBeYbtKoIhbIht9drjJEP4MH0XmiQlKdyc1L
 t12YTDvHgus1TA9DxQAIDdSN3PRzfz1XejY3uQ6+VH44bnFJTE290csLQADOc7wg0ywc
 Bu/w==
X-Gm-Message-State: AOJu0Yy71upURw4nUDRMb9ede9P245L60whv3gbW8i6MwayPQEfUULOj
 fFYTZLGmMaPSfH9WD7K8MrmIl7DcG/YgIQ==
X-Google-Smtp-Source: AGHT+IEKHZcPu40mdnUdBPnr18eJ2NZuMilZISzchQOnl040Nc5W3ngv4CzvEhgjYblOQcrB+o9OiQ==
X-Received: by 2002:a0d:d503:0:b0:5a7:b8d4:60e1 with SMTP id
 x3-20020a0dd503000000b005a7b8d460e1mr16319600ywd.9.1700142550111; 
 Thu, 16 Nov 2023 05:49:10 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 h66-20020a0dc545000000b005ba5f28ff47sm994841ywd.23.2023.11.16.05.49.09
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 05:49:09 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-da041ffef81so841522276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 05:49:09 -0800 (PST)
X-Received: by 2002:a25:b120:0:b0:d9a:c7af:bb4d with SMTP id
 g32-20020a25b120000000b00d9ac7afbb4dmr15046211ybj.37.1700142549098; Thu, 16
 Nov 2023 05:49:09 -0800 (PST)
MIME-Version: 1.0
References: <20231115212908.33131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20231115212908.33131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Nov 2023 14:48:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCVTRu3JGrsZ4YjLJmzq7W1fRQ2+KkSvecGDnff=yinQ@mail.gmail.com>
Message-ID: <CAMuHMdUCVTRu3JGrsZ4YjLJmzq7W1fRQ2+KkSvecGDnff=yinQ@mail.gmail.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: timer: renesas: ostm:
	Document RZ/Five SoC
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

T24gV2VkLCBOb3YgMTUsIDIwMjMgYXQgMTA6MjnigK9QTSBQcmFiaGFrYXIgPHByYWJoYWthci5j
c2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIu
bWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4KPiBUaGUgT1NUTSBibG9jayBvbiB0aGUg
UlovRml2ZSBTb0MgaXMgaWRlbnRpY2FsIHRvIG9uZSBmb3VuZCBvbiB0aGUgUlovRzJVTAo+IFNv
Qy4gInJlbmVzYXMscjlhMDdnMDQzLW9zdG0iIGNvbXBhdGlibGUgc3RyaW5nIHdpbGwgYmUgdXNl
ZCBvbiB0aGUgUlovRml2ZQo+IFNvQyBzbyB0byBtYWtlIHRoaXMgY2xlYXIgYW5kIHRvIGtlZXAg
dGhpcyBmaWxlIGNvbnNpc3RlbnQsIHVwZGF0ZSB0aGUKPiBjb21tZW50IHRvIGluY2x1ZGUgUlov
Rml2ZSBTb0MuCj4KPiBObyBkcml2ZXIgY2hhbmdlcyBhcmUgcmVxdWlyZWQgYXMgZ2VuZXJpYyBj
b21wYXRpYmxlIHN0cmluZyAicmVuZXNhcyxvc3RtIgo+IHdpbGwgYmUgdXNlZCBhcyBhIGZhbGxi
YWNrIG9uIFJaL0ZpdmUgU29DLgo+Cj4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJh
Ymhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgoKUmV2aWV3ZWQtYnk6IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CgpHcntvZXRqZSxlZXRpbmd9
cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVu
IC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhr
Lm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkg
Y2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3Rz
IEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
