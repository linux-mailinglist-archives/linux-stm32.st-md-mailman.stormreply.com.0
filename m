Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 607C0565560
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Jul 2022 14:31:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 176E5C640EF;
	Mon,  4 Jul 2022 12:31:09 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04A6FC640ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jul 2022 12:31:07 +0000 (UTC)
Received: from mail-yb1-f180.google.com ([209.85.219.180]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M4K6z-1o8cDC0ggj-000J7q for <linux-stm32@st-md-mailman.stormreply.com>; Mon,
 04 Jul 2022 14:31:07 +0200
Received: by mail-yb1-f180.google.com with SMTP id l11so16588836ybu.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Jul 2022 05:31:07 -0700 (PDT)
X-Gm-Message-State: AJIora9xkeIDAfyRrMPi83JT8U4YgHc+SJlN2bZVrVv3R8zVQLIOKuHH
 DBWhTT3+BCQQsVoteLScLII/uCl8Do6QmUrB/W0=
X-Google-Smtp-Source: AGRyM1uIsB5p1OtXGjLSwI0R54AfR1c1LsYfX6zy+YyIgV3P1Zr8/Ygsw9x+P8wejb5hxbdNzj2H49PkcBqYdnJXq4g=
X-Received: by 2002:a25:7c41:0:b0:66d:766a:4815 with SMTP id
 x62-20020a257c41000000b0066d766a4815mr28599498ybc.480.1656937866036; Mon, 04
 Jul 2022 05:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <85e47007-bfba-7a64-db75-893b0d20d025@foss.st.com>
 <CAK8P3a2OC=G-gw_Nny-ATj5dHtVcLrGHTK9qvs+QPUw52RWxhw@mail.gmail.com>
 <a1b80bbf-11a6-d5f7-ce40-04a644039eaa@foss.st.com>
In-Reply-To: <a1b80bbf-11a6-d5f7-ce40-04a644039eaa@foss.st.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 4 Jul 2022 14:30:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3PUzuKYUGmsFDD4GCK1-1n1rKpAFDo0LRKxT-HdoTyAQ@mail.gmail.com>
Message-ID: <CAK8P3a3PUzuKYUGmsFDD4GCK1-1n1rKpAFDo0LRKxT-HdoTyAQ@mail.gmail.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
X-Provags-ID: V03:K1:6a6LNvImW4I/6HaG8YihDwa8ZzoS8HnWVT+GoS5CMjAUpz2deKb
 KdVlwrwQtQmKmD+1X6kN52x9pW/sV0ayS1UhcBFUYXGVdNni90y8/hno2+l+fVtjIT2GLoV
 Px2VH07/Jb1CS4yQkXAVxQ+7/Pfk11z79IuIOPvFMupfzE3fpkHsjcCv/znYVIxCzmaPW3V
 qMSzsZwH3WLowUjiv6Vxg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:q33jBlEo39k=:fZ2XotAaICQCE518hjjQNt
 EeA5aMIC32phUBLDl2EYdidkjjFpXzXqDBPE8rLvYq1EirDhVeMfZs/CrvHWBxNgeFh215bw/
 2nHFU2wBPNSXXVxskudcIE5hRI0R+m2iSXLz6NJuKcW+9UPxmXnrxOGDtoF16Qc3FbIR14tcQ
 9vmN5odsdVo6pnvx111NYfEgsdoNBapNJar+PZ6O5L3BwVvuo5sXjxA2Bqcf5BP/tRlPiZSTm
 ccEymRJtf1VxhiG1U1ITjD5uWb/ccKFVVSKMHKJkYlorn8JlxDh0XnipOFsXUhLVX1LfV/pKF
 Avehn2b0shUZ3l5D3eEsTF3FFtXc6t3vxBs+UvDZBmUat+n3mhpIKd4usHQHbuB/KF4oW3RIv
 HjFtD6zZC4RW5QDv/3In//g84teAU8jgwzkzn/ZIgqPBmYs8L2hBjoUqqpaZnyMbRnUP9h/eB
 29hjVyMT82XnKTfmqPy0YqNP8GKJIoJlfob/xhJOaLNkD2Dqe5kQup/qs8g0DQco3z5dHf2lL
 CI8umLMtE7ln8V7nGy2GEA5iOEwEcC9quVxp6+Y5sC7DwS5VT1l5FtxNn1MwBgbonCrRSmEM9
 8IkNFDn+0HRo9vk8vHkUV5szjXbAXUojuqnSmUjB91MrqqG8Rsc2L9qoWzFJqayDrXqkio16S
 mvNFmJW9o9vjjJr+09zrIzxZUOf9ykYvzS2XFTmYe+Hng6XJaWav7l5hpMzvkvEZdQgfLKWDX
 0Z1Y8J7BVv7dXSteA1lYaDBAmvEbNWZisLDYLx3DmilYiRXwAEznSayYnXc4kWIcsUsUK6y/1
 +a787pzD+XHBuaH6oMNPknHerJoWZvKEmcXaQOQc/DRhp9rEs6tajxsX96oxugE90uE83TSgn
 ZX5unAYpqb/6UcojOgo3843qRv56kuNQsynAwlXN8=
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
 SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 Olof Johansson <olof@lixom.net>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [GIT PULL] STM32 DT fixes for v5.19 #2
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

On Mon, Jul 4, 2022 at 9:52 AM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
> On 7/1/22 15:25, Arnd Bergmann wrote:
>
> Hi Arnd,
>
> No pb, I'm going to send a v2.

Applied now, thanks!

> If it is not an issue for you, I would
> prefer to rebase also the stm32-next to avoid conflicts during the merge
> on your side.

Yes, I see  the same problem there now, so rebasing that as well is the right
solution. I started my other branches late, so rebasing on top of v5.19-rc4 is
fine, just no later than that.

      Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
