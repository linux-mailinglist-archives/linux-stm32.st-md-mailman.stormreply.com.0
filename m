Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5324D1CE6
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Mar 2022 17:13:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DCF1C60496;
	Tue,  8 Mar 2022 16:13:50 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6284EC5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Mar 2022 16:13:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BE394B81AF5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Mar 2022 16:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA18BC340F7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Mar 2022 16:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646756025;
 bh=jXBz2f9tChtMFtKyOyZ4Q3h2mhlA6Onv+Izw71UufzM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UnxR/RJqQQzmrMWTZA3iu/62twkicgqrZxqPlgt9nko9YFkMPdzqQdhKoUlmtE+sA
 LsIrzYMHxXsjIhdqok6IGMj9Rq+1a6gWFNyB+Z+70KJtOOsqpOWNvFYljWZILzQJFj
 LCxFHq/7Of/gQbIlyvcaL2wihl5o1JEWd4jIsnhVX/JV05yIIeslM8V9wzZWNaplmt
 l79agZVVIiUMcMfcrko3HrLFLt+J5HqqOBuZ0IiRMIWFolhZ93VD/j8oJUDeiczv1Y
 ubHFl6HiKUy6yf1IWu6VGT4SBvF3/AqCtwo8kPFLx0yRK8d3B/jrDwCqPJscQUbEO6
 W1eCuj5HSAGvw==
Received: by mail-ej1-f49.google.com with SMTP id kt27so40486774ejb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Mar 2022 08:13:45 -0800 (PST)
X-Gm-Message-State: AOAM5311yPDxipWypZPK70XF5SYLIuzobiK+1tDEZu8znFf6JRsPckx9
 tSRqanUfayjtYE7yiZ9dlUMKxVpi4zahPGsHRQ==
X-Google-Smtp-Source: ABdhPJwgjUirqReFAL6N3dmjsf1cllJkmUJ+TfjKooqF93ar8SLKSqqP4oME9QxeInU2UXWZqXn7edss5wrmTCZW8Po=
X-Received: by 2002:a17:906:181a:b0:6d0:ebf5:c064 with SMTP id
 v26-20020a170906181a00b006d0ebf5c064mr13580319eje.82.1646756024055; Tue, 08
 Mar 2022 08:13:44 -0800 (PST)
MIME-Version: 1.0
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <CAAOTY_8CTewRw2Le9RjXoCrqF8AyHD0_p01EMiJ2QQ63yf-HKQ@mail.gmail.com>
In-Reply-To: <CAAOTY_8CTewRw2Le9RjXoCrqF8AyHD0_p01EMiJ2QQ63yf-HKQ@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 8 Mar 2022 10:13:31 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+qqCHvzg8uKx6xaD4cDJJq7hOUvJGME18V7cuLW5OPqQ@mail.gmail.com>
Message-ID: <CAL_Jsq+qqCHvzg8uKx6xaD4cDJJq7hOUvJGME18V7cuLW5OPqQ@mail.gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH 0/3] Fix MediaTek display dt-bindings
	issues
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

On Fri, Mar 4, 2022 at 5:49 PM Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote:
>
> Hi, Rob:
>
> Would you like to take this series into your tree, or I take this
> series into my tree?

I can't. I don't have the broken commits in my tree.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
