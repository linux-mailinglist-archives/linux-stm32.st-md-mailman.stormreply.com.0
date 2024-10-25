Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C989B10FD
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Oct 2024 22:57:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A669BC78021;
	Fri, 25 Oct 2024 20:57:32 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 971D6C7801C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 20:57:25 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539f2b95775so2888634e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 13:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729889845; x=1730494645;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hNPFlVbZVA/OKJ3932WwecR37g7+EI0egSRr36/qweM=;
 b=eDsbN7iN8Gx7grolhuqK4yjMPHra1WIo6V0UydkwuEKLWzc6mzLcbBoU3wqPPYCKJo
 UvsOohaUnx4aDUKa52JPLanIIi4tGy63Ki8WwXto0pTzDeIvvH9kuw6V8xv0m8f21TRJ
 RFrNek+JPHA6AXaNjgDhr5+dse0YPJ98/BfPbqBJy0gi6RtqUUQ+SvufHFAoYudjXMPT
 EqdJgbtyGjo4GfXBXk6i97wX7TQS0zANkt3WxsIieh5mY/8nI8ezLz8O++7DdsNeQltN
 XABAk5RLt3AO7RM3sdjf7TSqRXnYWhWJmxj7ARNQQkVQUponidj0WX6AQJobWjhIKVqr
 6phg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729889845; x=1730494645;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hNPFlVbZVA/OKJ3932WwecR37g7+EI0egSRr36/qweM=;
 b=TANIevGz5pvC/dizjBX2f/85ajiX/Lh/LuIvFZG6pXIGejDRqgVyLnCgkfCISlgpjC
 xJHFxT/PWI6QmG/jbCeJQKkMk0pc8Wb/mMoT0/QPhRdz2YwE0Mfs9kxFF/uPWhAixiPI
 giMP5H9++xrh0cSEqwE0KBKMWIQRLTHy+7bdABNbXbhELZKdGhHBTvwfASrfKLg3UYmj
 bGlH7vgg5qEdsYq2NOqMN7UYkwGFvkq24hF1aHSM123Syvz0t8HpZ9XqdAJpCE/CETp0
 zypgkQOIqFJhJ8kGNuACBQeuIRT/Hw/zpgevA00JYnFP5cAeueFbx4T26AFQ6ea3d/jO
 A+nQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc7WoY863xnoLbMLpDdwhfUrEWrx44wmk9gHGzg91WYrw/mwfuZAN7u6clHnLly1TIyH9RNU8aiz1ZkQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwHdZrGoW7ibDqlSU4Abypov9LEALiIiTvdgPNJH+MzmOBhXaLi
 TpgFVxFbfHyjTaZuOb+QfzVefWEJyKtUDH85kYaorXIFtV364kBt/TC46uOvB1onSBaWcN2T4O2
 btmsT0zFO10EpwfH7M2EptcCLRYETMvKLWgWVDA==
X-Google-Smtp-Source: AGHT+IGNM4TYAOHuoUTcKkN3riSvNQrGUI2BitGMjHxjJ9ZNHlb/Bci2C7h3R3BXPLmrz9pSyztWUOGUMtDmtzwbabk=
X-Received: by 2002:a05:6512:3da8:b0:535:6baa:8c5d with SMTP id
 2adb3069b0e04-53b348cbb72mr418498e87.20.1729889844751; Fri, 25 Oct 2024
 13:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20241017-arm-kasan-vmalloc-crash-v3-0-d2a34cd5b663@linaro.org>
 <20241017-arm-kasan-vmalloc-crash-v3-1-d2a34cd5b663@linaro.org>
 <69f71ac8-4ba6-46ed-b2ab-e575dcada47b@foss.st.com>
 <CACRpkdYvgZj1R4gAmzFhf4GmFOxZXhpHVTOio+hVP52OBAJP0A@mail.gmail.com>
 <46336aba-e7dd-49dd-aa1c-c5f765006e3c@foss.st.com>
 <CACRpkdY2=qdY_0GA1gB03yHODPEvxum+4YBjzsXRVnhLaf++6Q@mail.gmail.com>
 <f3856158-10e6-4ee8-b4d5-b7f2fe6d1097@foss.st.com>
 <CACRpkdZa5x6NvUg0kU6F0+HaFhKhVswvK2WaaCSBx3-JCVFcag@mail.gmail.com>
In-Reply-To: <CACRpkdZa5x6NvUg0kU6F0+HaFhKhVswvK2WaaCSBx3-JCVFcag@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Oct 2024 22:57:12 +0200
Message-ID: <CACRpkdYtG3ObRCghte2D0UgeZxkOC6oEUg39uRs+Z0nXiPhUTA@mail.gmail.com>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kees Cook <kees@kernel.org>, Mark Brown <broonie@kernel.org>,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 1/2] ARM: ioremap: Sync PGDs for
	VMALLOC shadow
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

[Me]
> What happens if you just
>
> git checkout b6506981f880^
>
> And build and boot that? It's just running the commit right before the
> unwinding patch.

Another thing you can test is to disable vmap:ed stacks and see
what happens. (General architecture-dependent options uncheck
"Use a virtually-mapped stack".)

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
