Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B1C22B605
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jul 2020 20:47:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB065C36B27;
	Thu, 23 Jul 2020 18:47:24 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6F3DC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jul 2020 18:47:22 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id s189so91724iod.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jul 2020 11:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i26RyORzgcGhTDDr0Yskb0jorGpqOlxgU0nNXEtj6pQ=;
 b=qgVLpYxk5vJuma06OtQAPe9aQ9tEQZtCqrhWUEGb2poYmc917waO4ve8gZ+2gsK4w5
 OEQW7m0eoqCi7WbqBLoyw7d6ZUXXNb/FTTVudun4oFPSDbzrAb8S7yD/p9zjZ/0wLSu4
 HRFetF83/4iGRJFq9rakRw586ArBkMEzXf49fu4OHnPuHb3fvM/DSkikO/dms+AJVT2J
 43l2owtl2CHo+4Zz2D4ZHoJIq+K71+Tgfstfq9A1Q8cF7lSUuvLhxUfIdBQGEe4vA9K3
 D46P6x2Cl/7ktiNeUDqvl5oer7Zv4ZNc4S7NxAnx5ljOtWTQPrlZn459/qyKuN2zjGTU
 kf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i26RyORzgcGhTDDr0Yskb0jorGpqOlxgU0nNXEtj6pQ=;
 b=T0sEYq4aWBumOUrIs9ki+5MwjwUWkklqIYTAeTn/KYWBAOxOS/K+sbI0LoLhTgMUS5
 jOi/lEhQ4CuCSSKIcAvRPh942ZqPGTHSk9fzn3/Jhu22zE35DFHl9W3yqNP/f+aqxpV/
 PvLH5lSXT1J+bgIMVilNuZkRzQ21wZfWn96DDqZdtGALRXdXjM9ZhmovL7LR0UT7nJgT
 WH9gDq8pKe6fKLx9koCb4edhj6vOQNZeyIlkDf3ovSGFt7n91Cpk92MUFYj1cggOKSkv
 Xtr4rDUcGH5ZmtrrA/QXkxFpOO+Y+v8LEv5cE8vcalLY7VvnlwLiJoUOKLIoS2yxYAIx
 xlOw==
X-Gm-Message-State: AOAM530btN8wjM+xO/qO6p7yIwtaJb9ocbJJRBko6hnupxC4H2CVPsEJ
 x9K7OxrMDRziiQOZ2RUzB5Qjs9/AV09+DORxnVs=
X-Google-Smtp-Source: ABdhPJxduA29adOXUyM6/Q9lweE3woxGK3YJquEBfY6GPmJuab33msEmJGBpk0vqAyyH/COvSSFEgGJDUfldHaJP0sA=
X-Received: by 2002:a5d:9c0e:: with SMTP id 14mr6370304ioe.109.1595530041579; 
 Thu, 23 Jul 2020 11:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200721185317.208722-1-marcin.sloniewski@gmail.com>
 <20200721185317.208722-3-marcin.sloniewski@gmail.com>
 <73077407-e008-1ae2-266d-1045a73620ba@st.com>
In-Reply-To: <73077407-e008-1ae2-266d-1045a73620ba@st.com>
From: =?UTF-8?Q?Marcin_S=C5=82oniewski?= <marcin.sloniewski@gmail.com>
Date: Thu, 23 Jul 2020 20:47:09 +0200
Message-ID: <CALa5TyyMxzhwkt_S=xYfYk1MRe2C8DL5Eoeiax0bdxdNm42Hfw@mail.gmail.com>
To: Christophe Kerello <christophe.kerello@st.com>
Cc: Rob Herring <robh@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Lubomir Rintel <lkundrak@v3.sk>, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, allen <allen.chen@ite.com.tw>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/3] ARM: dts: stm32: add initial
 support for stm32mp157-odyssey board
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

Hi Christophe,

> > +     pinctrl-names = "default", "opendrain", "sleep";
> > +     pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
> > +     pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
> > +     pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
> > +     non-removable;
> > +     no-sd;
> > +     no-sdio;
> > +     st,neg-edge;
> > +     bus-width = <4>;
> > +     vmmc-supply = <&v3v3>;
> > +     vqmmc-supply = <&v3v3>;
> > +     mmc-ddr-3_3v;
> > +     status = "okay";
> > +};
>
> Based on the pins muxed, 8 data lines are configured, but the bus width
> is set to 4. What is the reason of not setting this property to 8?

Yes, it was workaround, because sdmmc2 interface was working only
with width set to 4. It turned out there was one wrong pin used in
sdmmc2_d47_pins_a.
It will be fixed in v4.

Regards,
Marcin Sloniewski
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
