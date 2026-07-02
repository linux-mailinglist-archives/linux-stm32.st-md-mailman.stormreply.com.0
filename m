Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Cfm+EeAYRmqTJwsAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Jul 2026 09:53:04 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA766F46DC
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Jul 2026 09:53:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=env7wj8w;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AB22C8F265;
	Thu,  2 Jul 2026 07:53:03 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F58DC6C856
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2026 07:53:01 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 250AE60120;
 Thu,  2 Jul 2026 07:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A267B1F000E9;
 Thu,  2 Jul 2026 07:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782978779;
 bh=RggIXQChyrd9PGRMbf+vMro4+L7wE747ABQYOAEiDL0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=env7wj8wcJfIuCtiqo2vta7nC186527y80FragjdAc/RxQ5ScaDRP4J4T3DllIWsE
 y/oCXXrMyyA10nC8qPxYSwd9jLj272kw1s9l2jnzrnuCSuw9xezvcyfbUTosfMLlrt
 S0RLngLUyu20SuO6o4/xwJ1cmZzVnqkogmrOauVjic58rC30njyzut0demB8x2BXFK
 J1t65ElN9x8747Pzzi0vsBEeTaC/dP3bearigkZWFXVZ/G1n9vct3IIDoW5etiX7B6
 sS1h3pACCRoAzYaNqxDHEiq5ouMcX7h+rD6WjrFR+K2TVYP+60La/bQVogr1LPx8bX
 uucpi7VH4ZLIw==
Date: Thu, 2 Jul 2026 09:52:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <20260702-congenial-honest-platypus-39d90a@quoll>
References: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
 <20260701122043.19612-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260701122043.19612-2-angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, justin.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, kernel@collabora.com, airlied@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, andi.shyti@kernel.org,
 simona@ffwll.ch, robh@kernel.org, ck.hu@mediatek.com, chunkuang.hu@kernel.org,
 conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 jason-jh.lin@mediatek.com, linux-kernel@vger.kernel.org, tzimmermann@suse.de,
 djakov@kernel.org, krzk+dt@kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/6] dt-bindings: soc: mediatek: mutex:
 Improve title and description
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:angelogioacchino.delregno@collabora.com,m:devicetree@vger.kernel.org,m:justin.yeh@mediatek.com,m:dri-devel@lists.freedesktop.org,m:kernel@collabora.com,m:airlied@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andi.shyti@kernel.org,m:simona@ffwll.ch,m:robh@kernel.org,m:ck.hu@mediatek.com,m:chunkuang.hu@kernel.org,m:conor+dt@kernel.org,m:jitao.shi@mediatek.com,m:p.zabel@pengutronix.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:broonie@kernel.org,m:linux-mediatek@lists.infradead.org,m:matthias.bgg@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:jason-jh.lin@mediatek.com,m:linux-kernel@vger.kernel.org,m:tzimmermann@suse.de,m:djakov@kernel.org,m:krzk+dt@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,mediatek.com,lists.freedesktop.org,collabora.com,gmail.com,st-md-mailman.stormreply.com,kernel.org,ffwll.ch,pengutronix.de,linux.intel.com,lists.infradead.org,suse.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,quoll:mid,collabora.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DA766F46DC

On Wed, Jul 01, 2026 at 02:20:38PM +0200, AngeloGioacchino Del Regno wrote:
> Improve both the title and the description of this hardware to
> disambiguate its functionality from a hardware mutex and/or from
> a hwspinlock.
> 
> Though in datasheets this is called "DISP_MUTEX", the meaning is
> is "Mute-X" (where "X" means "any hardware trigger signal") really
> as this is what this piece of hardware does: muting or unmuting of
> signals in each sub-IP of the display or other multimedia related
> controllers.
> 
> Based on that, also clarify the description text, as to make sure
> that the information is actually accurate.
> 
> While at it, also avoid forcing literal blocks in the description
> as there is nothing in there needing that (no ascii graph or other
> stuff that needs a literal block anyway), and add myself in the
> list of maintainers.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/soc/mediatek/mediatek,mutex.yaml   | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
