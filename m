Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLWqNbTjDGrIpgUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 20 May 2026 00:27:00 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 726D258598D
	for <lists+linux-stm32@lfdr.de>; Wed, 20 May 2026 00:27:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 145ACC349C4;
	Tue, 19 May 2026 22:27:00 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9732FC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2026 22:26:59 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2ba21d32776so29539315ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2026 15:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779229618; x=1779834418;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jifOPOKz9e7t/M4xHCnDkF0tjSFHG2IW4tQnfDCbC4s=;
 b=oq41ks/1t780j7/zpMuKWP2iTHWNv2k6YhOwNVus8wFVHpSz2CxqMov5PZL3dBzt8P
 xEISxBJwVh/t8bxsgtqjQGyhfjgfvD3j2rPQfDvQOGYnI3H3WLqLgbieHG4qe2fT3KE9
 begTIBBElCcBttYWMu++/VDWUVET76DI+DWs/xli2FxGw8kGawngbeeSRPCBTb6xWUsA
 f7Xl/lDb0UNhz6u3gI52QW+/qHVzAZZclR9P0JP7aMSrXtPmB1+OPMdAyO1T0up5hJXx
 79WWrZ7GA1cOjDAaTvx9LVSSEnJx8S66cbzkHnZOT4xPbmd9CnsA80Xf5Sg3bu1Uop01
 WNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779229618; x=1779834418;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jifOPOKz9e7t/M4xHCnDkF0tjSFHG2IW4tQnfDCbC4s=;
 b=XR2tYTrEM5lon9LV+y5dY6vbUfFLP72W5K3H+6g+viWIlWHUVId2I6I4/ldm8zI+Ps
 4MCetguEWgbg6WYGir+dE7cY4DbkglPRFZiMGhfCT1UjdQk39oX+3Yn1KrBzSTABdRQw
 Ei6/Osh/3wUVIBdC5zHx4vtlOVrrGlhfSOmLLez0q0x3+4+SVr45MrqWQFsSABriQqcA
 USCDSK0trnI1LRmGaNi/69VLma1o7vcnopAvLigT10jlzvrs5zbL6r0d5zgsEUkgD4Wa
 YRx7xLcdKdv9u/PDSePVReNjfrI/lsK5wxTtdMI7knoomg/UY4SsnAJs/WIQdc9o5FEJ
 nGHA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+zYVUj+8UCR5GVOraEtbL0wEMIR41No0b6OV5eD8gmGaWsZGMmfQZgibrm/c5UWZD4wCHzd4SaQKp3bg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxgOXDIiq+EutlyvuEsSU2exjbVWujO1NRfSv07Ds+c/hontcgF
 UTTSmTOTxt5u/TpeyMYJ80GE1YOjAVhPe2+44Kq+zoK+VPMij5l9h7wa
X-Gm-Gg: Acq92OFRC/h1yCtV/Pd92se12l1V6I/ESkHjPZtu7cbII/ySvK+CQQI/SahmuUvwukd
 +pDoWD8igxTsE/xci8+Yb9LU0n1LKjVACK3nGbLYov6SLwc4X77QFOlkMLFtOt+LHUAlYpSsWnE
 +1UZztV+wU4i6se0IWTOodPwYqG40UwUsyvtR36fUfAXSU+K+cU02Q1far12lIe5N2T/nkrIoc1
 EcE7RSPJuojARBh7gUGHcl0raujkDrb0W53j50hniKYn4Y63zs+w7pFk68+QWn0DGHM2X0OyksF
 BLxLB8DBoaJ1/QHrzcwSrMDaFyQopfFV8ZnvSgdinLLt2LVRa01aJ6mgHBm7MZ73/Vp/vwXwPP5
 rhImnr5hC+rHtBqJfCJ0/IKzDluMnRQRJBHcZ95RxgtUr8NhQ9JQ0oms7lx6A5Qgb8aBOH8A+xb
 QXFScu+P4XmEUfiHwsKAvJE+0L8q/z2Mt/PTUJ9wSr+/+YY+616JHGuEzzh560MGjDld/IJb6fg
 aW5h8nxV1b9Xk6xTFGDsU/LRuv7F4jIKHNTW8mC/7B7mw==
X-Received: by 2002:a17:903:2a87:b0:2ba:4eee:6c1e with SMTP id
 d9443c01a7336-2bd7e8214d5mr226202775ad.15.1779229617864; 
 Tue, 19 May 2026 15:26:57 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5d0fd279sm196517115ad.62.2026.05.19.15.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 15:26:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Date: Tue, 19 May 2026 15:26:39 -0700
Message-ID: <20260519222639.34508-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Cc: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
 open list <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Alok Tiwari <alok.a.tiwari@oracle.com>,
 Michael Turquette <mturquette@baylibre.com>, Brian Masney <bmasney@redhat.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH] clk: stm32: add missing bitfield.h header
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[foss.st.com,vger.kernel.org,kernel.org,oracle.com,baylibre.com,redhat.com,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:linux-clk@vger.kernel.org,m:nicolas.le.bayon@foss.st.com,m:linux-kernel@vger.kernel.org,m:sboyd@kernel.org,m:alok.a.tiwari@oracle.com,m:mturquette@baylibre.com,m:bmasney@redhat.com,m:gabriel.fernandez@foss.st.com,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 726D258598D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It seems some ARM header includes this and the build passes there, but
nowhere else. Note that the driver has COMPILE_TEST in depends.

Fixes: 37ae8501cdb0 ("clk: stm32: introduce clocks for STM32MP21 platfor")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/stm32/clk-stm32mp21.c | 1 +
 drivers/clk/stm32/clk-stm32mp25.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/stm32/clk-stm32mp21.c b/drivers/clk/stm32/clk-stm32mp21.c
index c8a37b716bd5..bdb17419908c 100644
--- a/drivers/clk/stm32/clk-stm32mp21.c
+++ b/drivers/clk/stm32/clk-stm32mp21.c
@@ -4,6 +4,7 @@
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bus/stm32_firewall_device.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index 52f0e8a12926..eb0bc918ecee 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -4,6 +4,7 @@
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bus/stm32_firewall_device.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
