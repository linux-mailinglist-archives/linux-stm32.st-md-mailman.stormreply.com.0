Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id onVTOjzuVmpxDAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 04:19:40 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DB375A088
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 04:19:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=ihZcenMz;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 207A3C1A979;
	Wed, 15 Jul 2026 02:19:40 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAF5DC2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2026 02:19:37 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2cabc0a1ab6so59412155ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2026 19:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784081976; x=1784686776;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3+A/CsOvZ5kwNPw68MEUIBx9OhApXOPeGcI1WPKSM0g=;
 b=ihZcenMzUk+R7hwhxifNKfu5FuJF7LZxWf4d78kPYsmQCboZPFVXA0lnWSaJTydhGc
 gCPFlrpymlri00z9kEopppfGWGsfkk/mA1AHFujmj6i72+VH8NDmJp06spOUYseTKpow
 yS4d3FJL6fGSIJIXGulkKR2sHhPpzdUEs7xcnujk4RGELdqO8QV3uSutZD385ZooDwcZ
 UlPxSGRqhVfuwT09xx3VOOpIvKr71Nos/wS0PAA2AtD0leuRWGU+KPBOyGmm3Y3/xwwA
 3k3hEj6rlT7n4gL9vI8SAt2DavvGokA5Ex+DxsDSkzdYwLtuIg5OILj9+1R77wakl5I8
 mBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784081976; x=1784686776;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3+A/CsOvZ5kwNPw68MEUIBx9OhApXOPeGcI1WPKSM0g=;
 b=P1n0NO5olZDLlGIFx5bdxL/9OenUcWhzAUoOLwwxFI81aeoSQuLiPjrqVCyacUtOmg
 JURfqHYXa9ptaRkUrOGho+AxPtaASZQ8zf4RcuZFQpitql3vH9NuDaY7g7QMnTlOSz5l
 mx2gkL/sT8c6NW7PCwzLOrmYxhfCgWxVgNhTtp7NylTyOd+Gtg6Kw/enCVKOz14dYXKq
 aRAjbsxOltAYggYYsELZAd/eN9UsTfEeOYFBoEF5OHwlg3Ku6aHSgz9RgAPpWQvXs002
 n8W5+OXxIGmvnqgXIpatxDNrtFQRL7bNARVbgsTV13rcjrocRBHJO0nT8BfLSIcAd/Wm
 aPhw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoNbnpe/QzpiTW/m/yWgU1I/cg/nB189FdQ7AgB4iD8oIgr05bfG1Ul0XLEJpIOdtDkkAdFqTejNlARiQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzgJ9ss/ZMSRelUuTsBTlRi8W9QxvJiGq0hVxph4P9Fn9V458x/
 jBMf5DBxJM/lzuZFihBh7EuOg2DDTKOspju/AtMPs/xNi0ryFIJkEwwp
X-Gm-Gg: AfdE7ck6rLUoLKBYbJsBMgzut5nj9FUBEtju/R6lhnzqmiCo70eQHxEhCHBph3QaNBf
 B59jIdaoNt8/HWsbw2mgKgCGCbxd2WFsHTGyYlZub5Jg8CMfNtEdU16khGqgL+FkoDrpDkT6At3
 D1P8ZMkbgKwjPMpR7Rb8NiA6SATaQmUOB1qeHDPfUyHX+kV2Zvz0AfCzqqu5wBDmzli6xfOEi8q
 CmgSF0pWUZUWMFgJp3XT0UI4ScQYdPsYZ+aCyFYpUjdfIb2I7Dma6tvuhchlEsp3teQwM3EhyDI
 S9vwar99XnNMm5In+iNNGPg2VlgS/zfX/tf3yJJenSMeOlz6f4AGtMRjwmheJgHpKDhs1ivklfy
 FsElE0ErQtSPJzNbEZwO5oj47GjwBQtUs8lUY2fd++23cgTKCOUJ3YEAjs2Pu5kyDpUF1bodfL7
 IP9jnc194B0mLw8R5MDspM+B33pSjdT18TQ+Iemspmj1F9c+HxpoWtiw94adOuXkK4yoIm9+6yG
 J2HxzlV//Iy3ZiopvviaYqMAiTfnA6qReQkjI3DdDUV6lYmZC++3yHe/1l2659r2A==
X-Received: by 2002:a05:6a20:3d92:b0:3c0:9c1a:893e with SMTP id
 adf61e73a8af0-3c34d8c599fmr6957139637.70.1784081976192; 
 Tue, 14 Jul 2026 19:19:36 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ca7f626fb78sm8653754a12.13.2026.07.14.19.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 19:19:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rtc@vger.kernel.org
Date: Tue, 14 Jul 2026 19:19:33 -0700
Message-ID: <20260715021933.1551663-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b?i:clang|llvmb"
 <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>,
 open list <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Justin Stitt <justinstitt@google.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH] rtc: stmp3xxx: use
	devm_platform_ioremap_resource()
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,lists.linux.dev,google.com,vger.kernel.org,kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:linux-rtc@vger.kernel.org,m:alexandre.belloni@bootlin.com,m:llvm@lists.linux.dev,m:ndesaulniers@google.com,m:linux-kernel@vger.kernel.org,m:nathan@kernel.org,m:morbo@google.com,m:mcoquelin.stm32@gmail.com,m:justinstitt@google.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73DB375A088

Replace the open-coded platform_get_resource() plus devm_ioremap()
sequence with a single devm_platform_ioremap_resource() call, which folds
the resource lookup and mapping into one step and returns an ERR_PTR on
failure, checked with IS_ERR() and propagated via PTR_ERR().

Move the mapping ahead of the devm_kzalloc() so that an error or deferred
probe is handled before the rtc_data allocation, avoiding needless work.

The fsl,stmp3xxx-rtc nodes in imx23.dtsi (reg = <0x8005c000 0x2000>) and
imx28.dtsi (reg = <0x80056000 0x2000>) each provide a single
non-overlapping IORESOURCE_MEM window, so the region reservation now
performed by devm_platform_ioremap_resource() introduces no conflict.

Built for ARM (mxs_defconfig + CONFIG_RTC_DRV_STMP) with LLVM=1;
drivers/rtc/rtc-stmp3xxx.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/rtc/rtc-stmp3xxx.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
index 7afcd14aeee5..05f128ccf827 100644
--- a/drivers/rtc/rtc-stmp3xxx.c
+++ b/drivers/rtc/rtc-stmp3xxx.c
@@ -245,28 +245,21 @@ static void stmp3xxx_rtc_remove(struct platform_device *pdev)
 static int stmp3xxx_rtc_probe(struct platform_device *pdev)
 {
 	struct stmp3xxx_rtc_data *rtc_data;
-	struct resource *r;
+	void __iomem *io;
 	u32 rtc_stat;
 	u32 pers0_set, pers0_clr;
 	u32 crystalfreq = 0;
 	int err;
 
+	io = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(io))
+		return PTR_ERR(io);
+
 	rtc_data = devm_kzalloc(&pdev->dev, sizeof(*rtc_data), GFP_KERNEL);
 	if (!rtc_data)
 		return -ENOMEM;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		dev_err(&pdev->dev, "failed to get resource\n");
-		return -ENXIO;
-	}
-
-	rtc_data->io = devm_ioremap(&pdev->dev, r->start, resource_size(r));
-	if (!rtc_data->io) {
-		dev_err(&pdev->dev, "ioremap failed\n");
-		return -EIO;
-	}
-
+	rtc_data->io = io;
 	rtc_data->irq_alarm = platform_get_irq(pdev, 0);
 
 	rtc_stat = readl(rtc_data->io + STMP3XXX_RTC_STAT);
-- 
2.55.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
