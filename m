Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C11234CB31B
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Mar 2022 01:00:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 642E6C5F1EE;
	Thu,  3 Mar 2022 00:00:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C740C5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Mar 2022 00:00:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 48D7761B8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Mar 2022 00:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3A7C340F8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Mar 2022 00:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646265647;
 bh=Gh+Iw395lx9OcmDBaop4139TbIG8zRBjlYsZzNBFWco=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BocpuqTmutORsZYOiNSdm6lbdqku4oUyiaGBbawYajhypmeyVq/AFKrfpskEbcDf1
 Q4/3uRPtQVWQFi13n7scGMH2Wid9LMjelDkVKUG+YEX7DHDQZ0KWBXrrawYLftXc3k
 imwIMLlwqpUJdpgJFKoH1Z3B51kHkMs0QNYnA8bhbSTXwnhU0Cu1B3wklft1sYv1Q5
 sZrEciaPDY3ZaKJyqH1bwFDtdS/e3oeCQj2G8VxNKQ5Z3e8195bISM1iV0JOy11v3j
 OMssM1DtJK+tk/y6B7eunZOi4e+gNL/pU1dRgivstJDAtlfMwXfKDmZjslIiDbLCgP
 ZdiHHAR5HAnQQ==
Received: by mail-ed1-f46.google.com with SMTP id w3so4425213edu.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Mar 2022 16:00:46 -0800 (PST)
X-Gm-Message-State: AOAM533DDaYP/XHiHMn6CVX/GI8FX24tR4bUP+GIPP/7s6mDvcirKoi+
 eRM1mZYstUGuaSYzGcjFHaqBRySAXXiL0RdxCw==
X-Google-Smtp-Source: ABdhPJyCWS2G7IAO37h6jGUTcYx1AHcHdPNzIqNZZelMR25IBMLn05AR7M7SJt01irflojL+S4EdT9nvnMtxT4pRjgc=
X-Received: by 2002:aa7:df12:0:b0:410:a50b:de00 with SMTP id
 c18-20020aa7df12000000b00410a50bde00mr31738511edy.2.1646265645243; Wed, 02
 Mar 2022 16:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
 <20220126071932.32615-4-jason-jh.lin@mediatek.com>
 <CAAOTY__K_0sp6+VdL0yi=wF9wA_uag4HKqK3ST7uySdkzfCHBA@mail.gmail.com>
 <CAAOTY__Xz0Pu30tmUrNJ=Nji=03Xv_3Qw526_hT-zELME36Bxw@mail.gmail.com>
In-Reply-To: <CAAOTY__Xz0Pu30tmUrNJ=Nji=03Xv_3Qw526_hT-zELME36Bxw@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 2 Mar 2022 18:00:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLU0m9C1OPdiBPTkofB4sfiAeUPbFHp0w8caWyP4XPOEw@mail.gmail.com>
Message-ID: <CAL_JsqLU0m9C1OPdiBPTkofB4sfiAeUPbFHp0w8caWyP4XPOEw@mail.gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>
Cc: Fei Shao <fshao@chromium.org>, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "roy-cw.yeh" <roy-cw.yeh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Moudy Ho <moudy.ho@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v15 03/12] dt-bindings: display: mediatek:
 disp: split each block to individual yaml
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

On Mon, Feb 7, 2022 at 5:07 PM Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote:
>
> OK, it seems no one has comment on this patch, so

No comment because the patch was not in PW. That's most likely due to this:

Subject: [PATCH v15 03/12] dt-bindings: display: mediatek: disp: split
each block to individual yaml
Date: Wed, 26 Jan 2022 15:19:23 +0800 [thread overview]
Message-ID: <20220126071932.32615-4-jason-jh.lin@mediatek.com> (raw)
In-Reply-To: <20220126071932.32615-1-jason-jh.lin@mediatek.com>

[-- Warning: decoded text below may be mangled, UTF-8 assumed --]
[-- Attachment #1: Type: text/plain; charset="y", Size: 50916 bytes --]

"y" is not a valid charset. This is caused when git-send-email asks
for the encoding and you answer 'y' rather than <enter>.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
