Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8864E5408
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Mar 2022 15:10:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAEFEC5F1F1;
	Wed, 23 Mar 2022 14:10:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A6B7C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Mar 2022 14:10:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 32C01616DF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Mar 2022 14:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97365C340F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Mar 2022 14:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648044610;
 bh=v/gFT/8y2QNpM7jRFtSw7CA3jwTKUwu7o9yrZABFACw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P+6qju7KgrYR9PKOtOje2vk3T7msB9Dbk7AF0A6rKiZ4l/NA6fVLIOeq3Q6cV+Psf
 U84/Q23zl09bnN8MmrJjFmHzNc81xjaoIyVcteZphR5iwnf4GUrKAf7mFyK+6N7KHm
 EG4lUIiy6K8tUjZDXzdcRdcCcvSJt4/uklymGD4IuW8MRu9R07+LmehP+aLa6mWBmY
 spWoBaerVe1to5cHJfmrazOGYhZPDtoEp87mWUIRLkNPy92wYLGbW7sBeozCw0xjqO
 AEYz6xqgfySUJC3MtfNsIUw+ygBR/olYwNushte6FdFdsu5fcTHKqD0xpmqYL3DWPJ
 7kBtA+yI0JovQ==
Received: by mail-ej1-f44.google.com with SMTP id bi12so3110766ejb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Mar 2022 07:10:10 -0700 (PDT)
X-Gm-Message-State: AOAM532fU+KuetI62x4DvI//oVfT9BzJVqjEmownzRBM3CMlQv5NpTTA
 eWnCCZL2hZGovikDrVkXzE5pJKS2F4p388KCaw==
X-Google-Smtp-Source: ABdhPJyoHAOLWCGsvMFbQN/cBB3l1ZQVSPRNagAHnYdBe/ediYewgN8QArA8v7kajXGSiPzjYVmw0poiMS0XEAnD4uA=
X-Received: by 2002:a17:906:d204:b0:6d6:df17:835e with SMTP id
 w4-20020a170906d20400b006d6df17835emr161839ejz.20.1648044608892; Wed, 23 Mar
 2022 07:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220309134702.9942-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20220309134702.9942-1-jason-jh.lin@mediatek.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Mar 2022 09:09:57 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+=hTKTjB8rR77_uQYKDWHzLyTdeU7zbixSCZCNrdmNvg@mail.gmail.com>
Message-ID: <CAL_Jsq+=hTKTjB8rR77_uQYKDWHzLyTdeU7zbixSCZCNrdmNvg@mail.gmail.com>
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Fei Shao <fshao@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 singo.chang@mediatek.com, Fabien Parent <fparent@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "roy-cw.yeh" <roy-cw.yeh@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Nancy Lin <nancy.lin@mediatek.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, devicetree@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v2 0/4] Fix MediaTek display dt-bindings
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

On Wed, Mar 9, 2022 at 7:47 AM jason-jh.lin <jason-jh.lin@mediatek.com> wrote:
>
> The vdosys0 series carried a nice dt-bindings conversion of the old
> txt documentation for the entire mediatek-drm driver, but some of
> the issues in there weren't seen.
>
> This series is fixing all of the issues pointed out by a
> `dt_binding_check` run, followed by `dtbs_check`.
>
> Change in v2:
> - remove mediatek,ethdr.yaml file
> - change include header of mediatek,ovl-2l.yaml from mt8173 to mt8183
>
> AngeloGioacchino Del Regno (3):
>   dt-bindings: display: mediatek, mutex: Fix mediatek, gce-events type
>   dt-bindings: display: mediatek, ovl: Fix 'iommu' required property
>     typo
>   dt-bindings: display: mediatek: Fix examples on new bindings
>
> jason-jh.lin (1):
>   Revert "dt-bindings: display: mediatek: add ethdr definition for
>     mt8195"

Can this series get applied soon? linux-next is still broken.

If it hits Linus' tree, I will be applying them.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
