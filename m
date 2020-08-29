Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C82AC256867
	for <lists+linux-stm32@lfdr.de>; Sat, 29 Aug 2020 16:48:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82A11C32EA5;
	Sat, 29 Aug 2020 14:48:46 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D7FEC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Aug 2020 14:48:45 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id l63so1647229edl.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Aug 2020 07:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b/qCN7j8tb2VUbSrI7tBTv/xuxn0AqjD1uWSjfTSjT4=;
 b=hHbur1rsCmRq/5XRl3unzdV1tt10cWSYSErINzv3YotSrO4cpzSxPBIZJ2F8a/p32y
 EbtjHtBuQMT/xnw1bnaezOZ1tZ1Y9WFE9e6+e3Gf8QQSqDHzcBWhyDMXhaBBzEOtJCJU
 dqIIYRY1M1LPLrByw0nz0/WJmEAEMMTHuU3scdguAfue9jBMtfmdRg+szVvVqmjfcc/T
 dtYopwsHvM5tIAyofaF/KHVMrxQEyw8Vw3BB3mONHh1jgQSMvvFUzz3zh8ZAwQk88kVq
 BlIgeLZ5FoZJGig/TL19ACCrjD9laRdwz9auEmT5qN2ItBU+IlMD/NOdsLSTkEu/AAJN
 VIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b/qCN7j8tb2VUbSrI7tBTv/xuxn0AqjD1uWSjfTSjT4=;
 b=bm88eNGhu48aa0HILUbO+E3CJK/nwqpdOIu1VnbC50AqORHK4ig4Vwi/EIH2nwtPil
 Sfxpt+ii3tvlQmLt/YoIXWsdUgxsdkFVWQGEiESmn1pqJ0binXSB9xvm8Ei1aN3+k2Le
 i22KnJ8vH/BD+uL0QuE35JzEvMFengNjObQ5RTPN5CdIDkuwP9en95lwu4H9vBcW9tid
 47PJHFEZhCpHSo/bT7A2B/hJW4LfnVi3Vz1GGq+GBalqDsfAtG/6Ssv+W4pw5NsJyJLi
 GUc3W0rbF6RONMbuameDI0ZrhJaT3NtW1WLxSzsXPC5wY2U1EhgCVhFE4/7zW4W09jJY
 UKMg==
X-Gm-Message-State: AOAM530Y+GJCm6H6TAZ3OQ6hspveJztTOGpVtRGRyt64Y+TnbFyRwgw2
 HJ32Kb1SonPnw2Tt9rb4kcGheIUyqZUKHZPt+Cs=
X-Google-Smtp-Source: ABdhPJxMlnl1Lp/VRHMrdqqkFtqSaK4C9u1G2u7BpHPiLA9TpJhoMPjyU5seldtykzBb1BcV6pduKOwjgdRUKlBblPA=
X-Received: by 2002:a50:fb98:: with SMTP id e24mr3048905edq.130.1598712524689; 
 Sat, 29 Aug 2020 07:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200829064726.26268-1-krzk@kernel.org>
 <20200829064726.26268-6-krzk@kernel.org>
In-Reply-To: <20200829064726.26268-6-krzk@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 29 Aug 2020 16:48:33 +0200
Message-ID: <CAFBinCCDvnT2HUuAF3J4FCWXKGpo-Wp-VxBuVFZSAovjeV04=g@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-amlogic@lists.infradead.org,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 06/18] iio: adc: meson_saradc: Simplify
	with dev_err_probe()
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

On Sat, Aug 29, 2020 at 8:49 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
