Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LKBKnbaCmob8wQAu9opvQ:T2
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:23:04 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9025699BD
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:23:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD9C8C5F1F4;
	Mon, 18 May 2026 09:22:59 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3B65C87EDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 May 2026 11:25:15 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2baef9f5ecdso59886945ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 May 2026 04:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778844314; x=1779449114;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2cckrbFDzDclaD9xEuvQg7f44hhTEfkSqsz3bGxhFSs=;
 b=oLrEsa9CToNLh6SmROvweafbF/IJsmbuQ7uhJLqZwJq5ySPqr4BlqJRL5kF1exemzi
 6dFw7Hou4ejkDu2KgcMlMWLIYayKWXCZ4u1CRLi+1ycKmwrIf0jv88NktdZsZZY+Csqx
 BnuOsmS7kQaH1POLbSnRFUW2vzjsEhnXub02LjxleiZNEpHM+GoRHp0q6TTKiwQPWez7
 pDQ/FC+h+/ge938XHW2BkNBKfb3N1jfcoa0WYevD0zeb7KXzpRhR8dE67Y4hvsn/nVVl
 HAHRRBko2cI2KDdAhIaetu106VU0Jm9VSGkIcvunn5M9HRmyxMo9bhQmYlUgpGbZ9bwE
 f8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778844314; x=1779449114;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2cckrbFDzDclaD9xEuvQg7f44hhTEfkSqsz3bGxhFSs=;
 b=s2nxgteOMU7m3HQHELbeF/9jIWgtwZoL8nb1Chne2LMyL7yutcmgjfGFX5gD0C95A9
 nT/c2BEpt2dTnU92T9WO6xH3pcCVmuEUnrw+NZX542pOErGqwWcXKhWJJ1nCk3YVBala
 My94Co1+6mKHP17X3vKdVmwJ0YeFfbAASgFkRuD/X/FBoK9/TGYjE/95d/Ro4YxBCVlZ
 4DJi6UL8vDVnEli4ksToibdfaVrY32/TVgv/Wvugo0SrgQquxus/sh/zBCe9KYQGkKNw
 AA0lpXKfhEtfIRkIr3adqNbR5YAQij/jxW5x9hWWbU7YLp1LNFsoUioD8CjQgxfWxQqr
 WAbw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8xXjXnqQVnC5mUtNwbnD+/KjqAn1EjE7OTbSdYfEM8xkVIGOOgZQ1Yhb8m0oMcmNeQcl4Vm8ML71UqTA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzroSf+AbUpOZieccGZA7jGk4tMCMKKVCYiVsO9FTnVLZoadZFu
 k18pHpd9VPwWrNFnVK72i3XmrqAmp/t6GOs5YkO3gtjvjoELn1sonVBl
X-Gm-Gg: Acq92OGZXMYAB7kZWJedAuhOG/OYdRQcyVFvKYcF380f3UjB/ZedI4DvvKfHbY3jMS0
 aO5fVSJnqvsj5c9coCNguqOnXTa91QcO0DqFqBYvfLyU3UcEOr8xQ+uJg80r+U7YJEwEMTN65EQ
 tFYIxY6REkRhUTD2PQPydTxvwT+d6ys0DAHKv8FcVpBfe7V4D3H8N2RZ/yDpx0K+A1zDKTeZXCL
 RQkyQ6kEOxiz0i2nneeF1UAlRyNoG3v1URRNJxqq2Lc02oDEcOQuxuYhm9m1UwKpKgx9ucUzVBp
 PUuBkNFFeKo78ORLX/QlJvxBPHz/b1WNtWYpXAT2Z4mgAwwNFFPAtI3E47F+ChD6TpuwFh0Cu52
 8iZoAYWfbMOONOmFxj+UxjjFYDpliGMyTUsVGawzcHcWvPQitU8/sJp5Lp6a0IlartYFd4Jl5QT
 MBiDe4xobh7kOEKLMPFAmYjWGrvR9ECeGiq0uhveMSZVRE+IVk0TaGHSc2zgTp5gQJwm19GPXUw
 aqY0XY=
X-Received: by 2002:a17:902:f08d:b0:2bd:2051:13ed with SMTP id
 d9443c01a7336-2bd7e87ef1amr28948915ad.23.1778844314099; 
 Fri, 15 May 2026 04:25:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5d0fd856sm54530385ad.66.2026.05.15.04.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 04:25:13 -0700 (PDT)
From: phucduc.bui@gmail.com
To: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
 broonie@kernel.org
Date: Fri, 15 May 2026 18:24:54 +0700
Message-ID: <20260515112458.34378-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 May 2026 09:22:57 +0000
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org,
 tiwai@suse.com, mcoquelin.stm32@gmail.com, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/4] ASoC: stm: Use guard() for mutex &
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
X-Rspamd-Queue-Id: BD9025699BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[69];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:olivier.moysan@foss.st.com,m:arnaud.pouliquen@foss.st.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:linux-sound@vger.kernel.org,m:tiwai@suse.com,m:mcoquelin.stm32@gmail.com,m:perex@perex.cz,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:phucducbui@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,suse.com,perex.cz,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.983];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series converts mutex and spinlock handling in the STM drivers
to use guard() helpers.
The changes are code cleanup only and should have no functional impact.

Best regards,
Phuc

Changes in v2:

 Replace break statements inside scoped_guard() blocks with return 0
 in stm32_i2s trigger handling, since break only exits the implicit
 scoped_guard loop rather than the function switch block.

bui duc phuc (4):
  ASoC: stm: stm32_adfsdm: Use guard() for mutex locks
  ASoC: stm: stm32_i2s: Use guard() for spin locks
  ASoC: stm: stm32_sai_sub: Use guard() for mutex & spin locks
  ASoC: stm: stm32_spdifrx: Use guard() for spin locks

 sound/soc/stm/stm32_adfsdm.c  | 10 ++----
 sound/soc/stm/stm32_i2s.c     | 67 ++++++++++++++++-------------------
 sound/soc/stm/stm32_sai_sub.c | 29 ++++++---------
 sound/soc/stm/stm32_spdifrx.c | 44 +++++++++--------------
 4 files changed, 60 insertions(+), 90 deletions(-)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
