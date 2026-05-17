Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NtjpD3naCmo38wQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:23:05 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F29055699C5
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:23:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B3F6C60463;
	Mon, 18 May 2026 09:23:00 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5159AC8F274
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 00:18:37 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2b45cb89f7eso6762905ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 May 2026 17:18:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778977116; cv=none;
 d=google.com; s=arc-20240605;
 b=cg14VV2ZuK7cbAZY31mh7m7mAg5nPpjnf13aSj6oz6jTzNjgUrJ+zJA+QN55TGBCkS
 BK9agFVDwumiLMi7vPOFqNm+YCV66GAPbxa4vU290BRFuohkBtDvg9AIBXzRx2wcvG8T
 wRluhYKVBGP0mHe2uoMQScpwANYo2HaNVHV//3yu46QBWd8mVuXx0+P/JxiowHGhrX7H
 0fbH7kc6PEurqZ2j4ulFwSK95EFelFfykSNsOE9+VZrbTjNiSLwP81KdR+/cEag8ZEsf
 lH9P/hpL9V5+2mUTHa2pfVnLc8haGPwhFEFLo9RU/dbX2/WWYgukXCJtoKMhULOWbqEp
 tsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=mwlQ5BpuuzTZAL1LxPwbMkdpasTg6SIqMpf1zg1uo5Q=;
 fh=rMg3edL/VJIu9Y9WtkJ3anhqTCd711XSRNlLcycV0/s=;
 b=hRtRpj3UN7fNv1BNpu3tZ/FWvLMyNxOXaAMXVCDDQ4h7CGTT1Sd+DldEWD5AFjAh+q
 KYTp6zjL5h/oRGud6YAEyoTZ+3y4gakvAOB7jfR4T+rNtwDbzJ5Uy7MDfr4qVLrEcUat
 tsq5po0Q3M0ovoIBfuoBJ30yNWbpvHgHerLt6XTEQKbXKphb6vzsN+5m7j8BWg5jcWuc
 LrQN6ijXGL+/gagLTNFbXHwTygFRdtKjp42nKNcpvlS+sJ5xtXXYAC/y22Bmdfho7yN/
 G0Ch2rfPx3Df84UjHyLOPsf59svb79IfyuMip4GBL4avUXApYVM8YcydWjV02FHF+vGf
 uxjw==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778977116; x=1779581916;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mwlQ5BpuuzTZAL1LxPwbMkdpasTg6SIqMpf1zg1uo5Q=;
 b=I1NPCUeumUlPGDFllpb5NMUmIgRmOfcGhLWoF0AeXV7+Vmy5Fzaj8Hcs8QSMriUlMv
 7sbGnattjnQl69/HDdGp3IpDgX1vUFf1SGaxER8A+7YeGu1mjIyGezcNOQVAeFDS6su6
 gSDhFm2P0Bmx/9xWUkQ6LnTZkx+p4+aKNffFL7VSQpkZtRmkXjdQT3G8oCXCm+DFwET5
 CN75wAVehpV8mTzvMmJSvIcDq932c6IXqoQ2kJoD0N3Nno7J5AuXC9/2didayOu8s0Xq
 BUQzzkhEJW7LwST9OCTj2E4rHYBWTcN5E3Y5/YJwHTAs8vQRC4eFR7lDZsdtQGWd3bkv
 +TQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977116; x=1779581916;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mwlQ5BpuuzTZAL1LxPwbMkdpasTg6SIqMpf1zg1uo5Q=;
 b=K0NbsHHBqLIppwPJPFL5w9qYv7YaVQT4cGqyS6eUjPx+RYw3SCE3cJSmoAO161GDjJ
 WTMisNZIWq/g9c+C5EGCfw3UwtDumpOWnvnCEDi+7I5sigo6U/W9wldmG2vzwsoZiuvf
 3O7cJQPlYWDBxLj343c3fUguNeToCF9VL6gBpbpgvcBNRhZchNHpeTt3bnRwyciB7VnA
 JLC1n8hPxWXqsrPc5591Rpg//wQopTA01U9jiBnhDjB+zQqRZ75g6sUMugLOxM1S8pxC
 lh44pUTizs+oyT0dQCwkJFXgBU//RJZgUC8RPubdSsIyZ/CF619AY7TjBIpwAbCNQKea
 UPUA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8gv0uHmtxkC9tZpLcFVJjN0YQ880t/ztje05mq/prR9HVQF/1zTS4fHrkw+Rt+1fpZ4EkWlQPX7GjLTA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzo21OhViy8/2qr8Dor3VeaSeCGCJg0xPwwl0/WZH67b8vuM0K1
 7IHkuqaKO2mrqdW8vU/eK8mDSQYaO5Q6R9t/YyRKeu36AsjTM86qqdu+66MVlughO/+eqoSIYjm
 77pdOl55fiQnhESoVaJyFAFbjE6ioY+8=
X-Gm-Gg: Acq92OHEFSIYuoWLfQe5h6KADEhIPFVNpVVAm3/9Uro2nTgJCSKMQwpLHKukJ1bZ2YI
 XGcSzoZ+5lQQayfzxFLubRRh60YsLwD/gbTNBEONoDIbjWZQrJf0jqPFcwwwT1sztaTDz4jfapC
 NLmwZMkLEAp5BE+tNL1VKuqVfZ2FGcLnOIXO6Y/RZ8TMCmWdxKolZMxyb2jOQdwX9YFE/vg79Ue
 0ETTOiYXXxUH4bQY02hsUP048d4GlvWgZfyrx6OPSEnlatmHDGDg61qMPSPCEmawn2+eObhR/6s
 i74f7LVSS07Rmzmvb9lNJSY7BIOgKpdSkHUBvNqvoHKhwYBnYUs=
X-Received: by 2002:a17:903:3c30:b0:2bd:7ff4:ab0b with SMTP id
 d9443c01a7336-2bd7ff4b216mr106672755ad.39.1778977115676; Sat, 16 May 2026
 17:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260513104329.81592-1-phucduc.bui@gmail.com>
 <20260513104329.81592-3-phucduc.bui@gmail.com>
 <agUknFcDIfwrOCld@sirena.co.uk>
 <CAABR9nHfXi5G4+sVnLbWWJctQHkWASTzTwiV424bO6BXZDqX+Q@mail.gmail.com>
 <agZ92TVjcYpEv_eH@sirena.co.uk>
 <CAABR9nHR13e3d46_Z7Q8ZkjQzKbkcPs2Er4sAvq6G1EEj-xoXw@mail.gmail.com>
 <agfd4gvQ_m3Zt8GP@sirena.co.uk>
In-Reply-To: <agfd4gvQ_m3Zt8GP@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 17 May 2026 07:18:24 +0700
X-Gm-Features: AVHnY4JFQ_P1OHVLxDYOkHcfJiy2AJrIGhHUyvcIGLB3nM-OzzVXfHcxNMGpPaI
Message-ID: <CAABR9nF2GePScGzjbPs3Fzj_qiiWcP0D0+SciyPw1J9kTR4GUw@mail.gmail.com>
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
X-Rspamd-Queue-Id: F29055699C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	DATE_IN_PAST(1.00)[33];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

Hi Mark,


> There are likely to be different considerations for different drivers,
> on some systems the power savings from managing the clocks may not be
> meaingful or we may need the clocks for register access.  In general
> it's nicer to actively manage the clocks but it's not super urgent to do
> so from a framework point of view, it's more a how much work the people
> working on the individual drivers want to do and if there's a use case
> for specific hardware.

Understood, and thank you for the clarification.
That gives me a better understanding of the considerations around PM/clock
handling in these drivers.

Best Regard,
Phuc
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
