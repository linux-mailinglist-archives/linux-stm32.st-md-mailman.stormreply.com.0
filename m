Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANYTLXPaCmob8wQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:22:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 378EC56998E
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:22:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3232C5663A;
	Mon, 18 May 2026 09:22:58 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEF9EC87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 10:43:49 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2bcd730e090so23793115ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 03:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778669028; x=1779273828;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WJhDTZ96rCLwuybfvMwu4DRpewl1qW7+n/gNAgLcqec=;
 b=q/lR8crDP9p1SWZ3/HZ18BiZukJ3i3+I9bhQ5wWz+5+e65GEjIjlk2h25kbIwDGUsi
 IdIiNswODC3Ux1e3PO2G95/kd2QUtG1CHV28k1asMCuz7dA3EoidKbxsNcYO/Jw035cU
 QvghErFIAsmT6ISvXWjpq/CATb9HxC8g/wYsB0BfjM3yAz0QysMOMPeHoKxE38pzlzNL
 u32A2bOS8EiraAv9a6vEuVGzT9Pupp39jNdO5+rp2TArEhaSPJdSc+xNoYzePUOv/pxq
 LNmX5NBvzafcSBkG04I225ryV5Ew483wLk07Y73iumUy949kgRyB7T+uizvhdOKaP6nb
 57lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778669028; x=1779273828;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WJhDTZ96rCLwuybfvMwu4DRpewl1qW7+n/gNAgLcqec=;
 b=QdJvrGEya9XjVMgmogGppaFWl5wOV0ZPUqmWCC7WP8G5CWp1MPaTve31WupPkZPWwy
 lmis/zcdsDBSkGIPM8nYMPGlUPqxn16aj//xYEKMOZFQ6Zu+rp3J5lcH+cUe4R4KRV2p
 inaME5PAEcWf1cPKsFMr0VdmgqKcobNxvhJOlY8axIUyIxkqJ/s5GhfR6CXooAabt/vy
 1Lpv7Zt4Dq66+veEg8411Jam7SNvXSkFeGHE53nDbpcWLIGFKTGvaQR2It3cOzM2zkVo
 rItTZTuJJn03lT9xICrP7dHhJ13eGLMa+HTTDIdzuBhdgdF8PBu4Wi5/o9y3URAVbnEX
 Z72w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/8cBCCyRSRFmoly2jj1bFsRLJlJT301EdHhoU/EnEExOIwxAFvtQ5EMHCpERWUmlsK5Cxy1bjgURosIA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw+lK4IoQPg6Pgk9q0AWqStZWfYDMjIlat85PiH+iOPrqrEcULw
 XVuWZuIpcsFDLcEeG29KVzaiMXen2cz1MBB21C84myOzyyZ+eTiRN+rD
X-Gm-Gg: Acq92OEW9ZP2/zs+ADke+yYjWpmGNQnigNtZbLnfGSziX7xLqzjOBx6bla4alQAii2S
 6kt4m+qXIF7pIlpOR+MbI6oS0Azcs3Vs3NfA6/AHDaaCgomEQQ+QYjh5mTXSI/2rHN6tg9UGPjO
 p+5j4FrTAUNXRHd7MIIEQloUGrXrAQYPIrxifKHfe5pB0uy7ieAMKvNcOFJ6WD8UPVP/u8EmQCS
 AKlwVxg68xTWzPYZcyfuWsbr6qVTo3yMOjZrmLwkYnowOyxvY76JlGUTeD/t9XQGJBguUl7bZ9s
 35MGQefXR3F5mDTDklwUvQELCVc0b8O3zz9JWzqiNCRcI218AecdKex0EGL5oJB0Ku+0nt6EAyB
 qyKntldC5ZjE5cKjPp3OfANOGpiVMBeaInxhT1yKve8IdRQB1ZODpEt7EK8hBgciZGp63lik6HU
 7hQv2tJkjQl4sn9wDS0xH2YpVmIgv8v85cY5uL2sKBH2lsV0zuxQeE7T07tXukGF8mgxXz
X-Received: by 2002:a17:903:986:b0:2ba:6ca2:bd9 with SMTP id
 d9443c01a7336-2bd30640442mr23589835ad.41.1778669028312; 
 Wed, 13 May 2026 03:43:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1e35e9dsm170479535ad.39.2026.05.13.03.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 03:43:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Mark Brown <broonie@kernel.org>
Date: Wed, 13 May 2026 17:43:25 +0700
Message-ID: <20260513104329.81592-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 May 2026 09:22:57 +0000
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/4] ASoC: stm: Use guard() for mutex & spin
	locks
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
X-Rspamd-Queue-Id: 378EC56998E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[118];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
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
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
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
	NEURAL_SPAM(0.00)[0.982];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series converts mutex and spinlock handling in the STM drivers
to use guard() helpers.
The changes are code cleanup only and should have no functional impact.

Best regards,
Phuc

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
