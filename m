Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B3E1BBE26
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Apr 2020 14:49:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57A3AC36B0C;
	Tue, 28 Apr 2020 12:49:51 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9061FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 12:49:49 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id y3so1157061lfy.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 05:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UL/TVs62faF1qHVs/iiuWvqOrsmLsKHyIOog76Ui4vY=;
 b=VVzJkCiuPUgRSo5KUL+WQU5C4r/qwXnkA0/rH3dMnEHBm1e4tgddRH1V/HnB6F5iGK
 6ib22DEAlDbVPG7vXaKfYvHPpXUXg82m/Jl5PNK6yT1oufMeKGeZFqkHKGUG+OQes4IP
 agBRex/tDRgpxy4wUHqJpz1gj+GMHf093SEeP83nm1BXRcMi6+dHfhlG0KcAGHG5r7A/
 wTcuVPeQX1gFZ1n/iZb2/PqbErlG8zUwuEvEKct2LiiC99fi947KLNDpuypP+2ZWrz0m
 NLqhkYR/CKdvqtvHlxp7gVzsJ5fRCBYFmBwEjITSas4Z3RbVgfHXBUykZr4mT9O7fFTd
 7M/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UL/TVs62faF1qHVs/iiuWvqOrsmLsKHyIOog76Ui4vY=;
 b=A9Agdos16P/AjQYibDSKNgeDcFMbGFFPVScADJ0VTHEV8Dtb7dujLvvcbnW5QYGofK
 fbKin//1N4XSgUIur5ksdVxuKbu6xw/zk0s3SRj2JEZ1KKkQyF5O5OATB4EoaSmgirjm
 xGL+3tMgCf92L3MZyq/1rHbiUQxMtuYalGWBT9ScpmNj8Z/gQNn6jkYZVxLpBIJFOtdb
 WwH1azqMJnNSUhewj53lmK4nkYuf+iJLBG7Obsn30AvxKdi3BhasbNnYTknbLgsVF1O5
 Jvj/TMVTXw17rLhRX41iFlVwiUCun39aXrFN3SLLSvtB7uxTCqHfQ/+uufUpTetnfmPk
 xIYg==
X-Gm-Message-State: AGi0PuZZG1S+YUdFDe/oZGfEqSYA3xUP5er5svGPSBGiy65SX7vo9gb3
 ejDT+IGdW+ekmtVSnkLHYc06bjG+YCqcpjbdcfAvVQ==
X-Google-Smtp-Source: APiQypJYIQJ85qOD1cwJ8t3Ko6n/QlAkuFT5C5YrkLuzUTtDUSKQTsPmMdAaXkYcqBPYL//zz5+kD6YQtD4IfGvW0B4=
X-Received: by 2002:a05:6512:685:: with SMTP id
 t5mr19029129lfe.47.1588078188674; 
 Tue, 28 Apr 2020 05:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200422072513.8352-1-amelie.delaunay@st.com>
In-Reply-To: <20200422072513.8352-1-amelie.delaunay@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Apr 2020 14:49:37 +0200
Message-ID: <CACRpkdaG8PPA13gMXMS62Fow7De5vDaG=gZ+HAEx6yhpOH0sTw@mail.gmail.com>
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/1] pinctrl: stmfx: stmfx_pinconf_set
 doesn't require to get direction anymore
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

On Wed, Apr 22, 2020 at 9:26 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:

> Pin direction is not used to set pin configuration.
>
> Fixes: a502b343ebd0 ("pinctrl: stmfx: update pinconf settings")
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Patch applied.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
