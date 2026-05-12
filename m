Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLWxDKfvAmrAywEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 11:15:19 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE6E51D6EB
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 11:15:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8704C87ED8;
	Tue, 12 May 2026 09:15:17 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52E7FC01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 09:15:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 260A96001A;
 Tue, 12 May 2026 09:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EA8C2BCB0;
 Tue, 12 May 2026 09:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778577314;
 bh=tQrx4ZRS7IpQ4Yeb3zvXcMC5gRyGgc0EqCTTskuD72c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C0JSfZQZpjD/Tvilt+ZydSoCODb9Cfdg9R/yccRDlcfaoqRM8iSMCNxRaMjr8pF/7
 PxuXXBLtVyINXXEJr8VmMbnEE0/2uqGdkKSzC5ft2lBFgjHBi9yZiITxp1XcstcHE8
 EK0wfXtuOs/5/GoVOCWIbJO9H5aWRYiL2sW/8mKhWqyNPtknH75fuBTGJanoB7tqpX
 +cGkXvFkkkcFpNm7iZLpVnNQbTZqufS2LlzPV9BVyeUykqzjr9aaSWmCmrrMhNnzm9
 IA1oPOljf0GEIfzjcMt4eZSfvURwoY6rIUz8dwJ6TrRoOWfY0pZEi/8r4DRSb4tS/f
 A6nDUfzh5Gj5Q==
Date: Tue, 12 May 2026 11:15:12 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Message-ID: <agLvoBCkUf_TN5b-@lore-desk>
References: <20260511165942.2774868-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260511165942.2774868-1-robh@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-remoteproc@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>, imx@lists.linux.dev,
 Tanmay Shah <tanmay.shah@amd.com>, Frank Li <Frank.Li@nxp.com>,
 dri-devel@lists.freedesktop.org, Mirela Rabulea <mirela.rabulea@nxp.com>,
 Eric Dumazet <edumazet@google.com>,
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
 linux-mediatek@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, MD Danish Anwar <danishanwar@ti.com>,
 "Andrew F. Davis" <afd@ti.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
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
Content-Type: multipart/mixed; boundary="===============1672224348125925154=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 9EE6E51D6EB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.19 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lorenzo@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-remoteproc@vger.kernel.org,m:heiko@sntech.de,m:imx@lists.linux.dev,m:tanmay.shah@amd.com,m:Frank.Li@nxp.com,m:dri-devel@lists.freedesktop.org,m:mirela.rabulea@nxp.com,m:edumazet@google.com,m:marijn.suijten@somainline.org,m:pmohan@couthit.com,m:s-anna@ti.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jbrunet@baylibre.com,m:simona@ffwll.ch,m:detlev.casanova@collabora.com,m:andrew+netdev@lunn.ch,m:airlied@gmail.com,m:jackson.lee@chipsnmedia.com,m:parvathi@couthit.com,m:nas.chung@chipsnmedia.com,m:martin.blumenstingl@googlemail.com,m:ben.levinsky@amd.com,m:michal.simek@amd.com,m:ezequiel@vanguardiasur.com.ar,m:basharath@couthit.com,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:khilman@baylibre.com,m:linux-media@vger.kernel.org,m:linusw@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:tzimmermann@suse.de,m:neil.armstrong@linaro.org,m:victor.liu@nxp.com,m:linux-arm-msm@vger.
 kernel.org,m:s.hauer@pengutronix.de,m:linux-spi@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:abhinav.kumar@linux.dev,m:rogerq@kernel.org,m:broonie@kernel.org,m:linux-mediatek@lists.infradead.org,m:kuba@kernel.org,m:matthias.bgg@gmail.com,m:linux-amlogic@lists.infradead.org,m:robin.clark@oss.qualcomm.com,m:mchehab@kernel.org,m:sean@poorly.run,m:kernel@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:mcoquelin.stm32@gmail.com,m:rogerq@ti.com,m:lumag@kernel.org,m:mathieu.poirier@linaro.org,m:netdev@vger.kernel.org,m:andersson@kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:danishanwar@ti.com,m:afd@ti.com,m:jesszhan0024@gmail.com,m:vkoul@kernel.org,m:p.zabel@pengutronix.de,m:hugues.fruchet@foss.st.com,m:dmaengine@vger.kernel.org,m:krzk+dt@kernel.org,m:freedreno@lists.freedesktop.org,m:davem@davemloft.net,m:nbd@nbd.name,m:andrew@lunn.ch,m:martinblumenstingl@gmail.com,s:lists@lf
 dr.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,sntech.de,lists.linux.dev,amd.com,nxp.com,lists.freedesktop.org,google.com,somainline.org,couthit.com,ti.com,gmail.com,st-md-mailman.stormreply.com,baylibre.com,ffwll.ch,collabora.com,lunn.ch,chipsnmedia.com,googlemail.com,vanguardiasur.com.ar,redhat.com,kernel.org,suse.de,linaro.org,pengutronix.de,linux.intel.com,linux.dev,lists.infradead.org,poorly.run,foss.st.com,davemloft.net,nbd.name];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[75];
	NEURAL_HAM(-0.00)[-0.761];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[lorenzo@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,devicetree.org:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action


--===============1672224348125925154==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DRGrXT3EJq+RYIF3"
Content-Disposition: inline


--DRGrXT3EJq+RYIF3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The "sram" property has become a de facto standard property, so create a
> common schema for it and drop all the duplicated definitions.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  .../imx/fsl,imx8qxp-dc-command-sequencer.yaml |  2 +-
>  .../devicetree/bindings/display/msm/gpu.yaml  |  6 +----
>  .../bindings/dma/stericsson,dma40.yaml        |  8 ++----
>  .../bindings/media/cnm,wave521c.yaml          |  2 +-
>  .../bindings/media/nxp,imx8-jpeg.yaml         |  6 ++---
>  .../bindings/media/rockchip,vdec.yaml         |  5 ++--
>  .../bindings/media/st,stm32-dcmi.yaml         |  6 ++---
>  .../devicetree/bindings/net/mediatek,net.yaml |  3 +--
>  .../bindings/net/ti,icssg-prueth.yaml         |  2 +-
>  .../bindings/net/ti,icssm-prueth.yaml         |  2 +-
>  .../remoteproc/amlogic,meson-mx-ao-arc.yaml   |  7 +----
>  .../bindings/remoteproc/ti,k3-dsp-rproc.yaml  |  8 ------
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  |  8 ------
>  .../remoteproc/xlnx,zynqmp-r5fss.yaml         |  9 +------
>  .../devicetree/bindings/spi/st,stm32-spi.yaml | 10 +++----
>  .../bindings/sram/sram-consumer.yaml          | 26 +++++++++++++++++++
>  16 files changed, 48 insertions(+), 62 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sram/sram-consumer.=
yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc=
-command-sequencer.yaml b/Documentation/devicetree/bindings/display/imx/fsl=
,imx8qxp-dc-command-sequencer.yaml
> index 27118f4c0d28..fd095e5742c5 100644
> --- a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-comman=
d-sequencer.yaml
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-comman=
d-sequencer.yaml
> @@ -41,7 +41,7 @@ properties:
>        - const: sw3
> =20
>    sram:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
>      description: phandle pointing to the mmio-sram device node
> =20
>  required:
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Doc=
umentation/devicetree/bindings/display/msm/gpu.yaml
> index 04b2328903ca..358759fad8dc 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -84,13 +84,9 @@ properties:
>      maxItems: 64
> =20
>    sram:
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
>      minItems: 1
>      maxItems: 4
> -    items:
> -      maxItems: 1
> -    description: |
> -      phandles to one or more reserved on-chip SRAM regions.
> +    description:
>        phandle to the On Chip Memory (OCMEM) that's present on some a3xx =
and
>        a4xx Snapdragon SoCs. See
>        Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
> diff --git a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml =
b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
> index 607da11e7baa..d8f92838f4c9 100644
> --- a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
> +++ b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
> @@ -136,13 +136,9 @@ properties:
>      maxItems: 1
> =20
>    sram:
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
> -    description: A phandle array with inner size 1 (no arg cells).
> -      First phandle is the LCPA (Logical Channel Parameter Address) memo=
ry.
> -      Second phandle is the  LCLA (Logical Channel Link base Address) me=
mory.
> -    maxItems: 2
>      items:
> -      maxItems: 1
> +      - description: LCPA (Logical Channel Parameter Address) memory.
> +      - description: LCLA (Logical Channel Link base Address) memory.
> =20
>    memcpy-channels:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
> diff --git a/Documentation/devicetree/bindings/media/cnm,wave521c.yaml b/=
Documentation/devicetree/bindings/media/cnm,wave521c.yaml
> index 6a11c1d11fb5..6cd33dfd095d 100644
> --- a/Documentation/devicetree/bindings/media/cnm,wave521c.yaml
> +++ b/Documentation/devicetree/bindings/media/cnm,wave521c.yaml
> @@ -37,7 +37,7 @@ properties:
>      maxItems: 1
> =20
>    sram:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
>      description:
>        The VPU uses the SRAM to store some of the reference data instead =
of
>        storing it on DMA memory. It is mainly used for the purpose of red=
ucing
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml b=
/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
> index 18cc6315a821..6ba668aa633d 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
> @@ -56,10 +56,10 @@ properties:
>      maxItems: 5               # Wrapper and 4 slots
> =20
>    sram:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
>      description:
> -      Optional phandle to a reserved on-chip SRAM regions. The SRAM can
> -      be used for descriptor storage, which may improve bus utilization.
> +      The SRAM can be used for descriptor storage, which may improve bus
> +      utilization.
> =20
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b=
/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> index 42022401d0ff..4f38a0ef29d8 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> @@ -91,9 +91,8 @@ properties:
>      maxItems: 1
> =20
>    sram:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -    description: |
> -      phandle to a reserved on-chip SRAM regions.
> +    maxItems: 1
> +    description:
>        Some SoCs, like rk3588 provide on-chip SRAM to store temporary
>        buffers during decoding.
> =20
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b=
/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> index d9fbb90b0977..7c2ddd27780f 100644
> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> @@ -47,10 +47,10 @@ properties:
>      maxItems: 1
> =20
>    sram:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
>      description:
> -      phandle to a reserved SRAM region which is used as temporary
> -      storage memory between DMA and MDMA engines.
> +      SRAM region which is used as temporary storage memory between DMA =
and
> +      MDMA engines.
> =20
>    port:
>      $ref: /schemas/graph.yaml#/$defs/port-base
> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Do=
cumentation/devicetree/bindings/net/mediatek,net.yaml
> index cc346946291a..6bbd83c6aaf7 100644
> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> @@ -67,8 +67,7 @@ properties:
>        - const: ppe
> =20
>    sram:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -    description: phandle to mmio SRAM
> +    maxItems: 1
> =20
>    mediatek,ethsys:
>      $ref: /schemas/types.yaml#/definitions/phandle
> diff --git a/Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml b=
/Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml
> index c296e5711848..883033b19b8f 100644
> --- a/Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml
> @@ -21,7 +21,7 @@ properties:
>        - ti,am654-sr1-icssg-prueth  # for AM65x SoC family, SR1.0
> =20
>    sram:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
>      description:
>        phandle to MSMC SRAM node
> =20
> diff --git a/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml b=
/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
> index a98ad45ca66f..9370c43bc66a 100644
> --- a/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
> @@ -24,7 +24,7 @@ properties:
>        - ti,am3359-prueth   # for AM33x SoC family
> =20
>    sram:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
>      description:
>        phandle to OCMC SRAM node
> =20
> diff --git a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-m=
x-ao-arc.yaml b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-=
mx-ao-arc.yaml
> index 76e8ca44906a..3f710433e937 100644
> --- a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-ar=
c.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-ar=
c.yaml
> @@ -48,12 +48,7 @@ properties:
>      minItems: 1
> =20
>    sram:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -    description:
> -      phandles to a reserved SRAM region which is used as the memory of
> -      the ARC core. The region should be defined as child nodes of the
> -      AHB SRAM node as per the generic bindings in
> -      Documentation/devicetree/bindings/sram/sram.yaml
> +    maxItems: 1
> =20
>    amlogic,secbus2:
>      $ref: /schemas/types.yaml#/definitions/phandle
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc=
=2Eyaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> index b51bb863d759..8b1ed384ef22 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> @@ -75,16 +75,8 @@ properties:
>  # --------------------
> =20
>    sram:
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
>      minItems: 1
>      maxItems: 4
> -    items:
> -      maxItems: 1
> -    description: |
> -      phandles to one or more reserved on-chip SRAM regions. The regions
> -      should be defined as child nodes of the respective SRAM node, and
> -      should be defined as per the generic bindings in,
> -      Documentation/devicetree/bindings/sram/sram.yaml
> =20
>  allOf:
>    - if:
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc=
=2Eyaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> index 775e9b3a1938..14e6b2f817b3 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> @@ -224,16 +224,8 @@ patternProperties:
>            at 0x0) or 0 (BTCM at 0x0), default value is 1 if omitted.
> =20
>        sram:
> -        $ref: /schemas/types.yaml#/definitions/phandle-array
>          minItems: 1
>          maxItems: 4
> -        items:
> -          maxItems: 1
> -        description: |
> -          phandles to one or more reserved on-chip SRAM regions. The reg=
ions
> -          should be defined as child nodes of the respective SRAM node, =
and
> -          should be defined as per the generic bindings in,
> -          Documentation/devicetree/bindings/sram/sram.yaml
> =20
>      required:
>        - compatible
> diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5f=
ss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.ya=
ml
> index ee63c03949c9..c7d5e58330d6 100644
> --- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> @@ -106,20 +106,13 @@ patternProperties:
>            - const: rx
> =20
>        sram:
> -        $ref: /schemas/types.yaml#/definitions/phandle-array
>          minItems: 1
>          maxItems: 8
> -        items:
> -          maxItems: 1
> -        description: |
> +        description:
>            phandles to one or more reserved on-chip SRAM regions. Other t=
han TCM,
>            the RPU can execute instructions and access data from the OCM =
memory,
>            the main DDR memory, and other system memories.
> =20
> -          The regions should be defined as child nodes of the respective=
 SRAM
> -          node, and should be defined as per the generic bindings in
> -          Documentation/devicetree/bindings/sram/sram.yaml
> -
>        memory-region:
>          description: |
>            List of phandles to the reserved memory regions associated wit=
h the
> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Do=
cumentation/devicetree/bindings/spi/st,stm32-spi.yaml
> index 472e92974714..6d7d595e4ab3 100644
> --- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> @@ -89,12 +89,10 @@ properties:
>        - const: rxm2m
> =20
>    sram:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -    description: |
> -      Phandles to a reserved SRAM region which is used as temporary
> -      storage memory between DMA and MDMA engines.
> -      The region should be defined as child node of the AHB SRAM node
> -      as per the generic bindings in Documentation/devicetree/bindings/s=
ram/sram.yaml
> +    maxItems: 1
> +    description:
> +      SRAM region which is used as temporary storage memory between DMA =
and
> +      MDMA engines.
> =20
>    power-domains:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/sram/sram-consumer.yaml b/=
Documentation/devicetree/bindings/sram/sram-consumer.yaml
> new file mode 100644
> index 000000000000..f00087bd2879
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sram/sram-consumer.yaml
> @@ -0,0 +1,26 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sram/sram-consumer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SRAM Consumers
> +
> +maintainers:
> +  - Rob Herring <robh@kernel.org>
> +
> +select: true
> +
> +properties:
> +  sram:
> +    description:
> +      Phandles to one or more reserved on-chip SRAM regions. The regions
> +      should be defined as child nodes of the respective SRAM node, and
> +      should be defined as per the generic bindings in,
> +      Documentation/devicetree/bindings/sram/sram.yaml
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      maxItems: 1
> +
> +additionalProperties: true
> +...
> --=20
> 2.53.0
>=20

--DRGrXT3EJq+RYIF3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCagLvoAAKCRA6cBh0uS2t
rB3PAQDUyipx/50v+HQH37ZQgQgNXN+WyuErXdljPkPOAGPQXQEA5AF8C1BtXXr0
ThfwiDvqyao6viviV65dKTdINUDRXA4=
=S+zT
-----END PGP SIGNATURE-----

--DRGrXT3EJq+RYIF3--

--===============1672224348125925154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1672224348125925154==--
