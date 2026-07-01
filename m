Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yEKTByIGRWoO5QoAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Jul 2026 14:20:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C30B6ED309
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Jul 2026 14:20:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=collabora.com header.s=mail header.b=UdHzJ3oK;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=collabora.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 574C0C8F265;
	Wed,  1 Jul 2026 12:20:49 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7E01C712B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jul 2026 12:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1782908446;
 bh=m6sJ153mTEtGqqARntkJHomU856d72WMcKy3EMNBfdA=;
 h=From:To:Cc:Subject:Date:From;
 b=UdHzJ3oKReCUM8CMjgYobeK2cYD0xqTaw9zVy9oOW3jjlQ8dli3+zy7x6/FrKbNIC
 F6DKQVvkx8hl8FMqpY7/7MNEpwFaEVOu+XvIFD13MRWW9hGQ30sRRZf2faShcOZNTP
 6uZdv4d2uYiO0PKtTI7QQF58ZuT1hIK1MGl9uqbAPr4h2mFz6FwBjzLtbycO+Xh1Qe
 zI2xEsMa1XUDENfAEOWl3tUuFbQr6sczfbOixO6NQ1lJqRZFQcjZNe2TugkBhQw0h3
 SEHLwpCkJBG8XMMDbCar3ZE7CT/31SzfVT9rVc9fvOIMmdw6wq2rnVwLvy46dWmMxZ
 NoBlTHgqlhLhA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BC1D817E0857;
 Wed,  1 Jul 2026 14:20:45 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Date: Wed,  1 Jul 2026 14:20:37 +0200
Message-ID: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Cc: justin.yeh@mediatek.com, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, airlied@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, simona@ffwll.ch, robh@kernel.org,
 ck.hu@mediatek.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 jitao.shi@mediatek.com, andi.shyti@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 mcoquelin.stm32@gmail.com, tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 p.zabel@pengutronix.de, jason-jh.lin@mediatek.com, djakov@kernel.org,
 krzk+dt@kernel.org
Subject: [Linux-stm32] [PATCH 0/6] MediaTek MMSYS/Mute-X new-style part 1
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[collabora.com:s=mail];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[collabora.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:chunkuang.hu@kernel.org,m:justin.yeh@mediatek.com,m:dri-devel@lists.freedesktop.org,m:kernel@collabora.com,m:airlied@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:simona@ffwll.ch,m:robh@kernel.org,m:ck.hu@mediatek.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:jitao.shi@mediatek.com,m:andi.shyti@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:broonie@kernel.org,m:linux-mediatek@lists.infradead.org,m:matthias.bgg@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:mcoquelin.stm32@gmail.com,m:tzimmermann@suse.de,m:linux-kernel@vger.kernel.org,m:p.zabel@pengutronix.de,m:jason-jh.lin@mediatek.com,m:djakov@kernel.org,m:krzk+dt@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[mediatek.com,lists.freedesktop.org,collabora.com,gmail.com,st-md-mailman.stormreply.com,ffwll.ch,kernel.org,vger.kernel.org,linux.intel.com,lists.infradead.org,suse.de,pengutronix.de];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C30B6ED309

This series part 1 of a huge restructuring of the entire multimedia
part of MediaTek SoCs, especially mediatek-drm, and contains only a
set of changes that don't require any simultaneous updates in the
mediatek-drm driver.

This adds support for correctly advertising the MediaTek Mute-X IP
as a source of trigger signals (because that's what it is), hence
for adding #trigger-source-cells in the Mute-X devicetree node and
for specifying a Mute-X trigger-source in all of the MTK Display
Controller components supporting or requiring one, as previously
it was kind of hacked up as a static array in the Mute-X driver,
for both MDP and DISP components, which is, well, depending on the
point of view, actually wrong.

Moreover, this goes on with the first part for a rework of MediaTek
MMSYS, which is a requirement for the upcoming huge restructuring
of the mediatek-drm driver; this starts adding boilerplate required
for setting up MMSYS entries with decoupling of "component type" to
"component instance number".

As of now, all of the components in MediaTek DRM, hence also in the
MMSYS driver, are thrown in a catch-all enumeration that does not
make any distinction between Type-Instance relationship, and it is
like so (mock-up names ahead):

DISPLAY_DITHER0
DISPLAY_DITHER1
DISPLAY_DSI0
DISPLAY_DSI1

... and so on.

Since the number of components is now becoming uncontrollably large,
the catch-all enumeration poses a big issue as the mediatek-drm driver
is allocating a huge array that will be only half full (optimistically,
because usually it's way less than half full) and with repeated ops
assignment for each and every instance of the very same Sub-IP,
effectively treating every instance of a Sub-IP like it is completely
different from one another (for example, like DSI0 and DSI1 are as
different as DITHER0 and DSI1).

This has to change. It had to change months ago, but now it has become
not only a maintenance burden, but also a... (sorry) big mess.

And well, that... especially looking forward to add support for newer
SoCs, using even more components in one pipeline, and using different
and newer components (of new types...), making the catch-all enum to
grow of another ~20 entries or more.

So, this is PART 1 of this huge restructuring, which will impact many
drivers, including soc/mediatek's mutex and mmsys, most of drm/mediatek
and, in the future, also media/mediatek/mtk-mdp3 (and eventually its
firmwareless implementation which, for components handling, will be
as complicated as mediatek-drm and, without this restructuring, would
be yet another boulder).

AngeloGioacchino Del Regno (6):
  dt-bindings: soc: mediatek: mutex: Improve title and description
  dt-bindings: soc: mediatek: mutex: Allow #trigger-source-cells
  dt-bindings: display: mediatek: Allow trigger-sources on relevant HW
  soc: mediatek: mtk-mutex: Add new functions to add/remove triggers
  soc: mediatek: mtk-mmsys: Rework routes to specify component ID
  soc: mediatek: mtk-mmsys: Use MMSYS_ROUTE() in default routing table

 .../display/mediatek/mediatek,aal.yaml        |   3 +
 .../display/mediatek/mediatek,ccorr.yaml      |   3 +
 .../display/mediatek/mediatek,color.yaml      |   3 +
 .../display/mediatek/mediatek,dither.yaml     |   3 +
 .../display/mediatek/mediatek,dp.yaml         |   3 +
 .../display/mediatek/mediatek,dpi.yaml        |   3 +
 .../display/mediatek/mediatek,dsc.yaml        |   3 +
 .../display/mediatek/mediatek,dsi.yaml        |   3 +
 .../display/mediatek/mediatek,ethdr.yaml      |   3 +
 .../display/mediatek/mediatek,gamma.yaml      |   3 +
 .../display/mediatek/mediatek,merge.yaml      |   3 +
 .../display/mediatek/mediatek,od.yaml         |   3 +
 .../display/mediatek/mediatek,ovl-2l.yaml     |   3 +
 .../display/mediatek/mediatek,ovl.yaml        |   3 +
 .../display/mediatek/mediatek,padding.yaml    |   3 +
 .../display/mediatek/mediatek,postmask.yaml   |   3 +
 .../display/mediatek/mediatek,rdma.yaml       |   3 +
 .../display/mediatek/mediatek,split.yaml      |   3 +
 .../display/mediatek/mediatek,ufoe.yaml       |   3 +
 .../display/mediatek/mediatek,wdma.yaml       |   3 +
 .../bindings/soc/mediatek/mediatek,mutex.yaml |  21 +-
 drivers/soc/mediatek/mt6893-mmsys.h           |  34 +-
 drivers/soc/mediatek/mt8167-mmsys.h           |  21 +-
 drivers/soc/mediatek/mt8173-mmsys.h           |  28 +-
 drivers/soc/mediatek/mt8183-mmsys.h           |  14 +-
 drivers/soc/mediatek/mt8186-mmsys.h           |  22 +-
 drivers/soc/mediatek/mt8188-mmsys.h           |  78 ++---
 drivers/soc/mediatek/mt8192-mmsys.h           |  20 +-
 drivers/soc/mediatek/mt8195-mmsys.h           | 181 +++++------
 drivers/soc/mediatek/mt8365-mmsys.h           |  20 +-
 drivers/soc/mediatek/mtk-mmsys.h              | 299 ++++++++----------
 drivers/soc/mediatek/mtk-mutex.c              |  60 ++++
 include/linux/soc/mediatek/mtk-mutex.h        |   6 +
 33 files changed, 474 insertions(+), 390 deletions(-)

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
