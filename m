Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF67BADE67C
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jun 2025 11:20:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DCC5C36B3A;
	Wed, 18 Jun 2025 09:20:48 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF110C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 09:20:46 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-3105ef2a071so68706251fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750238446; x=1750843246;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IRP+3CAFUW4BsJ0AF1rbBPjb6qCHBeVG0qqt3MSiEw4=;
 b=J8yHQITOLWftv5j05Y0RBoJfFmy5dHMukhjHlzzuZoNQM5yOBFuATQt+BGdZosRith
 Sx9kPppE3xIkLQ2DunlklJnZnFY6N+cQwIaP+wJ4M8CVRGBe1X3OIsoQ2osloxLxrrL1
 GTBqcFYApZC/z5AJDQMx/82GSSu9xWRrIYJXyzro1Yb0dLfAIaLCJcaTXqaXlkbjYq+P
 nU2h4CzzkAAfEBvFjpC60n2nleHQU1oMZZ2UVGb8XuMzyOJ3R+9uYyzSBEByTnIva+45
 mSahNo9Urhrf1d06gjxOn3lqeFORmIEZH8xGh3J69+x+KdeB7SqxdoskXNL/TpJlenQg
 U/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750238446; x=1750843246;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IRP+3CAFUW4BsJ0AF1rbBPjb6qCHBeVG0qqt3MSiEw4=;
 b=Mt2ewdxepxgih+LloAOA7N+9udq0JxWKznR0IepBQSnOrtacBDbpNfJC7/S3fbLMZx
 EW4oRavXTG+i8oRYiXr5kSXuFEILYotRUXLBGeoMG/yHy7XMovnxxDcSuawv/nZrHKda
 oSZaWSGgIquKGzAps9caUO9r4d/GeLdrZS+5S2jUZCl9qLC4rG/93wl6ibzCNiBrEC14
 wP2ynks/0ww5ajaZutgna5DYdFy0J5fKBp3i9U0V8mVT6fK4nWyR4iEsiBvn5fioMTxD
 bzNeFGQED1zPGyBYe6ZpfGH/hBTDZH18X47GZDYe6l4icsNwxtj+xLBy8atb8A1UaloJ
 OEig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXALWNSJ11XXZfgu9xJEA7Bv8lvKOLe6lV/JUVooYKVsiLn/4CC6DLID6aY7uLxro8hdUiDZcM0v6k9Hw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxLE+0/7hV3XyUQJxgyvZb3Z3sE03UqCG+cFJBViBWPVvoCW0fc
 16gh6mA5wL735NByX4whWr76Y1mxstf5VaTMw+8jzJck8+Vl2qbJVD9fa2nrYN9EWycDwfEAOI1
 73UNXMF+ZdwakLbAbUC56PH0UwmeAQEw5Mtwz7xpYBg==
X-Gm-Gg: ASbGncvA2iDz9mf/Cx3SpUbrun6tF0MpiZjM2aiKgbKpHpJlUH6nNJKCTj9BVjGHSIj
 yOpMDAmH/SBzO5z/FJoiIOBEDeb5Dgk1GkTPkYfp2EMhunIhxllDQS2GQUhqI93NGNj3HXVnKpy
 gmW6nvLlDdUJCy+x1sS+e+q02GLXCvx94ByA+Nqr0PbBI=
X-Google-Smtp-Source: AGHT+IGYHmwuRCbsyGw1J8Pu6GUbhDQ6w+nVs1//AI3lpbzQb9Bb3dDWstkl4KwszZdq0G2erWbc3Ga3QrnKGmbGGhc=
X-Received: by 2002:a05:651c:1a0a:b0:32b:522b:e446 with SMTP id
 38308e7fff4ca-32b522be65fmr41755231fa.10.1750238445710; Wed, 18 Jun 2025
 02:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250610143042.295376-1-antonio.borneo@foss.st.com>
In-Reply-To: <20250610143042.295376-1-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 11:20:34 +0200
X-Gm-Features: AX0GCFuWBc_XYewjnfwAEfEgMlAZ5vMOVJJK7KgI8KvNcDIipEswDPcxuF3xpvc
Message-ID: <CACRpkdYVaTvArLVNUYf41nm_StVkWT0CMmTxheT9ovbBE+PopQ@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/5] pinctrl: stm32: add irq affinity,
	RIF, module support
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

T24gVHVlLCBKdW4gMTAsIDIwMjUgYXQgNDozMuKAr1BNIEFudG9uaW8gQm9ybmVvCjxhbnRvbmlv
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IFRoaXMgdjIgaXMgYSBzdWJzZXQgb2YgdGhl
IHYxLCBzcGxpdC1vdXQgdG8gc2ltcGxpZnkgdGhlIHJldmlldy4KClBhdGNoZXMgYXBwbGllZCEK
CllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
