Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D86D213D665
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2020 10:06:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93EA0C36B0F;
	Thu, 16 Jan 2020 09:06:53 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF555C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2020 09:06:52 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id u71so21704966lje.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2020 01:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YX3/Ti4rNNr6UCshG9bZTqGTKsmc/hxmzqtnVPBHDm8=;
 b=MGfwKQoKAqc3fScLEHCq7ywLuKCcvWPmQ9A7lwyExcP8OV3fnyDUQ4mQEIZsH51+oJ
 0kNXekwRVSQafelLavUheZa9llfrrDBxGeJJtIf2c5aYnACbp3ferLP/cK1w4LwfX0F3
 6Y7NAppxwKV8qjOAUP4jQl6u1uUyfEKMd0lLnEwFErxZTg7GvpGuBiAIDoD22b5Qu04x
 FmzKSj5FCFYAwffwgIp3VN72A7V4dI1YvvpN/tGlg9y7nXiewtk9bT33IzGyPGzNU5+w
 7RvD5HjpxlCMTAYkHfR4pIC5wzIa0hnrVGufZMvfS0btIgdaMkCANDqJNtjHbDC/IHe9
 87uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YX3/Ti4rNNr6UCshG9bZTqGTKsmc/hxmzqtnVPBHDm8=;
 b=LRGNEuRn/srBL5Ty6R+jbLjZm46F7uZIT4seEXE7Mcev/y59oBvvA/Ruddtv2Idvge
 KYmmgMdAhDNakldYgHOOqCSc9s+J9OaZrSHkJqtZ6Hj8dwgBxMIKydaUSZTyi4qNwlnj
 SW4+7tnZY/R0vUNacJca1C2PdtWM9wAM7jKZA0/uWaw8PAyUKsYiuqNk4wAkKjOf/T9M
 BohHJns9I1BNZy/xQ9rHP+mTBM8snb3Oq7CeGTdDati9F8vJAsOXg9ee/wu+nCxdahwK
 lEd5kAbeNvcbyEfdO1XHQqPTUgeYpzRK/UnfTu+Kf6L7y0e7uXheDR69HySSnAf6IsPH
 8+Qg==
X-Gm-Message-State: APjAAAU2scTdRurVJp94bUcXEk+zOo+Zgg74IyTXVh+9wR+u3z8Gl1hK
 1qUv+f9XUmfAajKNYoxO5yBuGjxR7Kc7OQNmQScYUA==
X-Google-Smtp-Source: APXvYqz1bWJIuOjw+BT1TEwOPq4JBdgdI/skG6NXF/N1KsERHNA6I+CpAf4tjtbyYYrx3gjxL2aY1jk3BlxmtyTmf9w=
X-Received: by 2002:a2e:960f:: with SMTP id v15mr1685441ljh.265.1579165611849; 
 Thu, 16 Jan 2020 01:06:51 -0800 (PST)
MIME-Version: 1.0
References: <20200109145333.12260-1-benjamin.gaignard@st.com>
 <20200109145333.12260-3-benjamin.gaignard@st.com>
In-Reply-To: <20200109145333.12260-3-benjamin.gaignard@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jan 2020 10:06:40 +0100
Message-ID: <CACRpkdaK+kQZH_Txu-r4DY_m6muh26aCWcGOkxbi8hbCgww28A@mail.gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>,
 Baolin Wang <baolin.wang7@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Pascal PAILLET-LME <p.paillet@st.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, Jan 9, 2020 at 3:54 PM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:

> Implement clock event driver using low power STM32 timers.
> Low power timers counter s running even in when CPU is in stop mode.
> It could be used as clock event broadcaster to wake up CPUs but not like
> a clocksource because each it rise an interrupt the counter restart from 0.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> Signed-off-by: Pascal Paillet <p.paillet@st.com>

Looks good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

If you have a spare always-on timer (and it looks like you have) which
you can set as free-running, you could register it with
CLOCK_SOURCE_SUSPEND_NONSTOP so it
keeps the system clock ticking also during suspend as
alternative clock source.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
