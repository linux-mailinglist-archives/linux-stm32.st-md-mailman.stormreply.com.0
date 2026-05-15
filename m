Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 07YyEnfaCmoz8wQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:23:03 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF565699AF
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:23:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4019C5F1C5;
	Mon, 18 May 2026 09:22:59 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3EE9C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 May 2026 04:49:07 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-3665b67ed66so4792698a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 21:49:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778820546; cv=none;
 d=google.com; s=arc-20240605;
 b=ZBa11uwr24d8zEi8ovA0O3llPfJKGLJZATIRVpd5nNmrzyE7BHro5wXSASQ8eb7pbu
 8Yk5bNWnfPsmwMh776BNctMxQbR5y5ycYJRe2zK1eA0Cgob8NUIO5EBfE/QL54+lj81C
 olO/ioYbZd965TIierfrYR2MDIFZILT9sPLLdOB/8Q3LB5Fv/rqJ577aG4VtL9RwG+At
 fMpX8uk+q1L5sQGoQepS+M0IBmK+H9z4bTQXjL7USGPh6DdbGh0xwL5z/vEjIa+qz7aI
 9p9IgO8cSKH165+nqGmdUDed2wfmkgRpuHh+GZBOjcg3itEdC0ND5xeEVIHmw6/mlrfB
 +tgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=7Ze77vbekY63STpWUt0uP8LUCQHGr3bsiE2SLku80DU=;
 fh=GrUVzUqeQZ9cUa/VSX2S2k3t5jHZAmDwHP7rn/gWMS0=;
 b=b1NUMcNh2TIt1AC22UofSWd74WwRbA6LiHifPuo0UD7YxOC1le9THUhTMYqZh+T0E/
 sOSfQPqCp/bHJ1QW/19OIviu2l4yQhn9YEmnn8yMzKgGCrc6IGUNx2oemneAmKTwiIgn
 0OUtRySe9qe+B/AYVbyIYqzMcA2XAF3HmUraCqMlgYMDEdg6ouLnNLX1UdA96n6AN4sM
 TE7s7sGx8v+IWvYNk7nLdO4khzupbqkoWGajm2QuCN8HNQ3CoDShvViGLxECR9TY8dUr
 wvBuiW6MyDNYxfjNmybsAoUwEl9vfBNrSvPjHRqu9m5fSD4UM1b/jdokwm7qm7EcCAAj
 nKYA==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778820546; x=1779425346;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7Ze77vbekY63STpWUt0uP8LUCQHGr3bsiE2SLku80DU=;
 b=KUphVm6aZG3dtK9ypc+Yrzi2YVFNzMgFDsPcdFsRssnbPkO8rpQuW6wvsYbJbKYur/
 XstZsJ/vSD02D/0HbFwU5J2b1u6ybo4STDkeofOrUDWgKJPH/B43JEh2lbHpHYPBcljF
 OKL40h9fS60knRoBLkCm4y70BoKawDffbPAAic18OKkuEHtrbuuivcKqqjxU3/dPD0RN
 KrQg3lnYtpRLrawWAa4e35krcKFu+StdQaWTNGOdKXF5q+WAP08fLb2sOOCLTNi35KGA
 q1zRKZKyq87GTV8QHFAI8rrNb3EyMmRBgqM8kxWzwnC+pD0f6RldiKtycjICSY1NtuDQ
 6CJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778820546; x=1779425346;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Ze77vbekY63STpWUt0uP8LUCQHGr3bsiE2SLku80DU=;
 b=n9hvV5UiZOzsKORNj8lwpFD1OxgX4HZVf3DRGMsBxINIUtXfpqQG9YsB6o+NCBy5CN
 kZEyDlXmZtenzyZg/3W8yGgc/CvmGSYLLuv3iq5H3GaDGFF6nTwMbv1j04gEw4YuqNe9
 qv2IudmrS0Ad5fUrpzfUPTjd8SpVBTWr5uhs3XfW+Ohk15sd7jJIsPDwspRPKatZ0JZu
 WxofDO4Od7rrsyciQ6Yxx8aRVkBfyKIVsZ2wxN/sWwRPuFsp34NPFsbdhIDj46K5mKSK
 6LZ8/tke2Jr6v7tJl1HATBCy0+huYNcd8w5rWCB9Bs4+M8qMLoRu0/HjE/p2Vz8r3Lbn
 dxXw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/EaTzMGvyjKhociZB/tyM9htA273J5otMm34RCFnHuqgV3Y1K3T+9sK6YG7xyv9RlLOtTo6Mr1BqGetQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxD76bPcWZtZTKXoTaAUrpkC72OEcIP9nkAclWFeIWIy3kDi8KV
 kPeBzw+lnDnNOdIbnq9qbO86QSfYVUYD5xTiqnXrw66yQ0MN7s2uZPmhOUu7sA3+wgmIQUGM4ZZ
 476gDenYBpuARGJXnNHOXBadU9szMwmE=
X-Gm-Gg: Acq92OH+9d6N3r/I1R4oK+4Xw0+9oJrm9K7tYqqRhiovLf/RHqrU3HWfM5mzjwTtVFU
 1X56n4N6Z26CXdWX7/Qgzz8kAwkeprQpnKpbE9Q49ZrvKPyioq5fVnhhypwqkEdT2fSpGO2I66B
 DiybA41HZDtUoRoyeAlN1rto+eQsC018+7uzB6RmE6rvBY6d1cB5Q+i6GjR1iYKvZPESyDXxOyj
 mE8Ovmkui2+uyyYezc8OBYqUA0jTyxOzGDstLGa6/ZTkdjyT+MdSLAyxR+ch5Sz0MmYwUBBHnz7
 TipUWBHgOlxwtvOQlUSNJ9N4UxAREj6q6mIl55pA7J4sQC8U
X-Received: by 2002:a17:90b:57c7:b0:369:2e00:1ff0 with SMTP id
 98e67ed59e1d1-369519c6663mr2379277a91.6.1778820546309; Thu, 14 May 2026
 21:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260513104329.81592-1-phucduc.bui@gmail.com>
 <20260513104329.81592-3-phucduc.bui@gmail.com>
 <agUknFcDIfwrOCld@sirena.co.uk>
 <CAABR9nHfXi5G4+sVnLbWWJctQHkWASTzTwiV424bO6BXZDqX+Q@mail.gmail.com>
 <agZ92TVjcYpEv_eH@sirena.co.uk>
In-Reply-To: <agZ92TVjcYpEv_eH@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 15 May 2026 11:48:55 +0700
X-Gm-Features: AVHnY4LSRW3rAmjavn6_eDy_Qm1nhNiehY-HxiVuY8qyBRTItYTFMQaIPdHoTM4
Message-ID: <CAABR9nHR13e3d46_Z7Q8ZkjQzKbkcPs2Er4sAvq6G1EEj-xoXw@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
X-Mailman-Approved-At: Mon, 18 May 2026 09:22:57 +0000
Cc: linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] ASoC: stm: stm32_i2s: Use guard() for
	spin locks
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
X-Rspamd-Queue-Id: DAF565699AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	DATE_IN_PAST(1.00)[76];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:linux-kernel@vger.kernel.org,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:lgirdwood@gmail.com,m:mcoquelin.stm32@gmail.com,m:perex@perex.cz,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,gmail.com,perex.cz,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_SPAM(0.00)[0.996];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi,


> > I'll send a v2 of the whole series with this fix.
> > Would that work for you?
>
> Yes.

Thank you for the confirmation.
By the way, I have an architectural question that came up during my cleanup...

I noticed that the STM drivers currently manage clk_prepare_enable()/
clk_disable_unprepare() directly from the dai_startup()/shutdown() paths.

After looking through various vendor audio drivers, I noticed that
PM/clock handling styles still vary quite a lot between implementations.

For example:

some Intel drivers enable clocks during dai_link init.

Samsung separates bus/interface clocks and operational clocks,
enabling them in different paths such as probe() and set_sysclk()

UX500 and STM enable clocks during DAI startup()/shutdown()

Tegra, Sunxi, and Rockchip often manage clocks through runtime
PM callbacks

From a maintainer perspective, is there generally interest in gradually
converging these drivers toward more modern/common PM patterns,
or is preserving existing hardware-specific sequencing usually preferred
unless there is a concrete issue to solve?

Best regard,
Phuc
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
