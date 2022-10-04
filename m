Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E50415F3E89
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Oct 2022 10:39:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB312C6334A;
	Tue,  4 Oct 2022 08:39:38 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF85EC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Oct 2022 08:39:36 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id m3so17853680eda.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Oct 2022 01:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=HbvqDIX9oo5aR0rinPIfG6EwFnlRQIrCG7ZrPltM9Lc=;
 b=YAs5f7a+SVYZc9jo8gHqFvK+zMAcuYKbZ6KbzjlYuTtej3dIzWVWltJrj5VeLGn40Y
 npUP2fYler+Us5soUgncvbdFOV4uzWQNEthG7jf5KUb5W3XE4kY6vJgm/GmJqsUvFmwI
 69pGxMQukCibbJDelCfI+Sz+CNMiYEiKCBAPWk+YufDyUXnlvTKUh2NciYAItEvJYErl
 IpKIm8RRsxsditVTjLzUPqDWnnT3Ln1xsScopy3oGYucptMzQCgI5C0QqL3GmvBmjbsR
 W8rmGRBq6Yga0Di0dG3rLTH8/qymjpGbP9LJYN9lFevnikzYVZXxNL4QYKGXwfQJUDvh
 ZAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=HbvqDIX9oo5aR0rinPIfG6EwFnlRQIrCG7ZrPltM9Lc=;
 b=JbN8IRNy5cJhoIKl+K2P1NthxKy0C2CeCgL6m7SNqGdcjXobWb+6nsLnn81dUVUegB
 TrxA8cTcl2+XSksSlHvNzzeWvJC3Sncb+CScLfGMG3gsm8w9hkhqGJNhC4Va/o8lX3ov
 p2QeO4AfgkuaQitWFvF6yGmH+YS8S0n5CBPxwnFqqBLkhvV2bokTG1Gdy8U8evVHaINL
 q81gakDvaAtt3uop1WJPPhgnp9DCkBi9oDk1k0V3mYjT3n78sYyl9RwfMunppV6r08FI
 6dXBmoBuwilaSTJy5iaP0Vxd34p+gkjfPWhyBEcBfDZ/erTYcAcac4jXXQCsf1cwKKpG
 gaZg==
X-Gm-Message-State: ACrzQf16HOfkFQH5GIGNcbe84cFEklnxi8mCrbG5G73RbAu4vvC2F82S
 yy+FBzmzYJHaLsUzLlIZBzf0rOt5PPmjx+eVMjlDxg==
X-Google-Smtp-Source: AMsMyM7XXeeiChPOkjYqU2QYAwJ1IPbhN43xb08pBTsk70xy7+i7k8gBIK0PAYwLijPvm5c4tRwxEQ8g8/lBrKmdxEw=
X-Received: by 2002:aa7:c050:0:b0:453:4427:a947 with SMTP id
 k16-20020aa7c050000000b004534427a947mr22460271edo.172.1664872776414; Tue, 04
 Oct 2022 01:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220926204752.381798-1-marex@denx.de>
In-Reply-To: <20220926204752.381798-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Oct 2022 10:39:25 +0200
Message-ID: <CACRpkdZq+dirXNxALS9mtCaZqNUFD=FgSRzR3GNr7rpG23kW2g@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: st,
 stm32: Document interrupt-controller property
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

On Mon, Sep 26, 2022 at 10:47 PM Marek Vasut <marex@denx.de> wrote:

> Document interrupt-controller property and its interrupt-cells.
> This fixes dtbs_check warnings when building current Linux DTs:
>
> "
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: pinctrl@50002000: gpio@5000a000: '#interrupt-cells', 'interrupt-controller' do not match any of the regexes: 'pinctrl-[0-9]+'
> "
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Patch applied.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
