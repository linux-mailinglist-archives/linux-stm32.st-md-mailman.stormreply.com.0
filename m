Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FBUHIgOpT2rzmAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 15:58:27 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BD5731E11
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 15:58:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=collabora.com header.s=mail header.b=Uk9k61Ti;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=collabora.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAAA0C8F284;
	Thu,  9 Jul 2026 13:58:26 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B14BEC712B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2026 13:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1783605505;
 bh=DjWIojAzSpqrury6RVuc3AKXDQ21nXDPRrnz5nALTGA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Uk9k61TiU5kLuxeWd3yKSlAqlof2xEMCyZ91YUH3EfsxlKkfbd0J9XbYPF2Ozvnx2
 znsCEGFc0wsenIpMQNl9u8fUGgAEXMNXikFccXqUNWwyipJ6b4k7hwQdB+28KHNYgV
 DhGM+/SdJbKXOTVW8bKfuCRp6qIndc4Bicdywmrx8J4xx3lLAWIOOTO1Uui4dEFIlM
 njnJBYlIgqMZkMzTUVIyiAa4RtLla1XMF/0vUPccM7sSh2aOyGfsAHSchAmSGL9UJx
 GMq1i7dDU2zbAh61mKNXgcrr/LfUmlxvBwforDJ3gRoQAAgG63SBV3U7NlObDn0Baf
 +WVSbE+qB6gzg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519) (No client certificate requested)
 (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 08BAF17E071A;
 Thu, 09 Jul 2026 15:58:23 +0200 (CEST)
Message-ID: <fba4f7d6-d480-4f1a-8d80-3dd0a797b61e@collabora.com>
Date: Thu, 9 Jul 2026 15:58:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: krzk+dt@kernel.org
References: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
 <20260701122043.19612-3-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260701122043.19612-3-angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, justin.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, kernel@collabora.com, airlied@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, andi.shyti@kernel.org,
 simona@ffwll.ch, robh@kernel.org, ck.hu@mediatek.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 jason-jh.lin@mediatek.com, linux-kernel@vger.kernel.org,
 p.zabel@pengutronix.de, djakov@kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/6] dt-bindings: soc: mediatek: mutex:
 Allow #trigger-source-cells
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[collabora.com:s=mail];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[collabora.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk+dt@kernel.org,m:chunkuang.hu@kernel.org,m:justin.yeh@mediatek.com,m:dri-devel@lists.freedesktop.org,m:kernel@collabora.com,m:airlied@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andi.shyti@kernel.org,m:simona@ffwll.ch,m:robh@kernel.org,m:ck.hu@mediatek.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:jitao.shi@mediatek.com,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:broonie@kernel.org,m:linux-mediatek@lists.infradead.org,m:matthias.bgg@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:jason-jh.lin@mediatek.com,m:linux-kernel@vger.kernel.org,m:p.zabel@pengutronix.de,m:djakov@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,mediatek.com,lists.freedesktop.org,collabora.com,gmail.com,st-md-mailman.stormreply.com,ffwll.ch,vger.kernel.org,suse.de,linux.intel.com,lists.infradead.org,pengutronix.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[collabora.com:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:from_mime,collabora.com:email,collabora.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07BD5731E11

On 7/1/26 14:20, AngeloGioacchino Del Regno wrote:
> This hardware controls trigger sources, and there's even a generic
> binding just for that: allow #trigger-source-cells in MuteX, so
> that this is allowed to provide triggers to external HW.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Hey Krzysztof, I noticed you gave your A-b/R-b on the other two bindings commits
but you skipped this.

Did you have any doubts on this one that I may clarify for you, or was it just
that this one slipped through while reviewing?

Cheers,
Angelo

> ---
>   .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml      | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> index 1ba086ad749d..429ea149068e 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> @@ -57,6 +57,9 @@ properties:
>       items:
>         - description: MUTEX Clock
>   
> +  '#trigger-source-cells':
> +    const: 1
> +
>     mediatek,gce-events:
>       description:
>         The event id which is mapping to the specific hardware event signal
> @@ -119,6 +122,7 @@ examples:
>               interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
>               power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>               clocks = <&mmsys CLK_MM_MUTEX_32K>;
> +            #trigger-source-cells = <1>;
>               mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
>                                     <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
>           };


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
