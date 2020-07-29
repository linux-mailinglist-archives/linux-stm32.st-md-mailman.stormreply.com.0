Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF742325C1
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jul 2020 22:01:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C511C36B29;
	Wed, 29 Jul 2020 20:01:48 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B326C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 20:01:45 +0000 (UTC)
Received: from mail-qv1-f46.google.com ([209.85.219.46]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MgNlH-1khtf52WoJ-00hyFQ for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 22:01:44 +0200
Received: by mail-qv1-f46.google.com with SMTP id j10so4786699qvo.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 13:01:44 -0700 (PDT)
X-Gm-Message-State: AOAM533EFIzFM6w+mGqy+l1QoURO9I4nFgRmqUdA+mankVch9WE0+Bg2
 dbNQWPPCp4FfMQqrue+UytbRSjLL405ID5VgrLs=
X-Google-Smtp-Source: ABdhPJy0Ua6F8cJWKsPP2p9baaRfve0Dq+caOpEYZQuW5KpGIU4VwtaO5Yvv8AbCmTFZHyZTlC3sodaIaAmZei/ujVY=
X-Received: by 2002:ad4:450e:: with SMTP id k14mr3013292qvu.211.1596052903435; 
 Wed, 29 Jul 2020 13:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200729160942.28867-1-krzk@kernel.org>
In-Reply-To: <20200729160942.28867-1-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Jul 2020 22:01:26 +0200
X-Gmail-Original-Message-ID: <CAK8P3a38VC5UD+1HHRFWnafM7ZLMc34Ay23FUCjjgiz46SCV=A@mail.gmail.com>
Message-ID: <CAK8P3a38VC5UD+1HHRFWnafM7ZLMc34Ay23FUCjjgiz46SCV=A@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:jUuTYVra5oVApqAR7fiVBRRAu6egz7RGqQwR8dn9cphL7d6FBsF
 Q5Si52rFGTGIO1uRzLl7eRt0XekV+ohYk5TvPchI54KAO5MNZbUpBqRd6FmhGlpTEO3E+mN
 biwns8U6a4JEcX2uDCVEwPDSV1c5uCAb2IA/NKSj/c5d1FsyM/PJcWaLALW9OeKzA/rSrVQ
 d8qEvzNsRyYQTP+bsSLqA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pnh/aDybRFQ=:ev8jHAQ8EcYorMP4xmmlSS
 Wnb9IN6+hLHkX5DZdNhtiE7Ks0Mh1gKvRRgccUCggjf5xmxUWGx16+090sGUqR+9i+WPAecce
 O3YINHqhNbXi+SttWWk9f4HyQIW1lnlGiB97V4c/jUTqf3WS3UNFmJG3jjSip3gy/T+7fIU+g
 eoOVVS57B330gPL77EfQntDlzWxWpmMQgUsc44fvkCKA3SlDtD77CuA86ekN2f/nHaYby+ucK
 58FPsNdGIBYhdRwWif9rA/RLuOson4BaqigNCASOISbSG7y3Wg9NkXxnH9RYeDIjFJlSPyjD4
 rCiKbZ4l33OBwHblbyDW5SZxOtcRucDsIyznG1MUBexwE3jEc2WEApE4OaBiY5EYsdNVh8z3Z
 aOmr9eDfBYK8jrOmog85niHF5SISg3PwOtN/zJGuFlvzP8Zy1A3oQ2jmgTqjWSFPfs33vx3Ow
 5a8xLZFsFoWMsGx9d9SkUhYz4mtc1N70XcOhPeVG5ommv3umORlW9zLKvqiS2ef/5lSEE/h3A
 6WDa/weE/+JFXcS+X2213Bg9XpGVzWl+IeY1G+AJ1CaUpGZ6yidZ9aMNyCDT7TneSGxwuvo9A
 Cb4xrpa4L4A+soI/Fw77+IOFRUPVkRnj2PNbwLhQpaDYYDP2SRLWV15Oxa6aygKYxqNTEU62/
 Jck1Q6EeF6DBYuTBBZc5aXw2dcBlRkPfDJ12nPLuFlhNek9kDnpWMoPqbqenT5Do6RPq7RCng
 ztxZVRrONqq4s7JQSK1PyK7BBmPL0cf7P1pXhXc4mX85JnTbzTke01hFpfCrl+EExUtay8FMd
 MP3RtYps/r07vaHd7M8BlxrwObovJFzXeu1lx10SZm+UIgJHWNVm1VZ3Wc6lBN5luEXAe7E
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <snawrocki@kernel.org>,
 Cedric Roux <sed@free.fr>, Russell King <linux@armlinux.org.uk>,
 linux-stm32@st-md-mailman.stormreply.com, Lihua Yao <ylhuajnu@outlook.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, Sergio Prado <sergio.prado@e-labworks.com>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Simtec Linux Team <linux@simtec.co.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Vincent Sanders <vince@simtec.co.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [Linux-stm32] [PATCH 0/7] ARM: samsung: Cleanup of various S3C
	bits
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

On Wed, Jul 29, 2020 at 6:11 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Hi,
>
> I tried to cleanup few warnings in S3C machine code which lead to
> finding some bigger issues.
>
> Patches touch mostly the ARM Samsung machine code except patch #1 (clk)
> and #5 (watchdog).  They are independent from each other, except
> some conflicting lines.
>
> The last three patches would welcome some testing... as I did not
> perform such (lack of S3C hardware).

I have an older series that I mean to repost. Please have a look at
the s3c-multiplatform branch of
git://git.kernel.org:/pub/scm/linux/kernel/git/arnd/playground.git

The patches in there need to be rebased on a newer kernel, which
should be easy, but they will conflict with your work. If there is
anything in there you can easily pick up into your series, please
do so.

       Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
