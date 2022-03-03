Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC244CBA4E
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Mar 2022 10:31:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CCF0C5F1EE;
	Thu,  3 Mar 2022 09:31:46 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 475E8C01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Mar 2022 09:31:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 94AC71F45394
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646299903;
 bh=7BamnJwMgtqrT3JoQ68Ebed6Mw0Z4qhgq17wKkO7uZQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DsKwhWmYCfBFjIrDoWzkxPNJKmtBbRcsgc1JMZx9lfNHbf04n0AFN6jYOU5/79Sgw
 nyvDJ6M5EkqPGymiwkWb9kne6FdPEpfJ7vttPbObbeF56henBC6oGc/RTdSSjfFW6+
 VC8zJrNU1oQ4UK0ECsXCpbxrdqn7cMaBEEa6/oHh5jqH6bCErPARX3ha6Zno76b3E+
 mVHxV/HiSCkOtzQ38z1XM+GaVwYW7hIpmZE01VSoCluMtv/2M2vCwEAIzg0+8JiSmH
 crxIXXQ4Kl6XsDKLzr6kxkK6ds2BQl0YGHLhGRoZPLryIOwv7sDw2menm+j746SUHW
 LfIys7ju/p13w==
Message-ID: <28098efc-1de1-b540-b1a3-bf7a92af9511@collabora.com>
Date: Thu, 3 Mar 2022 10:31:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>
References: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
 <CAL_Jsq+6k5EqouAO2Xm=GpBz3Pi-wfB-ixGwfyC+Y+qOrjUFTg@mail.gmail.com>
 <c103927d7dbc3217431c83dc22a44c656c561228.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <c103927d7dbc3217431c83dc22a44c656c561228.camel@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Fei Shao <fshao@chromium.org>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 singo.chang@mediatek.com, Fabien Parent <fparent@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "roy-cw.yeh" <roy-cw.yeh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 devicetree@vger.kernel.org, Moudy Ho <moudy.ho@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, nancy.lin@mediatek.com,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Il 03/03/22 05:25, Jason-JH Lin ha scritto:
> Hi Rob,
> 
> Thanks for the reviews.
> 
> On Wed, 2022-03-02 at 17:50 -0600, Rob Herring wrote:
>> On Wed, Jan 26, 2022 at 1:19 AM jason-jh.lin <
>> jason-jh.lin@mediatek.com> wrote:
>>>
> 
> [snip]
> 

Hello Rob, Jason-JH,

I have just crafted a patch that fixes everything mentioned here,
if it's easier like this, I can either send it for the maintainer(s)
to apply on top, or squash in Jason-JH's original patch.

If you'd like to get my patch, though, I have one question:
this is touching literally all of the YAML files that Jason-JH is
introducing, so, should I send this as one patch per file (which would be
something around 16 patches) or is just one fixing them all fine?

Cheers,
Angelo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
