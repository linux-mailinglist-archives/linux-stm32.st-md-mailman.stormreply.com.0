Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BAE57EA2
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37CB1C9A3EB
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:51 +0000 (UTC)
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
 [209.85.221.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36BD7C10CB7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 14:55:51 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id 130so1342888vkn.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 07:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=McASa29lxjZpj0oJ3ZfQEaOaFXbUU/UG3+m1x1GG8co=;
 b=X3xAV4NyA3y9UzA2IA/Mk+qrbdrPKZIojhR+endGbpMJCR38xtZNqJ9k22djG6EF8T
 lgeu4QQxt/tsghp0XWw3YgkSmM36uLQez2tVp4MN+NadgIHC0T2hblyRbSo9szBtCly7
 Wl/mDoc9QOORA8aKlSOXdTAQ2mVhqtKyuShPZOn9t5BGSWAGAHhGSbwIAFb5WEVoeR7E
 kP+EjwXcBAkzjawd196Z/h9+budQycSYG4WoqpHICVdO3OTu0jmpgEthvef+K46SvBJp
 k+whefb30M+1PGYlpvNw5ZQWAt4m/unHVMNLGpia4S28NYrHiRibidO0Ao1/uRPdY6o9
 rBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=McASa29lxjZpj0oJ3ZfQEaOaFXbUU/UG3+m1x1GG8co=;
 b=FDOlv4CTwBFw4DFdKsuxjikxU0lmYHjGkY6iuWgZvCVFlHzHgGhNWyIrw7bljZy53E
 esnl+qBmY0LdkD51EyAhUoOoeZgIkPVLRGEQ9U50mzpuB7pW6spGszFAognhyl3BYn9c
 WgdOEmGfbqazS/Vp3jWzUMLIShGac68p5/zsTCCACs30SRKs9rM8Fp2p81+5nFh1xKFC
 g7Mg5ttybZmbroxjvG/S2F8OUhgYQkXXLxbRss40W0aC6kWN04nYn6VdxbZpu+t7030H
 V+/cRRXc+buBZfFTE+pS10/8h9OY2NcR9SagdsY7Brd5zBrtjDNnxouDr3HzD7W9MaTF
 a7rw==
X-Gm-Message-State: APjAAAUeIkaSF4vb/cG775UFBlGbICkq+BMzbJh9efeBBPCmLUrvZiTf
 MBCHAiXM0ZWEyUtaDO9CwwuKRH2y7uzOOKvYRJg=
X-Google-Smtp-Source: APXvYqxCcxQEXetp+8qxWOCkYRfCFeSjQTr5ue+VK7qlD1hltuVYOFpeQY0fPGUN+r8Luu/8sd8vTD7bA2pcXXHSCQ0=
X-Received: by 2002:a1f:14c1:: with SMTP id 184mr9771787vku.69.1561128950035; 
 Fri, 21 Jun 2019 07:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <1560755897-5002-1-git-send-email-yannick.fertre@st.com>
 <CACvgo50vSNCTTTKp9D_07tazOE9YkU-zKAsDywvWe6h0NgcEmQ@mail.gmail.com>
 <2c169739-febb-12a9-0fa1-d5da053ded67@st.com>
In-Reply-To: <2c169739-febb-12a9-0fa1-d5da053ded67@st.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 21 Jun 2019 15:53:32 +0100
Message-ID: <CACvgo52tK2Gaz7wzJ0Cw1rKsTog6PbGF4G8at=cO-oyiEZ4EUg@mail.gmail.com>
To: Yannick FERTRE <yannick.fertre@st.com>
X-Mailman-Approved-At: Thu, 27 Jun 2019 08:49:46 +0000
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 LAKML <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/3] drm/stm: drv: fix suspend/resume
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

On Fri, 21 Jun 2019 at 15:01, Yannick FERTRE <yannick.fertre@st.com> wrote:
>
> Hi Emil,
>
> The msm driver tests the return value & set state to NULL if no error is
> detected.
>
> the ltdc driver tests the return value & force to suspend if an error is
> detected.
>
> It's not exactly the same.
>
D'oh I've misread that patch as pm_runtime_force_suspend() being
called when the atomic helper succeeds.

Thanks for the correction :-)
Emil
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
