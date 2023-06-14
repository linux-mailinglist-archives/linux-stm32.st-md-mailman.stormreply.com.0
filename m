Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB5172FC20
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 13:14:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D2DCC6A61A;
	Wed, 14 Jun 2023 11:14:16 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70ACAC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 11:14:14 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-56cf00a04e5so6352527b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 04:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686741253; x=1689333253;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iKRabDKgNdRjabGDczWZve4hAHKXZMZCSP9Y/mNfdlI=;
 b=SA34EGsYB+cg5TEAaZgbHqcm+KPXLDJ07FNu9ECtl5mn6dlm5HohM32bOFcMxYIjRc
 4JTi7tuo4IuM4C0ijR6cFYyZiBLCDIvYNNESxJbqfKtK6O5v5FruBQIFmBbK7f9Hh46D
 7WWydFG7SVdCg6Is1UM+ZdaAvIGgZuAZaeFXRKUzuI7fciRUD2ZFsnWFhv6zdM5RsGrA
 FFzS0kjENlwouHH7wndGyQ+AhS1q+5d/ytodI8zxSNJUtZawumZ1wBCAYHcyWFZtxl2P
 GUw9555b4BOWOoe1CoAArj54Pcg/UxAgrt6UFPU6YazfMWNlV31oASAF8tICfwDEFHHG
 jrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686741253; x=1689333253;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iKRabDKgNdRjabGDczWZve4hAHKXZMZCSP9Y/mNfdlI=;
 b=R9jC84ZkrXmN9fyhGzOz+PNB/j8IZyCE7dI2WISivd3imyiKMpoQUvHEaJpx8S9JJT
 FKSvWzslZokdyjT4mh8KwKiomytqVmeTHiLQnexvguPA75AYhf1nAy8O9ylJKldxKRaF
 rWM9Fh4u5sI0AOicfG/7hpj1PijdIVtAhdhNTKFT1P/yyM88j0Tr1e1/T9wKST8zj6rp
 Lda/lKCznuupWkplXOQQ2OH7Y8qbGppcKqFnXJKwHccK4xrqdEcjLACfGXcSwG7TVq8B
 WaVkGuBOSR5fK1jDO6oGNpkHvRclMyuK84LRq29Q+C2z/xAw+KR+V681t5sQdX/rCcbb
 jsHw==
X-Gm-Message-State: AC+VfDwbJ6feWiUTOY7yjKtIDFzSR/7sJKGvQssr6sIfymA9Hu3aUjJH
 xe5Ypjd2GFG8V5Iu770WypHU4gbJPEV6xMrIUjC3UA==
X-Google-Smtp-Source: ACHHUZ7fC+P4Spp6eGsl26E1xC0n5raOY4TA1TrqW9ckIEH3q1G2FnCpRlONyRG9gfIwrDN5urF8kSFV/jyvnvVl1Ws=
X-Received: by 2002:a25:d787:0:b0:bcb:9b43:5a89 with SMTP id
 o129-20020a25d787000000b00bcb9b435a89mr1604952ybg.61.1686741253275; Wed, 14
 Jun 2023 04:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
 <CAPDyKFpP=G6vs-VLoTF4BhVgxDyBLZ4DqWsXy1qvH1tV_SC53A@mail.gmail.com>
In-Reply-To: <CAPDyKFpP=G6vs-VLoTF4BhVgxDyBLZ4DqWsXy1qvH1tV_SC53A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 Jun 2023 13:14:01 +0200
Message-ID: <CACRpkdbh0dgkJdf50Nf4OB_qLtmz3kaniwKTE3Bke181BeDbaA@mail.gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgMTI6MzLigK9QTSBVbGYgSGFuc3NvbiA8dWxmLmhhbnNz
b25AbGluYXJvLm9yZz4gd3JvdGU6Cgo+IEFwcGxpZWQgcGF0Y2gxLT5wYXRjaDkgZm9yIG5leHQs
IHRoYW5rcyEKClRoYW5rcyEKCj4gTGV0J3MgY29udGludWUgdG8gY2hhdCBhIGJpdCBtb3JlIGFi
b3V0IHBhdGNoMTAsIHRvIGNvbmNsdWRlLgoKWWVhaCB0aGF0IG1ha2VzIGl0IG11Y2ggZWFzaWVy
LCBpdGVyYXRpbmcganVzdCBvbmUgcGF0Y2ggaXMgbGVzcyB3b3JrIDpECgpZb3VycywKTGludXMg
V2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
