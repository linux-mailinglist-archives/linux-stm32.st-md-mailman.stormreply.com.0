Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AEksNtOvQ2qAfAoAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 14:00:19 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 097476E3EBD
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 14:00:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linaro.org header.s=google header.b=MJN2K2ZO;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linaro.org (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9655C8F265;
	Tue, 30 Jun 2026 12:00:18 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEE60C424DB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 15:36:06 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2c9b1edf2bdso11898865ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 08:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782747365; x=1783352165;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RsiAkF5rnsXrEzna1iMYWZla+7JEf5EC3Z4oGTp3rT8=;
 b=MJN2K2ZOV0UlLmOfJRT5T9y0b2YV3mIUIE2lozpRr9I51PKt5P6a/3Q5rcJwd9ZuPo
 reOZM9KBfTKw41TMsENnOavDRS0tOMnNM6osueulSQ5b5IVZOrl0jYwiiLQ/nNBFtqTA
 O6hPCsQf023jfsZqNvWYjzIW4Wtiyah3S/YARusUpX87VN/VE//qGwPFoWb4EWqyixSp
 lJuCyHWnt829osRyxxXfQrq1R9ZCz/JAlQW+e5nNbtm9Sf3iaH+7jFaAUjTJ6qk/TWaL
 xZPZm809rrjVz6p6hpgZF/w133Fmh3Ar+FhCJYTUz0FHGy2NkEKpEAL0CYUrhLHkVrch
 m8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782747365; x=1783352165;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RsiAkF5rnsXrEzna1iMYWZla+7JEf5EC3Z4oGTp3rT8=;
 b=aXWpfhKbtpqFs5KKub7V1rwOhJ9Q06AncU3+Ro3SMmUSD74a5R/3TFeak9klk32p6M
 WO6g/gCeZ5qyptol06Iwn6fMfilrgKT4oNokbqykaztiTyWlMEc24d/TKYrSTpRLtzTm
 BM+LOnlbz6S18hsChc4M75ZFwsdAlSRqjvy/vPQU77M4NGPy0x2se7fQ7GfRdCplmtwL
 FzPHiQjZLfeW1xGLs0wXT7ORr2JQPzwoltk5FYAY4/MCkWk5RcCkCm+bfkg8UyycHX0j
 nG1DoiM+Q+WHF1+Q+smrz6H6LoBY+BX2yK1JwLGItRA27qczT2Ss6IeSDrzipG6bKm6J
 lg+Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrbcdMz8BERs39b7W4qNsyTheol5piJzY8/teVVHKRACEozimV0DmjliNE32FU1R5PVLnu2GHiQ5xALSw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwLtrOs+DwlA74McG7o+Sa3ffTIpmr2EbDT+BfQfniWCZss54Cd
 n+qNym5FuR/9RZjc1lNtP6qbo7LSfM7CYhAxsgushePhU8dcP0fxHKR0+kyyboA6SAY=
X-Gm-Gg: AfdE7ckkdpzCMN7RpHboXRcQwTmpriHWz/p2DA4g+i2S1UBnhLbF3NHx5UOc9PUDvkE
 zBV4zr2wLkM+k44LDai7HYmuS041Th5GUNl9Ye+J5Zgh7eGR+b8G2kBVtSb+iLSgjAiYJIKtb2s
 FUdnkCFSX1JeQkL9kUvctVFcKPaSJIKvCw1dGhmHYo6azL/o3ICD49YBCiCVNoHvKIeZ9FXfyie
 87aQ8TyZEy7OiCoarnp/I5Vh8zAGCH/dzwf1vv6aY/z+RN4JcXSdRCs0Su5/dRycxy+7wjZeTzh
 XewNRB74QphjO+waXBsxEz9BF2Z0ISzrhPJIWOHnAw1Ow3xORjkID7gJqM3CMQiMoXZFEfIcMW/
 kxezjZL4kpIJ+7B3+WMrvmHkj7ayePXlAB6UDx1o8mhEgRDUcTR0MgEq4KEbt0cxyKrUvrUOlXh
 eUbRcjThXodiN4fA2DQI7y+jnGCc0=
X-Received: by 2002:a17:903:2f8a:b0:2c0:b5c1:8e22 with SMTP id
 d9443c01a7336-2c9854b5597mr89458355ad.12.1782747364963; 
 Mon, 29 Jun 2026 08:36:04 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:aa83:261a:68a7:9974])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7f63d09f0sm98408955ad.56.2026.06.29.08.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 08:36:04 -0700 (PDT)
Date: Mon, 29 Jun 2026 09:36:00 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Message-ID: <akKQ4H09G2MpRVGN@p14s>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260529021637.2077602-1-ben.levinsky@amd.com>
X-Mailman-Approved-At: Tue, 30 Jun 2026 12:00:17 +0000
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ben.levinsky@amd.com,m:daniel.baluta@nxp.com,m:imx@lists.linux.dev,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:geert+renesas@glider.be,m:tanmay.shah@amd.com,m:linux-remoteproc@vger.kernel.org,m:andersson@kernel.org,m:Frank.Li@nxp.com,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:kernel@pengutronix.de,m:festevam@gmail.com,m:s.hauer@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mathieu.poirier@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nxp.com,lists.linux.dev,gmail.com,vger.kernel.org,glider.be,amd.com,kernel.org,st-md-mailman.stormreply.com,pengutronix.de,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,p14s:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 097476E3EBD

Applied.

Thanks,
Mathieu

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
>  7 files changed, 73 insertions(+), 227 deletions(-)
> 
> -- 
> 2.34.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
