Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3DC5EE24A
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Sep 2022 18:51:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EA2CC63327;
	Wed, 28 Sep 2022 16:51:43 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBC41C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 16:51:41 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id m18so2771184qvo.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 09:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=mbxRn007Ip2c/fdHqU/bp/LXy4PPcd8ySvUFUqzEX6s=;
 b=KDSVQ1oMBKRLgWEH0InLjPc/aLqNu0zJv9KCeb8pdE0nGiSRyuKb+9DE+EiYJnbcj/
 5W1QoMNbFR8fVhpkgXjoUmwOHLLwmX0oCbXvktWasxGC3jQReTgauOcAnmNu6PeNALaT
 UqcmXt9f/k5KyHbejcWPZGCuaX758i59+J3Ih/oqrzRUSd40tW8vWxku8ZEFNkA5tVAf
 LlbTu/3PjEkZlVfhoqC/toTBWPSvXO4D+eLotlQz+TXjWh/O8HKOj+XbHQ6/PsZ7mkeh
 kbW1JxtOwjFtbNfwAa5yVKWxeFkEXKz56IXX77UAuUH5jPopvluRUhwSGTqgneWCsw8d
 ug9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=mbxRn007Ip2c/fdHqU/bp/LXy4PPcd8ySvUFUqzEX6s=;
 b=qrFZgd1kW6CZRy5kfuV3Te076pScMNt9PaU8LN3s4szQMl0GmmHIbs/jcT/ea5NooY
 M/fVP/EzJLzuYd54eWxCyFC/p6HvMy19lvxlsoXomyHRIRhaJKofYV08Pbg7cGo+/m5O
 uN5XlMgTqu639AzVmrbfbdXnH1qWZM+H+3NkDSdHl7h/Y6cVqJA8nQgn9Kb7FKmfHsgh
 yQFQsn2W1M45kDX9tiNUWuhkqpO7WdrLv3eYaUlRGuTGIu421yXJokm0ANVORo9hMYg0
 pHa32/9MQwbeKju55JU5p0YCYad6+0rE61QVzi9nAGM9CqecLJUxoKvQjDvHYwBg7Z3w
 uBXg==
X-Gm-Message-State: ACrzQf3mE4x6Up3cZXetQbODBqud3KAdOeagGk+iRgDzt5kLEvvMwXgu
 BI1N7p4aoc841HIHqwwYCMYGTQefComySpEX/W4=
X-Google-Smtp-Source: AMsMyM7wXSmHKlE03PtWvNbyVtg+Z/ygdLMTLfA2/MG8cnEF6SrXoChIYY1ksHA/b/6JHXHhXq/pPCj/E7DaDVv2w6I=
X-Received: by 2002:a05:6214:c63:b0:4ad:6b45:8235 with SMTP id
 t3-20020a0562140c6300b004ad6b458235mr26846114qvj.48.1664383900664; Wed, 28
 Sep 2022 09:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220928164114.48339-1-olivier.moysan@foss.st.com>
 <20220928164114.48339-2-olivier.moysan@foss.st.com>
In-Reply-To: <20220928164114.48339-2-olivier.moysan@foss.st.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Sep 2022 19:51:04 +0300
Message-ID: <CAHp75Vf1rJRVK5Emuwk4863DTb9JjTswJefJM-1oX+2gQvLMRg@mail.gmail.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Wan Jiabing <wanjiabing@vivo.com>,
 linux-kernel@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, nuno.sa@analog.com,
 Paul Cercueil <paul@crapouillou.net>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 1/8] iio: adc: stm32-adc: fix channel
	sampling time init
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

On Wed, Sep 28, 2022 at 7:42 PM Olivier Moysan
<olivier.moysan@foss.st.com> wrote:
>
> Fix channel init for ADC generic channel bindings.
> In generic channel initialization, stm32_adc_smpr_init() is called
> to initialize channel sampling time. The "st,min-sample-time-ns"
> property is an optional property. If it is not defined,
> stm32_adc_smpr_init() is currently skipped. However stm32_adc_smpr_init()
> must always be called, to force a minimum sampling time for
> the internal channels, as the minimum sampling time is known.
> Make stm32_adc_smpr_init() call unconditional.

What is the text width here? It's okay to use Up to ~72 (or slightly
more) as a limit and format accordingly.

> Fixes: 796e5d0b1e9b ("iio: adc: stm32-adc: use generic binding for sample-time")
>
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>

Tag blocks mustn't have the blank lines.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
