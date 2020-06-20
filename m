Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E4E2026A5
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Jun 2020 23:09:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1E42C36B0C;
	Sat, 20 Jun 2020 21:09:01 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0105C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Jun 2020 21:08:58 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id q19so15304105lji.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Jun 2020 14:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gc9tdvMm5I7FJ9/c9wizyx0mIG41qGeqGwmlr+DZXMs=;
 b=IvAC7ZQ3rsnPQbRpe/zhqJX5h5DHKg2O/MrnfYfjr9Zce7psVaMRbv9AhkaSnbgzO9
 +WaPbgTnjvGnVJKwiLI8WAKGc6kWyYMwchzqviYciYEfZcPQ9D5xtRFr5tgz2Oq+16k0
 DFIafeLVdCK3BP4iid2OzKBZViODJZYG5DNZaqPnzFzSsuGxIeKBSHBk6Dcwi72cNcen
 u2bC9fuNz6HlM9G/ZJrKeg0F8THM+Gl1vS4O4q/YqnNsiKCStMLriluy51nB6rNwOtOI
 tcnMd2RvUpAmKCH1xk0vtXcZ33/12atFQif1nAM/XxmRQMDxkQYKXqTTEvtI7pXawhfc
 y9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gc9tdvMm5I7FJ9/c9wizyx0mIG41qGeqGwmlr+DZXMs=;
 b=H3GGfgu6xSR7mYwPgqfBLye6oSzdWIttKKWP8SIFU0YAs+I8NOeLdV+ygtDTIK0KrY
 BV0XtwI5gG8VmJrQHKxuI00arFMCnpEBMXmOAjIQHzIXpGxRyogCTAIL3Q6WZei8zb3Q
 brC45Vr1tFSdlCw8u5GUDrQOZSdpaNSsTxzdAxYWA1Q/wrsg9T0W4TVsm/MF10h1Ezr7
 a1vPaaam/fS4ky7/uLl82dPE5ZZsrBkKWh44P9TUXNKe0znB0HF5xQnc5JGvKJPhtBue
 4KAyNKc8eSndE5c3fKT3rJyZbv8mCZjFJRlbDeT0Zy2gGmc5ve9UG1Xfx28b4BFoznLM
 YptA==
X-Gm-Message-State: AOAM531jB1h74oxB//seiH68OzlQxQlonkgfdEaW2ezjhvnb/UR+fWXU
 QWViPGCN4WOdUk6lDw4YqkKsf9SsKoKtDJqU6noVkQ==
X-Google-Smtp-Source: ABdhPJwdgpgs+ay+WZjD/XkBsiAdpaLbdadabai2iJjIEJzxZyOWnj/D/DOGj5KOcwe67T4FZfBDGzbpDtr8cOH+enA=
X-Received: by 2002:a2e:7303:: with SMTP id o3mr5207917ljc.100.1592687338273; 
 Sat, 20 Jun 2020 14:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200615125951.28008-1-alexandre.torgue@st.com>
In-Reply-To: <20200615125951.28008-1-alexandre.torgue@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 20 Jun 2020 23:08:47 +0200
Message-ID: <CACRpkdbgMRW6Jqde6AOcjJ9=T-d5fTO02N19YsrVL+iaZiKXwA@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/2] pinctrl: stm32: Add possibility to
	configure only one pin
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

On Mon, Jun 15, 2020 at 2:59 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> Currently stm32 pinctrl driver offers only the possibility to configure pins
> groups thanks "pin_config_group_set" callback. To configure pins thanks to the
> GPIOlib (i.e. GPIO_PULL_UP ...) this driver needs also to support
> "pin_config_set" callback.

Nice feature growth!
Patches applied.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
