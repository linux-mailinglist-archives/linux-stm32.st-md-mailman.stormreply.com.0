Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A39B0E5C8
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 23:58:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 586D8C36B0C;
	Tue, 22 Jul 2025 21:58:03 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B8E0C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 21:58:02 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-609b169834cso4722a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 14:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753221481; x=1753826281;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w8hcD+fzN/rLyW2ntnhyBmLcEi4uK+H7gUEsQ2j7Juc=;
 b=Rgrkj/tFYiDjEM3z4VbWexqFspqbEeNQViV4bXbKPSOEZsLApzE8Ig9053LqBD0oJ1
 X3jyjA9dlw1JYNiB5AKInlNp85yJ2uU8geYg1ecMyCkbR0he0cujsdd6pnkHCbo87emA
 oqTOFlZI3kKKiR8iw456eXB3d6TqDtLkwJzXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753221481; x=1753826281;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w8hcD+fzN/rLyW2ntnhyBmLcEi4uK+H7gUEsQ2j7Juc=;
 b=EWOAjKD/GYnHrIxFGxB6QMaX2frwoIGZVLHRYipRk8pJDpqv96sJCYWS7zhkCHbo9c
 eyVuGRt4h1OuoDNTo3OSMZvHtXxneYEov9u1q0m0cPE4hvQR0MMBGG1fi6ZdRMdIQe8S
 54eG59rX2XQblEXAheVFKDVbsTpoe1JqfLdNbXyZ65wTGy40zKLoI1mezje/YcDTzvmr
 rKYGveaVmo1oLFfJ8+cjv47gmxrLC6ugtEMsuPI4i2n9nbYyGht6leY/gjBuT5Bc+2Gx
 /c+8dorYdSV0Yi4m79RKkWzlL49qpjoom92PyclF3b87FRGJtNf+JBmbXtx8+zyB2SIh
 DZNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2MnzZ5ieTZ2ko7NnU/nKMnRoIQ4u6T/gpHC7CKXIH47kuH1mD9csAk2ErVkdgLgPRukeysTIhKR7L6g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyuJYwW1+SWZGW+TLsYD/75tAwUJfJ4kl4wvOhFdg+QIbE+A9KF
 GhMfBHUz8E5HgZoAr74voI1Utu0HmZI3y/JzjpBFsetJqT5tdeUVU9ril4h5GicIn6NJGBmwJHv
 kJ2IagJmJnrGIbNgLCTnBLQoID1gRu2JJl/e3e7OS
X-Gm-Gg: ASbGncsNnhUSz8SfmvQyzKSmGpvKf7H7tcE7+UGeFl9cGKWG0TRXdkuVdoODaayPhE+
 OP1m20wKH2dunspLWE7rDE1WvPBStaNNUk9hLN2pPSYWIDmg7VVvUmYpYvJTpVBvG2kiypiBv7n
 cJ+7uZJzK0s8bgognmhTAoY808yn4k8hTmJ/QQbeIermYUFqp0+F+6NE379ex3og1Dr6ufExFc1
 3Dsf+ygY4uM+JNJEqyFffz1HAyMcAx61w==
X-Google-Smtp-Source: AGHT+IFuRyHVLlTc9+mvjyXn9nDzKUxgSkHkWINR1NMMOVHEBiRhg+HBPAtm00VgI63bbY4a+rdh39BgoHymQ+H8ciM=
X-Received: by 2002:a50:cd42:0:b0:612:ce4f:39c with SMTP id
 4fb4d7f45d1cf-6149a332acamr34752a12.0.1753221481275; Tue, 22 Jul 2025
 14:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
 <20250722-ddrperfm-upstream-v3-6-7b7a4f3dc8a0@foss.st.com>
In-Reply-To: <20250722-ddrperfm-upstream-v3-6-7b7a4f3dc8a0@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 22 Jul 2025 14:57:48 -0700
X-Gm-Features: Ac12FXzhD62MTJBHmWXOCNn35YJ884MYdMc4gPYhqJDJjbLE29Cjc-kRxryta0g
Message-ID: <CAODwPW_7aYdEzdUJ7b2nT4-zS9bu_hbNqjc7+_wSHbedXZXJ=Q@mail.gmail.com>
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Le Goffic <legoffic.clement@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Julius Werner <jwerner@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 06/19] dt-bindings: memory: introduce
	DDR4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

> +      - pattern: "^ddr4-[0-9a-f]{2},[0-9a-f]{4}$"

This pattern doesn't really make sense when DDR4 doesn't have the same
manufacturer ID / revision ID format as LPDDR. You could either only
leave the fallback constant for now, or define a new auto-generated
format that matches what DDR4 SPD provides (which I believe, if I read
Wikipedia right, is a two byte manufacturer ID and then an up to 20
character ASCII part number string -- so it could be
`^ddr4-[0-9a-f{2},[0-9A-Za-z]{1,20}$`).
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
