Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B16D472FAFB
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 12:32:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7025EC6A61A;
	Wed, 14 Jun 2023 10:32:03 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B58D7C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 10:32:01 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-bc492cb6475so477753276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 03:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686738720; x=1689330720;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I9/uJWt/ZuvpPe3D5swX3KpfwGEqFuE4FpM5RCSL7dg=;
 b=MCgedgP9Okz69NLPetN7JTzxnS1NBAn9qU/oH5pHi8LmO0PBDavduC+CJ/WmA3pY/W
 Q2jNlVMbpgZdRVCvHc/1qyZ1DuICb8uCnkCgGa3yE23FzCRbO8w9bO0kxsd07EyTz3Ny
 ii8qIVTop0XINd2XsVi8BJd07BcbyR34qlMqq7Z0RvIIbF8Y5IcYlyU0P1yu2A/3NvYE
 RVEhqCqZVSI+uv9jkl6/eWaALmdVdHK/lZPacobowCiXZs1unk8c+vDMZw/4obC3w9s1
 c7nC19ofZomtg3SQSzlPo9jvZk6yOVyvowNUfPQmASBU3wKBllpc05WUV7Bi2JvXBdpI
 ryOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686738720; x=1689330720;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I9/uJWt/ZuvpPe3D5swX3KpfwGEqFuE4FpM5RCSL7dg=;
 b=TNByPxOPe/2B5z10orJIlyeBwFvr8cJzWG3g4NxWZtRkIPQ6Q3PWaeUeg9ItvDJlpn
 G57ijqxIftxowIIbET6V73m6Du76Q6eTkI7SGJE9L60QdACVqFLjvrGU1io86b+hK9LC
 YweTc3NZeuZaQREykOaDfHUO2w/TNiXxNWk4Ge75puc0s52owRXhcewpuBRLdp4e7oNk
 gSrokTaPuwNN+VvmP7xG/AV716XNhGt8Ws7lRwIyUpROlaCXX/lhqqLntOJUEnClpnDt
 o8TICaGVXu+oND3QmbYB9jCGkbjEdpzN1oyxiLmVG0ZKQyPK682v1yftLOqR1/BJZArH
 l7/A==
X-Gm-Message-State: AC+VfDz+jExvb85Dwyndrpc/cH9eNa4CWLoB99UOw9iuXGTJrSxAp24N
 DT37jyZQMTx33OK8B1BaCvkHpoYWLOhcsaeiPhyOrw==
X-Google-Smtp-Source: ACHHUZ7gC+7dlFTTQUBB98VwtkJQOcb9XZ09VT14Ld/fIPuh52WdHcHgb9e4SwQzIlYb8VFK9kWWWaTBfzN7vPnHEJ8=
X-Received: by 2002:a81:7204:0:b0:55a:574f:327c with SMTP id
 n4-20020a817204000000b0055a574f327cmr1355540ywc.13.1686738720466; Wed, 14 Jun
 2023 03:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 14 Jun 2023 12:31:24 +0200
Message-ID: <CAPDyKFpP=G6vs-VLoTF4BhVgxDyBLZ4DqWsXy1qvH1tV_SC53A@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mmc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 00/10] Fix busydetect on Ux500
	PL180/MMCI
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

On Tue, 13 Jun 2023 at 22:34, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This series fixes a pretty serious problem in the MMCI
> busy detect handling, discovered only after going up and
> down a ladder of refactorings.
>
> The code is written expecting the Ux500 busy detect
> to fire two interrupts: one at the start of the busy
> signalling and one at the end of the busy signalling.
>
> The root cause of the problem seen on some devices
> is that only the first IRQ arrives, and then the device
> hangs, waiting perpetually for the next IRQ to arrive.
>
> This is eventually solved by adding a timeout using
> a delayed work that fire after a timeout if the busy detect
> has not stopped. This is the last patch in the series.
>
> I included the rewrite of the entire busy detect logic
> to use a state machine as this makes it way easier to
> debug and will print messages about other error
> conditions as well.
>
> The problem affects especially the Skomer
> (Samsung GT-I9070) and Kyle (Samsung SGH-I407).
>
> It is fine to just apply this for the -next kernel,
> despite it fixes the busy detect that has been broken
> for these devices for a while, we can think about
> backporting a simpler version of the timeout for
> stable kernels if we want.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes in v4:
> - Fix an unrelated change in patch 1
> - Move MMCI_BUSY_DONE initialization outside the if()-clause
>   for busy detection.
> - Use the per-command ->busy_timeout as calculated by the
>   core.
> - Link to v3: https://lore.kernel.org/r/20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org
>
> Changes in v3:
> - Unconditionally assign busy_status = 0
> - Rewrite state machine states to just three
> - Drop a patch that gets absorbed into another patch
> - Drop patch to get busy state from the state machine, it was
>   fishy, based on a misunderstanding and not needed
> - Link to v2: https://lore.kernel.org/r/20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org
>
> Changes in v2:
> - Drop pointless patch nr 1
> - Unconditionally intialize some state variables
> - Use a less fragile method to look for busy status when
>   using busy detect, should fix Yann's problem
> - Link to v1: https://lore.kernel.org/r/20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org
>
> ---
> Linus Walleij (10):
>       mmc: mmci: Clear busy_status when starting command
>       mmc: mmci: Unwind big if() clause
>       mmc: mmci: Stash status while waiting for busy
>       mmc: mmci: Break out error check in busy detect
>       mmc: mmci: Make busy complete state machine explicit
>       mmc: mmci: Retry the busy start condition
>       mmc: mmci: Use state machine state as exit condition
>       mmc: mmci: Use a switch statement machine
>       mmc: mmci: Break out a helper function
>       mmc: mmci: Add busydetect timeout
>
>  drivers/mmc/host/mmci.c             | 143 ++++++++++++++++++++++++++++--------
>  drivers/mmc/host/mmci.h             |  15 ++++
>  drivers/mmc/host/mmci_stm32_sdmmc.c |   6 +-
>  3 files changed, 132 insertions(+), 32 deletions(-)
> ---
> base-commit: 3dff3b32d4752f4a0655fad3c8669978c291ae59
> change-id: 20230405-pl180-busydetect-fix-66a0360d398a
>
> Best regards,
> --
> Linus Walleij <linus.walleij@linaro.org>

Applied patch1->patch9 for next, thanks!

Let's continue to chat a bit more about patch10, to conclude.

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
