Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDC+G6yvHWondAkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Jun 2026 18:13:32 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 010C062264C
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Jun 2026 18:13:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 964A3C5663A;
	Mon,  1 Jun 2026 16:13:31 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 049E6C56612
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jun 2026 14:42:34 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2bf125989f2so27391475ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Jun 2026 07:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780324953; x=1780929753;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=I0dhUfw0XKND2zjq9zxpBDoT9bHm0cEZAjiXz5KStSE=;
 b=NRK5hvTbZNHQqOnVXPeZPM5W8WKVGYQTisQ+Wl2EkW3o/B1xutSYlUJ4Hvam2s4NDc
 QhHTnYcgvxL6hge+9aobPGi/tpKcRRSjr/IVqsKcAeQHolfXuqg6pC70/0F89bQs1skW
 yCspadD59dgmoDkg+317Gcqo2bEHfvWUC2C7dzLYpjrw284vKOkp+QBU5rxdFYyZyJUG
 WluOn5mMUb/S9+fPnVKx/dg37eD9X7vd3dDSAX+IYExaCVX5SlZJ8KZ/A1Lpbk1Ab+0O
 o8RwEItztfbF+oVCujHtHPqKKfM6SOe71HsiBEPwikZLUT5cXCg2Q8/x2pCVjVsY+9id
 AXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780324953; x=1780929753;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I0dhUfw0XKND2zjq9zxpBDoT9bHm0cEZAjiXz5KStSE=;
 b=FmISITHCYlF8qqPg/q5DQXtIYtdXttAy3lDRpldM5HZvjJ9P86bZHDxcvINS7gJzum
 jyQsC9pi8gLxMAKput6s7YpivzBsMj7IaOY/o6NjVrNJnYvpjrOwsY5spuxlMMXFtxd8
 6eu/f+AA7Wm25lsLXRORD7ga5Vcp8XAJG4feM4DflzWRIWRiSw/+k5tj6SJEYQB6mgKH
 Kx/r4SlEpuzYwSr3qiwvTcqy+VFy4AGYWkTMiUxCsurPRqtgbJayBkrQ+0jztDPS1IcX
 kdgDfQP21itW7W6dRbKjE9PDHwx0FumCrVrRnR0JXPbZtQqemp+0/C2dMQXhdqWOMX4h
 +1Ag==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Zf6Lb0sgtE1EY7FVynhEMO31tyS9Iym6Hol2nPMe/qFxDOQnFZiz61iSCxwlciLy8HD6oJhmtPEliJA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwuhD5Og4+HQjlXzUamGNpFsn4uvdw+IH86ObxLKfVNQt7PKqRb
 LEzrMe2rwvFcFymzh6LbnBW9rrGmc/XyAiT3ULra19nzKdHOV6dPXs0NhwvZXcSA5vU=
X-Gm-Gg: Acq92OEinJuOlZHPIieDHdtYn67EXeIg5cCDJLkftKf/+DCeY11eGEVrohcIc+O+gGX
 Wz5sm/eyPygW/4q0mepIp+hAKs9TsUUsY7layPD7bE718OSgKE427S2MWbR8HHJS4caCqwQ1yh1
 IZp0+1b/plpAHOxlwXjliHS7cDiwBfUc8hGgubPCfBaYS6ILdmSU+N2OopdG6dwdmWqln49FI3k
 QR/Uppd38nxH1FHaqpW1jp7eQNjHVO1UhplvWPS4LJlWe6HbtOXBgLfe5sqWoolyS9K1rXs7Qht
 8aRmeHum9CJuVoxvF98y3f/2QVhx1Oy9bDaCqYLBiApX7rKh/oF+8kH0tGK5Sj6OrVktRsWWYsU
 DJ45zdgwgXf+WIC+ZasKv21Yt/V5vt3Ky/BL9BcLzhDh42JHlYksmndx6XjafTBNLjC/0JFrgVo
 O9pWoFCDjDstNnjp0YfDbxsS+ryM8k2HAXGvNsNLZvIRhSfc7z
X-Received: by 2002:a17:902:e74b:b0:2bd:63dc:b7ad with SMTP id
 d9443c01a7336-2bf3679ebc4mr132076775ad.2.1780324953150; 
 Mon, 01 Jun 2026 07:42:33 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:86cc:b476:3696:fced])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bf23c0842esm107038115ad.57.2026.06.01.07.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 07:42:32 -0700 (PDT)
Date: Mon, 1 Jun 2026 08:42:29 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>, arnaud.pouliquen@foss.st.com,
 daniel.baluta@nxp.com, peng.fan@oss.nxp.com
Message-ID: <ah2aVdlsLqy9aeHP@p14s>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260529021637.2077602-1-ben.levinsky@amd.com>
X-Mailman-Approved-At: Mon, 01 Jun 2026 16:13:30 +0000
Cc: Daniel Baluta <daniel.baluta@nxp.com>, imx@lists.linux.dev,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tanmay Shah <tanmay.shah@amd.com>, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/5] remoteproc: cleanup shared
 carveout and resource-table helpers
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
X-Spamd-Result: default: False [3.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ben.levinsky@amd.com,m:arnaud.pouliquen@foss.st.com,m:daniel.baluta@nxp.com,m:peng.fan@oss.nxp.com,m:imx@lists.linux.dev,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:geert+renesas@glider.be,m:tanmay.shah@amd.com,m:linux-remoteproc@vger.kernel.org,m:andersson@kernel.org,m:Frank.Li@nxp.com,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:kernel@pengutronix.de,m:festevam@gmail.com,m:s.hauer@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[mathieu.poirier@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nxp.com,lists.linux.dev,gmail.com,vger.kernel.org,glider.be,amd.com,kernel.org,st-md-mailman.stormreply.com,pengutronix.de,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.952];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 010C062264C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Good morning,

On Thu, May 28, 2026 at 07:16:32PM -0700, Ben Levinsky wrote:
> This series is a preparatory remoteproc cleanup split out from review of
> the AMD BRAM-based remoteproc series.
> 
> During review, there was a request to move the duplicated plain
> ioremap_wc()/iounmap() carveout callbacks into common code and to
> factor the "missing resource table is OK" ELF parsing path into a
> common helper as well. There was also a request to send that cleanup as
> its own patchset first, with the AMD BRAM series respun afterwards on
> top once this cleanup is merged.
> 
> This version keeps the same overall cleanup goals as v2, but reworks
> the optional resource-table pieces based on follow-up review:
> 
>   - reshape the optional resource-table helper in patch 4 into the thin
>     parse_fw() wrapper form suggested on the thread
>   - switch the patch 5 clients over to that helper shape directly,
>     without post-helper rproc->table_ptr checks
>   - keep the driver-local parse_fw() wrappers and their existing log
>     messages and severity choices
>   - retain as much of the existing per-driver parse_fw() logic and code
>     placement as possible while moving the missing-table handling
>     through the shared helper
> 
> This series now does that in five patches:
> 
>   1. add common subsystem-private callbacks for the exact-match
>      wc-ioremap carveout case
>   2. switch the in-tree exact-match users over to those callbacks
>   3. mark carveouts mapped through the shared wc-ioremap helper as
>      iomem so the framework uses the proper I/O accessors
>   4. add a common helper for drivers that treat a missing ELF resource
>      table as optional while keeping per-driver logging decisions local
>   5. switch the matching in-tree drivers over to that helper while
>      keeping thin local parse_fw() wrappers
> 
> For the carveout map/unmap cleanup, this series covers the exact-match
> users called out in review: xlnx_r5_remoteproc, rcar_rproc,
> st_remoteproc, stm32_rproc, imx_rproc, and imx_dsp_rproc. The zynqmp R5
> TCM mapping path is left alone because it also clears the mapped memory
> and is not an exact match.
> 
> For the optional resource-table handling, this series converts
> xlnx_r5_remoteproc, rcar_rproc, stm32_rproc, imx_rproc, and
> imx_dsp_rproc. st_remoteproc is intentionally left unchanged because its
> parse_fw() callback also builds carveouts and is therefore not a direct
> match for the helper introduced here.
> 
> Changes in v3:
>   - rework patch 4 so the optional resource-table helper matches the
>     thin-wrapper form suggested in review
>   - note that patch 4 still triggers a checkpatch --strict warning for
>     the flow-control macro form, but that implementation follows the
>     maintainer's review suggestion for the thin parse_fw() wrapper shape
>   - update patch 5 to use that helper shape directly in the client
>     parse_fw() callbacks
>   - drop the post-helper rproc->table_ptr checks from the converted
>     drivers
>   - keep the converted parse_fw() wrappers otherwise close to their
>     existing structure and placement
>   - test xlnx_r5_remoteproc on the latest tree with firmware images
>     both with and without an ELF resource table
> 
> Changes in v2:
>   - split the mem->is_iomem change out into a separate patch
>   - add a common error message on ioremap_wc() failure
>   - drop logging from the optional resource-table helper
>   - keep driver-local parse_fw() wrappers to preserve per-platform
>     missing-resource-table logging policy
> 
> Ben Levinsky (5):
>   remoteproc: add common wc-ioremap carveout callbacks
>   remoteproc: switch exact-match drivers to wc-ioremap callbacks
>   remoteproc: mark wc-ioremap carveouts as iomem
>   remoteproc: add helper for optional ELF resource tables
>   remoteproc: switch drivers to optional resource-table helper
> 
>  drivers/remoteproc/imx_dsp_rproc.c       | 41 +++-----------
>  drivers/remoteproc/imx_rproc.c           | 40 ++------------
>  drivers/remoteproc/rcar_rproc.c          | 41 ++------------
>  drivers/remoteproc/remoteproc_internal.h | 38 +++++++++++++
>  drivers/remoteproc/st_remoteproc.c       | 31 +----------
>  drivers/remoteproc/stm32_rproc.c         | 39 ++-----------
>  drivers/remoteproc/xlnx_r5_remoteproc.c  | 70 +++++-------------------

This set looks good to me.  I am fine with the checkpatch warning on the macro -
given the redundancy it avoids, I think it can be tolerated.

Wolfram has already indicated he wanted to test these changes - Arnaud, Daniel
and Peng, please do the same for your platforms.

Thanks,
Mathieu

>  7 files changed, 73 insertions(+), 227 deletions(-)
> 
> -- 
> 2.34.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
