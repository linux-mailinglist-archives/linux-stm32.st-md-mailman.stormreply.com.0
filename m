Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B748E482
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jan 2022 07:54:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E14CC5F1FE;
	Fri, 14 Jan 2022 06:54:47 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54225CFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 06:48:07 +0000 (UTC)
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9080F40033
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 06:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1642142881;
 bh=PKBAkmJ7or0T/bxHU0Wvyq29ugXtwBBaF+RK3mybysU=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=hDIiylRN/BhR3ijiiWn2wBFPyRwRb06nqYpmUx4C+aV6dTp5xI2nRrJGZ3n50E7O0
 CbS1pO8x86DkqH4QUbPue5kg/sSXD9bqZpvAf6m2k82QB941iO2baagLssj9WarLQp
 KLMiSonoqyTJSWEY/X1fHx6nD9jrRmdvDsSCvcQA131JdAOjfBHyzZEDjO6GLgkrRv
 T4f0LMD1m9xLE6iEabDWROdRNcJxN7SJ1YiYOJpqX0/n+K9GaTyTVxQWEqYSQ/CYe/
 G1NT0CiQdqFfO09vj0y7XGfVyJ8KK1+hN7FARhe5AJ5XMiXttlAht6j3CNnkTUH50B
 CeV74hekx6AnQ==
Received: by mail-oo1-f69.google.com with SMTP id
 w25-20020a4a6d59000000b002daaed72624so5410464oof.23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jan 2022 22:48:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PKBAkmJ7or0T/bxHU0Wvyq29ugXtwBBaF+RK3mybysU=;
 b=CHac+vTJ8lduek0I4j3WNA2PTY7RODzlYeSCJi4YRlY4QWyG1GoIgbd0Tgqm+R74fd
 khhD62QdXzJvgmLCjBeqGlYnLopU9rWKqoBgHrc5s1zrzYMLzjqi7yopsxdBzxYof9rq
 SepHr3VlaeKzuAux9EwoeIbiFZe3/EoSqTV1UXKvSi8EX0tRNb7yvU6NM3QLXF0NERJe
 TLt/SyA4yzAD14h4MZS3T0ell5JKjLL70Kmuf2EJpAsDgqeqieHxkC5SmWnj3JF7fv6+
 x1F6yzbINEBqjVTD0v0zxjSolMNB48+8c5BF84sOZFR79Odn4V9C+PxsAtGbCgiMHxYQ
 ei6g==
X-Gm-Message-State: AOAM530+puAYQNu89Qx3Pxry98YgSE84NaXUJURSEy82F318cm0QCGhj
 g+Nrddfin5IHYH5bh/rPGuBAs2a2L3AmXd2uThYJqYhiSHeLDlegUxlAXP78J/D318Z9d8a+06O
 L04uXpaL7M3Dhvw3QD3+kVSpi837NIqUaTkwK94Ftb0d416CSbG7YnyzKthXhrBsWoMqjHT6yeQ
 ==
X-Received: by 2002:a05:6808:293:: with SMTP id
 z19mr10972597oic.41.1642142879352; 
 Thu, 13 Jan 2022 22:47:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJye/IK1OGddDRHlpoRSRDwJDrr3evy3FfczWQgU60l1SslTO9lJxeMi9V5rBVY0jKXg6Ly5r0DmOwSH1F8j5i0=
X-Received: by 2002:a05:6808:293:: with SMTP id
 z19mr10972566oic.41.1642142878837; 
 Thu, 13 Jan 2022 22:47:58 -0800 (PST)
MIME-Version: 1.0
References: <20220114040755.1314349-1-kai.heng.feng@canonical.com>
 <20220114040755.1314349-2-kai.heng.feng@canonical.com>
 <20220113203523.310e13d3@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20220113203523.310e13d3@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 14 Jan 2022 14:47:47 +0800
Message-ID: <CAAd53p6rW7PcugY7okKsXybK2O=pS8qAhctMzsa-MEgJrKhEdg@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
X-Mailman-Approved-At: Fri, 14 Jan 2022 06:54:46 +0000
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 alexandre.torgue@foss.st.com, Russell King <linux@armlinux.org.uk>,
 joabreu@synopsys.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 peppe.cavallaro@st.com, Ivan Bornyakov <i.bornyakov@metrotek.ru>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 2/2] stmmac: intel: Honor phy LED set by
 system firmware on a Dell hardware
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

On Fri, Jan 14, 2022 at 12:35 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Fri, 14 Jan 2022 12:07:54 +0800 Kai-Heng Feng wrote:
> > BIOS on Dell Edge Gateway 3200 already makes its own phy LED setting, so
> > instead of setting another value, keep it untouched and restore the saved
> > value on system resume.
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>
> I defer to PHY experts for review. Coincidentally the first Marvell
> flag appears dead, nobody sets it:
>
> $ git grep MARVELL_PHY_M1145_FLAGS_RESISTANCE
> drivers/net/phy/marvell.c:      if (phydev->dev_flags & MARVELL_PHY_M1145_FLAGS_RESISTANCE) {
> include/linux/marvell_phy.h:#define MARVELL_PHY_M1145_FLAGS_RESISTANCE  0x00000001
> $
>
> unless it's read from DT under different name or something.

It was introduced by 95d21ff4c645 without any user. Should we keep it?

>
>
> Once you get some reviews please wait for net-next to open:
>
> http://vger.kernel.org/~davem/net-next.html
>
> and repost. It should happen the week of Jan 24th. When you repost
> please drop the first patch, I believe Russell does not like the BIT()
> macro, his opinion overrides checkpatch.

Of course. I'll wait for the review and resubmit the 2nd patch.

Kai-Heng

>
> Thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
