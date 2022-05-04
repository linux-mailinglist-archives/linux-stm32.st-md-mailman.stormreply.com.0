Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6945351B195
	for <lists+linux-stm32@lfdr.de>; Thu,  5 May 2022 00:04:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 311EDC6047D;
	Wed,  4 May 2022 22:04:39 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6594DC5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 May 2022 22:04:38 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-2f7c424c66cso30905297b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 May 2022 15:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zqlpLuQfBXsLF0pGTV7F8Lqm0D+MDLdu0OmDcVtwIY4=;
 b=uOk/SO4PYBMT+8q1dA1TD5ptS5xd/kbbzQLYE6iespzhwRZycMKu5S3Qhyiz6F+i+1
 3cOJMgPCVoECy5RD3/Qtqqi0Dgd8cNVtxDpH7cyysA9bWJtaBzWNzqAT35Kh8PpgeUp0
 LEwxjERbI/QnoiGBnKxyEE3BpPH5Cdrf+zKObdobq0SKBeWIaWkut6AZ2IU6fQ/sYQ6c
 nTwHHjF0AO+2SNGg7wY3qPOsZREgDpQwjEuQq+eL8Uzo9fApS54erILmrbEOxlBVyUSs
 NovjMz5MjUjUdq+1l8a+JM44tWm5RCCtn/vOHA36VSTza1cRyofX77vYLvS1C7rEPbK8
 lHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zqlpLuQfBXsLF0pGTV7F8Lqm0D+MDLdu0OmDcVtwIY4=;
 b=q6TkH+xyblYwuSMMli1X0Mua3kcZgFXcyBrRcf9RqiRLI5PBDFZ0xacEh1SwbLN14b
 FgNZGVCT6+tQr0hvlRKDImxlKntfbV/dA764zCU+k6MAOp2Wy3TqZjwyFbaET/Ze+SGo
 7xfFtoGGOE0WxEWdR/9QRh4OgV1jJ3nazMlWGo5FikPdIaXC/lTUYlCFm/+N19h1sMCT
 Ry2mfCWLUjXutGGMHgy0woFFimzQIbkfi5b7mMWmwVljYYEAKB8pjzB+3SsqEcHtihZV
 +HuKn6RwlSLeEGJsRqFeGy7T+vQ9rLfxRABpVFH/QmvyliFuKpCdZVTdy9zsfwvdk1Dm
 elxQ==
X-Gm-Message-State: AOAM530v8JcB9K+Ucy5uOsMSZ//Iqb9b6iLFcIojaurpv782TRRxuoCr
 rKPQKu3OIvYLR4EiEMd8VPemP1eUejZfW4kgpvy3lQ==
X-Google-Smtp-Source: ABdhPJwa3Zp+INs9eIYA3vmkO66opZgtx8fKINwCtGXZ3pcba1YTMqSjlpx5Z4gASQOH6KsNIBd0fjydcV+hsZ93qI4=
X-Received: by 2002:a0d:ddc6:0:b0:2f8:a506:a5c0 with SMTP id
 g189-20020a0dddc6000000b002f8a506a5c0mr22606554ywe.140.1651701877405; Wed, 04
 May 2022 15:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220502153114.283618-1-fabien.dessenne@foss.st.com>
In-Reply-To: <20220502153114.283618-1-fabien.dessenne@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 May 2022 00:04:26 +0200
Message-ID: <CACRpkdZNS4N9q5whUT3fHh6M1xzuWYWGfr_EvRuDePpNP4QPzg@mail.gmail.com>
To: Fabien Dessenne <fabien.dessenne@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: prevent the use of the
	secure protected pins
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

On Mon, May 2, 2022 at 5:31 PM Fabien Dessenne
<fabien.dessenne@foss.st.com> wrote:

> The hardware denies any access from the Linux non-secure world to the
> secure-protected pins. Hence, prevent any driver to request such a pin.
>
> Mark the secure-protected GPIO lines as invalid (.init_valid_mask) and
> prevent the pinmux request / pinconf setting operations.
> Identify the secure pins with "NO ACCESS" in the pinconf sysfs.
>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

Patch applied!

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
