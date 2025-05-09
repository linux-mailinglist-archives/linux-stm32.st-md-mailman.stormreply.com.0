Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EB6AB10F8
	for <lists+linux-stm32@lfdr.de>; Fri,  9 May 2025 12:45:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32D5AC78F94;
	Fri,  9 May 2025 10:45:12 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7DA3C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 May 2025 10:45:11 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9ebdfso3584064a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 May 2025 03:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746787511; x=1747392311;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CxPInF1T9LVjEkvLtOyhGto+ZvX/qrXq2sR90esUvWw=;
 b=R+F4PC/k+ngqiaUenzljNJTDUvpbB55n7A44rzmcvEyP/qxqW/ClCMvVBVqCAxz5+w
 Zx75Ou+Vatf6CWR1PmUhYuNR2zVqgrjHYIR9npSfvzGOaCvfSpdt80H0eOUZj/c8uV+f
 tXpoCUFD9UL+PlklQ9RwHAvtADBA+m26SsYa3bP7mmZuAK5dGtDdl40kNJq5ATi1pc2D
 lV0UWsrXewqiWOM6LoXBuDVkybA549xSz2xh7w+DsM987MFPrXfD7XzQo06Gb1GSciPb
 QDQVR6r/MwySN3+j0DDAb8P67Lcd24tvwPebAuzaOSIt1DtZTsB+BsPmozVxQ13fQAny
 J+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746787511; x=1747392311;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CxPInF1T9LVjEkvLtOyhGto+ZvX/qrXq2sR90esUvWw=;
 b=gsI22gUqvWWaTlehdLyvE1I68B5rvIb+xd3bmi8qDrNTjBxX4b2o5C9jROtAOkuxGf
 MBbuXnmchvo1BZ6YWut69MvfVuTviH4P1dBeuhtJy8s8GtZlTwqeLh8tJobzoU0+0XkC
 He5J2SPiAIU7HtRh2dkQHKxVJc52qPUXTlPS1fTWKljwRI7cay0o3xFV5UhoIiMbHGkw
 iijVSE+4VuTd/+UB16jztZva4Ymj1MUAMpuHgyd5TGAUX63YQ8m0CSR6bdQJMvWR/ZLO
 RHmmv8YXEOuAMJGk1HE5Qrm9FhN3YlCfLvl5Y7RxuwxER+Tuc6AcGf+2Iy+8sQmKzavq
 F0kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdeAfXPx3olgTfh/IlmExm4Vs2KGwNNuJ/Fo2KwyzZ9HOmTpyPoXUteDjCNvzBG4LiALsyKui/qLdWCg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwARrIwNioeKWPZTmLlz7bi2aWVnM+qazinmfI9D7+7MhGro3Xp
 aHbEdaKwnis+syL4+zJpFxZL7N1OzstLvAhmAHkHCNk7k5k9QE3T
X-Gm-Gg: ASbGnctZI/rePqVHhghQ69WlqE5TL2mSiu44nT5XrYLOLmLry9y9zBOl9Xh4e4BixBN
 RC8LDeSPNqDs7sbNcDbwbCcKhl9mQOkceEr9GnLkaQyyjhgT8BROsgxq6ORGU9CMOfMbovnMn7d
 SyKURVxxjmOpBWDQszX2KFKs8hLyL4Af/mCvVkuPm9zeg/gbLK8ddaNtacNFxXmUfETmmtuo/+T
 vmr3I4FhmDmi8X32gjcQZ9enIVkJxcSCSUXnH0IoMvUgaHrPTQxQPlRIUQIi683Xazwftr+nvp5
 i7o1dcFQn0+4M9TiesBq4fZZYSFtbjozTa85KjE=
X-Google-Smtp-Source: AGHT+IGGLGNvENgsehRHPyd78blj4yJFAdejnjHHmOciST0qvwqR/4gxuUrwFEkkZ1cDCGVf1I/sgg==
X-Received: by 2002:a17:906:99c2:b0:acb:34b2:851 with SMTP id
 a640c23a62f3a-ad219170650mr281983666b.44.1746787510903; 
 Fri, 09 May 2025 03:45:10 -0700 (PDT)
Received: from localhost ([87.254.1.131]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad219853421sm129131466b.165.2025.05.09.03.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 03:45:10 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri,  9 May 2025 11:44:58 +0100
Message-ID: <20250509104459.28167-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH][next] memory: stm32: Fix spelling mistake
	"resset" -> "reset"
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

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/memory/stm32_omm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
index 166baed0738a..bef7cf4391d6 100644
--- a/drivers/memory/stm32_omm.c
+++ b/drivers/memory/stm32_omm.c
@@ -173,7 +173,7 @@ static int stm32_omm_disable_child(struct device *dev)
 		ret = reset_control_acquire(reset);
 		if (ret) {
 			stm32_omm_toggle_child_clock(dev, false);
-			dev_err(dev, "Can not acquire resset %d\n", ret);
+			dev_err(dev, "Can not acquire reset %d\n", ret);
 			return ret;
 		}
 
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
