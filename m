Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GBoNc48BGqsGAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 10:56:46 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 692545300D2
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 10:56:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AAE6C87EC6;
	Wed, 13 May 2026 08:56:46 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE964C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 13:32:22 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-8379e010b01so2323041b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 06:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778592741; x=1779197541;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+G1CpOAyOxANA+SPh/GOBsJg+6uFI1md7kNT04Z6aes=;
 b=O2jsMDAMZ0U9d75ERvWgxBQG+pfwnjpGvJcNPPcVSdIH/+IhGDGLfFqTonGhJUjiAZ
 e/wQvU6sZp6i8qXkt5U7yY+621aBxC7x4N21UyLwtyKJ8gIMuuJttTWmhe+8LBsOGCNk
 xnQzxmvDLM4PAHxeV35QiCde3i5IxFo/xoMkDo+WxK0pXRV9EL93JkIcIvQF9xfXpoUI
 5sJ5YJKz4ctbvXAXdaZ6MrXILgOJQwLcaWeRgvkn9lPzdNBHEM3cRntIMvh2zqBgsZi5
 bJEH+G2vhdu9tIHpMHXAgp0F24rp1p9pcb+m58QFS+nj53ZzYLAXK/G1QTKApIORslWb
 Bs8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778592741; x=1779197541;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+G1CpOAyOxANA+SPh/GOBsJg+6uFI1md7kNT04Z6aes=;
 b=ZyXoPUiJlIPjTCvpr95wCv87eOWAYFNj4EuYRrKut8+fn/jyFqwsxR2r9CmIGAGNSZ
 u/GrEL09vr3hu9Y3dfbTrZIFQSu5pjWQOf+5ZkyZBeiZ/I+38xmF4GydRTUn6bPfAaTK
 aySfoxbmJqWdZczCp6pGmTGzNPMdt2li5VWANlGY6+FPMYD0z4gbF+pdFfDXv9x8sGO1
 i4FqRMrAfJwfGfb49K0gwpODf2IE3ESJCMCxayyDVN6SE8iHigvdo+Kaq9RyTvtoGVpD
 kj+a3WEqJvhIdb+8izNeS7c9qbrbMmJlNyA3b3oYIamqPb6/E+wy0UbuPaG6W1Cog7vh
 Pxhw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8eYr2TOeUDEswhc+dXKNgytfe7Ah7g4qj4OkTdY95UgSThUOtLPitfnLqq30Iarw2jJxAexNpJQoLkBw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzy82/Ju18yWb6G1jEbR5uRdSFjU+Khn5NzZD4G6UHgrQ6b4D3U
 wrfFL92pXZ7DGD5OF2ppaOYWQPr2RT5+isZoWtoH8z/c3ka5V28zKRfr
X-Gm-Gg: Acq92OFwKD4zIUmsWpbkoGCH/GaSPDskL0GqBxDcU6+NHlkM+geAHUKV1Sgm9jkKbGr
 1Ij7mZtOB5dBsbu4jFkZsCBw+zCt+FJCYc1uZ+r8dwzpV3tgLkgiNjQiJPL89D0GQAoNlmiN5L9
 adQqCHP+0qDS8SOGCG92VT+L6BOByp/0hSd0yX4JfPEbuoJ1Q20/LilM1cF2EV2svX9J578/4Gd
 736oM608URbAxst+uocqiaSM5FofDx8kBlGzJ+NCYHe0AKSGw3TttP5GnFkfQWx4u/lbInKlicx
 zWdd5zEJpYkoGtL+zJ8dSFM735rUnRSNY5E0wLSduofx1m1mBE6mDNhEWUdNBy/shZ9R7gpE9C+
 u+YcKGAWZH+S6owuePF+K2dF+Y4h2KtdrCO3Wb3cOazaOvtpQ6nnsiDhCQibPKCLa6zOFcEgqeJ
 QSv3EMiFF3NDiJa185+JTIV3zgbyQtXtmjFgITL6IZuINKhKOe7jyk7vVILpuJKA==
X-Received: by 2002:a05:6a00:b48:b0:835:351c:f236 with SMTP id
 d2e1a72fcca58-83a5d09a78dmr28663707b3a.29.1778592740983; 
 Tue, 12 May 2026 06:32:20 -0700 (PDT)
Received: from r912.lan.4v1.in ([182.70.116.80])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8396563f38fsm22849934b3a.8.2026.05.12.06.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 06:32:20 -0700 (PDT)
From: Avinash Duduskar <avinash.duduskar@gmail.com>
To: netdev@vger.kernel.org
Date: Tue, 12 May 2026 19:02:14 +0530
Message-ID: <20260512133214.1773502-1-avinash.duduskar@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 May 2026 08:56:45 +0000
Cc: jiri@resnulli.us, mcoquelin.stm32@gmail.com, corbet@lwn.net,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 horms@kernel.org, kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] Documentation: networking: devlink:
	stmmac: fix typo in phc_coarse_adj
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
X-Rspamd-Queue-Id: 692545300D2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[avinashduduskar@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:netdev@vger.kernel.org,m:jiri@resnulli.us,m:mcoquelin.stm32@gmail.com,m:corbet@lwn.net,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:edumazet@google.com,m:horms@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.096];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[avinashduduskar@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[resnulli.us,gmail.com,lwn.net,vger.kernel.org,st-md-mailman.stormreply.com,google.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

"Functionnal" should be "Functional".

Signed-off-by: Avinash Duduskar <avinash.duduskar@gmail.com>
---
 Documentation/networking/devlink/stmmac.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/devlink/stmmac.rst b/Documentation/networking/devlink/stmmac.rst
index 47e3ff10bc08..fbaa81ea782d 100644
--- a/Documentation/networking/devlink/stmmac.rst
+++ b/Documentation/networking/devlink/stmmac.rst
@@ -24,7 +24,7 @@ The ``stmmac`` driver implements the following driver-specific parameters.
      - runtime
      - Enable the Coarse timestamping mode, as defined in the DWMAC TRM.
        A detailed explanation of this timestamping mode can be found in the
-       Socfpga Functionnal Description [1].
+       Socfpga Functional Description [1].
 
        In Coarse mode, the ptp clock is expected to be fed by a high-precision
        clock that is externally adjusted, and the subsecond increment used for
-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
