Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6230D35C7EB
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Apr 2021 15:48:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DD1DC57B79;
	Mon, 12 Apr 2021 13:48:34 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 882A4C57B76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 13:48:31 +0000 (UTC)
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MLR9p-1lF6Uu01DP-00IVSd for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 15:48:31 +0200
Received: by mail-wr1-f53.google.com with SMTP id c15so4066625wro.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 06:48:30 -0700 (PDT)
X-Gm-Message-State: AOAM531KIpekQq3LeZUw4UYFYRr092OZNG96TtykdQkyzwwL6LUZPOU6
 5u1S/SMT65vz4pDhl56176l4Dl7IWpeQgj7Z6II=
X-Google-Smtp-Source: ABdhPJzRKsuHD0/zPPicEoAxxZxBRdHEuIhju2Sjyhs6U3CtpsN5iiGtWexs/UH9JtENKAiPv0Fc8B0whXOW4BsN5Zc=
X-Received: by 2002:a5d:6a11:: with SMTP id m17mr32604882wru.361.1618235310703; 
 Mon, 12 Apr 2021 06:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210216074929.29033-1-patrice.chotard@foss.st.com>
 <1cd91834-6df8-a655-a3b1-0e16f5fe470d@foss.st.com>
 <52c32145-7f29-8944-58dc-dc2fb406ffb0@foss.st.com>
In-Reply-To: <52c32145-7f29-8944-58dc-dc2fb406ffb0@foss.st.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 12 Apr 2021 15:48:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1upDuztHd0pH_dM+OpMp8WtiMPAZN8p=9xxtCSVJGZMw@mail.gmail.com>
Message-ID: <CAK8P3a1upDuztHd0pH_dM+OpMp8WtiMPAZN8p=9xxtCSVJGZMw@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
X-Provags-ID: V03:K1:bDUdLRt557/47GWhfBKV90g3k7OZRNqcFHbvWyO9g/NJ+4zuzsO
 H16LdEPJyk2A9IIlqon02Tt6UgN1qd0R1AbAAFbVvTIYFFaro+irA8WmzGJR9gP1fBkYlVT
 N88QKrcHhaKraQoCfARcE/9GnljJqyeY7AGRYtDZaL8l9iqafApOLJv9c9oS1EgwDr7rqBP
 sa7jjieYMnrcgDzmMg/5A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:N3LCi+xXaG8=:ll0+TqJMGS72ZACSdBhT5l
 v+0eDpUJngYjOqKVTWSG9C1WB/++RolpevMy9TCAR7TsFv6oVMFWQktPNh/ncvPkwnvob64mk
 GM+6u8voeAit6dWk3lo6BsSmHgY2Ax62Lnc/4TZ4pDpTqGm84OEQkYbEANvh17JyK+qVQleqR
 wZQA5j118/bbkoU+/xBjkMUu9KitIAba0apMfDbIcFILgaaGZtBCDJcfIf2YtcA6ohVifbjjd
 sIsSJaazNcFqzdztHSD9fIRlmixF233WdVLPMfAbI4qNNuVWoGuJpjdn94lbn8kXAUNgn5kxv
 cuWZsAGi7dwG46HvHw/BgVrmModgyLE+v2Z4dxkaORzhsobJCxZIQc5fgfQQF9c9MVmBP5brp
 9H1HxRsR+SsHWOZ6ZCjp6D8p88LRxNXubSGk6E6LIMzZ2UAKgVO3Q67ow44PQLruasAUBmDJA
 iE6v7Iw8htnssQxwWRMSAXYJ1er49Vo=
Cc: SoC Team <soc@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RESEND PATCH 0/3] MAINTAINERS: update
 STMicroelectronics email
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

On Mon, Apr 12, 2021 at 12:19 PM Patrice CHOTARD
<patrice.chotard@foss.st.com> wrote:
>
> Hi
>
> I think this series has been forgotten, any chance to see it merged into v5.13 ?

It's in -rc7, but it appears that my email reply went missing when I merged it.

      Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
