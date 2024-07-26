Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C116E93D9E9
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jul 2024 22:38:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 857BAC78018;
	Fri, 26 Jul 2024 20:38:47 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 755C1C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2024 20:38:40 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52f01b8738dso1846536e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2024 13:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722026320; x=1722631120;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rW/mjPQFMDuWlDKqsBRHZwlG6YWHVt6ZqbKxEMjtSFI=;
 b=A7VJgfCQFES7iYmJo1rO78PvH0m6et3VqPHdPBbx7jaUCV//5uAQpdzwUZ1Jqo7r06
 CNYoFdmKkfEK7tKDRs7eKrFfowYUba1SWaQ1QWbBQHY5CEeUIRgkP1f5Dx793JUb/KNP
 rzBhnmLlcd9Ym6h1SN26laOcdZ8rqnpPx+rBJ0GMKybP/zB+6HJlinsCBY2YZ29BxLpr
 9lqtyYd0cJONJ/FxYdeUZLqCzHobj82UkBxn5YuPuusW8hrfX/OpS5tvcTY7JePIymi+
 SlFBGwrExRqiYpQQC49BVteqCxZgftPf/fKr4w6kQ6KoTM8WJdmeocNCLxzz8/POU7Hk
 nWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722026320; x=1722631120;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rW/mjPQFMDuWlDKqsBRHZwlG6YWHVt6ZqbKxEMjtSFI=;
 b=ICQnv1tFnPhfh+VpxqiQRIrqisl8LmAtZR7WbpR692DntE+eryWhunn6lMF2zQVUEu
 G5AbsPF/iHZn//b4qAfPIo2BB8T5ZkOJVcYK2IKII/sUBROGxXi1cUZiVoowbqxIFdm5
 07r3yi92VZWjM+W9+TzKV9pllDQ9dsQ0/pCV2rZKpvQwmfe9kEhusIb0mQO8SDbzKMtx
 CspYqszt90dxkX5+qh9mFjBWDgABUK2OcN55rSDQ68yaEAKS9TyouDm7sgbNkYiRhumc
 A+7t+xCJgry8zsLuyD8c19Ge/HsKK5qDfyL2Kcg4j2/TjD69qcargP/nN6dlsgqwbYbq
 yvVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVByo/R1K3qp5W3NowMTlaqsXkwkAZOJLNcs+wThHvIlHH5k9KeZHEpXLTp8kICXe4rksrtx9c2+VO/hWiW0Y2Z3754ODPLK83Z/UFnE1CagpXdIZP4OIc
X-Gm-Message-State: AOJu0YyuFZuQ13REzzTefSXe1hjExss7BbolGoCSfigPDJKR2A1SoCi4
 Uvfpn3BZSP8HtsPGEQcDYA1h8Dsg3oqPVoRx2f6d3CSQDljzWNAlD2uwcAyzEH65plKvLUoSWGz
 snEGvrGOsrcAUVXAofUrgn7rkUWP4Nuf1/kp90w==
X-Google-Smtp-Source: AGHT+IHz/y8/buT1Q4Ov7Oc+F2tq/tFZZb040THUUnc6gsADTyKKKUkowSMmF4Ldk8jwYen4+HJqSnTy+HhOgCdrHk8=
X-Received: by 2002:a05:6512:3ed:b0:52c:e00c:d3a9 with SMTP id
 2adb3069b0e04-5309b2698b8mr531605e87.1.1722026319708; Fri, 26 Jul 2024
 13:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240722160022.454226-1-valentin.caron@foss.st.com>
 <20240722160022.454226-2-valentin.caron@foss.st.com>
In-Reply-To: <20240722160022.454226-2-valentin.caron@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Jul 2024 22:38:28 +0200
Message-ID: <CACRpkdYheDSTNszVdm4YOuupCNQbib5KB5xHgYTU3K1k_fMtyA@mail.gmail.com>
To: Valentin Caron <valentin.caron@foss.st.com>
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/4] dt-bindings: rtc: stm32: describe
	pinmux nodes
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

T24gTW9uLCBKdWwgMjIsIDIwMjQgYXQgNjowMuKAr1BNIFZhbGVudGluIENhcm9uCjx2YWxlbnRp
bi5jYXJvbkBmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IFNUTTMyIFJUQyBpcyBjYXBhYmxlIHRvIGhh
bmRsZSAzIHNwZWNpZmljIHBpbnMgb2YgdGhlIHNvYyAob3V0MSwgb3V0MiwKPiBvdXQyX3JtcCkg
YW5kIHRvIG91dHB1dHMgMiBzaWduYWxzIChMU0NPLCBhbGFybS1hKS4KPgo+IFRoaXMgZmVhdHVy
ZSBpcyBjb25maWd1cmVkIHRoYW5rcyB0byBwaW5tdXggbm9kZXMgYW5kIHBpbmN0cmwgZnJhbWV3
b3JrLgo+IFRoaXMgZmVhdHVyZSBpcyBhdmFpbGFibGUgd2l0aCBjb21wYXRpYmxlIHN0LHN0bTMy
bXAxLXJ0YyBhbmQKPiBzdCxzdG0zMm1wMjUtcnRjIG9ubHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBW
YWxlbnRpbiBDYXJvbiA8dmFsZW50aW4uY2Fyb25AZm9zcy5zdC5jb20+CgpSZXZpZXdlZC1ieTog
TGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdh
bGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
