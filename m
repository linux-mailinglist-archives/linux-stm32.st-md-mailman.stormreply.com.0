Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB573DC029
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jul 2021 23:22:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C99D8C57B6F;
	Fri, 30 Jul 2021 21:22:54 +0000 (UTC)
Received: from libero.it (smtp-18-i2.italiaonline.it [213.209.12.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34973C57B6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jul 2021 21:22:50 +0000 (UTC)
Received: from oxapps-35-162.iol.local ([10.101.8.208])
 by smtp-18.iol.local with ESMTPA
 id 9ZxxmK9xfxWyj9Zxxmk9Ao; Fri, 30 Jul 2021 23:22:50 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1627680170; bh=MIRh6b4BlqCNSWoiYnKkCTt6g5l7D5bTi3Cy1ajNnVk=;
 h=From;
 b=qcZjZfXvM43R5W6hKxrkHOoeu5uef+esI0zTC2CPyjMg0XjM68DSkxyF8R2hdAL+c
 LFRLTcDIoKdzQSvInsAfyDCuc1gln5zb91KfesU4hPRL72D8hByg5DTyYUNFOKyyml
 nno7iNqpGj6GzZamvbDHiCyXA31T0JDgoHpxhYjJMOkAyJb5ALzSmuu1qSarWP/7zI
 Wx5imZuwLgKMjVI5WxMTugs965rrPFkR9h74CiYp0lUUB/g/uJrACTtGyIKnMX4+5L
 Idk4YHf5869Q8IBt7d3uOxtU91XcwyiNLoklmegBhm6ukbX3E3XHe0J4Fmzz4UMew1
 ydR14enANGukQ==
X-CNFS-Analysis: v=2.4 cv=d+kwdTvE c=1 sm=1 tr=0 ts=61046daa cx=a_exe
 a=OCAZjQWm+uh9gf1btJle/A==:117 a=ph_LecQPeAcA:10 a=IkcTkHD0fZMA:10
 a=7HzzVYOy9wMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Clq-v84VBH2wsqQnF40A:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
Date: Fri, 30 Jul 2021 23:22:49 +0200 (CEST)
From: Dario Binacchi <dariobin@libero.it>
To: Stephen Boyd <sboyd@kernel.org>, Dillon Hua <dillonhua@gmail.com>
Message-ID: <1098513125.52015.1627680169782@mail1.libero.it>
In-Reply-To: <162767443658.714452.1239845779696330360@swboyd.mtv.corp.google.com>
References: <20210725160725.10788-1-dariobin@libero.it>
 <CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com>
 <1926284813.753014.1627553002984@mail1.libero.it>
 <162767443658.714452.1239845779696330360@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev34
X-Originating-IP: 79.45.223.112
X-Originating-Client: open-xchange-appsuite
x-libjamsun: rqnWdyeqWISTUy7ZHXC51GaKgPrQD3at
x-libjamv: YVidEiow+UM=
X-CMAE-Envelope: MS4xfEv2HuVu70s5x/tl23e8NZEi5LwPXWPJ+Qq1UOZ2efPVf9+ZByj7mXUuSW5Dg6ShVAMU27eU2I7xBjDlWXh82UdfPiT8lTDENDLRJxoE4+0bVzb/SbZ8
 MBppciMk2uXYHLu3HSHDPjKQx+5stpbqsT5G7tX26IOFVB3Wv+BsQ+lnbsp5GJD+ltSTqBGvsGOArWz3K87QBcMNoRqXx/ZZjXqtGEhb97PbQeoVNSCEOsd/
 tazRbpq59fxxFgbiXqL8gjL7wPYo2HXqijzkX5I/li2zVzK+wro7TMTfwtYfYHyCwtebyF7nau8/JdUDV68nrDg8GllVnSgNkXqyQSPQNhLPb063nKijbijy
 m4ifJLGwHs5+m+E//qh4kv2LtdP7indFiGnM+wVyq75/iuPlxZx3expKsFgxAZjHKmBpI3duX0n1mKyF9dH1Wg7/zWeVdrUELOoN9vpCf9buK3f1rDax1I+i
 qCxMzV5YZfhbKQcRp1i9Iz1i90GbRupohVd8Jn0NiAvBGmP2akzcpFRydiZA855/xlaHJvupf870u1gTfe1CSdSyh9qiHHUMIQwfoA==
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-clk@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [RESEND PATCH v4] clk: stm32f4: fix post divisor
 setup for I2S/SAI PLLs
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

Hi Stephen,

> Il 30/07/2021 21:47 Stephen Boyd <sboyd@kernel.org> ha scritto:
> 
>  
> Quoting Dario Binacchi (2021-07-29 03:03:22)
> > Hi Dillon,
> > 
> > > Il 28/07/2021 12:03 Dillon Hua <dillonhua@gmail.com> ha scritto:
> > > 
> > >  
> > > Hi Dario,
> > > 
> > > I have a similar patch [1] submitted last year.
> > > Unfortunately, it did not get accepted by the maintainer.
> > > 
> > > Just a reminder here for you, should remove
> > > 
> > > { STM32F4_RCC_APB2ENR, 26, "ltdc", "apb2_div" },
> > 
> > Thank you for your suggestion.
> > While testing the patch on the stm32f469-disco board I didn't
> > notice the white screen issue. I'll try to run the tests again. 
> > I will let you know.
> > 
> 
> Ok, I'll drop this from the tree.

The patch fixes commit 517633ef630e ("clk: stm32f4: Add post divisor for I2S & SAI PLLs"),
so IMHO it should not be dropped from the tree.
What Dillon suggests, if confirmed, should be fixed by another patch.

Thanks and regards,
Dario
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
