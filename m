Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C993DA0C9
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jul 2021 12:03:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2891C597BC;
	Thu, 29 Jul 2021 10:03:24 +0000 (UTC)
Received: from libero.it (smtp-32-i2.italiaonline.it [213.209.12.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE944C5719C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 10:03:23 +0000 (UTC)
Received: from oxapps-18-104.iol.local ([10.101.8.114])
 by smtp-32.iol.local with ESMTPA
 id 92ssm1HOrPvRT92ssmema3; Thu, 29 Jul 2021 12:03:23 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1627553003; bh=Xs8eN08sziDm55rnNhVcpr91uudi9y0YZFX/Jrmocrk=;
 h=From;
 b=gLmvxwlPiY24DoSFqfFTPkm4lFPPbkprab5NVSaN2KpUFY/Qwj3WkDtf2MsTyW6IK
 dL/Ci9lN8BKQlSyZqjHTbXLAQd8MgnTSvM/EMx7/5Pr6jlEgP69Ypk+j5KVczR/9Yp
 AAjcqLSUSG7k1jHimTwBsWya1vEGTAcjRe2uRAmkFtDoV2y0xPe5ZTjYWu9XVhKAud
 DkNrLvdmDmDxQkQuLZxoVDloVgz7yRRpxGvu8qWa43CtQd+U7ZwMuK6TEBG0IqR7W2
 k5hFekwOARHlrQHDN+GCCQeLOz6PaTY0k+IfbCi1FkCOD0y+mlkyjZEab7UgU7cuPN
 d0BHcqUmVJYcg==
X-CNFS-Analysis: v=2.4 cv=NqgUz+RJ c=1 sm=1 tr=0 ts=61027ceb cx=a_exe
 a=/Ybp6/jOcaliI5wkn0kplg==:117 a=C-c6dMTymFoA:10 a=IkcTkHD0fZMA:10
 a=vesc6bHxzc4A:10 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8
 a=SU5VBOwo6aiSI8lX5M4A:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=T3LWEMljR5ZiDmsYVIUa:22
Date: Thu, 29 Jul 2021 12:03:22 +0200 (CEST)
From: Dario Binacchi <dariobin@libero.it>
To: Dillon Hua <dillonhua@gmail.com>
Message-ID: <1926284813.753014.1627553002984@mail1.libero.it>
In-Reply-To: <CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com>
References: <20210725160725.10788-1-dariobin@libero.it>
 <CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com>
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev34
X-Originating-IP: 185.33.57.41
X-Originating-Client: open-xchange-appsuite
x-libjamsun: 6kzYpe1z67xWIV8DNCxeZK4Q/cqaATWL
x-libjamv: WUhzgF/beUU=
X-CMAE-Envelope: MS4xfMWZymzk0e23HLw9svR11Oa7lRx/VBBLXeLj/dXrKh69/UUQXFHRM3Thl5XQkSyXAKtZ8G17KIoB2/A708uJe0M1SvAjDmjA9QbvJxwVM+00Rp7/2hNR
 jMPU7wS/bC4yCBOZdISaBQGXM64kqvbIWMeBNMlxv5+p8BTQwGdWPxCpa5Q3E4VkxEz3Sd+FpjqEGItRNqRzXVtZ+VTAIBT0tW88u/jg4CCtUJ1wNFGLQXN8
 CPdHqlLXPOUrzCew8CxoiQli2T/JMZAlEwgIJyq6Si0VLtHKhH74lA6ywqH6YF7QnG9hbnCVhrQAvPHslfHncLWOi8xBPxYejhuNEs/C4yf0JiBhECeqzZ7/
 dY56WZuMVceSQqvJYusAN7nM8BqNgnFu5OPi8qCE5bZaa67ugZrgFxJvX4G5uhmoy62NjTv4x7SfUOjaeVyddd98EzYuljbd5B+FAhfnsGI/jhPhqAIg1ZFF
 UPZW7QkjXjiXRQqb78orlBN+qbPx8SDawMCodz6na+giEN3R0lUmEZVUdkSnR9PhrKUFRPb5KZObGMe5lSj6v7PmFboXQeCWg7bvbg==
Cc: Stephen Boyd <sboyd@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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

Hi Dillon,

> Il 28/07/2021 12:03 Dillon Hua <dillonhua@gmail.com> ha scritto:
> 
>  
> Hi Dario,
> 
> I have a similar patch [1] submitted last year.
> Unfortunately, it did not get accepted by the maintainer.
> 
> Just a reminder here for you, should remove
> 
> { STM32F4_RCC_APB2ENR, 26, "ltdc", "apb2_div" },

Thank you for your suggestion.
While testing the patch on the stm32f469-disco board I didn't
notice the white screen issue. I'll try to run the tests again. 
I will let you know.

Thanks and regards,
Dario

> 
> from stm32{f429, f469, f746, f769}_gates[]; or else
> run into white screen after the kernel enters the console.
> 
> This patch was verified by Patrice Chotard, you can
> find  the history from [2].
> 
> Hope you can help to submit a patch to include [2], thanks.
> 
> [1]
> https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
> https://lore.kernel.org/linux-arm-kernel/1590564453-24499-6-git-send-email-dillon.minfei@gmail.com/
> 
> resend this year:
> https://lore.kernel.org/lkml/1590378348-8115-6-git-send-email-dillon.minfei@gmail.com/
> 
> [2]
> https://lore.kernel.org/lkml/6915fa2a-e211-476f-8317-6825e280c322@foss.st.com/
> 
> Thanks
> Best Regards
> 
> Dillon
> 
> On Mon, Jul 26, 2021 at 12:08 AM Dario Binacchi <dariobin@libero.it> wrote:
> >
> > Enabling the framebuffer leads to a system hang. Running, as a debug
> > hack, the store_pan() function in drivers/video/fbdev/core/fbsysfs.c
> > without taking the console_lock, allows to see the crash backtrace on
> > the serial line.
> >
> > ~ # echo 0 0 > /sys/class/graphics/fb0/pan
> >
> > [    9.719414] Unhandled exception: IPSR = 00000005 LR = fffffff1
> > [    9.726937] CPU: 0 PID: 49 Comm: sh Not tainted 5.13.0-rc5 #9
> > [    9.733008] Hardware name: STM32 (Device Tree Support)
> > [    9.738296] PC is at clk_gate_is_enabled+0x0/0x28
> > [    9.743426] LR is at stm32f4_pll_div_set_rate+0xf/0x38
> > [    9.748857] pc : [<0011e4be>]    lr : [<0011f9e3>]    psr: 0100000b
> > [    9.755373] sp : 00bc7be0  ip : 00000000  fp : 001f3ac4
> > [    9.760812] r10: 002610d0  r9 : 01efe920  r8 : 00540560
> > [    9.766269] r7 : 02e7ddb0  r6 : 0173eed8  r5 : 00000000  r4 : 004027c0
> > [    9.773081] r3 : 0011e4bf  r2 : 02e7ddb0  r1 : 0173eed8  r0 : 1d3267b8
> > [    9.779911] xPSR: 0100000b
> > [    9.782719] CPU: 0 PID: 49 Comm: sh Not tainted 5.13.0-rc5 #9
> > [    9.788791] Hardware name: STM32 (Device Tree Support)
> > [    9.794120] [<0000afa1>] (unwind_backtrace) from [<0000a33f>] (show_stack+0xb/0xc)
> > [    9.802421] [<0000a33f>] (show_stack) from [<0000a8df>] (__invalid_entry+0x4b/0x4c)
> >
> > The `pll_num' field in the post_div_data configuration contained a wrong
> > value which also referenced an uninitialized hardware clock when
> > clk_register_pll_div() was called.
> >
> > Fixes: 517633ef630e ("clk: stm32f4: Add post divisor for I2S & SAI PLLs")
> > Signed-off-by: Dario Binacchi <dariobin@libero.it>
> > Reviewed-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> >
> > ---
> > I added Gabriel Fernandez's 'Reviewed-by' tag as requested by himself
> > 15 days ago at https://lore.kernel.org/patchwork/patch/1450964/.
> >
> > Changes in v4:
> > - Really add Gabriel Fernandez 'Reviewed-by' tag. In version 3 I forgot
> >   to add the tag.
> >
> > Changes in v3:
> > - Add Gabriel Fernandez 'Reviewed-by' tag.
> >
> > Changes in v2:
> > - Change  'u8 pll_num' from 'stm32f4_pll_post_div_data' structure into
> >   'int pll_idx'.
> >
> >  drivers/clk/clk-stm32f4.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> > index 18117ce5ff85..5c75e3d906c2 100644
> > --- a/drivers/clk/clk-stm32f4.c
> > +++ b/drivers/clk/clk-stm32f4.c
> > @@ -526,7 +526,7 @@ struct stm32f4_pll {
> >
> >  struct stm32f4_pll_post_div_data {
> >         int idx;
> > -       u8 pll_num;
> > +       int pll_idx;
> >         const char *name;
> >         const char *parent;
> >         u8 flag;
> > @@ -557,13 +557,13 @@ static const struct clk_div_table post_divr_table[] = {
> >
> >  #define MAX_POST_DIV 3
> >  static const struct stm32f4_pll_post_div_data  post_div_data[MAX_POST_DIV] = {
> > -       { CLK_I2SQ_PDIV, PLL_I2S, "plli2s-q-div", "plli2s-q",
> > +       { CLK_I2SQ_PDIV, PLL_VCO_I2S, "plli2s-q-div", "plli2s-q",
> >                 CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 0, 5, 0, NULL},
> >
> > -       { CLK_SAIQ_PDIV, PLL_SAI, "pllsai-q-div", "pllsai-q",
> > +       { CLK_SAIQ_PDIV, PLL_VCO_SAI, "pllsai-q-div", "pllsai-q",
> >                 CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 8, 5, 0, NULL },
> >
> > -       { NO_IDX, PLL_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
> > +       { NO_IDX, PLL_VCO_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
> >                 STM32F4_RCC_DCKCFGR, 16, 2, 0, post_divr_table },
> >  };
> >
> > @@ -1774,7 +1774,7 @@ static void __init stm32f4_rcc_init(struct device_node *np)
> >                                 post_div->width,
> >                                 post_div->flag_div,
> >                                 post_div->div_table,
> > -                               clks[post_div->pll_num],
> > +                               clks[post_div->pll_idx],
> >                                 &stm32f4_clk_lock);
> >
> >                 if (post_div->idx != NO_IDX)
> > --
> > 2.17.1
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
