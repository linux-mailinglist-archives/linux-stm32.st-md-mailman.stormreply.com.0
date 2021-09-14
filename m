Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A27F40A6C1
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Sep 2021 08:38:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F5CEC597BE;
	Tue, 14 Sep 2021 06:38:45 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2628AC597BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Sep 2021 01:11:07 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id m26so10578085pff.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Sep 2021 18:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ivan-computer.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=z2lOZGZdanpaYVRAt/kvSmIvYXxBB8qSaA1o9kisjMg=;
 b=Xt0ZPlRVNLKoo7f/9go3VQniX80+aRjOr3TNjoHcqY5VbakNlBn65Ufxe1U1HX9BXo
 KLCBdzaE3tcqQezis8ZrR7yyG+i8he02WyzB3fzpticQI52MIDnkOK3FeWBEkFkelDiZ
 8z0FJPwvunszsa6/Nm5Us8uZEcPyw9PFUHqnYe2Gy4O1vbBFGCVcZsOhiIyjbQFiw21J
 FtlM70CKKLusdtTaqU5Xg6ZMxicEdN8zn1fDpCOvTv8EMXXc58hCRQmg1jnzvz9ymq8v
 U4SNUEFjLQhbkjrsfS6PjkAbTrjs2HxVfNHMhFKktiR1j24tTNPkm0hQz7+5LFyZ4Cga
 tqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=z2lOZGZdanpaYVRAt/kvSmIvYXxBB8qSaA1o9kisjMg=;
 b=De+lHLibuyd321/1Y49+QieFTJ90DSMSzF/WEibVHcWSlKScEOvDW3KenRdWO6jIfs
 1DaMiIt8fWY3DWMkbjwf0Z0o76zEgqKudXkGsMnLgZjCKdab8XwCOoTYTGgl7CMSwiR2
 yz5azrMzIlyvRspRrBhRCrTdhI4x7hanmYniLwql7cnVHZ4NpyAaGSppR9YcWcSmRGr6
 dibYAoO1eMqOvR1gbMr0Xbyd55xLF0B3Xzbhb8TdcWSPgurvPo1ywm2V1Uoq0hi1YtYF
 uiDSfxPNQh1Ct7a/uZ9VlWXzFy94WE5dVoleR4ez+r4/EX2/YpvPx3vi8kllxCt3+tK+
 jqDQ==
X-Gm-Message-State: AOAM531lZAZj16D+jK6hFdiRcUVhjbr9IEuqehfzkB1Z1xPSv+2Rav4j
 2OjxlNFxkBWAje71PRvokQ4MuR2yxuHkU37TVB6WtA==
X-Google-Smtp-Source: ABdhPJxZLMOzU++Yr534PIvgmvPLqoY0wiy/m/5MqekCrmsD3aOr7SJTtlFVAA6QQu5SqxWHHHr0DfSDwMlxti/zU0Y=
X-Received: by 2002:a62:2905:0:b0:3f3:d4ce:443d with SMTP id
 p5-20020a622905000000b003f3d4ce443dmr2213624pfp.44.1631581865674; Mon, 13 Sep
 2021 18:11:05 -0700 (PDT)
MIME-Version: 1.0
From: Ivan Babrou <ivan@ivan.computer>
Date: Mon, 13 Sep 2021 18:10:55 -0700
Message-ID: <CAGjnhw920kNaJ9Vkg54WR8vh2TaomuTtA3WwR3eieD4v6iEJDw@mail.gmail.com>
To: sashal@kernel.org
X-Mailman-Approved-At: Tue, 14 Sep 2021 06:38:45 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-rockchip@lists.infradead.org, joabreu@synopsys.com,
 michael.riesch@wolfvision.net, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, wens@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-rk: fix unbalanced
	pm_runtime_enable warnings
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

Is it possible to revert the patch from the 5.14 and 5.15 as well?
I've tried upgrading my rockpro64 board from 5.13 to 5.15-rc1 and
ended up bisecting the issue to this commit like the others. It would
be nice to spare others from this exercise.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
