Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A14382F643B
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 16:23:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53E11C424C0;
	Thu, 14 Jan 2021 15:23:34 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5D01C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 15:23:32 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id o10so157905wmc.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 07:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LUR3ZC5J+1hLkR7qz5X75neLOSs5yFqeDGs5AO9qOw4=;
 b=LWGlRpsZ+c5J5N8fxZQxQAtRsePbal/MHQsI00818w2JQRVWkSwZfq4KGRZpl5qQkS
 cmUin/BmDApKu0+yaK/yZKP+4GpIg+m1J3cUGHIGmhy7zBQf6lDT7cHaPzXUx3m5d7nh
 hsfV+fAjLuZlK4DVOrbY53QYJFJBfyzJ4eJ89TVmoD5Gex4jCGr5mEIT3l4Wx2xS+ub6
 crLMVAZao1Bt1oxaQ9kFAonzeBN+svgQ1kpFWLKQxM8WWiD2PWL8jXWhM0OhQZ3ypx37
 H4rO9JO7eNksW+7X3SvoCCDcdb3xvdwD3ZuNvEkxQLqeTWXAzIgdMJpUlE4jJc6y2b0a
 Flsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LUR3ZC5J+1hLkR7qz5X75neLOSs5yFqeDGs5AO9qOw4=;
 b=I2RZbP/wP62vYAMv2Mtj0k48bXVYIe+oZ9VQO6Or/vwQkblxPbcmo42jjZmzilr/kF
 1MNNNFVFpVQmf70AtEuVVVvLUmFxPyT2nT7ZjR7CsUSXqWhxKXJ8fJcL8m1P1m2aBViq
 OSe24xPWQXwvSdADCAsTbnWDwHJJFQIvEwVEbgICUHBv6v7OOpVbamDRN1eVd7/FVvYS
 D5Rqc2x+otYACUgXJHXrYgHYqoPGZPRQc5TlJq2Ah+lCh+ACzt3l9xcLGUKAMOH6kIyw
 c3bqmdvi2D605yoet63wbmWqkPU2/w/Hdh0AZGNxPd5EeKDWIQRHra6kYJNE5NLPBCnO
 c45Q==
X-Gm-Message-State: AOAM533V+ia77b27ZSvaRlulvzfMO0nvkk8N/ZvtsPcSyM93Tvvy0dxz
 u2TfBuQYH/HXSm96lmU65KEUKQ==
X-Google-Smtp-Source: ABdhPJyDPR5SpV4A1P0OFN9rFKTQ2+PGovbF0AbXTJxJljKfJFFIiV44I8Zw/NaDinFku3qBrxZwkQ==
X-Received: by 2002:a05:600c:313:: with SMTP id
 q19mr4402221wmd.126.1610637812260; 
 Thu, 14 Jan 2021 07:23:32 -0800 (PST)
Received: from dell.default ([91.110.221.178])
 by smtp.gmail.com with ESMTPSA id e15sm10777713wrx.86.2021.01.14.07.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 07:23:31 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Thu, 14 Jan 2021 15:23:18 +0000
Message-Id: <20210114152323.2382283-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Henrik Rydberg <rydberg@bitmath.org>,
 "C. Scott Ananian" <cananian@alumni.priceton.edu>,
 Luotao Fu <l.fu@pengutronix.de>, Peter Osterlund <petero2@telia.com>,
 Bruce Kalk <kall@compass.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Stefan Riedmueller <s.riedmueller@phytec.de>, linux-kernel@vger.kernel.org,
 Stefan Gmeiner <riddlebox@freesurf.ch>, Sangwon Jee <jeesw@melfas.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 James Hilliard <james.hilliard1@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Benjamin Tissoires <benjamin.tissoires@gmail.com>,
 Daniel Ritz <daniel.ritz@gmx.ch>
Subject: [Linux-stm32] [PATCH v3 0/5] (Set 2/2) Rid W=1 issues from Input
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

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

This is the second (and last) of 2 sets.

v3:
 - Make use of 'ret' instead of removing it
 - Use __always_unused instead of removing unused variables
 - Fix recent/new warning regarding undocumented 'prop' param
 
v2:
 - Replace empty if() with commentary
   - Suggested-by: Joe Perches


Lee Jones (5):
  input: mouse: synaptics: Replace NOOP with suitable commentary
  input: touchscreen: melfas_mip4: Mark a bunch of variables as
    __always_unused
  input: touchscreen: usbtouchscreen: Actually check return value of
    usb_submit_urb()
  input: touchscreen: surface3_spi: Remove set but unused variable
    'timestamp'
  input: touchscreen: stmpe-ts: Add description for 'prop' struct member

 drivers/input/mouse/synaptics.c            | 7 +++++--
 drivers/input/touchscreen/melfas_mip4.c    | 8 ++++----
 drivers/input/touchscreen/stmpe-ts.c       | 1 +
 drivers/input/touchscreen/surface3_spi.c   | 2 --
 drivers/input/touchscreen/usbtouchscreen.c | 3 +++
 5 files changed, 13 insertions(+), 8 deletions(-)

Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Benjamin Tissoires <benjamin.tissoires@gmail.com>
Cc: Bruce Kalk <kall@compass.com>
Cc: "C. Scott Ananian" <cananian@alumni.priceton.edu>
Cc: Daniel Ritz <daniel.ritz@gmx.ch>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-input@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: Luotao Fu <l.fu@pengutronix.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Peter Osterlund <petero2@telia.com>
Cc: Sangwon Jee <jeesw@melfas.com>
Cc: Stefan Gmeiner <riddlebox@freesurf.ch>
Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
Cc: this to <linux-input@vger.kernel.org>
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
