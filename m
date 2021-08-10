Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 841D63E5A47
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Aug 2021 14:45:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18261C57B51;
	Tue, 10 Aug 2021 12:45:27 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF6EBC424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Aug 2021 12:45:23 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id z20so4090727lfd.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Aug 2021 05:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p4fA30UmsVxbBBxabVfhDHH9C11jyZ20WTjP74m8fKs=;
 b=AK4sZ/xcdeynrPd0HoK9VrAa56Ppasl+7IUeUdRIyd53PKhm+G8CK7yd7RM6qm1FWQ
 P0hhWbl16qzyOVC4C6rQL1+y16s2AcqBp2R5QtNa7Nu6fydfvjHSLTGayNX4sfGsstN9
 Fca8gk6BV0uI2mBMqNl+iWBzxDsoHR4UFVNmOL8C8tPhfyCH1vMuUbbfgKACeSTBUjtF
 hU17EbETZFHmolBSxIXzAdEqfW2II7k+6rwdazTQI8WOQO5Ivc1sJpL2csNDHLEO4/q5
 B5ohuZng+tP1eArePVamNoCUkNl/A+ql27xsXujzS0v+50Vf9ehPBjNWwyUgSLBIce+5
 DFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p4fA30UmsVxbBBxabVfhDHH9C11jyZ20WTjP74m8fKs=;
 b=eT0pYsT/4+fVZSFlx13fJNQvq/uFJjJCdNIZFXSTWz+4ivgn4pOBzlRzthKJzMtbQB
 n42bWc58lko/L3PuWqfYffYM8vLeyyO9IaK+7JPv3tqrodi6i7w2QDNbFdXMrwQ1uD0b
 vb3mC7eap2G83i7YLRGwTS6wPVTfcAAB1CfZOJRfqeGC01S4zbkE4eFRoDq539RGOhhc
 Bj7OT/GNg372MkQN0B8umqat0pj3GWsPRX6/hFwB45ssiT54HqD8XlFK1pwdBOXpFqcq
 eQ1lf9219QzsB9gQetoHpJRxRwQ/vEKxWZzf6URchm5Ogya3zDbgwPuPgkRwdrHyvt5k
 BvDQ==
X-Gm-Message-State: AOAM531vsk7NlnpSzhwuHDIjjLoRk34QwhbEnjDGPUZf7TeWTzXHSi56
 XddpvaPql/Bk1EmJ1574VoW9Nw5ksll4MuCWbgeeGQ==
X-Google-Smtp-Source: ABdhPJxdOTFsL9Ec9pZR+uNkqzgGHrc7A/wQl1VbkWLUWhvC904yI+SM3mADlRMM+ZuroqFnn+tC+w5vpOPhWgdRecw=
X-Received: by 2002:a19:ac04:: with SMTP id g4mr5316722lfc.29.1628599523238;
 Tue, 10 Aug 2021 05:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
 <20210723132810.25728-2-alexandre.torgue@foss.st.com>
In-Reply-To: <20210723132810.25728-2-alexandre.torgue@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Aug 2021 14:45:12 +0200
Message-ID: <CACRpkdZKU7zA-SiV8n=wtaD1iqYMUocncvQB6NdAmYSn4xN7LA@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olof Johansson <olof@lixom.net>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/7] dt-bindings: pinctrl: stm32: add new
 compatible for STM32MP135 SoC
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

On Fri, Jul 23, 2021 at 3:28 PM Alexandre Torgue
<alexandre.torgue@foss.st.com> wrote:

> New compatible to manage ball out and pin muxing of STM32MP135 SoC.
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

Patch applied!

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
