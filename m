Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C20EF12D985
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Dec 2019 15:53:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A741C36B0B;
	Tue, 31 Dec 2019 14:53:03 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 094F9C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Dec 2019 14:53:01 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id c26so35406682eds.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Dec 2019 06:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2o20aAqayv6BZ7lYdB775KhwnJD8SsBVJk71b0rde2E=;
 b=poRD7KZjKZr3ORNVyI2Yj3hyY1TSZPoPk95zGZ701aGlD/EuLWIYYGcQNBnu2tZ7En
 xoxgSxs5loO/fAEkWpp678V8OLrQTcgJrUFksGkGuG8BarsWWXMPvtvZE1SfXAOgejml
 SLB+9Fd0k3b41xtxmVe9f/raX5P1W249Yk2AqJ15SARoCzycZA1QzKvuIQ+3j32VCpGz
 iKSAYWHJWSCOuZVvlXBzU8wMmL0ERW8LyW2wYDIQ9WUVbotyuWLM0aScSi3rKSQVm33C
 mvV0Fo4HIPY9SHlLjH+P+IMsRlEgXN4N/aXUFYrOoO0MbtUyKTAwyLZ6UghZzNXybp5c
 gC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2o20aAqayv6BZ7lYdB775KhwnJD8SsBVJk71b0rde2E=;
 b=W8WdBfcmNN+vKBUheBw7suSu22+gKu9AuUusj1fwYfD/iWS26ddE3lTO+m837Jic8U
 LiGHKDYldLfeR5EPzSQHdeKnj8Z/YLE2VhrSkb2kvqld0KKViieXdERSalvfayhk72zC
 /b2BVspbvwZj6D5QFu3aW0Ano1Ptwr4Xh/fQ8VH/dVwyxd3cOgVrHrgPCuh9kIsg1rf8
 uczdkTwNf3o1XSqAlujBxZq7/oLeLmpXAj3Ip0Uu+3TEIhZ/vU/zbxKq6Tk7Fh44qQfk
 OaviHmIECbE5jtL33HadJJDqMvOWHXKt6As07bJoenus4LHgrrFAxKU0lQ7ECex501xD
 hb4g==
X-Gm-Message-State: APjAAAU79iL1Y/+IQJ3+cTrMTldn425W1dfJmnhqn3o0mNgQscaFP2rT
 9Vm65gBNytaTQtbT/13Ih/JhLfYKnv96WD7/VmA=
X-Google-Smtp-Source: APXvYqyRa5i9cLmMHe86c+B4Fx/pd0qP4rUcFH9Tquw1x4/LQC/Oq5YixxDbRdVtRa9R4GKVNAzhEfLEp5Lfo8kVkxk=
X-Received: by 2002:a50:bae1:: with SMTP id x88mr59378035ede.10.1577803980972; 
 Tue, 31 Dec 2019 06:53:00 -0800 (PST)
MIME-Version: 1.0
References: <20191230172113.17222-1-krzk@kernel.org>
 <20191230172113.17222-2-krzk@kernel.org>
In-Reply-To: <20191230172113.17222-2-krzk@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 31 Dec 2019 15:52:50 +0100
Message-ID: <CAFBinCAeE-mu4+F9vOkp3cMaGjQ7tst0xdd47zSp54wW4ArRug@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] pwm: Enable compile testing for some
	of drivers
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

On Mon, Dec 30, 2019 at 6:21 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Some of the PWM drivers can be compile tested to increase build
> coverage.
>
> The Meson PWM driver requires COMMON_CLK dependency.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
for PWM_MESON:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

thank you!


Martin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
