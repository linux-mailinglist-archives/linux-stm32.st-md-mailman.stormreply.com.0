Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B3C616DBC
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Nov 2022 20:21:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F71CC04003;
	Wed,  2 Nov 2022 19:21:27 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16AD2C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Nov 2022 19:21:26 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id y13so17282859pfp.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Nov 2022 12:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=B8Kb3FDF2ltCser6k2Boeu2/HvGG8fHolSWZaqKpuWo=;
 b=fCn72FEK7JqsX/hjTC/1QNdSlH+bbHzR/GBepixStWXFturm+bTiBoBMndtGCZnb5M
 XsraYqE4sBX2oDxyjcP35OrO6FQDiukWe1SSPop+KaAnoJgDPAy/i9zrWuLR4Ta6mVxW
 84EA7ip0h1VgQ0i6pTx8biZigeWK/OyGC6HfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B8Kb3FDF2ltCser6k2Boeu2/HvGG8fHolSWZaqKpuWo=;
 b=attiQnhNDnJLrYQ6gFIUO24boXp56pMJuuAKT4TSBnq2CyOAlkNy83KCSAN87FNRDk
 wY8fhoPPiyzXDFwblARhJCWChmRPJrxiBoHPTLorkp3z9+m9gQA2h3ophIcAhOgdLAEC
 KAPDg2zz8W3DSA9yxWIM/DP/l5ORvBM6rDzcAgSJZkEXCmlBlQNwPDPoyyvb/mN4SeWw
 zlrU3DgFWBaglFU8TCKlfEap8jfP1L3G5Ghj4EGWytqwS5v5nK9s/bgZima0MyNUKkAC
 r7iFuUNC1FJ15L4E5iTlIhkbdFnV8cPkXTUEANNKhXygs5GiTXA35HNeBnLmn+agfwCp
 zTpg==
X-Gm-Message-State: ACrzQf3kIT5IoM+POb+Rni+NKwpfReC3YiN03W4Mu9AavnqaL11TN4gw
 Broa7z3A8CfzjlM5FU/2yw0JmQ==
X-Google-Smtp-Source: AMsMyM7YtHQImySKSXB+BJJLch8eWsN4QnSQHsUF3i5EKgm8DFqzAM89xVOPYsJc4pOM1Kic66vX+A==
X-Received: by 2002:a63:d845:0:b0:44b:d074:97d with SMTP id
 k5-20020a63d845000000b0044bd074097dmr23393938pgj.32.1667416884681; 
 Wed, 02 Nov 2022 12:21:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 k28-20020aa7999c000000b0056bfebfa6e4sm8733255pfh.190.2022.11.02.12.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:21:24 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:21:23 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Message-ID: <202211021216.FF49E84C69@keescook>
References: <20221102172217.2860740-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221102172217.2860740-1-nathan@kernel.org>
Cc: linux-omap@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-iio@vger.kernel.org, Tom Rix <trix@redhat.com>,
 William Breathitt Gray <william.gray@linaro.org>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 Julien Panis <jpanis@baylibre.com>, David Lechner <david@lechnology.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [Linux-stm32] [PATCH 1/4] counter: Adjust final parameter type
 in function and signal callbacks
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

On Wed, Nov 02, 2022 at 10:22:14AM -0700, Nathan Chancellor wrote:
> The ->signal_u32_read(), ->count_u32_read(), and ->count_u32_write()
> callbacks in 'struct counter_comp' expect the final parameter to have a
> type of 'u32' or 'u32 *' but the ops functions that are being assigned
> to those callbacks have an enumerated type as the final parameter. While
> these are compatible from an ABI perspective, they will fail the
> aforementioned CFI checks.
> 
> Adjust the type of the final parameter in the ->signal_read(),
> ->function_read(), and ->function_write() callbacks in 'struct
> counter_ops' and their implementations to match the prototypes in
> 'struct counter_comp' to clear up these warnings and CFI failures.

I don't understand these changes. Where do 'struct counter_comp'
and 'struct counter_ops' get confused? I can only find matching
ops/assignments/calls, so I must be missing something. This looks like
a loss of CFI granularity instead of having wrappers added if there is
an enum/u32 conversion needed somewhere.

-- 
Kees Cook
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
