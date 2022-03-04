Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AA14CD1AA
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Mar 2022 10:55:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2A5EC5F1EF;
	Fri,  4 Mar 2022 09:55:04 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CFE8C5EC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 09:55:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B18E11F46483
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646387703;
 bh=EfrLQeiJMUy4oMQI58UrAdjbGw+ADzKMI7I2grHoz4M=;
 h=From:To:Cc:Subject:Date:From;
 b=LJuRzerx/ge7QtwE1iuUcucq6QplNy5celhG3oIai0DzzGpXlLqI/R0DQlelkg3nz
 BnbC5PXT2XvUCdjrgyhE3M60uVU85X5rg6GSOLu7MXsCeqFs/QCY7rVhv7geTHc+GF
 c/+2NUH4XSyIeK+TwD8p9u/RWCYMN9246caOp5e1uyU0Oyisba04A5lm/ZFJbTpvXQ
 uWOF09ZcwSVxxoSSkMxgKq9q2oOocWInIhklbyR+S1KvHGntFoiYcEU2hd4kp8AxV/
 y+671YfAqPE5EnJlthsSaUSMnYcgcPZSQX/tw99UorcH1mcAEVOy8Crq9aneJjKxt0
 dj9rPtk84IMiQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Date: Fri,  4 Mar 2022 10:54:55 +0100
Message-Id: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, jitao.shi@mediatek.com, daniel@ffwll.ch,
 krzysztof.kozlowski@canonical.com, airlied@linux.ie, jason-jh.lin@mediatek.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ck.hu@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH 0/3] Fix MediaTek display dt-bindings issues
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

The vdosys0 series carried a nice dt-bindings conversion of the old
txt documentation for the entire mediatek-drm driver, but some of
the issues in there weren't seen.

This series is fixing all of the issues pointed out by a
`dt_binding_check` run, followed by `dtbs_check`.

AngeloGioacchino Del Regno (3):
  dt-bindings: display: mediatek,mutex: Fix mediatek,gce-events type
  dt-bindings: display: mediatek,ovl: Fix 'iommu' required property typo
  dt-bindings: display: mediatek: Fix examples on new bindings

 .../display/mediatek/mediatek,aal.yaml        | 24 +++--
 .../display/mediatek/mediatek,ccorr.yaml      | 23 +++--
 .../display/mediatek/mediatek,color.yaml      | 23 +++--
 .../display/mediatek/mediatek,dither.yaml     | 23 +++--
 .../display/mediatek/mediatek,dpi.yaml        |  3 +-
 .../display/mediatek/mediatek,dsc.yaml        | 23 +++--
 .../display/mediatek/mediatek,ethdr.yaml      | 99 ++++++++++---------
 .../display/mediatek/mediatek,gamma.yaml      | 23 +++--
 .../display/mediatek/mediatek,merge.yaml      | 49 +++++----
 .../display/mediatek/mediatek,mutex.yaml      | 27 +++--
 .../display/mediatek/mediatek,od.yaml         | 14 ++-
 .../display/mediatek/mediatek,ovl-2l.yaml     | 26 +++--
 .../display/mediatek/mediatek,ovl.yaml        | 28 ++++--
 .../display/mediatek/mediatek,postmask.yaml   | 23 +++--
 .../display/mediatek/mediatek,rdma.yaml       | 28 ++++--
 .../display/mediatek/mediatek,split.yaml      | 17 +++-
 .../display/mediatek/mediatek,ufoe.yaml       | 19 ++--
 .../display/mediatek/mediatek,wdma.yaml       | 26 +++--
 18 files changed, 318 insertions(+), 180 deletions(-)

-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
