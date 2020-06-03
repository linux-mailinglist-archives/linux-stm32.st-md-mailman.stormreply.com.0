Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAC41ECF7E
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jun 2020 14:11:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC21DC36B21;
	Wed,  3 Jun 2020 12:11:11 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFB23C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jun 2020 12:11:10 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id y11so758220ljm.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jun 2020 05:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YfIwoVqhINbM8JX02JQVBFl5UwDmm1K0R0OAHvfku4E=;
 b=aWqv3ou5Qov3U3msHumGanAGhQDq5piVnxaH/XWJmipKJsOeWVNQIztptBeNCtMWG6
 99b3l7r9pG46qUjWpv+WoQs+yVkeYL+OHYfJzjhbwlgDHanfANKMk5J6k2xrDF0jApcs
 ITr+QKkVRhH2NduIS0rGnMoa1juq/PSUMUe+/Vobm+ot+3yv1cd8yFBR8RpnGpZzbD/i
 KGvscj/DzzzJcfsZ/B2RW2XxwxgRgDyru1kGkFLZGIOB4klILxvqMmjRjUexshZjeou7
 IWTl2Oef6qF/8FD3/+nq6Ege6qhULB4qLz6/BgG3qQflgRe1nkZ+ZiOB0fEUutqZ2TNb
 CrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YfIwoVqhINbM8JX02JQVBFl5UwDmm1K0R0OAHvfku4E=;
 b=beEr+uD0HKyp4zE9VETXnO9qdwRl5/BF7dxpoEqJa19n7s9nRpCoG5jn7G5YNbbx8L
 UpALTy3Mm0DrtaDejRBMGGp4xxRL5v8lpAAcL63kZ7RMtwmYW4lFhIIjr2N/DDupcflb
 rEuzSE8Bmmkv08nuUIvTKPlGJ91ErvriaE8au+2zJ8V8XyDyvlGjqQi3rko/VlVACqiz
 Ycjy8j4XkGU847uaePOva9CKaHfKPGQVaO9fszW2d5jAzNKSshBZj4cpCuB9VNJzPMXN
 ewOJjW28IbtUxCnRKVfM5G4lePcClH6Jk/TPrA1f2tNMvOWVBVsX/NnMlldd95IrgF4g
 P/SQ==
X-Gm-Message-State: AOAM533zz7O0sit9U/GkOuqYQA/d0N9MA0i26lo6UYbBCppZNMigYXyR
 LhGmqNTumy16LL5iFHbSorHmzwrKANXKN00ZFvznuQ==
X-Google-Smtp-Source: ABdhPJwGPqax4Ku+Y+HnI5jIvzA/eJkmp5Pc0XM9c3bmnH0a+2++YRcBgL324sT+NutIXiJsU51+xCLtJmEUSqS/sw4=
X-Received: by 2002:a05:651c:112e:: with SMTP id
 e14mr1798631ljo.338.1591186270117; 
 Wed, 03 Jun 2020 05:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200513145935.22493-1-benjamin.gaignard@st.com>
 <20200513145935.22493-15-benjamin.gaignard@st.com>
In-Reply-To: <20200513145935.22493-15-benjamin.gaignard@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Jun 2020 14:10:59 +0200
Message-ID: <CACRpkdYu2As27M60ogUoLfX1z=XZSCSx5qTLwm5ADdf9Jy7HGQ@mail.gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 linux-usb <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 14/15] dt-bindings: pinctrl: stm32: Add
	missing interrupts property
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

On Wed, May 13, 2020 at 5:00 PM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:

> Driver use interrupt-parent field so update the bindings to allow it.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>

Patch applied.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
