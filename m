Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EDA4CCD40
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Mar 2022 06:26:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08F43C5F1EE;
	Fri,  4 Mar 2022 05:26:56 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99EE3C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 05:26:54 +0000 (UTC)
X-UUID: 72e0c9f99d2c46f3865c7f719f17a9f8-20220304
X-UUID: 72e0c9f99d2c46f3865c7f719f17a9f8-20220304
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2126705116; Fri, 04 Mar 2022 13:26:48 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 13:26:47 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Mar 2022 13:26:46 +0800
Message-ID: <c19b14ab9a8879fc50d8bcc87745da48491be373.camel@mediatek.com>
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob
 Herring <robh+dt@kernel.org>
Date: Fri, 4 Mar 2022 13:26:46 +0800
In-Reply-To: <28098efc-1de1-b540-b1a3-bf7a92af9511@collabora.com>
References: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
 <CAL_Jsq+6k5EqouAO2Xm=GpBz3Pi-wfB-ixGwfyC+Y+qOrjUFTg@mail.gmail.com>
 <c103927d7dbc3217431c83dc22a44c656c561228.camel@mediatek.com>
 <28098efc-1de1-b540-b1a3-bf7a92af9511@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Fabien Parent <fparent@baylibre.com>,
 Moudy Ho <moudy.ho@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "roy-cw.yeh" <roy-cw.yeh@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, nancy.lin@mediatek.com,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v15 00/12] Add Mediatek Soc DRM (vdosys0)
 support for mt8195
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

Hi Angelo,

Because linux-next has applied these patches:

[v15,04/12] dt-bindings: display: mediatek: dsc: add yaml for mt8195
SoC binding
[v15,05/12] dt-bindings: display: mediatek: merge: add additional prop
for mt8195
[v15,06/12] dt-bindings: display: mediatek: add mt8195 SoC binding for
vdosys0
[v15,03/12] dt-bindings: display: mediatek: disp: split each block to
individual yaml


I'll rebase on the latest linux-next, and then send 1 path + 1 series:
[1] a fix up patch for all dt-schema error in each display dt-bindings
(If Rob wants me to split this patch into separate patches for each
file, then I'll resend it.)
[2] a series of remaining patches of this series


I would appreciate it if you would take the time to send [1] for me.
If you can help me to send [1], please let me know.
Thank you very much ;-) 


Regards,
Jason-JH.Lin

On Thu, 2022-03-03 at 10:31 +0100, AngeloGioacchino Del Regno wrote:
> Il 03/03/22 05:25, Jason-JH Lin ha scritto:
> > Hi Rob,
> > 
> > Thanks for the reviews.
> > 
> > On Wed, 2022-03-02 at 17:50 -0600, Rob Herring wrote:
> > > On Wed, Jan 26, 2022 at 1:19 AM jason-jh.lin <
> > > jason-jh.lin@mediatek.com> wrote:
> > > > 
> > 
> > [snip]
> > 
> 
> Hello Rob, Jason-JH,
> 
> I have just crafted a patch that fixes everything mentioned here,
> if it's easier like this, I can either send it for the maintainer(s)
> to apply on top, or squash in Jason-JH's original patch.
> 
> If you'd like to get my patch, though, I have one question:
> this is touching literally all of the YAML files that Jason-JH is
> introducing, so, should I send this as one patch per file (which
> would be
> something around 16 patches) or is just one fixing them all fine?
> 
> Cheers,
> Angelo
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!3tXE3T-t6I2GMILAOHpkTXhrLHwFAQtmhGqTBtKSY2SLWM2qBBMULlM17TtG6VwNR5yn$
>  
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
