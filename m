Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BCBB1663C
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 20:30:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F83DC30883;
	Wed, 30 Jul 2025 18:30:04 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 266FDC3087B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 18:30:03 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5f438523d6fso1792a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 11:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753900202; x=1754505002;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7NIbM6q1x218b7Li1UvxruEIMKkwKF1Zyv43mPS1uqY=;
 b=TLCiNMCgPg73OSCSrF+38VQTBz60w5BulFfCVDjZMBh8eivKS7PwHxU5YfcKZMHt1o
 VN/zlytJvWb3udd49Yo+eC9TF6peAicmahtnAW7sbzkY0mfdQxpaEb+hUkN+rf82cks0
 XKpgafHaUWH/vW5BIXjbImj4fwy+OIEV0Fvq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753900202; x=1754505002;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7NIbM6q1x218b7Li1UvxruEIMKkwKF1Zyv43mPS1uqY=;
 b=wHgYjlh7tWWPpmp/ymrVybxhXI0VGQy3ZuMtJGgU4K+PmqV5IfyT/xrICJf6AUE+e0
 Oqph6jaxpl7umR9RliW5Ycew8/86GbX+8wADfRI3NqDZVs8wefdDLNIkObqQI5k0L9l0
 xe5OJQgnEKAIEdo1MreAZM6/wQO6L0nmTuSd2kQHxXlq1RgMrhQF0PbFRq81M5Vyqepw
 mG18hzA2ZAMJEEkfC0HlKkx6roHduxStNtXozbABju4yb5Vo6sWE5P4JOe5A0LGy6Zl5
 pB8jC4AqLVhLnCPLQ8XVCkfgZEQdDBRHpRB2ujiCGafaHs+BzuvwhNdTp3wOzYS06MQZ
 lLqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX16OW0gQ/QcgcPqfXqU5YlGrPzCjQZn23su/q5mw6/rtVJmsROlIh+98nkYY0xTCujkthwsmib4j/RSw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx0DP/N+sRhsNVXRgYnPFTCIWoCCI4NivC1UzzagP9LjD5o1RVx
 oAEyG0wFBpIx4mkZEx22qY6Fa5LObuyoZpJAWaVvCtW3SiZJ1dfUG09Si9+EfXq9exxEtz8YF8+
 srYiPId6d4/1NFGoOopxNuHZlpnmzFJdz/6vteTHA
X-Gm-Gg: ASbGncuduCgMVYIVr91UOJXrohWhue4GhgGQToWQkzS5IZQIOArFKywczucH2o2AuMv
 F6u062lTNdZF3R6NVSKEQNP0Dt2TQEFZh15e1rcnLr6ZS+IeaugiNi8uJCnZof6wF2PXOfXyw2U
 KKLcoAGGJC/Or0AsSciSzPEKwoE9aB0biFRxJTYGhs+Bq5HD1CF0TByp3UPAYX3ZPYGbx/OAHsX
 /rf3uE=
X-Google-Smtp-Source: AGHT+IFbbK/ul5EAl+qpurW8QCD6MUFcOByL7/YGvDuMq5A8bS06QIOt2f3QRAN6xuePrLmBIsEPhHn7xYqFra8YQrM=
X-Received: by 2002:a05:6402:d50:b0:607:d206:7657 with SMTP id
 4fb4d7f45d1cf-615a5f03c3amr15582a12.2.1753900202156; Wed, 30 Jul 2025
 11:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-6-03f1be8ad396@foss.st.com>
In-Reply-To: <20250728-ddrperfm-upstream-v5-6-03f1be8ad396@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 30 Jul 2025 11:29:49 -0700
X-Gm-Features: Ac12FXzJRbNK4O4rQzoS61E9llbPlM-a0El1zXFqw746Wesi6zAN_YlMACvZJkI
Message-ID: <CAODwPW8ZXfMdFL2=6ht+BvQq5_LQkwHhQJT5j9DcseEx9naXxg@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v5 06/20] dt-bindings: memory: introduce
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

> +title: DDR3 SDRAM compliant to JEDEC JESD79-4D

Should this say DDR4?

> +examples:
> +  - |
> +    ddr {
> +        compatible = "ddr4-ff,f", "jedec,ddr4";

This is not a valid example for the way you're defining it now anymore.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
