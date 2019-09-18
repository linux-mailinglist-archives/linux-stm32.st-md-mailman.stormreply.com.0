Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D5AB65EF
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Sep 2019 16:23:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43214C35E01;
	Wed, 18 Sep 2019 14:23:29 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0115C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 14:23:27 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id x15so4210883pgg.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 07:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hBF1etsivhmKdLkajwW8GHvPk5tP312Rqd082oyW/40=;
 b=KTcABZbJz2NA0gOeD1Qk+C6NCkIU0co5QvjKv9sapaIiZ/aOcOklr2aph/qPdpteM1
 f9Crx3hv6rnSCrkcG89lN6CQljYO6GXIcen+1NBAOp3UVFv/GHksaNifgj73/zPtDhj0
 kS1Ckv3keBIrbasafOfh/gVuWTSMTPlkqgxBlGaZ2PkjjSFRe4/mG9SzFI9tKljz8IoJ
 n9Z8mOb3e4/09p35VMsBbMRTTU4uZdgxp9ikYxgaHqxsArontVYO2lPSFMHmOR1zzbr4
 BZBkP/WhVtTospi0W8CPHgAw/PcbuIvbu8x3H4S7lafBwG2FjZ2l3cDjQX0Ow0TRIBQi
 LR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hBF1etsivhmKdLkajwW8GHvPk5tP312Rqd082oyW/40=;
 b=FB7noa7NWdMyHKsY5/Hd06s5KA3dIRSKEeVq7hCHZIAQ4Hq6gIdpDn62kH5089dmS7
 VSfNxEFcSZy0v734CIgt76clT3Z7OAamU/V3tSXu9fGF4K9iyxB1OwFVyt8py05HO4f5
 2a7B0Q4tfcjJCkISBvaX1lt4RKwUOtl2Ohn1uIAbuHYTsm4c4hD9oMtBUjjsZ905Idck
 SVeUc3KFFiEOH9kWJERuWrE3xs9/Vs6Nfn3houx/Wh7zPZtTfa74blszbB2KMkc1htaB
 k4KUkfh0ZFSjXdUHa0Ds1dq/Q2Hz/KSlMzZNk3g0r+Gl0TEomXS7v05UPkAV7VoNiduG
 s9SQ==
X-Gm-Message-State: APjAAAV6RLC5SSnSzEszXyxGWnO+xUaARVl0ZRjJpnTehOeFSMHjWaD3
 xMGEpwA1iZy+DnTQ0azrcxo=
X-Google-Smtp-Source: APXvYqwDluvBGw1cnbd/MWHtPlAIMe4bMLEDRhdzKzQgVavoWQaUPt4wXe+kCj2DcEFZ303Bu4/vAg==
X-Received: by 2002:a63:d46:: with SMTP id 6mr4329157pgn.364.1568816605894;
 Wed, 18 Sep 2019 07:23:25 -0700 (PDT)
Received: from localhost.localdomain ([2001:268:c145:8e3a:1c91:3b66:30:c335])
 by smtp.gmail.com with ESMTPSA id
 d5sm10996675pfa.180.2019.09.18.07.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 07:23:25 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@jic23.retrosnub.co.uk
Date: Wed, 18 Sep 2019 23:22:44 +0900
Message-Id: <cover.1568816248.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: benjamin.gaignard@linaro.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, linux-kernel@vger.kernel.org,
 William Breathitt Gray <vilhelm.gray@gmail.com>, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/2] Simplify
	count_read/count_write/signal_read
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

Changes in v3:
 - Squash code changes to single patch to avoid compilation error

The changes in this patchset will not affect the userspace interface.
Rather, these changes are intended to simplify the kernelspace Counter
callbacks for counter device driver authors.

The following main changes are proposed:

* Retire the opaque counter_count_read_value/counter_count_write_value
  structures and simply represent count data as an unsigned integer.

* Retire the opaque counter_signal_read_value structure and represent
  Signal data as a counter_signal_value enum.

These changes should reduce some complexity and code in the use and
implementation of the count_read, count_write, and signal_read
callbacks.

The opaque structures for Count data and Signal data were introduced
originally in anticipation of supporting various representations of
counter data (e.g. arbitrary-precision tallies, floating-point spherical
coordinate positions, etc). However, with the counter device drivers
that have appeared, it's become apparent that utilizing opaque
structures in kernelspace is not the best approach to take.

I believe it is best to let userspace applications decide how to
interpret the count data they receive. There are a couple of reasons why
it would be good to do so:

* Users use their devices in unexpected ways.

  For example, a quadrature encoder counter device is typically used to
  keep track of the position of a motor, but a user could set the device
  in a pulse-direction mode and instead use it to count sporadic rising
  edges from an arbitrary signal line unrelated to positioning. Users
  should have the freedom to decide what their data represents.

* Most counter devices represent data as unsigned integers anyway.

  For example, whether the device is a tally counter or position
  counter, the count data is represented to the user as an unsigned
  integer value. So specifying that one device is representing tallies
  while the other specifies positions does not provide much utility from
  an interface perspective.

For these reasons, the count_read and count_write callbacks have been
redefined to pass count data directly as unsigned long instead of passed
via opaque structures:

        count_read(struct counter_device *counter,
                   struct counter_count *count, unsigned long *val);
        count_write(struct counter_device *counter,
                    struct counter_count *count, unsigned long val);

Similarly, the signal_read is redefined to pass Signal data directly as
a counter_signal_value enum instead of via an opaque structure:

        signal_read(struct counter_device *counter,
                    struct counter_signal *signal,
                    enum counter_signal_value *val);

The counter_signal_value enum is simply the counter_signal_level enum
redefined to remove the references to the Signal data "level" data type.

William Breathitt Gray (2):
  counter: Simplify the count_read and count_write callbacks
  docs: driver-api: generic-counter: Update Count and Signal data types

 Documentation/driver-api/generic-counter.rst |  22 ++--
 drivers/counter/104-quad-8.c                 |  33 ++----
 drivers/counter/counter.c                    | 101 +++----------------
 drivers/counter/ftm-quaddec.c                |  14 +--
 drivers/counter/stm32-lptimer-cnt.c          |   5 +-
 drivers/counter/stm32-timer-cnt.c            |  17 +---
 include/linux/counter.h                      |  74 ++------------
 7 files changed, 53 insertions(+), 213 deletions(-)

-- 
2.23.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
