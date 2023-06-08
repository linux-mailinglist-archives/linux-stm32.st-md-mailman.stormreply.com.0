Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFBC7281BE
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Jun 2023 15:50:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC494C6905A;
	Thu,  8 Jun 2023 13:50:07 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17F6BC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 13:50:06 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-5664b14966bso5426127b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Jun 2023 06:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686232205; x=1688824205;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J8QpnJSVLjkLfqhjKetMXB1z/ynBlgTXzzXr8NIKQBg=;
 b=eoeJediBHOzQ4sCzvkREN7NkrM+aOyYC9wrM0BBnD9QxoBLoy5vPtbG+E2gPKOhIwu
 EyNOe2N8inNUgS6tjtZnWsksbeCvcU8AoFBZ6DobK57j0QMubICD10enZz9lOfMoiZto
 dnEvHA8rWj9ZLoqv3YvVr4raYrYLM79xqk8YTt2cbBiEZAPfbmHKLO3XZuEbr0szb/95
 SsCYDLUHDN/89usT82gCPbSachy3FrjGTVQM2qjW2EJ9uSXC3cX2taX/RguroKB4gpOF
 aOvxH6ic6qAbhoKc4/toPBBjaozoEySEUg2T2tBycGzEMbSPSZvDTUa9JAlMnTpiNlUU
 uJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686232205; x=1688824205;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J8QpnJSVLjkLfqhjKetMXB1z/ynBlgTXzzXr8NIKQBg=;
 b=K3ImE1hqDjVsJ4TXqff+mR4Ob9rz2eskzlGEkBRkCj/GRt8g/k9Xgs08fvBZKzKyVI
 J6HvYxH22kzZBU8wTMqYq4oKtqORIYuZgoCFaF/xIxqXoKAA7wRBaDFJJAKgSRXDvw0L
 zHuyKeApP+dEv3VWa1mtcwjc7CajlCwrsbLdXOWs+eZNwwW3M1jJvzM7ZCYXOsNyBXgb
 Znk0/DTx2pwwMlC/XH3cFBtvwv2R9SB0UBBv6q7lMGFaCrazxYSeM8PrgdmahaZdLeYz
 D6YrOGwaeu/XzNr3r9MXBNo7HBGMDWuGGRJPvdvHeUzliItR1BBRa9r6EQuZjpVqcx0r
 zIdg==
X-Gm-Message-State: AC+VfDxTYIY/IoQr0KiiRP3N6SDJraZf+sV401JVQ/3A+UY2BPnpW4zP
 g0MEneRLD8xqiRqeXeVZSgqCkd886pTGrHd7yx0YYXqwN1bvvbTaoWc=
X-Google-Smtp-Source: ACHHUZ7B7bXPRaT8K13It0iwZz1KqJEF7lXGqjS4rO8Dx3uKOw8HQryytQq7nhVtQCV6nX83IX6Uwme+LOGCLFP0Fx4=
X-Received: by 2002:a81:6a87:0:b0:568:fe3a:46b3 with SMTP id
 f129-20020a816a87000000b00568fe3a46b3mr10251209ywc.28.1686232205112; Thu, 08
 Jun 2023 06:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230602132859.16442-1-alexandre.torgue@foss.st.com>
 <20230602132859.16442-3-alexandre.torgue@foss.st.com>
In-Reply-To: <20230602132859.16442-3-alexandre.torgue@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Jun 2023 15:49:54 +0200
Message-ID: <CACRpkdahyWFFscLYTDBGGSp-67_+4Qj1dsDif-jDFWoEK0mXzw@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, soc@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Olof Johansson <olof@lixom.net>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 02/10] pinctrl: stm32: add stm32mp257
	pinctrl support
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

T24gRnJpLCBKdW4gMiwgMjAyMyBhdCAzOjI54oCvUE0gQWxleGFuZHJlIFRvcmd1ZQo8YWxleGFu
ZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IEFkZCBzdG0zMm1wMjU3IHBpbmN0cmwg
c3VwcG9ydC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50
b3JndWVAZm9zcy5zdC5jb20+CgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPgoKUGxlYXNlIG1lcmdlIHRoZSB3aG9sZSBzZXJpZXMgdGhyb3VnaCBB
Uk0gU29DIHdpdGggbXkgQUNLLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
