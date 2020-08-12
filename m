Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 279042428A5
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Aug 2020 13:28:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA3B9C36B26;
	Wed, 12 Aug 2020 11:28:54 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 404CDC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Aug 2020 11:28:53 +0000 (UTC)
Received: from mail-qt1-f180.google.com ([209.85.160.180]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N9MlI-1kkKiu2Q2W-015FGr for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Aug 2020 13:28:52 +0200
Received: by mail-qt1-f180.google.com with SMTP id w9so1153110qts.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Aug 2020 04:28:52 -0700 (PDT)
X-Gm-Message-State: AOAM53224yLCr5SFHhKEc6fmGudMXfu3rxvZm5cU1o3TfGI2TBv3p4+v
 BRI2C+IvRL89N7IQ8MDA7el0AYEtu692x0HzY3E=
X-Google-Smtp-Source: ABdhPJxsW8KvhXUS1ojoIaqN362ISA/JDUik1npds+V9z2Z/6a42INf5aMjjkxMPeXquVPo4e7r0h6AJVgmGkNoG4Tw=
X-Received: by 2002:aed:33e7:: with SMTP id v94mr5752270qtd.18.1597231731435; 
 Wed, 12 Aug 2020 04:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200804192654.12783-1-krzk@kernel.org>
 <20200804192654.12783-14-krzk@kernel.org>
 <159721917443.33733.7919188364233003142@swboyd.mtv.corp.google.com>
 <CGME20200812091510eucas1p15944eb26bb496e20b9fadd609063a490@eucas1p1.samsung.com>
 <CAK8P3a13u0KY0jzxNLs=irTs6ZSXyObKKTp-8KEmowcOZrZXxQ@mail.gmail.com>
 <8066413c-367d-2f8d-3e7b-dacd954675be@samsung.com>
In-Reply-To: <8066413c-367d-2f8d-3e7b-dacd954675be@samsung.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 12 Aug 2020 13:28:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1xXe56k5nKuCJ-25h1VqWKRb9JGnFrr=SPg_icay-vZA@mail.gmail.com>
Message-ID: <CAK8P3a1xXe56k5nKuCJ-25h1VqWKRb9JGnFrr=SPg_icay-vZA@mail.gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
X-Provags-ID: V03:K1:43i3xilUWK1YLAppTmbdn7OPZew1U+kMphFEsk9jYzByVRr1RbQ
 bkBO2PmMR243LaqpT54fxQnFuiEy6L7EoqCQkt9QaJxI2vVLG7xDoj9sRMJiodDtoL8cc5z
 sgkG5lqFS4/mBcZB4fi8lps6dfrYbowftvSEONsWk17GZxUo5euoDWk6bOVzfT0lBUxEa54
 Dr5Ek1sUlNNmXdgf5Qxxw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6LnpGof8kz0=:qqse75H6oLrFX55qGV0egW
 BEV9FkNKD1XdPAAzDiWuqdUeuyc0mStzdcNGNTDx3VpHnMZiThKzDkfJOpvyqw7g0VqfX3kT1
 7o7RsMoMdW4BEx1sUaU0Q6ha0jdMAvrUvLoQkRBy82CKEAvokqhfDCFMIi0oa6PaZsFuSzRmj
 Y4rn2Cf2ZK06sDk07RQQV3fwvzq9PkiqFARi82lPyoshrZZ/W3vlpd8qkYVQZBR9F910fjb5n
 m780FiBHbqwYi9ETsXCSHqm/lpNgMxr/+LY4o1GajQ+LmiUwivjF97Wo+oabrENXroeiEYKJ8
 MbAxkAtH5/gOq1deXJ02wb0j0jL9MVmiT0hBRN4DNu9LkSkU76COXjOvgbaUy1In0QgWMS3Xf
 /GIv1BKJ4NmKXAYUp/83VbjPftZF6QYIhIGbSPSFNnRlORDSk0PMAG0UyDZ/sIMMCi7bAvOSU
 IriljOufp6hd5zVQthbS2+zwpr03SObgefxL0uZgZykdKg0mhoxZkCsXtBgJYYIMUPDicJA4y
 dSy1aGdMvZD4co7bBARBJ7EXwtmMMY7Sl+whpDqKsmf8MQ4Is6lzJbow5SN9iXiTyH8gbwwoZ
 vP1P5X9Gi1OfhI6w+8e3Jx3V9fSSDnD1A4v33cweZFt833LphCEHI8S08jNyT71UPOcqmzsVv
 YQBLgTUyQ2tAH3+NejFSr78ClcinhPVqIos5rz1ij7dSxPLPvwCAAszztFTbMNDBwbbcLltd/
 9sIrIYBqQu0Rur35L17VKWr1f6NRAfbnukhvqbwzvyioO4qXlSZy3R+qL12FRD6Eqihx7lZmY
 sS/XPYuHKywzmcl8Qle97DqD8qTy+QRe5UFuMVsx+/gQoJxVpg/aZPwwWxPCQ7y0Tbl607ClK
 kN4LV3ayRKmGISGEq6Cfas4JVkLvK+YOiVt7RmqCekvjQZA7ecaG5mPJVYMxZZUuNYmVbBwgf
 y684VXVLGzGu/33IH0RrSRtPJbzpR5QJgVutTm5uVmk9AZ2a+ud6w
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <snawrocki@kernel.org>,
 Cedric Roux <sed@free.fr>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Lihua Yao <ylhuajnu@outlook.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Guenter Roeck <linux@roeck-us.net>, Sergio Prado <sergio.prado@e-labworks.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Simtec Linux Team <linux@simtec.co.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 13/13] ARM: s3c24xx: camif: include
 header with prototypes and unify declaration
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

On Wed, Aug 12, 2020 at 12:46 PM Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> On 12.08.2020 11:14, Arnd Bergmann wrote:
> >
> > It seems there have never been any callers and the entire file
> > can just be removed, with the rest of that platform_data header
> > file moved to drivers/media/platform/s3c-camif/.
>
> Yes, it seems that patch never made it to mainline:
> https://git.linuxtv.org/snawrocki/media.git/commit/?h=testing/s3c-camif&id=355cbf835aff2aabf78390931cbbaa608af77967

I suppose it would still apply if anyone was interested, but I see your
point.

> I doubt there are still users of camera on the s3c2440 boards
> with current mainline kernels, if any at all, there are much
> better HW alternatives right now.

I see two board files (and no DT) instantiate the camif device:
NexVision Nexcoder 2440 and the FriendlyARM mini2440.

Can you say whether the camif on those would actually work
at all without your patch? If not, we know that there are no
users of that driver and could either drop it completely or move
it to staging for a release or two.

     Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
