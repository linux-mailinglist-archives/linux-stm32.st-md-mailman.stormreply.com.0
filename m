Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1702241BD2D
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Sep 2021 05:16:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B378DC5A4F8;
	Wed, 29 Sep 2021 03:16:35 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7CF0C5719E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Sep 2021 03:16:28 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id u7so727511pfg.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Sep 2021 20:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nU8NjFcHiQb2juc6iNrXx4yBJlrwbry86U2d9RYhoEc=;
 b=ea9XZQK839csHLMExTfIPXgY4B/YhV0ikwP4KLbKfdTb1LxOXTjjd0FVIUV/iIJWtZ
 Lp5uwzTHdT025gACEWTVCKrIqCotGjaBLQ2fdEw97UKlIqGfhBxF8mpgRoTfseMak8EI
 Pii6a5Q8dYw9f4vuaUYTjBrqxpCrN9H+dPa2rYDVJqnlspqTa1hi5LRVIIcO1OQOY/J2
 /sWp0UxttFYUMYY44ACDYqPLL00wDoi1wzuhxoc4UWCUsV8jk6DYJM+a97gNnoZktkwd
 pIquPCHLds98CRSIZoF668JVQX5NqZQ0i+EenkdwUmfiTCZ3MPavZwYbvxGcClk+dYcZ
 /mNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nU8NjFcHiQb2juc6iNrXx4yBJlrwbry86U2d9RYhoEc=;
 b=6dnCo90QV2npvVia0YBUctGoXKhChamF+xRRuZrJMzssqiD9AQLJaf2IVZvcpoUP8c
 V91CaG8tuwyT4rpeMPBRfdwCWb4ZMNfAqpFchPUOIiOr4JdlalhnnE7A3iWCpSVgwypT
 5o8/t5hY5WgP3QNzVZOHinFfKNH6XsDgT1wxTv+TALoHRuTouGGqK45k/QXkd/ZyBib6
 fFY18XZqShNriyMZAlBIZ2GXIi2YOGz+VRF5qlJqYyv//pFb9SknON1xMfxaiIwXu1yk
 3zpzBnekyrlc+1cEmp0UC7gDr7RP2h01MZWwmNByzp43/GiVw34VY2930+Kygc8biVLA
 HfyA==
X-Gm-Message-State: AOAM533PirBnFYwWRSz7n8ghPsQq2ZD4N5q2SNtdj0vBtGTmJo1NhZRW
 mv1pEnBYTprDiPCgw++FYNs=
X-Google-Smtp-Source: ABdhPJypHhopEVNS9JguXT5SH+XWxunhd/Pyg0tmBrjCHDWxgUIykr9qaW8Y1Ww9rfYyZjTNTWu8AA==
X-Received: by 2002:a63:e057:: with SMTP id n23mr7793886pgj.183.1632885386999; 
 Tue, 28 Sep 2021 20:16:26 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id 65sm464203pfv.210.2021.09.28.20.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 20:16:26 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Wed, 29 Sep 2021 12:15:57 +0900
Message-Id: <cover.1632884256.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v17 0/9] Introduce the Counter character
	device interface
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

Changes in v17:
 - A couple minor improvements to documentation from review suggestions
 - chrdev_lock redeclared as atomic_t; BITMAP was not necessary because
   chrdev_lock is a single flag
 - test_and_set_bit_lock(), clear_bit_unlock(), and clear_bit(),
   replaced respectively with atomic_add_unless(), atomic_dec(), and
   atomic_set()
 - counter_comp_read_is_equal() and counter_comp_read_is_set() macros
   implemented in order to properly test counter_comp structures' read
   callback states
 - counter_sysfs_add() call performed before counter_chrdev_add() call
   in counter_register() in order to match unwinding sequence
 - for-loop utilized in counter-example.c in order to simplify code
 - counter-example.c returns 1 on error instead of -errno; errno may be
   modified after a subsequent library call so we can't depend on it

For convenience, this patchset is also available on my personal git
repo: https://gitlab.com/vilhelmgray/iio/-/tree/counter_chrdev_v17

A Counter character device interface is introduced that allows Counter
events and associated data to be read() by userspace; the
events_configure() and watch_validate() driver callbacks are introduced
to support Counter events; and IRQ support is added to the
104-QUAD-8 driver, serving as an example of how to support the new
Counter events functionality.

William Breathitt Gray (9):
  counter: Move counter enums to uapi header
  counter: Add character device interface
  docs: counter: Document character device interface
  tools/counter: Create Counter tools
  counter: Implement signalZ_action_component_id sysfs attribute
  counter: Implement *_component_id sysfs attributes
  counter: Implement events_queue_size sysfs attribute
  counter: 104-quad-8: Replace mutex with spinlock
  counter: 104-quad-8: Add IRQ support for the ACCES 104-QUAD-8

 Documentation/ABI/testing/sysfs-bus-counter   |  29 +
 Documentation/driver-api/generic-counter.rst  | 177 ++++--
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 MAINTAINERS                                   |   2 +
 drivers/counter/104-quad-8.c                  | 256 ++++++--
 drivers/counter/Kconfig                       |   6 +-
 drivers/counter/Makefile                      |   2 +-
 drivers/counter/counter-chrdev.c              | 578 ++++++++++++++++++
 drivers/counter/counter-chrdev.h              |  14 +
 drivers/counter/counter-core.c                |  56 +-
 drivers/counter/counter-sysfs.c               | 123 +++-
 include/linux/counter.h                       |  98 +--
 include/uapi/linux/counter.h                  | 154 +++++
 tools/Makefile                                |  13 +-
 tools/counter/Build                           |   1 +
 tools/counter/Makefile                        |  53 ++
 tools/counter/counter_example.c               |  92 +++
 17 files changed, 1509 insertions(+), 146 deletions(-)
 create mode 100644 drivers/counter/counter-chrdev.c
 create mode 100644 drivers/counter/counter-chrdev.h
 create mode 100644 include/uapi/linux/counter.h
 create mode 100644 tools/counter/Build
 create mode 100644 tools/counter/Makefile
 create mode 100644 tools/counter/counter_example.c


base-commit: a5ae0cfd53aaf031c2e9ba048281776fa67047c2
-- 
2.33.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
