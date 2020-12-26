Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC8C2E2C9D
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Dec 2020 01:15:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 745BFC57184;
	Sat, 26 Dec 2020 00:15:47 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE386C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Dec 2020 00:15:44 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id g24so3609602qtq.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Dec 2020 16:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DVdvTATmDwmYxloj8TKrwN2TG5yZBfCLk/8JXYC6itA=;
 b=kvXDNmNW7SUXGtbW7J5cQlCOUNP/LGcd5R13he3ecyHyWNrJ+1R2licXt5Jt1G+hJU
 zaQ+/rf4B+6HbtIIN5GfWs3+UVO1mNXX0fAusIx0FhkPcZUkzM4Y3BhIZ0Yxh0CCQru0
 SpI3EYt3Tfni/gFhAu5TnBrwAdtG22+8BNLfjNAMnwQYviOTR47OgeBBJ8sWNmVMt6mb
 MUB5zz2owDp7Uo8h45+Co6aTFlQF/DTuv5hkt1Vh2QGcPz6JrD7IXMpS+4XK9vBTk5YW
 AYKClxJNimyLmqsovzMDDLu73zYQ7H18cyCN60NmqK1oiMa7JPbZytwBWXxMVkceQsPm
 tQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DVdvTATmDwmYxloj8TKrwN2TG5yZBfCLk/8JXYC6itA=;
 b=N3v6KRjDqx44af53Qtwv75PuDd0HDFW+AFY1fyK0ABhUkrzUpyaYAOJQacsSDZwT2/
 mdKK1Xtygkt/xTEie+D3T9yrrGneTGXJnbYS6SWPZjuzXVSPOGEnrnSdWGee/VLZkFOA
 qMrsSn6vW2vI4TyZ/jFIsm1QHugYpHZKouBIrNmWjKhDNped4Pa8vfM2z8HpAEj/DCl+
 tBS3+XXNHZUf9llJIIBOcip5MAO7r9USZlVgm1a5s6DgGe1ez+5sB4nKFrllX9BD91Av
 hDTCb9R2caGcgKbtlmfIzyxcgGJt2nr5uG94LjmrSHWMeTYCDrEPfe433twytDmLAk/b
 11CA==
X-Gm-Message-State: AOAM533LDBurQj0dttiG6CwwNvQLh1fopA3K1qU4Ns3MP0uCBvojXe+G
 5NonZrZoGqRZauNCVgApmTM=
X-Google-Smtp-Source: ABdhPJw1rPdFlbbhKKxus59aWuh+wxbn5TechZTGZasdUXRn6/Z7LRnigRTWJTtoxjwQ/trTlAq2rg==
X-Received: by 2002:a05:622a:a:: with SMTP id
 x10mr35164641qtw.29.1608941742965; 
 Fri, 25 Dec 2020 16:15:42 -0800 (PST)
Received: from localhost.localdomain (072-189-064-225.res.spectrum.com.
 [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id b14sm18349966qtx.36.2020.12.25.16.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Dec 2020 16:15:42 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 25 Dec 2020 19:15:33 -0500
Message-Id: <cover.1608935587.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 0/5] Introduce the Counter character device
	interface
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

Changes in v7:
 - Implemented u32 enums; enum types can now be used directly for
   callbacks and values
 - Fixed refcount underflow bug
 - Refactored all err check to check for err < 0; this should help
   prevent future oversights on valid positive return valids
 - Use mutex instead of raw_spin_lock in counter_chrdev_read();
   kifo_to_user() can now safely sleep
 - Renamed COUNTER_COMPONENT_DUMMY to COUNTER_COMPONENT_NONE to make
   purpose more obvious
 - Introduced a watch_validate() callback
 - Consolidated the functionality to clear the watches to the
   counter_clear_watches() function
 - Reimplemented counter_push_event() as a void function; on error,
   errno is returned via struct counter_event so that it can be handled
   by userspace (because interrupt handlers can't do much for this)
 - Renamed the events_config() callback to events_configure();
   "events_config" could be confused as a read callback when this is
   actually intended to configure the device for the requested events
 - Reimplemented 104-QUAD-8 driver to use events_configure() and
   watch_validate() callbacks; irq_trigger_enable sysfs attribute
   removed because events_configure() now serves this purpose

The changes for this revision were much simpler compared to the previous
revisions. I don't have any further questions for this patchset, so it's
really just a search for possible bugs or regressions now. Please test
and verify this patchset on your systems, and ACK appropriately.

To summarize the main points: there are no changes to the existing
Counter sysfs userspace interface; a Counter character device interface
is introduced that allows Counter events and associated data to be
read() by userspace; the events_configure() and watch_validate() driver
callbacks are introduced to support Counter events; and IRQ support is
added to the 104-QUAD-8 driver, serving as an example of how to support
the new Counter events functionality.

William Breathitt Gray (5):
  counter: Internalize sysfs interface code
  docs: counter: Update to reflect sysfs internalization
  counter: Add character device interface
  docs: counter: Document character device interface
  counter: 104-quad-8: Add IRQ support for the ACCES 104-QUAD-8

 Documentation/ABI/testing/sysfs-bus-counter   |   18 +-
 .../ABI/testing/sysfs-bus-counter-104-quad-8  |   25 +
 Documentation/driver-api/generic-counter.rst  |  416 ++++-
 .../userspace-api/ioctl/ioctl-number.rst      |    1 +
 MAINTAINERS                                   |    2 +-
 drivers/counter/104-quad-8.c                  |  799 +++++----
 drivers/counter/Kconfig                       |    6 +-
 drivers/counter/Makefile                      |    1 +
 drivers/counter/counter-chrdev.c              |  490 ++++++
 drivers/counter/counter-chrdev.h              |   16 +
 drivers/counter/counter-core.c                |  182 ++
 drivers/counter/counter-sysfs.c               |  868 ++++++++++
 drivers/counter/counter-sysfs.h               |   13 +
 drivers/counter/counter.c                     | 1496 -----------------
 drivers/counter/ftm-quaddec.c                 |   61 +-
 drivers/counter/microchip-tcb-capture.c       |  103 +-
 drivers/counter/stm32-lptimer-cnt.c           |  181 +-
 drivers/counter/stm32-timer-cnt.c             |  149 +-
 drivers/counter/ti-eqep.c                     |  224 +--
 include/linux/counter.h                       |  716 ++++----
 include/linux/counter_enum.h                  |   45 -
 include/uapi/linux/counter.h                  |  123 ++
 22 files changed, 3259 insertions(+), 2676 deletions(-)
 create mode 100644 drivers/counter/counter-chrdev.c
 create mode 100644 drivers/counter/counter-chrdev.h
 create mode 100644 drivers/counter/counter-core.c
 create mode 100644 drivers/counter/counter-sysfs.c
 create mode 100644 drivers/counter/counter-sysfs.h
 delete mode 100644 drivers/counter/counter.c
 delete mode 100644 include/linux/counter_enum.h
 create mode 100644 include/uapi/linux/counter.h

-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
