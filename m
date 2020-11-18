Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C46352B782D
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Nov 2020 09:10:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75AB3C56612;
	Wed, 18 Nov 2020 08:10:05 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AC6BC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Nov 2020 01:38:58 +0000 (UTC)
X-UUID: 630185640108402a83ff2c8a81bef551-20201118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VQSP1sH4CqMAhG3prd+7/b/qG6Nz5rZr5wJPtTA6ytA=; 
 b=prPzbxB8X79spbx4u3Y3tAouEp30AENJqm6rlTVLRN1wGwg5kXiB7WzqfJIfPzGn1auqofhq8g0WiGg4tyuA479gQpruShQYS1EVQdEYQa6J24IzQTq2RdM4k1nbTt1sqpZUbD5xK4dZ5nckjiLy6T1+Y0rgwwgA31I9agzLiKk=;
X-UUID: 630185640108402a83ff2c8a81bef551-20201118
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1400451792; Wed, 18 Nov 2020 09:38:53 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 18 Nov 2020 09:38:48 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Nov 2020 09:38:50 +0800
Message-ID: <1605663530.31607.40.camel@mhfsdcap03>
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Nov 2020 09:38:50 +0800
In-Reply-To: <CAMuHMdXVXqj9k4FMFH5aiqKwNrWocJpjahYKA8k2e3Z2ji2hvQ@mail.gmail.com>
References: <20201117103123.3938-1-chunfeng.yun@mediatek.com>
 <CAMuHMdXVXqj9k4FMFH5aiqKwNrWocJpjahYKA8k2e3Z2ji2hvQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5DF35A84F2346C88C9B1BA1AEF6C513A344973A569469D1148B07A014C4095D62000:8
X-MTK: N
X-Mailman-Approved-At: Wed, 18 Nov 2020 08:10:04 +0000
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 linux-realtek-soc@lists.infradead.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: arm: add additionalProperties
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

On Tue, 2020-11-17 at 11:37 +0100, Geert Uytterhoeven wrote:
> Hi Chunfeng,
> 
> On Tue, Nov 17, 2020 at 11:32 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > Add an explicit "additionalProperties: true" to avoid
> > dt_binding_check error caused by:
> > 'additionalProperties' is a required property
> >
> > This will not change function, due to additionalProperties
> > is true by default.
> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> 
> Thanks for your patch!
> 
> > --- a/Documentation/devicetree/bindings/arm/actions.yaml
> > +++ b/Documentation/devicetree/bindings/arm/actions.yaml
> > @@ -49,3 +49,5 @@ properties:
> >            - enum:
> >                - ucrobotics,bubblegum-96 # uCRobotics Bubblegum-96
> >            - const: actions,s900
> > +
> > +additionalProperties: true
> 
> Looks very similar to commit 62298364bd489b06 ("dt-bindings: Explicitly
> allow additional properties in board/SoC schemas") in v5.10-rc2?
Yes, indeed, thanks for your info.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
