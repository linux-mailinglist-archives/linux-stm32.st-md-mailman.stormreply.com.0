Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8BD3E5A4D
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Aug 2021 14:46:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35E0DC57B51;
	Tue, 10 Aug 2021 12:46:05 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CAF4C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Aug 2021 12:46:04 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id n6so15604445ljp.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Aug 2021 05:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DHQEcn/L096FZeElaexXhPEBfdCO+soqV1fEHutjPfc=;
 b=pVCY8pXO8WZx60AuIWSpSjnrcNn+QdvfI24iCIcoeKiyqzYL01tnKGNifhcSVirEx5
 7vh/G2qT+6K3GKYp1q7HMmh5N6KlRb3uar6xoKqYDMvgdXnR5HbYktcemK1Y0ShEOqpm
 H+aMr+oDEE/A2vPtYnC3GD2aRu/O2HkQdTuEQ0ywmhtGNPAi6T2ILQkTZ3HwCv/RsJn2
 pOrdSEVptFsrNuQ34mdGGx8cQBvY4eCGerDZUcGMQ9ZpH4GEdgvm1IztsvM8Ejf+xnob
 LDGd6Xkt+8WLzcQ91LGk2sW9tFP3+zHZCgfp5fhBvcuxHxtM5z4d7PYhtH9l79yR4vRp
 9V+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DHQEcn/L096FZeElaexXhPEBfdCO+soqV1fEHutjPfc=;
 b=PkG6mAGRFbv2uusoZ5cP3iquzolfVKSZtmuP4MzBspzJ+9G7yNPv/xphtCax94Wqxr
 DvSWLmPx5u1u4UPQvDSsZhdbQhhb8w9KmQ4hWPVR7va3FM6n23C89q34s+XQdYoO/WX8
 1cNvKPWj4C6R9PoGPN7UFODA+gmBUjumo4bL58MZ+HCXeazwKqm3Fmy8/ojbKYx6rIC0
 GczEMBBe9Sbr/8fQnNUtCbfJRB4QdKWSob5ihKlF8Fc6aRxielBnpnqoNLo0Vc9pfbr1
 DBQ8Y8Bp7qtNInNfmgcQiwUt+OGWpVCBgtkSGi/0h+MawDka4izHBmmjv3FcXMseF2u0
 DXDA==
X-Gm-Message-State: AOAM531fjxARkMXrx5VdRb8lacmatzZ5uYkMg1VZaEqLpKN/sdEYAwPY
 vYwKOh/mYQv1f0m/0zlTdgTp/DO1Kvfwlzo+QpTZ/Q==
X-Google-Smtp-Source: ABdhPJx17ikL8rd0Vw6gtWQ3wKu8CkLkaqj4zrGseAsmSHW46dcdTBrLGmh9BIf/ZKcRCwT80y6mnZJMPToeK/DUAjM=
X-Received: by 2002:a2e:b819:: with SMTP id u25mr19278050ljo.438.1628599563886; 
 Tue, 10 Aug 2021 05:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
 <20210723132810.25728-3-alexandre.torgue@foss.st.com>
In-Reply-To: <20210723132810.25728-3-alexandre.torgue@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Aug 2021 14:45:52 +0200
Message-ID: <CACRpkdb2Wvr510Oc-cbN4GHaNBoMvnobB6dUJiCMg=vo3SeTMA@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 2/7] pinctrl: stm32: Add STM32MP135 SoC
	support
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

> STM32MP135 SoC embeds 9 GPIO banks of 16 gpios each. Those GPIO
> banks contain same features as STM32MP157 GPIO banks except that
> each GPIO line of the STM32MP135 can be secured.
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

Patch applied!

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
