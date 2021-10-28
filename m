Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA7543D82E
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Oct 2021 02:37:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FAE0C5E2B2;
	Thu, 28 Oct 2021 00:37:58 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03FECC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Oct 2021 00:37:56 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id u5so7633668ljo.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Oct 2021 17:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HXqQCOpu8CLs50biqo5RLezrlhQ8rX/+z0HIytvSHFM=;
 b=UhWGxxDdtCvXQwuNGh/a6PTbTGzqmTdtJP2QgW3p1BbODTe01LeoGLpCVYRfMEvgfZ
 zf+1bv8i/zdKEYSO7QB5AgKWE23OD9M5NsvGwloOHT+TjpWrmj2UUWKha3UuaX8Ma7dj
 IsgaxLb+4N+Gzvyu8Ml9v7noz3vbKBQ/ZrK6iepE13fvp4fmeUTMITFZh7lWoz9wq/o7
 c6I7sOLWUr20sB9MA+ZvPidide7Pdu7VXZqvg8H/hw2lHHI9ZN6NKf7Nd78FW/UjMFfJ
 lgMzt2KZ3QU2kXkqaCxn+MHYhTr09+QMpk+uBSJfoJ/wTEnRomt2s3APDYlHM9za08Sj
 1QhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HXqQCOpu8CLs50biqo5RLezrlhQ8rX/+z0HIytvSHFM=;
 b=OVgdYnCDvHEJWxmdEqlEdgUvW0e2CR4thxkGj1cKd+OKSdCGA1JBlA7ib61MY+orrA
 75DCbXjLu65+k3/keoFZczz9BlyIpGbHbnlNG9qD5PS4VbowSfiFMI+rvQTbLYRoLO46
 cZgosIzDNs8Sn5eNn4KRqq2dnjOmgLTw4U5bC9qNFGWBr8S1OtZk/h8Xed3cd3f92/3c
 DMCe1Ql0KE1lIxZDZaZAjjrUjITzy/Aa1WXAHrq2cDqlP6SIDxzQ+z7741ya7r4lF/1t
 KIzvybxyCgfDpCmdW+ds6N832Oiecg4RSC0IxnNKBQxtXTXDdZRwPBq3WSsrnYA5b6oJ
 YNOg==
X-Gm-Message-State: AOAM532j4HTwZq19nmhwTQXCXFhKbUgJVeNnywJhGHHa7hbryYOuJ8Wn
 OSf+5WBwVqIMhjWCzbEcLd3zpwnWdMewkqDjXcEvEA==
X-Google-Smtp-Source: ABdhPJx/ZkBhi3dKE5KGYKnhgUSSycuYqcE4KP0Jbz2tVS2/1+povo5De6IlVJi8gu+smbo2PnhqZs781+xvQgBaJY0=
X-Received: by 2002:a2e:8ed9:: with SMTP id e25mr1240733ljl.358.1635381475650; 
 Wed, 27 Oct 2021 17:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211027082155.206449-1-francesco.dolcini@toradex.com>
In-Reply-To: <20211027082155.206449-1-francesco.dolcini@toradex.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Oct 2021 02:37:43 +0200
Message-ID: <CACRpkdY95RSDbNm5rMtSZmbDW9=+KtY7dAfA8PGarmQ-CF6dnQ@mail.gmail.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: marcel.ziswiler@toradex.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stmpe: Support disabling
	sub-functions
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

On Wed, Oct 27, 2021 at 10:23 AM Francesco Dolcini
<francesco.dolcini@toradex.com> wrote:

> From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
>
> Add support of sub-functions disabling. It allows one to define
> an stmpe sub-function device in devicetree, but keep it disabled.
>
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Cc: Oleksandr Suvorov <oleksandr.suvorov@foundries.io>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Looks helpful.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
