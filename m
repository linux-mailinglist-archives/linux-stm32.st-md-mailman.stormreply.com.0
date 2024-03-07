Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8794E8753ED
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Mar 2024 17:10:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37B79C6DD72;
	Thu,  7 Mar 2024 16:10:12 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B6C4C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Mar 2024 16:10:10 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-6e5027608a9so483937a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Mar 2024 08:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709827810; x=1710432610;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KVzT2QSwauUmQXDgyV4/hYmFZcp2eT14HsdupV+MgYE=;
 b=qeqLQ3iT1ZAlyS6i43nFzuhkEIHeb9MmhSOudNqLUuk4g9OJ6QZJGOGHftTmZhpgkG
 B1+Sj8KVkZLuZzZfraR2FPm0Thg0bSa0UZ/rsSu7dixGi+mYtzitRNCa+re5i+cBvdAe
 GPXOKqAUI6xcmVnSxNCTNPtoBVZQwvstFXHL3jQzTF/J8lGVAH/NThUg/CTJ5mrshSPs
 wjpeswZsEaKto2ox35usI3TmYfitWtnhBSczgg1h4mtR4xyTnmaU+HgFAG/i1gpxVVfn
 GXx7vO6OsUHu1pE8P/bMaYHZgC5cqEsQJIy0DVsAXvVDjUczSZ6Owgfu5hBZW5PxgiEe
 kvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709827810; x=1710432610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KVzT2QSwauUmQXDgyV4/hYmFZcp2eT14HsdupV+MgYE=;
 b=AupiN9uHCiEoxMIVoJeSg/CBa+5XqLLmB+WivtIyH8+BKskpuAI/dFFmwRPJal2LlO
 vBqR7fpn7tzZLO70k+ZoZlCzwsmAlTY0EfgchA8GnGZ5/Nf6iRi7HnkQvPdIXnayseS2
 jNkuJRscFR9RCVqWFvATuNDd98W8LoXwvYJtmL9GBU5XZwqkOFhL8ZfAyA3QB5B6FKkR
 A0VkSLTHfJa1Si9Bhai9IsiZb72kEQKV4yWMg4ovdrF85bLsu/6ixBceSIZpReWAVH19
 0hCziAbii3j3JpEx2ot59cEylM+6ceKDFg0eaNOYQ61D8ty3QhWR7tk037D+Rk81eGSD
 t/pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd9YE39Fdr0yTOcvM5d5P9Q6RLiVrV77vfGmNxDN+9PUxCCEuTvv2fCL5ZShG6GTavCcS4XeQoxhexd4nNIQF5i3B4guEjUTYv6gdNiRU72ch+4yytAgOO
X-Gm-Message-State: AOJu0YwHlE68HkAAtt7H4LnDdfx5X/MI8YQuM//Y9qDDzWwRjqURZ3tr
 wc5Kzbz00jLwloFzeUUvbv5qzUc6ExtK6ve85f1CpOtpzammaZmw6bvXw9Xo/40=
X-Google-Smtp-Source: AGHT+IEIyRs7AXpqG00AY0+Fef/12UtewTvs6Q2q2klTZYQ6YV9VEPXsKkxidX6ek4INd4XUG2Cmeg==
X-Received: by 2002:a05:6870:2c87:b0:220:c604:8df with SMTP id
 oh7-20020a0568702c8700b00220c60408dfmr331707oab.37.1709827809735; 
 Thu, 07 Mar 2024 08:10:09 -0800 (PST)
Received: from ishi.. ([185.243.57.249]) by smtp.gmail.com with ESMTPSA id
 p16-20020a67fc50000000b0046d2b34617bsm2502935vsq.28.2024.03.07.08.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 08:10:09 -0800 (PST)
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Thu,  7 Mar 2024 11:09:58 -0500
Message-ID: <170982771148.275811.6055226756648410455.b4-ty@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307133306.383045-1-fabrice.gasnier@foss.st.com>
References: <20240307133306.383045-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, William Breathitt Gray <william.gray@linaro.org>,
 lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 00/10] counter: Add stm32 timer events
	support
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


On Thu, 07 Mar 2024 14:32:56 +0100, Fabrice Gasnier wrote:
> Improves the stm32 timer counter driver by introducing new signals,
> e.g. counting frequency, and missing channels.
> 
> It also adds support for interrupt based events using the chrdev interface.
> Two event types are added in this series: overflows and capture.
> 
> Up to now, stm32 timer counter driver focused mainly on quadrature
> encoder feature on channel 1 & 2. It was limited to timers that has
> the HW quadrature encoder.
> 
> [...]

Applied, thanks!

[01/10] counter: stm32-timer-cnt: rename quadrature signal
        commit: 74326ec28e2794e352284f619faa967b4744b79f
[02/10] counter: stm32-timer-cnt: rename counter
        commit: 017edec6629109d14e8d0caf2539998f7912ec80
[03/10] counter: stm32-timer-cnt: adopt signal definitions
        commit: 2017a23fc03c9c6d0aab7775ae6a91b4b0a7b84e
[04/10] counter: stm32-timer-cnt: introduce clock signal
        commit: 70f8e3252192451bdb5575dc6f931655a45764a3
[05/10] counter: stm32-timer-cnt: add counter prescaler extension
        commit: 18766e036b33ea2cd017cf49cb0be6504a8821f6
[06/10] counter: stm32-timer-cnt: add checks on quadrature encoder capability
        commit: 395db2e2de1434c9f361db5a8ebcae07086826a0
[07/10] counter: stm32-timer-cnt: introduce channels
        commit: ed54da4ae5e10ea104aca4feab9a7f413ec4ace6
[08/10] counter: stm32-timer-cnt: probe number of channels from registers
        commit: 1f4552e70ca8ff36c59b7ffe2a7c277c23ea274a
[09/10] counter: stm32-timer-cnt: add support for overflow events
        commit: b30011f67e90076476d843f416085be7dead3bf1
[10/10] counter: stm32-timer-cnt: add support for capture events
        commit: a297b4a46ffd195a87532d37a2c344240d7d5ee4

William Breathitt Gray <william.gray@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
