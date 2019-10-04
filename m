Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22102CC3FC
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2019 22:11:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D04EFC36B0B;
	Fri,  4 Oct 2019 20:11:43 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D85B1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2019 20:11:42 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id u8so16241787iom.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Oct 2019 13:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q+gSdG7Prkk7Cp8mQY9HaZirRwIllCjsMp9BMJvUxrk=;
 b=ZSyrvWFeV/vh62RWW9BJlK1/b3jPCygzz85/0IwOL2MzWF2ErbrXK6d6LLO3DT1w7M
 tTzG4A+wWRStYJB9lmHyo/ND5e+tPKnLsSWfVGqX2PTyd83EKyJ9gLVo7YD4ZRRLXVvA
 u+YFOOsDVJF/Tt6K1cit9W+BpFxgaVaMID2R8z9h+WO31LJKARx+2KAU8lezejqryyRU
 NDa8k78Ue9/HTUCJAweCKptnGwn1UA2cUL3fOz9WsGSJDvMGeOpumca6hj6KLo3Eh2/i
 FMSd9CQiqYxLLAzuWfoZo8wbKGVbqooDkKvvAoqxJlgVTh9FIFKrd8tNT00tVxE7W4CS
 rfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q+gSdG7Prkk7Cp8mQY9HaZirRwIllCjsMp9BMJvUxrk=;
 b=p/9Zn6gh2vAWnbA1Zz2QZPBtDuuqTnECP1jdmms8xheKWYmd8NiGH3Y+Rt7KgBFjyC
 O0P1Imfw/EEo96Tj9Me9BWpNn7nozK2NcDDzH9J4VUNXaZ10jpcVTRinadRKIE145y01
 7Kec34nJoHHFsWOvMvVokcZOYiFv0mFvfJVyYtMgZehmuD1tJJAtNZhgyiBaQa/7QAUf
 C354hHkEncvd8SWSHMaMuvq42ckRXOHxCf05wu26WTfqNdnYoTW0i7j/eAQonLRBTQIl
 qc+XY6eHYU5vKPjgETwHiKzgsP8W8tnoO56yhl9SfubXLrRG5736Rl5j9WbTJ4NMvymV
 y0uQ==
X-Gm-Message-State: APjAAAUJ7scwDJf2qr3IH9H28yU57Q0ttQpuYOifn2yOYIICQEF/xUwr
 sa/1FWmutBj+ofSPOt6EWLQq+ZM9GsOGvUyY+/4SYQ==
X-Google-Smtp-Source: APXvYqxlEQ0p5dqdnleWWojSrwkdgmBEUkurQtZ1WZv+uCyU//AQSI8hbw9SjVK2dBtB2MjbTcY6tyfd+ZHXEi17F2s=
X-Received: by 2002:a5d:81cc:: with SMTP id t12mr8160598iol.207.1570219901601; 
 Fri, 04 Oct 2019 13:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191004124025.17394-1-patrice.chotard@st.com>
In-Reply-To: <20191004124025.17394-1-patrice.chotard@st.com>
From: Olof Johansson <olof@lixom.net>
Date: Fri, 4 Oct 2019 13:11:30 -0700
Message-ID: <CAOesGMgF2m_MUqHy9_aabMxMZ4rd1=qL0VGr+avPNn=GgsLJCg@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@st.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, SoC Team <soc@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] ARM: multi_v7_defconfig: Fix SPI_STM32_QSPI
	support
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

On Fri, Oct 4, 2019 at 5:40 AM <patrice.chotard@st.com> wrote:
>
> From: Patrice Chotard <patrice.chotard@st.com>
>
> SPI_STM32_QSPI must be set in buildin as rootfs can be
> located on QSPI memory device.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to arm/fixes. Thanks!


-Olof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
