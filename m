Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOuAIbVhAmposAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 01:09:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11441517289
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 01:09:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A00A2C87EC1;
	Mon, 11 May 2026 23:09:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A2A8C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 23:09:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B371B42B87;
 Mon, 11 May 2026 23:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A85C2BCB0;
 Mon, 11 May 2026 23:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778540977;
 bh=oNHvi4oxjrwBg8WrHDE3QBzWxrrrcye8fddyPM6VQbA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tD+ZfEvWY6zNN4Rotzj2Kp774to8Jqfnshu16QaCSxae/YvNmIW1jJarDiSqRocLW
 tVWXp2unxM4GrbwI8ccU9NuxPbVmKtlXWfhqTwPqsWIzA3IXkI6Mw7gvJarAMhhnav
 4w7IG99LKdnePjTd7/1hspEy91ix6y9dJ2WXOuUaT/ZHKcvtonxXqc5IM/OfHzcsXg
 Y5XTqNcIhhX5X1Vkal6gpxp4Idmf/UG1Ay+iIvry5nvDAEfdcLGJOquwRABQvM0l/v
 2AVlu3J20fhPTcD5ytxrwUBJ+Z/V4weIlqOdaX/2/EjzqbldOYkjqBKe+jZgv//gqd
 70uwh/Pbbat8Q==
Date: Mon, 11 May 2026 16:09:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Message-ID: <20260511160932.0e2cf50a@kernel.org>
In-Reply-To: <20260511165942.2774868-1-robh@kernel.org>
References: <20260511165942.2774868-1-robh@kernel.org>
MIME-Version: 1.0
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-remoteproc@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>, imx@lists.linux.dev,
 Tanmay Shah <tanmay.shah@amd.com>, Frank Li <Frank.Li@nxp.com>,
 dri-devel@lists.freedesktop.org, Mirela Rabulea <mirela.rabulea@nxp.com>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Mohan Reddy Putluru <pmohan@couthit.com>, Suman Anna <s-anna@ti.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Simona Vetter <simona@ffwll.ch>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, David Airlie <airlied@gmail.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Parvathi Pudi <parvathi@couthit.com>, Nas Chung <nas.chung@chipsnmedia.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ben Levinsky <ben.levinsky@amd.com>, Michal Simek <michal.simek@amd.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Hussain Khaja <basharath@couthit.com>, Paolo Abeni <pabeni@redhat.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-media@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liu Ying <victor.liu@nxp.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-spi@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Roger Quadros <rogerq@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 MD Danish Anwar <danishanwar@ti.com>, "Andrew F. Davis" <afd@ti.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, dmaengine@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, freedreno@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: Consolidate "sram" property
	definition
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
X-Rspamd-Queue-Id: 11441517289
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,sntech.de,lists.linux.dev,amd.com,nxp.com,lists.freedesktop.org,google.com,somainline.org,couthit.com,ti.com,gmail.com,st-md-mailman.stormreply.com,baylibre.com,ffwll.ch,collabora.com,lunn.ch,chipsnmedia.com,googlemail.com,vanguardiasur.com.ar,redhat.com,kernel.org,suse.de,linaro.org,pengutronix.de,linux.intel.com,linux.dev,lists.infradead.org,poorly.run,foss.st.com,davemloft.net,nbd.name];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-remoteproc@vger.kernel.org,m:heiko@sntech.de,m:imx@lists.linux.dev,m:tanmay.shah@amd.com,m:Frank.Li@nxp.com,m:dri-devel@lists.freedesktop.org,m:mirela.rabulea@nxp.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:marijn.suijten@somainline.org,m:pmohan@couthit.com,m:s-anna@ti.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jbrunet@baylibre.com,m:simona@ffwll.ch,m:detlev.casanova@collabora.com,m:andrew+netdev@lunn.ch,m:airlied@gmail.com,m:jackson.lee@chipsnmedia.com,m:parvathi@couthit.com,m:nas.chung@chipsnmedia.com,m:martin.blumenstingl@googlemail.com,m:ben.levinsky@amd.com,m:michal.simek@amd.com,m:ezequiel@vanguardiasur.com.ar,m:basharath@couthit.com,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:khilman@baylibre.com,m:linux-media@vger.kernel.org,m:linusw@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:tzimmermann@suse.de,m:neil.armstrong@linaro.org,m:victor.liu@nxp.
 com,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:linux-spi@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:abhinav.kumar@linux.dev,m:rogerq@kernel.org,m:broonie@kernel.org,m:linux-mediatek@lists.infradead.org,m:matthias.bgg@gmail.com,m:linux-amlogic@lists.infradead.org,m:robin.clark@oss.qualcomm.com,m:mchehab@kernel.org,m:sean@poorly.run,m:kernel@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:mcoquelin.stm32@gmail.com,m:rogerq@ti.com,m:lumag@kernel.org,m:mathieu.poirier@linaro.org,m:lorenzo@kernel.org,m:andersson@kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:danishanwar@ti.com,m:afd@ti.com,m:jesszhan0024@gmail.com,m:vkoul@kernel.org,m:p.zabel@pengutronix.de,m:hugues.fruchet@foss.st.com,m:dmaengine@vger.kernel.org,m:krzk+dt@kernel.org,m:freedreno@lists.freedesktop.org,m:davem@davemloft.net,m:nbd@nbd.name,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[75];
	NEURAL_HAM(-0.00)[-0.498];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action

On Mon, 11 May 2026 11:59:36 -0500 Rob Herring (Arm) wrote:
>  .../bindings/net/ti,icssg-prueth.yaml         |  2 +-
>  .../bindings/net/ti,icssm-prueth.yaml         |  2 +-

Acked-by: Jakub Kicinski <kuba@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
