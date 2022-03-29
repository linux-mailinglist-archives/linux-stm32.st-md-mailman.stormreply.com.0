Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A29F4EAA07
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 11:04:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 116C1C5EC47;
	Tue, 29 Mar 2022 09:04:28 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E693C5A4FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 09:04:26 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id p25so13526673qkj.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 02:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7LLXUdiKn5zGolda6p6nU0L90Q8R5gkNG4kyWBHOgl4=;
 b=q3/+tdY3J9aAuvu9noFP+S+KsNpiNDh+U+QtS9+G5QkeLxoitdWa1wnsiVYvtPPQZN
 th9F1yi51vf27xogHQiTbgX2/GrE/+FRpXiim+quLTwnJZvlTB4330QXduawd8u67M4v
 /fgbYXB6N9aunHVfoXLfaTr5dtVLZ3EAHkLnDeWutnv+7xufn8ft7yJ5JXx8e2kJnrlf
 XTftH4Ksn/HPUPtiY+4bFpshpsJWKjNjhchafuXY9iVNrRVWWx9U1VKr8Vty5CrNwZ6Y
 13kaHH6pHZyJx9of+2RWqw9To6uT+pvSG8dU1Cnvk+qvjuI1dMTV9mHV+3vmw4F7TwLs
 scLA==
X-Gm-Message-State: AOAM533T1TJosf2w5ySmZWUuuFQFzt9C0pJ1xAis8+iJDd9EGylyvhrk
 acyrBS4bP5D6a6LUtMuV1xx9jubTyWkpMg==
X-Google-Smtp-Source: ABdhPJx8QWKbd+zhAdHLq1sN8zNT9TzLIAeYiR5dHCBXZn1QtOLkMzYIgkPYIOjvg6luyGwMsEG2kw==
X-Received: by 2002:a05:620a:44d6:b0:67b:2dd0:3d19 with SMTP id
 y22-20020a05620a44d600b0067b2dd03d19mr19313155qkp.341.1648544664762; 
 Tue, 29 Mar 2022 02:04:24 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 d13-20020a05622a15cd00b002e1df990d01sm15065213qty.71.2022.03.29.02.04.23
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 02:04:24 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-2ea1b9b3813so70801527b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 02:04:23 -0700 (PDT)
X-Received: by 2002:a81:24d6:0:b0:2e5:b253:f9fc with SMTP id
 k205-20020a8124d6000000b002e5b253f9fcmr30366724ywk.438.1648544663596; Tue, 29
 Mar 2022 02:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
 <YkK691VG6ON/6Ysn@atomide.com>
In-Reply-To: <YkK691VG6ON/6Ysn@atomide.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Mar 2022 11:04:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDDNTgBdJTa8+H1H5v1gAarp07xxWu_E1JL8mXS8HPMg@mail.gmail.com>
Message-ID: <CAMuHMdXDDNTgBdJTa8+H1H5v1gAarp07xxWu_E1JL8mXS8HPMg@mail.gmail.com>
To: Tony Lindgren <tony@atomide.com>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 openbmc@lists.ozlabs.org, Daniel Palmer <daniel@0x0f.com>,
 linux-arm-kernel@axis.com,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-sunxi@lists.linux.dev, DTML <devicetree@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ansuel Smith <ansuelsmth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

Hi Tony,

On Tue, Mar 29, 2022 at 10:03 AM Tony Lindgren <tony@atomide.com> wrote:
> * Daniel Palmer <daniel@0x0f.com> [220328 08:53]:
> > On Mon, 28 Mar 2022 at 09:09, Ansuel Smith <ansuelsmth@gmail.com> wrote:
> > > as the title say, the intention of this ""series"" is to finally categorize
> > > the ARM dts directory in subdirectory for each oem.
> >
> > While I agree with this change and think it's for the good (browsing
> > the ARM dts directory at the moment is frustrating..) I think
> > buildroot and others need to be told about this as it'll potentially
> > break their kernel build scripting for ARM and probably messes up the
> > configs they have for existing boards.
>
> Yeah.. And ideally this would be done in smaller steps as these will
> conflict with all the other pending patches.
>
> For example, I have a pile of pending omap clock clean-up dts patches
> posted and tested waiting for v5.19-rc1 to apply. I'd rather not start
> redoing or fixing up the patches with sed :)

Git merge/rebase/cherry-pick should handle renames fine?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
