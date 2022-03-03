Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F234CB5E6
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Mar 2022 05:31:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B1DCC5F1EE;
	Thu,  3 Mar 2022 04:31:42 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BBB7C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Mar 2022 04:31:40 +0000 (UTC)
X-UUID: 4d86d7e1101140a188ece182579e12cc-20220303
X-UUID: 4d86d7e1101140a188ece182579e12cc-20220303
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 552324228; Thu, 03 Mar 2022 12:31:33 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 3 Mar 2022 12:31:32 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Mar 2022 12:31:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Mar 2022 12:31:31 +0800
Message-ID: <469ca28d06f8ced11b3853c0bc39b0f9eb6e11f8.camel@mediatek.com>
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 3 Mar 2022 12:31:31 +0800
In-Reply-To: <CAL_JsqLU0m9C1OPdiBPTkofB4sfiAeUPbFHp0w8caWyP4XPOEw@mail.gmail.com>
References: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
 <20220126071932.32615-4-jason-jh.lin@mediatek.com>
 <CAAOTY__K_0sp6+VdL0yi=wF9wA_uag4HKqK3ST7uySdkzfCHBA@mail.gmail.com>
 <CAAOTY__Xz0Pu30tmUrNJ=Nji=03Xv_3Qw526_hT-zELME36Bxw@mail.gmail.com>
 <CAL_JsqLU0m9C1OPdiBPTkofB4sfiAeUPbFHp0w8caWyP4XPOEw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: Fei Shao <fshao@chromium.org>, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "roy-cw.yeh" <roy-cw.yeh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nancy Lin <nancy.lin@mediatek.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
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

Hi Rob,

Thanks for the reviews.

On Wed, 2022-03-02 at 18:00 -0600, Rob Herring wrote:
> On Mon, Feb 7, 2022 at 5:07 PM Chun-Kuang Hu <chunkuang.hu@kernel.org
> > wrote:
> > 
> > OK, it seems no one has comment on this patch, so
> 
> No comment because the patch was not in PW. That's most likely due to
> this:
> 
> Subject: [PATCH v15 03/12] dt-bindings: display: mediatek: disp:
> split
> each block to individual yaml
> Date: Wed, 26 Jan 2022 15:19:23 +0800 [thread overview]
> Message-ID: <20220126071932.32615-4-jason-jh.lin@mediatek.com> (raw)
> In-Reply-To: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
> 
> [-- Warning: decoded text below may be mangled, UTF-8 assumed --]
> [-- Attachment #1: Type: text/plain; charset="y", Size: 50916 bytes
> --]
> 
> "y" is not a valid charset. This is caused when git-send-email asks
> for the encoding and you answer 'y' rather than <enter>.
> 
> Rob
-- 

Thanks for making me realize the problem.
I'll always use <enter> in the future.

Regards,
Jason-JH Lin <jason-jh.lin@mediatek.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
