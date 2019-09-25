Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0692BBE0B5
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Sep 2019 17:00:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4F93C35E01;
	Wed, 25 Sep 2019 15:00:23 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F337C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2019 15:00:21 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r3so7343176wrj.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2019 08:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=yrL9qSy/3grZaifloxyMrl1qoRWf0gLjQ/fLitAs1Sg=;
 b=tWFEpt1lBq/s0U7lRRMcg92G7ibk3Zphd/xQ6319ivkDGRcwuA2VsUEEhRXg6p3Rmo
 UFFLhSxCcBbU50mqQ0W8FKmttRbATzcWCmWzUlzCYmIZf7A17ZZWEAdjUO3Mltty3bJV
 gPuGpquxOoSIhqEJg9Oa8QbSXdbCW277ihBHN4xSJurJgqArzSADU2YFcSm5U73benaB
 CseZ5S9N3BtBYiecF3XIxDjZ2ZSvHqLN7yJQQZNDkFJWfr8qH7co/SD6q7xm1QQdVXbE
 URk33RcMwYrT1AJwrVuvrmUKTijJubzDzzZcglUtnKOBSJhwpSL4ci9KcKrbyZ3YSve1
 djtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=yrL9qSy/3grZaifloxyMrl1qoRWf0gLjQ/fLitAs1Sg=;
 b=Lh5lhmVcnEf7SpVFWPAIm9UUQ42Ngy7XH7eTW5Vb5UlQ18JX0XvYmeGtKGaDuC3r5A
 noVblBXTiat5EdDYT8iKZkUr/z5bRC4YArWoovoxTRDFnghl+Vnp9AztS3bBWiHY4d0Q
 nR9hG414oikqQzKCORyr0UDmZdoQ3Ad5PvVK3GbneK5650ZsDmfUZgMsmyxRn3zPy656
 n0mQA5vt6cRuwL+lj8/1HaK83T/SZSIuCe8jYAN9DIxODRAR7U5QXqwmnxzorcX+jAbA
 zMZuJNbo/ZbwbJ5ZltL7dwatndEKoDEK9G9nMpnuJap3CgGtpEd48vYkDkdLkLlSnmZH
 k2FQ==
X-Gm-Message-State: APjAAAVYbRRYbpeB21vmDe/RFwsuUQwUXv2NSkGJnMvl3mkk7WCm8w2z
 muo3oBaP6i3R1z7bAdwR/s1sVA==
X-Google-Smtp-Source: APXvYqzY26KY3DPvEXCysVewS/BT+v0bJdfTqB6QhZQoHrrjhoEyJyWKY2tBc0+lQU6tMfc61ziGzQ==
X-Received: by 2002:adf:ff8a:: with SMTP id j10mr10224298wrr.334.1569423620189; 
 Wed, 25 Sep 2019 08:00:20 -0700 (PDT)
Received: from localhost ([2620:10d:c092:180::1:87a6])
 by smtp.gmail.com with ESMTPSA id o9sm9880475wrh.46.2019.09.25.08.00.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Sep 2019 08:00:19 -0700 (PDT)
From: Loys Ollivier <lollivier@baylibre.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
In-Reply-To: <BN8PR12MB3266A4C33D234165A0F2A978D38F0@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <1568714556-25024-1-git-send-email-lollivier@baylibre.com>
 <BN8PR12MB3266A4C33D234165A0F2A978D38F0@BN8PR12MB3266.namprd12.prod.outlook.com>
Date: Wed, 25 Sep 2019 17:00:13 +0200
Message-ID: <86ftkkzaiq.fsf@baylibre.com>
MIME-Version: 1.0
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Fix ASSERT_RTNL() warning on
	suspend/resume
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

On Tue 17 Sep 2019 at 10:12, Jose Abreu <Jose.Abreu@synopsys.com> wrote:

> From: Loys Ollivier <lollivier@baylibre.com>
> Date: Sep/17/2019, 11:02:36 (UTC+00:00)
>
>> rtnl_lock needs to be taken before calling phylink_start/stop to lock the
>> network stack.
>> Fix ASSERT_RTNL() warnings by protecting such calls with lock/unlock.
>> 
>> Fixes: 74371272f97f ("net: stmmac: Convert to phylink and remove phylib logic")
>> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
>
> I already sent a fix for this. Please see in -net:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git/commit/driv
> ers/net/ethernet/stmicro/stmmac?id=19e13cb27b998ff49f07e399b5871bfe5ba7e3
> f0

Ah good catch :)

>
> ---
> Thanks,
> Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
