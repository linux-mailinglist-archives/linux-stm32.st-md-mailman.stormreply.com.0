Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 799E8563453
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Jul 2022 15:25:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C2FEC640EB;
	Fri,  1 Jul 2022 13:25:53 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0D93C03FDF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Jul 2022 13:25:51 +0000 (UTC)
Received: from mail-yb1-f171.google.com ([209.85.219.171]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M9npV-1o21Jy1B81-005raa for <linux-stm32@st-md-mailman.stormreply.com>; Fri,
 01 Jul 2022 15:25:51 +0200
Received: by mail-yb1-f171.google.com with SMTP id r3so4042936ybr.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Jul 2022 06:25:51 -0700 (PDT)
X-Gm-Message-State: AJIora/HWZoYLvdi8ZmR4dZfLmFrMMYGgplmTQLU/YPD4RqO7nx9LQab
 uXQFGYT6B2h9e6d1U4DYzc29vscjv82BeTEV43g=
X-Google-Smtp-Source: AGRyM1v50P5NPGozA3wyPyk4TcCAReOb9wjqGQSZyh2WJyG0U+W5GErPSuI2I+An1Dwcn17/8FW8lW4eU5gRRNDEo3g=
X-Received: by 2002:a25:8202:0:b0:66b:15cc:cacd with SMTP id
 q2-20020a258202000000b0066b15cccacdmr15837633ybk.452.1656681950096; Fri, 01
 Jul 2022 06:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <85e47007-bfba-7a64-db75-893b0d20d025@foss.st.com>
In-Reply-To: <85e47007-bfba-7a64-db75-893b0d20d025@foss.st.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 1 Jul 2022 15:25:33 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2OC=G-gw_Nny-ATj5dHtVcLrGHTK9qvs+QPUw52RWxhw@mail.gmail.com>
Message-ID: <CAK8P3a2OC=G-gw_Nny-ATj5dHtVcLrGHTK9qvs+QPUw52RWxhw@mail.gmail.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
X-Provags-ID: V03:K1:aSyHELo9u8vV7eatTdIiU4vdBlp+xRG5BFgIU7J1jpjcq59xeqe
 tS6mMAES+thxun4Phola0FqhDmXQbpItB1V3DkMKd99bJNIzidcSxbYCk8IhbHWni6nI/gl
 MaYIrKvMPF6Idl7BUfnTpCIU7Pp7wA0VGmlhrN9N4cGTZd+I/k+xIUnb6YeqcEXLegqme4x
 k2U9cal903UH5w2+TYYVg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bN8aOBDMEbc=:qy+sUyVVO1STn1n1lDfiA+
 hgW0F+2Bd5vNU00fiEj0Eet70Zo7X+bzs4KJtt1WW0uSfya+yoHSNOWOGwwESGdDA0AuRDPff
 Eo4P0OE7uXMkw7fvQnNjWl885g0dzTWRjKOUfVWai2z7a4Uqh+PhIETzFapP5AHm5u6TgHtB+
 Ouo/OHsoYY84qJM4H2DMhz1g54fFqKPF7MTCuSlJ612g3P0WA4j7hJpTqUKhg+cw0rd/YRlEJ
 cUr4rTcPrcZkYiL3qywNUqCKnPVi5ZNpVRCSpanUELp5p4evZwNcC25Vpt17hpzw6WZj3Zsnp
 OfDSzYIB8tsg2lE+7Iu1rFjGULSDHWjoc0HSaVO5irhC2dDCLAj/faKvKAfBeMSj+b79+g07d
 iB8M7Ja82N6Fos7/cJBJpVZv+WiFAKUs1XJVeVsYzZ+xokqneHeyHFl/uQs1PMYE3oecX4QDv
 ToHKwWlMDLplOKePrx9g/oJO/qrLR9IeayujPorG/Sy2Zo+nwxSBcDa89Jnizt2LjCVg5yyvG
 KQCMSoCHM8wlPHBnZGO30PctpfnPDVthtXdTg8YR8kQa6vpJjX2M0DfweLh2bjKG98EPIzQbY
 RnKbwFbpyKBgHjy5qx8XXwYBEAjfb9kWVusoDqDykioOhgTxdVWLs5YUAGGZN2h9xdi0FxQnc
 dUmqbHgoqQAessW9x4GjxQ/naJwRCnwFeiu5IhckxXydfWpMxtiHApzLO9AZ2qyt0l1IVKu1W
 fIC8aiDzNPpyIgjF5MkPSR+NksBs1bbpSzbUeWliqoSR2l28hQKcjDMTN7rA8Hcl8vLeDf2TX
 xbwiS2vcQ4+YmnSTD/+SiHtnYyN6hWM2b3U55iXTxCEar4+XEycfdCxyrQHWGq/Qyw4QLD2AC
 bFayx1G8j0NwOqo3omwg==
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

On Fri, Jul 1, 2022 at 2:05 PM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi ARM SoC maintainers,
>
> Please consider this second round of STM32 DT fixes for v5.19 cycle. It
> mainly concerns fixes for SCMI version of ST boards introduced in v5.19-rc1.
>
> The following changes since commit ea3414e1249ea35bc02debe28d4cbfeb6261657c:
>
>    ARM: dts: stm32: move SCMI related nodes in a dedicated file for
> stm32mp15 (2022-06-07 17:22:21 +0200)
>
> are available in the Git repository at:

Hi Alex,

I get a merge conflict because I had picked up the "ARM: dts: stm32: move SCMI
related nodes in a dedicated file for stm32mp15" commit from the mailing
list, so it now has a different commit ID from the one you are based on.

As far as I can tell, the patches are identical, but since the files
are modified
further in your tree, this confuses the git merge algorithm and leads to a
somewhat ugly git history with two identical commits if I fix it up.

Can you rebase this pull request on top of v5.19-rc4 and resend?
(note: don't rebase the non-fixes pull requests unless you have to).

      Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
