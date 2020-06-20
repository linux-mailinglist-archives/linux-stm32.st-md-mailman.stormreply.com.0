Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AEA20269D
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Jun 2020 23:06:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11200C36B0C;
	Sat, 20 Jun 2020 21:06:58 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91E82C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Jun 2020 21:06:55 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id a9so15256571ljn.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Jun 2020 14:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EVO4PW7RZ5BkQYoJgxP0Hx8bG7QWB5MT25IV3wH9AkM=;
 b=Dp0qEIC3xllmaPI+qPS5JRYOt7p/apOAtBOyLTt1Eo2YxFQMjJ2jEQhVFIbnoEOSaj
 NpB6w3MtDNzoDH0i4Lr++i8UwMgUoUFXwnZ2E59aKaaSP08WnuMNS9jC9RzRaVICDgzs
 SD5kRCXwRnMxFkvqWluqoSxPHgFvSUTR8YLxsxV6WYAsUQXojk1Oeb3bTknFsNHxFuOy
 QphZJF78NpRAJS8CIvakBPdC3TQSQlS3lbli4gopKVVfyN1jH0RjSlgBM9Mb2j1lrE+g
 HhCvb+tP7tJpRFBLmyvSv7C76RsBv59CSQjTgluWOwInYb6vvUfG9hdzcYFenNZyN8Z1
 tqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EVO4PW7RZ5BkQYoJgxP0Hx8bG7QWB5MT25IV3wH9AkM=;
 b=cpSvdKqmiXyAox9CTynBtA1j94gI1gdQ3m6bah1U7oeZhlBZQFNKw5LwRRmxlULibG
 9oFJ73sjwCmPD7eVoSbVE+awHiK8zoL/Bp6Ov//dwSXBPoS6k+2Y932vUx8xNhVIbEvi
 LjksXbLQXwM+G5P0BzMlsq3vLWumjsBY/KCRK9NdqboF9apmJmgtx7yYqUTjvhAe+Xjr
 KzvtQEdTvCxUI/cAr7hwtrP6itCLO/zZmRR9hhUSggelxmJScCUDkZm2yiGp0H22JOyc
 L+jfCOKiRwtRXOZnesOv0ZhjJhWekZkIHqwdazlTZR2Yb3l/JNqhKW194W7636Vplbf7
 zsww==
X-Gm-Message-State: AOAM531RpfFN/gW47jgWLgTUL8IXtpHN5qlBo2/lhSADQQrIT9cKx/4O
 stC4bj/F5cqZDhs99NkQlouZcItD0F0CfjBbfUd6EQ==
X-Google-Smtp-Source: ABdhPJwE4EHbLLjrPuV5spgZm/Iq14+xmGwaVeLjLtulYH7lt3F+0nrvpcg5T7zJTtXYbcSJEj3/EuUpVbHXVXBXMSo=
X-Received: by 2002:a2e:350a:: with SMTP id z10mr4720370ljz.104.1592687214811; 
 Sat, 20 Jun 2020 14:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200615125407.27632-1-alexandre.torgue@st.com>
In-Reply-To: <20200615125407.27632-1-alexandre.torgue@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 20 Jun 2020 23:06:43 +0200
Message-ID: <CACRpkda6STLBFPLE-YdFCqaqqrpUPkweh4qc_OYcdC03KZspPA@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/2] pinctrl: stm32: add changes to better
	manage
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

On Mon, Jun 15, 2020 at 2:54 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> Clocks and resets for GPIO banks could be defined but not yet ready when
> stm32 pinctrl is probed. This series adds changes to manage probe defer
> when a clock or a reset is not yet registered in the system.

Patches applied.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
