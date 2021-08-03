Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FB53DF683
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Aug 2021 22:41:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B49C9C5A4D3;
	Tue,  3 Aug 2021 20:41:20 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1C7AC5A4D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Aug 2021 20:41:19 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id gs8so379581ejc.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Aug 2021 13:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=muiFGHEiWM25TrMqBdRhYVOUT+BYpoCINhQGE9kEJ74=;
 b=MNlRcuGihDn3+Z15IGGZ551Y9IzqTYJz2RsPB/18HciIbgAh7DS4vs5qgpQzNuSd2+
 ZpzYlPq46RynZktqAvy2nZr+szds0M2MjV0g0++EgJgbFGgO3o68oLUnamcJJjZCzNut
 Yhq71OtVAfqNPzQmyEiV4kcaMF3h5ziwHE/c26ts1OlDE2LaJ8ZAFZ8kZW8QLsUeosqp
 WmmwPWnUiY1CbLZASkGIch1ltlXeQ/Z4rPTg3EiaQnUZdcZMRoaPTmN9jCnZw1FuTHSS
 dAY6evOYP7jawMRXnFBSTVvJC2GGYJen+gZUsPlHFQSmBbohMAesGlkHOnceCuQBpCGs
 nXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=muiFGHEiWM25TrMqBdRhYVOUT+BYpoCINhQGE9kEJ74=;
 b=lPZ2Q2V4J68QNdqEnM0iBao2fCb4cQonXfMCoa5CqrDwNIVfV5HM9lERSWs0NxaZrh
 +LL9/A3KfYYi2pnJSKrLQbwBkSVNePQldmEpJCT2nLpbU0dtwSWsRiUyJYVQ50Ac+oXZ
 bcHdhl9WAxB2woF3GamxqA+PoXRl99JjDjm13XHZnAVJstjf1k7h+Uo6Os2OmTTjLfK5
 imXSBUcjVGhlPphyYtOzC2kLrZ4oD8AxfsSBQAyn118qioUo+s4mcE5wUgZLOjsql0sQ
 lOefuhM+jIoiwbDCnPZLgT0Awgmr01cD5AcU7VLgpL60TsUFw+Pi0VBzqK54qkc7+4O1
 c/AQ==
X-Gm-Message-State: AOAM530NG/EGSMuptYQ9Xw+L9cGgozp9Y860B8lOA9dez47c9S47fWx6
 5JNHHMrRGD+M6sl5rIkSzZMCdmE0s05SZuR+ymg=
X-Google-Smtp-Source: ABdhPJxC90iBtIQJh6nPIWU8pSAop+ICxI60kaovcWNRh3ZFPKMATs9wV8MtyZ5+vdEpGw66BuARlVTc44++ww1Ejkc=
X-Received: by 2002:a17:906:b0c5:: with SMTP id
 bk5mr22129214ejb.428.1628023278980; 
 Tue, 03 Aug 2021 13:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210729201100.3994-1-linux.amoon@gmail.com>
In-Reply-To: <20210729201100.3994-1-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 3 Aug 2021 22:41:08 +0200
Message-ID: <CAFBinCAPP7J-B53FCrY50oF9ttsOkkknG1NhBbL8BYZVPdkJSA@mail.gmail.com>
To: Anand Moon <linux.amoon@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-kernel@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCHv1 0/3] Add Reset controller to Ethernet PHY
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

Hi Anand,

On Thu, Jul 29, 2021 at 10:11 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> It is being observed some time the Ethernet interface
> will not send / recive any packet after reboot.
>
> Earlier I had submitted Ethernet reset ID patch
> but it did not resolve it issue much, Adding new
> reset controller of the Ethernet PHY for Amlogic SoC
> could help resolve the issue.
nowhere in this series you are addressing the issue from [0]
Some more comments in the individual patch


Best regards,
Martin


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm64/boot/dts/amlogic?id=19f6fe976a61f9afc289b062b7ef67f99b72e7b9
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
