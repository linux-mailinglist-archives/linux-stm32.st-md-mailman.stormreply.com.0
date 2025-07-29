Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A93AB14893
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:49:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9449C3F95A;
	Tue, 29 Jul 2025 06:49:43 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 310C7C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jul 2025 02:02:10 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-2ffa1b10918so2866728fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 19:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753754529; x=1754359329;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EEeZXXxE8pXnqG0YImoNpmvGHhhvN/xzySIEmSbgUno=;
 b=eK2WexQqqwiRJlpH79X67CR6ACI/LfTkgY/WGigSbFreKOaFQ0vLDycDAFqdIzx1nv
 GcHfxtbwbv2+U2iZHWSMUZ4ZxgDrKHxsy5MILspJgwclbEjDd9DNLOBOq6FM6aaOpyK/
 +NL6U90qjzXzCK+i4b1Tb4yDVHgBPNLc/sENUHWyyQYA9AWUvFXvePrt+a6Fy2EWC0Te
 uYz8FDecCFWg7h3ZwikImQGMAertvYPmGPAhlNKtg1KSvTb5iySaaxur5VmRV9SKxVQ6
 y/azoks801L2tcBGx9TqwPaO3Do8BffXZO/sjK6k+rO4qgXxWvw6wVHKn/Jz/yRgmXUy
 FMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753754529; x=1754359329;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EEeZXXxE8pXnqG0YImoNpmvGHhhvN/xzySIEmSbgUno=;
 b=KdaN4CUIP54x/hLPW4zwYNTX/fbWglOGxTRauzJ5A5ErAP5Ei0VptjjROEwVhGtsZs
 2Ku5zy5Lhwen6Cj5RexqLQuImp11MBvt0mY3QLpdsXIGCDz7o2dCL2C4BF6fp1xUaAf/
 LxR4NRwZGS/B3KJftaAz2dYH3FVP0lcGethu1u8bzVTWWPr5L0SPwpmoKiv37wfRhL0x
 JSyQkzyPdlvfnsfRBMt19OhIomSmrChmQ3kum3bpTwjUwTHbJfozZmBXUSRxl0s5HeSW
 596mVgrW0gsCPu3/Rexq8M3trub/apT/DaFRh/3Oz1NeGHEIGchB4oiSKE3o+QeiFIFc
 zGAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6wROP18vGflpszALUmEiIclMbcwDyNotAB/KSFFSfJeylVQlk4l9r2G8A7NTyWga3V2Z1ByPF2XEAtQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzV+r1m1uxhBDMyfTDZtuidjRR/EH+LXOoNfeP8N7juIGKPsh5w
 eBELa6gIgUpqibcdmPaiSbJw4h3YnnAR3LiTiDmSURNGEJ/6VGo+AYCw
X-Gm-Gg: ASbGncvONeVAZPX6Qo++lQrQsxYyUlb3d/XrFbL9d0NIfr2SETj4CkJ/vh2rqyQZXaz
 qohYedPaAuDXUZTmi78OHs9StgWK09GPwDvEoYm5hQ/cL9a7x52PjX2Xa5DS68oxOlyQhknS8fe
 IsKzekRcU5uxxZiCb1pUJJxmguXDHKpgalPJwmz8RSxhvE4Y4LR03cxu/nW9r2gUXf6EvEoKNre
 qiXQeKLg+wTSSqr8IkWu0kGuR15GtWIdy/E3SxJOqnZRsFKMA3QNSizTDeRuYS3VQD9CGO55bHn
 CzaAQdyk0dpWeBRS7n5vt7gLQ8kRAUq6tjgTQtOSom8Srq0fFOQ2k6aGndD1mhrQMrtzXzWRjQI
 04Wk4nhGwPqEB1rADSkT4ewxM
X-Google-Smtp-Source: AGHT+IHOw30O5Z7jeXCpP/Gpsx4e0WuD5rBxHCXsw90edV57RFa6IsOd12KYHPXG7J73ZnyfU7myhA==
X-Received: by 2002:a05:6870:1b83:b0:306:9f8e:6699 with SMTP id
 586e51a60fabf-30701faa8b5mr9069467fac.30.1753754529402; 
 Mon, 28 Jul 2025 19:02:09 -0700 (PDT)
Received: from s-machine2.. ([2806:2f0:5501:d07c:e094:d952:816c:c6a5])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30713663c67sm2001746fac.31.2025.07.28.19.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 19:02:09 -0700 (PDT)
From: Sergio Perez Gonzalez <sperezglz@gmail.com>
To: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Mon, 28 Jul 2025 20:00:49 -0600
Message-ID: <20250729020052.404617-1-sperezglz@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, Sergio Perez Gonzalez <sperezglz@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ASoC: stm: stm32_i2s: Fix calc_clk_div()
	error handling in determine_rate()
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

calc_clk_div() will only return a non-zero value (-EINVAL)
in case of error. On the other hand, req->rate is an unsigned long.
It seems quite odd that req->rate would be assigned a negative value,
which is clearly not a rate, and success would be returned.

Reinstate previous logic, which would just return error.

Fixes: afd529d74002 ("ASoC: stm: stm32_i2s: convert from round_rate() to determine_rate()")
Link: https://scan7.scan.coverity.com/#/project-view/53936/11354?selectedIssue=1647702

Signed-off-by: Sergio Perez Gonzalez <sperezglz@gmail.com>
---
 sound/soc/stm/stm32_i2s.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 0e489097d9c1..6ca21780f21d 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -469,11 +469,8 @@ static int stm32_i2smclk_determine_rate(struct clk_hw *hw,
 	int ret;
 
 	ret = stm32_i2s_calc_clk_div(i2s, req->best_parent_rate, req->rate);
-	if (ret) {
-		req->rate = ret;
-
-		return 0;
-	}
+	if (ret)
+		return ret;
 
 	mclk->freq = req->best_parent_rate / i2s->divider;
 
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
