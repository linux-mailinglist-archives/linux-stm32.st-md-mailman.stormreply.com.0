Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A76961485D7
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jan 2020 14:20:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69BDDC36B0C;
	Fri, 24 Jan 2020 13:20:19 +0000 (UTC)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EFE3C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 13:20:18 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id r18so1174438vso.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 05:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t65RoraJ97XSNifH3nJWhcpZY1lN6qjNaU0+rNtB6VA=;
 b=gins8z7JzejJQal9gDEbPpdg5XvecgftPkBOzZDn61Udldh3usgTviD1RSeTs/khVg
 P6QL2wdgjepWpZPu2K07a0Gi2j30WxCH8luSM9XeXKn2a0tOlWNsCiBvesNyFuoRTa2l
 l+vIULJyGGwlTBlM48w/mQcMBP9WP2/M/8BvfKaietFwyHD4quO4EfSzZuZDebmtJUKO
 N78p+V3i2PTQYXQaBm9DxrHQdcBOrL5nyx5ZvfkLk7TND7MMNM/kXvpRBQCuqtQn+Mxh
 S+P6c2mXdalbk8iIrd+uIIUDrn+lJsAfuy8AVqcNxmXZb29qZ7+MytSuK9cABHt20/c6
 vbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t65RoraJ97XSNifH3nJWhcpZY1lN6qjNaU0+rNtB6VA=;
 b=ElMwrbey0juuq4p2gCj8ULXDToCLL71Owk8tbRVYlMmA5A9BMyBABF7jDQkKAiJ9gN
 glcBUEZFIqXRfT6PrjqEWYylADotfke3q6mRUOwC0k6ja9bKmfeLFG3l/b4cHcjK9CTc
 5FQr0mMyTvRGfDflxpyRnDFjjgHgUbUPkWak2nxWl9S9jvVZf0QC9lwENDdYuY6Y3IbT
 cp4KNM0qjILS6+R96/x7M4+tKiYC2E0xcMYnQ5v98HSyQqvQX6q/8X6WuoKk5UGdIa5+
 Hn3davbBa7HlahMYi/oQCdsvg8WwXpIYAPNuJQ+HknNdyvKopkxZbx2mkHQn8DwwVU7i
 WTBQ==
X-Gm-Message-State: APjAAAVFOyhB6AFNiUF/G+ML8x5FrQDzTI/y2zkI3i2oKD1/L+MBwZXd
 RC+WuO/WQPiozRvkdC0gvUBg0ZYM1z38xkUHVMHytg==
X-Google-Smtp-Source: APXvYqwPiZbZvXR+rHIvNUYilWv/U2EOOXMt8apmM26fWaq/fAZpxuaFlhAeSj98ruAwNOVdB6HsKU61mDEy2b2ThPA=
X-Received: by 2002:a67:cc3:: with SMTP id 186mr2203033vsm.200.1579872016966; 
 Fri, 24 Jan 2020 05:20:16 -0800 (PST)
MIME-Version: 1.0
References: <20200110134823.14882-1-ludovic.barre@st.com>
 <6d859def-351e-abd7-0d5f-962ad935dff2@st.com>
In-Reply-To: <6d859def-351e-abd7-0d5f-962ad935dff2@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 24 Jan 2020 14:19:40 +0100
Message-ID: <CAPDyKFo+4qTZbE=4Zgj3VN9BPYUHGskPSnYEJRo1TpARzg5zJg@mail.gmail.com>
To: Ludovic BARRE <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 0/9] mmc: mmci: sdmmc: add sdr104 support
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

On Fri, 24 Jan 2020 at 13:55, Ludovic BARRE <ludovic.barre@st.com> wrote:
>
> hi Ulf
>
> Just a "gentleman ping" on this series
> https://lkml.org/lkml/2020/1/10/392

I was just reviewing :-) Thanks for pinging!

One overall comment is that I think you can try to work a bit on the
changelogs. In some cases you described what the patch does, which is
good, but it may lack information about *why* the change is wanted.

Overall, the series looks nice.

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
