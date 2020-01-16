Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 321F313DF44
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2020 16:53:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CDCBC36B0F;
	Thu, 16 Jan 2020 15:53:30 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0053AC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2020 15:53:28 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id v201so15837880lfa.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2020 07:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3b7/rLBHWWHHYbKlS/39gt431nhXhJtYjpUHbaLNr48=;
 b=wAHw/S9tpiW6/rLfiflhLgJlKqcbwOlb9ikkhtYxRh+yigmPtz5rZmKdABwJ4ic8Ha
 M33iKs5jTU9sjzj0Eg3/LMkbs+ACuxkZcRsDB5bBK2Nhn6okMoqHcbOjlFADq9X53JDe
 WwvMyTDS3hZNvTK3oPxFD5bKFTbSoHfhCH8TWJP6Ljwhm99W4tZs16FU3BVitlpVZCV8
 ZiR6//F8cJ2yQdb8zaM3x4qL9zhSFHvb93qBrCVWgj3HF0VyLL2e/l9Pnvv/b6YbW417
 HnmyX3PEJs1Wmye0ZZyU5AOpQmwI3cskyx5jY4h8kVoZU+jQTBRuoyPyMF3pqGgMRAZc
 TMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3b7/rLBHWWHHYbKlS/39gt431nhXhJtYjpUHbaLNr48=;
 b=skrSylz3S6wx4Bi/ffQoeTtMwsSuq7yHcfrZrbOlqqkJibt9quMdt59SDcWFzz77ua
 TuFlOW+kjZKIf7HOAvM5M+sq2hAsXU0cICv3Vb2qPI/Nb2uz3LlOBIaAsx8V++potR3+
 GAj28/6LRnjtyxlDdY24lHpFZtfnIV7nq8dnOQs/Nsid2OU1/nYPDd7mVO5OfYRXVS7K
 /bcVY6XRCefQmzMkNnm0kEFXQNr6RV3bSVRoVoOfcDPfIUaIHDGH6Z1uYuYC2FegOaF4
 Sj3IL9CeYsphYmXyawjW+bKFHy/ZHd7i4PTSJ4EUPxTLMQh8TbS+I/CvRun6j6auhfHo
 1uVw==
X-Gm-Message-State: APjAAAW4Ng/EdcswAhxhiPApdRhTIgM+/Ag/qB7q7EOW7/XqiLWMBf2v
 r60oKHg3+kUWtoU4XQhThftiRtRLFgDHetWhNOiPFQ==
X-Google-Smtp-Source: APXvYqyaY1zsZac6xIg1geYp8/1vn1UDTyxas3KGQkY/prQkzpWCL0jDomBKohuCGrAyS4OUIUVVdQm7OlnHV7LpPR0=
X-Received: by 2002:ac2:5dc8:: with SMTP id x8mr319519lfq.217.1579190008179;
 Thu, 16 Jan 2020 07:53:28 -0800 (PST)
MIME-Version: 1.0
References: <20200109145333.12260-1-benjamin.gaignard@st.com>
 <20200109145333.12260-3-benjamin.gaignard@st.com>
 <CACRpkdaK+kQZH_Txu-r4DY_m6muh26aCWcGOkxbi8hbCgww28A@mail.gmail.com>
 <CA+M3ks7s_KOhXciJPZc3N4z9GNkiKa=fWdQ3hC_HTtrWMWYHtQ@mail.gmail.com>
In-Reply-To: <CA+M3ks7s_KOhXciJPZc3N4z9GNkiKa=fWdQ3hC_HTtrWMWYHtQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jan 2020 16:53:17 +0100
Message-ID: <CACRpkdZzL_rBs61s+4k6-QNkB4WzjV1hTy90_St-zsAO=ZyQfA@mail.gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Pascal PAILLET-LME <p.paillet@st.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Baolin Wang <baolin.wang7@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/3] clocksource: Add Low Power STM32
	timers driver
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

T24gVGh1LCBKYW4gMTYsIDIwMjAgYXQgNDo0NCBQTSBCZW5qYW1pbiBHYWlnbmFyZAo8YmVuamFt
aW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4gd3JvdGU6Cj4gTGUgamV1LiAxNiBqYW52LiAyMDIwIMOg
IDEwOjA3LCBMaW51cyBXYWxsZWlqCj4gPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4gYSDDqWNy
aXQgOgoKPiA+IElmIHlvdSBoYXZlIGEgc3BhcmUgYWx3YXlzLW9uIHRpbWVyIChhbmQgaXQgbG9v
a3MgbGlrZSB5b3UgaGF2ZSkgd2hpY2gKPiA+IHlvdSBjYW4gc2V0IGFzIGZyZWUtcnVubmluZywg
eW91IGNvdWxkIHJlZ2lzdGVyIGl0IHdpdGgKPiA+IENMT0NLX1NPVVJDRV9TVVNQRU5EX05PTlNU
T1Agc28gaXQKPgo+IFRoZSBkcml2ZXIgb25seSBpbXBsZW1lbnQgY2xvY2sgZXZlbnQgZmVhdHVy
ZSBzbyBJIGRvbid0IHRoaW5rIHRoYXQgaXMKPiBmbGFnIGlzIGFwcGxpY2FibGUuCgpJIGtub3cs
IGl0IHdhcyBhIHN1Z2dlc3RlZCBmdXR1cmUgZmVhdHVyZSwgaWYgeW91IGhhdmUgYSBzcGFyZQp0
aW1lci4KClRoYW5rcywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
