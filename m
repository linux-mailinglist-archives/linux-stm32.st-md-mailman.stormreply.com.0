Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D79447688E
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 04:15:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54D27C5E2C5;
	Thu, 16 Dec 2021 03:15:59 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 701F3C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 03:15:58 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id q25so34641146oiw.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 19:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/vd1l1da4L+56BdRKicFSLYhUH5s+2oK991AO1O0D3Q=;
 b=Moen/dDt2GL4Pm5rmYm0JJ3sp/Do+Jim7fbwzHPF2v5FUXZoyBZgT3fc0Ow5Z53o2G
 g8fg9wXMeZ1KhGqFOYfscFqPiLypIfavXYMHRX7bVFWbzdpqXNP92nzQqZsRze/mGdCb
 bMaXmFx4Syr7qlY+dSUDNSHfXg11kCN1uRmjxX/dwrMITGBCUxH+KFbVGQ3ZkYnezKaT
 BrPQmJZ9C9e4cMzG+mCxOQqzzruQUlCtJ63XomrZ6AyAuohoBjw36jOHGrzwUkoMJ+dz
 YlEXnFLr0KFmlh9PkhLFtdesYi5Xq1GmiywP5rXHeofRYMmJ5iwiz6wy98eWBjoKUlN7
 hmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/vd1l1da4L+56BdRKicFSLYhUH5s+2oK991AO1O0D3Q=;
 b=113BBAkxrhJPZvm/M16NlJty8+Cx2gfYERLqiwa2uLSmvWWH5MYETcYKk5CrCaOsgo
 kZjtZ+58ENVTLc5RP3Ja7xV/xdZWvl6Wn7aFPEwiXkh1e0K3jAeI4iOZIi77NliJ5ZiR
 M323GBfxeLvRh/bJi6r4sr2xaOp4Zfc9KtVCbPNp747RZWLbgOWkDzPl7P+AB3vTCOTz
 MWgSXPsVbykLEMfsUiQQsxZOcshI0NOxyKQBrkasLWdUfbwLZsRLUveCbG2fTllTDAAv
 GU4tXyKieIcOKxdW7Z02TWOZav/SVLO/9pWlATLpeh12EQl/glimgkmGFLTpnMNBpykk
 FihA==
X-Gm-Message-State: AOAM5338J7NMQAx6BsquvM48hRGeNaNZEliqjb8i4JRnzaZbnP5AYznK
 dl8+ITBaAew+nFTDh3OvFQSvP8s2Q9l4YHyBLhmhyA==
X-Google-Smtp-Source: ABdhPJwoPFQNRTk2WxXDFzdGoMtLJK2aSsDgN54l1FfDsqBiFYUMUWemWa48WFy7s+s/gDXbdor2ZgQIn40RGUQvw0U=
X-Received: by 2002:aca:120f:: with SMTP id 15mr2603584ois.132.1639624557318; 
 Wed, 15 Dec 2021 19:15:57 -0800 (PST)
MIME-Version: 1.0
References: <20211215095808.621716-1-fabien.dessenne@foss.st.com>
In-Reply-To: <20211215095808.621716-1-fabien.dessenne@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Dec 2021 04:15:46 +0100
Message-ID: <CACRpkdb4_zm8ywUsDUm=ZMG4jL=t-3gQx1sPEWQaFpBr_rRxGw@mail.gmail.com>
To: Fabien Dessenne <fabien.dessenne@foss.st.com>
Cc: Christoph Fritz <chf.fritz@googlemail.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: consider the GPIO offset
 to expose all the GPIO lines
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

On Wed, Dec 15, 2021 at 10:58 AM Fabien Dessenne
<fabien.dessenne@foss.st.com> wrote:

> Consider the GPIO controller offset (from "gpio-ranges") to compute the
> maximum GPIO line number.
> This fixes an issue where gpio-ranges uses a non-null offset.
>   e.g.: gpio-ranges = <&pinctrl 6 86 10>
>         In that case the last valid GPIO line is not 9 but 15 (6 + 10 - 1)
>
> Fixes: 67e2996f72c7 ("pinctrl: stm32: fix the reported number of GPIO lines per bank")
> Reported-by: Christoph Fritz <chf.fritz@googlemail.com>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

Patch applied for fixes and tagged for stable.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
