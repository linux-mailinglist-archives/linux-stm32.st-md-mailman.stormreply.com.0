Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 598FB6B204D
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 10:40:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18A7DC6A60C;
	Thu,  9 Mar 2023 09:40:25 +0000 (UTC)
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77E8CC65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 09:40:17 +0000 (UTC)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 0EF2A127D;
 Thu,  9 Mar 2023 10:40:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1678354816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j6A1cqIav5oN+sJ0Pm8CyKz7tSgwht+condPuImcVwY=;
 b=zsMPy9kNOSpYIQk2v92UlAChhQ1RPWvR19mptAEqIVjK7y7MtNDhCwb2WjCLD1XqQrz1Lw
 q8s4RCfCX8HShn15fWBvySjzhsBHUFHE1ZVKHu5VkB4RcwxibgapaU57G1lZ9MaCbGS+ZB
 d8zZihUMbqMqbCgfK1NPj8qFc6HdOzqsvmbsDviuS3ZwcHJ6DMQw2zRg/+2Ht3+IwL13B9
 3XbUFM/uL/TIFiDCwAouAEb4qEnSGJF/f7NhSKUHWODVLEtFviq2WFQVuobulTjGODAOt4
 qJx7Hf6BNV7PeSGwCgjwgSvM/epAZE1St3F3Qp7iV4+07CGebjwrTQ4MPMgtqQ==
From: Michael Walle <michael@walle.cc>
To: zajec5@gmail.com
Date: Thu,  9 Mar 2023 10:40:10 +0100
Message-Id: <20230309094010.1051573-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230224072903.20945-1-zajec5@gmail.com>
References: <20230224072903.20945-1-zajec5@gmail.com>
MIME-Version: 1.0
X-Spam: Yes
Cc: alexandre.belloni@bootlin.com, heiko@sntech.de,
 hayashi.kunihiko@socionext.com, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, rafal@milecki.pl, zbr@ioremap.net,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 alyssa@rosenzweig.io, jbrunet@baylibre.com, linux-rtc@vger.kernel.org,
 samuel@sholland.org, khilman@baylibre.com, sven@svenpeter.dev,
 michal.simek@xilinx.com, jernej.skrabec@gmail.com,
 linux-rockchip@lists.infradead.org, wens@csie.org, agross@kernel.org,
 linux-imx@nxp.com, vincent.sunplus@gmail.com, orsonzhai@gmail.com,
 linux-sunxi@lists.linux.dev, mhiramat@kernel.org, mcoquelin.stm32@gmail.com,
 neil.armstrong@linaro.org, martin.blumenstingl@googlemail.com,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linux-mediatek@lists.infradead.org, baolin.wang@linux.alibaba.com,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 a.zummo@towertech.it, zhang.lyra@gmail.com, andersson@kernel.org,
 marcan@marcan.st, linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org,
 Michael Walle <michael@walle.cc>, asahi@lists.linux.dev, kernel@pengutronix.de,
 richard@nod.at, srinivas.kandagatla@linaro.org, shawnguo@kernel.org,
 claudiu.beznea@microchip.com
Subject: Re: [Linux-stm32] [PATCH V2] nvmem: add explicit config option to
	read OF fixed cells
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

[as this mentions  nvmem layouts it would have been nice to include me]

> NVMEM subsystem looks for fixed NVMEM cells (specified in DT) by
> default. This behaviour made sense in early days before adding support
> for dynamic cells.

Why is that? It still makes sense, doesn't it?

> With every new supported NVMEM device with dynamic cells current
> behaviour becomes non-optimal. It results in unneeded iterating over DT
> nodes and may result in false discovery of cells (depending on used DT
> properties).

What false discoveries?

> This behaviour has actually caused a problem already with the MTD
> subsystem. MTD subpartitions were incorrectly treated as NVMEM cells.

But this is solved, correct?

> Also with upcoming support for NVMEM layouts no new binding or driver
> should support fixed cells defined in device node.

How would you support older device trees with newer kernels or the
other way around? I'm not sure I get your motivation to drop handling
the fixed cells.

> Solve this by modifying drivers for bindings that support specifying
> fixed NVMEM cells in DT. Make them explicitly tell NVMEM subsystem to
> read cells from DT.

How can a driver know when there are fixed cells and when not? IOW.
only new ones can be affected.

If you want to get rid of the schema for *new* drivers then what
about having a new child node, something like "nvmem-fixed-cells",
similar to "nvmem-layout".

And then you'd tell the new drivers to use the new-style dt binding. But
there are no new drivers yet. So I'm still not sure I get your motivation.

-michael
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
