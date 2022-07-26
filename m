Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7C9580E0B
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Jul 2022 09:40:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B576C640EF;
	Tue, 26 Jul 2022 07:40:50 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E6D6C035BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jul 2022 07:40:48 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id o13so1768789edc.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jul 2022 00:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T9AkE22NC0dR2ypursI2fN61qW/1wSf5rUvH6q53xFE=;
 b=ge7laRItcMaYz8CbVUmxu6fySWP6WV1vCNqQjPey7pCqpDVmXSL/OKsjz2cyQR0AZB
 MJGMng4U2M+FPryqWHApgaW+gVXE00zgoy2GtuaysBpIJC1AIHHBCAtAsyqKW02GIJaz
 StxWUCuuCnpCJkR9fp42qXCLB70UdwMTqQZU98XHIljorRNAn/RwBWrLhy0Zhqz0tlng
 a8dOSU7fFBjc7T/ut6wAkgbfOiEvp5bd+vEANLcBbfEjzwjoaf0bNkzLjiESwvhtL6gT
 o1NwdOhjDA05V3grNzlr4IbrNcISLiYuHF0fGau8O1dH2RDVQzDWRYpMkY4PIfuVgnuD
 Tmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T9AkE22NC0dR2ypursI2fN61qW/1wSf5rUvH6q53xFE=;
 b=G/Txy5Lpev5QQNDMYvPyURPAL1n15swDAGC+FUX298Njprs2i/Ch/UI/einAkeEw/b
 xdzl/d6bNfbH3tj8L3/4xSSKHQUovk76/otYmKCu5mxnRApSzlIl47ETiwaKiYMDImJy
 KOkJFimV0S4t3PcDyIEembH1Ku4ozhWJ5TSze+HYaV+C+Pfm5DcNo/IXzArU7N/LR1t+
 sTArbszhHNbrIKesCfFc+dfCowCao+19k9X+WtiB2zPAx4Irc5lgDzy9qQRnIrOzkyJj
 UmFa8J1VXld9YTiiw4mKJ8hbX5nbhbmxRK+5YEhx7HNJdztyJEpufMYxq/J/HlF/KdWB
 zB5g==
X-Gm-Message-State: AJIora8Cf9SsfLepnw0hyVxnovYKtrfU81KFglNupt6vk1M/S09lpuGq
 BAiW0Y5/1uNp4cRKtKNmQSjoKlZytWBvgqnaaLvkJg==
X-Google-Smtp-Source: AGRyM1vwZzhnBcWkZffdETCQmqtRoad3oPyepW/LJhXmMjspkJKij3hGNnPFM101r9JRUaT57ut9pk6wGB+tFiiLJ38=
X-Received: by 2002:a05:6402:2696:b0:43b:eb8b:d0da with SMTP id
 w22-20020a056402269600b0043beb8bd0damr10704544edd.158.1658821247900; Tue, 26
 Jul 2022 00:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220719214955.1875020-1-robh@kernel.org>
In-Reply-To: <20220719214955.1875020-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Jul 2022 09:40:36 +0200
Message-ID: <CACRpkda+pLvw1AUxERdVaXooH0VFtSHAj6qJ97H4JKx0p1MdkA@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: st,
	stm32: Correct 'resets' property name
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

On Tue, Jul 19, 2022 at 11:50 PM Rob Herring <robh@kernel.org> wrote:

> The correct property name for the reset binding is 'resets', not 'reset'.
> Assuming actual users are correct, this error didn't show up due to
> missing 'additionalProperties: false'. Fix the name and add missing
> 'additionalProperties'.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied, thanks for hashing out this mess!

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
