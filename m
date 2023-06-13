Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 019E572E282
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 14:08:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA534C6A61A;
	Tue, 13 Jun 2023 12:08:44 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D455C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 12:08:43 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-bb15165ba06so4490044276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 05:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686658122; x=1689250122;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=83Vvn1AtpC3kjFmfmJpDNEecuXzjnAlbe9sDtMkiAH8=;
 b=yKkRpSkM8xo/AWLmIqfTR4hfuPD71mefVtfSTjwCJAExj6Z5s+Nabcjlj3WJdfL1a4
 BnBjU8IXMAUq6x3KkhXHwk7jmYnb5UF+SwvZHZYGg7cPCHXhD4S/z5TnTsyP4Yb9mtgk
 3UcK0fHpn1w69QcppaLrABqOPPk2XKC+6kzkzruoip1BVuH/6eyIFc45vmGoJMOFMeJX
 Yq8eS8dCx4/XzWscmc9LS0lDgC69AG3JEqJcU4pCrxdfrCt17H9d3woQYawpYvao9ePR
 PVxysFSs3RroLrk3Tu3eKmVN7GiXOIM9NMqmljcavoglX2dhkCpJETVIlIleQCHvw/qg
 gIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686658122; x=1689250122;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=83Vvn1AtpC3kjFmfmJpDNEecuXzjnAlbe9sDtMkiAH8=;
 b=Udu0Quii0rez0DJQB+Gik3c8f69lXxumW0MaClsyo5CcEkQSHC0zfQ50zVYh2dJ2XS
 4IO6E7q/WNO6Tm2CD32mffHyUdhP5gg+9mKJlqK8L2stqefx4etm/umqFmru/c/5GKsT
 mmBaK5BntTtyT9lze0XvqaUSqiqnP4DaYHujiJOorCWl/65+QVmQBG6hxaJw4aJMYe8k
 KeBt068vlGgjlgM7BWT8u2AufiH2bDjlF++zmW+WHtB+WbjiHLrB88wVDnrPbImQ/N5j
 AtSHaUhVu7NTXL6F5ig62J1JQ8JjfAueSfhs0vVcrNgD7os+/7twz9QRTbBaQ17nWS5z
 mXTw==
X-Gm-Message-State: AC+VfDzJlMkpfFzZRJkPFKVSUqo/iPMl94aGSgLphalkO1wSJe6792yP
 hbtw8aCDeXBjTvCGtP1oYuDmdwQsEy1+tsorOf1BOg==
X-Google-Smtp-Source: ACHHUZ7fMurZ/F0UWw96LY76vsoO/8roFrU/LgtGY1mu/hLsztbYiSnmLFCKIEEnZvzUdG06IZxYxJxvasi7ZOZJ+mg=
X-Received: by 2002:a25:6c54:0:b0:bcd:73a2:d2cc with SMTP id
 h81-20020a256c54000000b00bcd73a2d2ccmr1044643ybc.59.1686658122515; Tue, 13
 Jun 2023 05:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
 <20230405-pl180-busydetect-fix-v3-5-cd3d5925ae64@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v3-5-cd3d5925ae64@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 13 Jun 2023 14:08:06 +0200
Message-ID: <CAPDyKFoWsQrS+8K6HiRGKvDu8kJ=9_5c7TdDy7DUti-HfnpH9w@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mmc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 05/10] mmc: mmci: Make busy complete
	state machine explicit
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

[...]

> @@ -1259,6 +1276,8 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
>
>         host->busy_status = 0;
>         if ((cmd->flags & MMC_RSP_BUSY) && (host->variant->busy_timeout)) {
> +               host->busy_state = MMCI_BUSY_DONE;
> +

Nitpick:

I would move this up a few lines, along when clearing the busy_status.
In other words, let's clear the busy_state no matter if the current
command flag has MMC_RSP_BUSY.

>                 if (!cmd->busy_timeout)
>                         cmd->busy_timeout = 10 * MSEC_PER_SEC;
>

[...]

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
