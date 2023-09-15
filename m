Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F257A1930
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Sep 2023 10:52:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7668AC6B462;
	Fri, 15 Sep 2023 08:52:17 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14654C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Sep 2023 08:52:16 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-d8168d08bebso1901208276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Sep 2023 01:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694767935; x=1695372735;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQEA2FIOx2kKdYQhqTeGKcS5B9p1K7dbq3FSAP3UBRc=;
 b=C+lMqrWboeSRfFcua7OrgReI2mspml1ZX6L38fpniYFBJU27QHHMOC5DdAEfE2Z9Qi
 AhSIpc6UGGu5yfclT0YYOI3cy1IYvAvVlfVCnlyIaT0dRQEJB/222TD74eS0MI4KpPrF
 gjDf6dLNcWGSJMcOFCsYm5O4wwmK4pS2zv5ClmEvEmS1ISwp55bfMOktUOaSov14Rhjq
 qnasYkeMUS1NhCITWEARZuvxIupvBTuyoQtwrOwX/WIHKialB1rfh6VRFR910CIFhSCO
 chaRxLae76VFA5EOmwj9TXlJ7UWappZmgX5qjAFTG36hEeXBeoDAqhSrNWByYxvm39we
 CCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694767935; x=1695372735;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QQEA2FIOx2kKdYQhqTeGKcS5B9p1K7dbq3FSAP3UBRc=;
 b=gnt4qYJ2nZr+21wCprW6NSVksbwhTd5l04MU/YCKoxCHrHVtn9ZrNz2G1rgfsEiNW6
 q5JhYt5xM2XF9lx/9lJ1dtJJyvLLx+wc0MqVI4F8Qr/M1miy2dcSEpBSiLhZ+VWdGBoU
 plZMLZsx27jJaLmzoCHaG9KSYMw/TmHmL1lvwRVyXI894jEy0ILcgUXE7MGWP5o+I5kT
 z7+TNSqPX33RTHglvAW8s+4i5Mspyf6U3T6s07kMquOOZwV88ivz0GGwY2EwaKZoZgwg
 hV85Le6rOfe+vB3rga6kNMgmjkVtsPQyxZp2iT9WZ/FKo9YuWha2M36BCSMeD8F0gD9c
 mjcQ==
X-Gm-Message-State: AOJu0Yx/n3dzphyaDZmjGXJou12+a/RFUzNXx9GGD87kecoYzLPDjZ/v
 arYdzlCOpXK69A5T3OPjzhdQgmRwLpPgwSRZES8/vA==
X-Google-Smtp-Source: AGHT+IF03Cm5Va9hUiFUq1vEzW6LcyQAcPPtXI3kkxlLHejHACO76N1blpi+PQJOeYgaIv7Amr4/YkwX0A4xUwTw4/k=
X-Received: by 2002:a25:3496:0:b0:d80:b87:3299 with SMTP id
 b144-20020a253496000000b00d800b873299mr602004yba.49.1694767934897; Fri, 15
 Sep 2023 01:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230914150904.155630-1-yann.gautier@foss.st.com>
In-Reply-To: <20230914150904.155630-1-yann.gautier@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 15 Sep 2023 10:52:04 +0200
Message-ID: <CACRpkdasQqbSGhrd7+0M7t5ATsj7krpvmCGZ9uPsYHcu5K87kw@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] mmc: mmci: stm32: add SDIO in-band
	interrupt mode
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

T24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgNTowOeKAr1BNIFlhbm4gR2F1dGllciA8eWFubi5nYXV0
aWVyQGZvc3Muc3QuY29tPiB3cm90ZToKCj4gRnJvbTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJp
c3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20+Cj4KPiBBZGQgdGhlIHN1cHBvcnQgb2YgU0RJTyBp
bi1iYW5kIGludGVycnVwdCBtb2RlIGZvciBTVE0zMiBhbmQgVXg1MDAKPiB2YXJpYW50cy4KPiBJ
dCBhbGxvd3MgdGhlIFNEIEkvTyBjYXJkIHRvIGludGVycnVwdCB0aGUgaG9zdCBvbiBTRE1NQ19E
MSBkYXRhIGxpbmUuCj4gSXQgaXMgbm90IGVuYWJsZWQgYnkgZGVmYXVsdCBvbiBVeDUwMCB2YXJp
YW50IGFzIHRoaXMgaXMgdW5zdGFibGUgYW5kCj4gVXg1MDAgdXNlcnMgc2hvdWxkIHVzZSBvdXQt
b2YtYmFuZCBJUlFzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJp
c3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWWFubiBHYXV0aWVy
IDx5YW5uLmdhdXRpZXJAZm9zcy5zdC5jb20+Cgp2MiBsb29rcyBnb29kIHRvIG1lLApSZXZpZXdl
ZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxp
bnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
