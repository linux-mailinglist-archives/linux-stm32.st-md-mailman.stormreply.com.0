Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A546F319DFA
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Feb 2021 13:14:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E864C57B5A;
	Fri, 12 Feb 2021 12:14:05 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C63ABC3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 12:14:00 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id j3so2063397qkk.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 04:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y4yEGF4AjXqnem5hKAuSPNf/U7YlqelstXtmTJWlhNI=;
 b=qeeJfbvFVl0h81JpFKFxtmMRQ10eHisgwd45W2GG7TM5yHTLOyZPV9gOdv7Mv2l2yg
 pnERECp342fv8J1aHQyL4PhoC9KoGNxukiqQR0YhWdjel+xmI8dPmMKImwLQywj1XEkv
 vW6lPFhEJl9q2mrvbwdJEiEajB1D6Tj47Jz2BMeEeJtpvK/y8fSYGYBuXBd6GlaN2mWa
 2FMS2PQ+RSVavlXbBe+3QoPnzo7LGbyUGlf+u/9CSg/hY+ahHf2K5dD7q/+UBCDu/0kY
 N28fGB8xikKFjZWZfLxL7UnZKHDQ8X0ms9BM1JByMIxCgFIbDSvxhX3osq70Y/+XRhg4
 7IYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y4yEGF4AjXqnem5hKAuSPNf/U7YlqelstXtmTJWlhNI=;
 b=Ih2iuVud9a2WibL7JxTn72Cgj2llL+Brf/eQfs2ELua4/KMbb8Q47w8SuQIt16r4Cf
 zpDjJDF7BN+oItMtarZPcGm531VPsAIGr5vpOx2Ng52pVzT4FAyN91Q/iX+7DBcVeIeI
 hX7ILxeXRGhHAWPjmHz4Jkml/llbKyhYuQRR3fDeMwtMHOyopJIFfLoVupLuLKJ5SlTv
 yxeZWxCYHXFoG32rmCqGIrTOn09VMa8YUnMHusTUSbIOrkBLfuKaY9yCGaNfqLCv0uVj
 6i5cjVzHHutNu7doogcuPQ8ju4U7I3FlmeTmwIoqsb2g74hL3/nAECd/LGoMtfDlxgYr
 r9TQ==
X-Gm-Message-State: AOAM5333qwoDBarwd/j0/+9TpL4DbE9oERbSuSgDgn9eGIb3XP2O4AP2
 tj7rfrvnAT3rok+uPkjfgDQ=
X-Google-Smtp-Source: ABdhPJxFsiQwibCIY/jzrkMEOjGRvL/Umh2DVWmeMRwmBlG0UpNjfOXTGn7C2OIHJu2eh2qGMrCXXA==
X-Received: by 2002:a37:992:: with SMTP id 140mr2317435qkj.349.1613132039638; 
 Fri, 12 Feb 2021 04:13:59 -0800 (PST)
Received: from localhost.localdomain ([193.27.12.132])
 by smtp.gmail.com with ESMTPSA id y135sm6278534qkb.14.2021.02.12.04.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 04:13:59 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 12 Feb 2021 21:13:24 +0900
Message-Id: <cover.1613131238.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v8 00/22] Introduce the Counter character
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

Changes in v8:
 - Consolidated Counter sysfs ABI documentation to single file
 - Added events_queue_size sysfs attribute to allow users to dynamically
   resize the events queue
 - Fixed markup syntax and typos in generic-counter.rst
 - Improved documentation in include/uapi/linux/counter.h and friends
 - Renamed COUNTER_LOAD_WATCHES_IOCTL to COUNTER_ENABLE_EVENTS_IOCTL;
   Renamed COUNTER_CLEAR_WATCHES_IOCTL to COUNTER_DISABLE_EVENTS_IOCTL
 - Renamed the struct counter_event "errno" member to "status"
 - Dropped the "irq_trigger" 104-QUAD-8 sysfs attribute; this
   functionality now occurs implicitly via the Counter chrdev interface
 - Return -ERANGE where appropriate instead of -EINVAL
 - Simplified switch exit paths; return early when possible
 - Call devm_request_irq() before devm_counter_register() for 104-quad-8
 - Renamed devm_counter_unregister() to more apt devm_counter_release()
 - Use enum counter_scope for scope values in counter-sysfs.c
 - Use sysfs_emit() instead of sprintf() where appropriate
 - Renamed find_in_string_array() to more apt counter_find_enum()
 - Renamed *_action_get() and *_action_write() to *_action_read() and
   *_action_write() to match new naming convention of Counter callbacks
 - Use "Counter function" naming convention instead of "Counter count
   function" to avoid confusion about scope

I pulled out a lot of bits and pieces to their own patches; hopefully
that makes reviewing this patchset much simpler than before. This
patchset is also available on my personal public git repo for anyone who
wants a quick way to clone:
https://gitlab.com/vilhelmgray/iio/-/tree/counter_chrdev_v8

The patches preceding "counter: Internalize sysfs interface code" are
primarily cleanup and fixes that can be picked up and applied now to the
IIO tree if so desired. The "counter: Internalize sysfs interface code"
patch as well may be considered for pickup because it is relatively safe
and makes no changes to the userspace interface.

To summarize the main points of this patchset: there are no changes to
the existing Counter sysfs userspace interface; a Counter character
device interface is introduced that allows Counter events and associated
data to be read() by userspace; the events_configure() and
watch_validate() driver callbacks are introduced to support Counter
events; and IRQ support is added to the 104-QUAD-8 driver, serving as an
example of how to support the new Counter events functionality.

Something that should still be discussed: should the struct
counter_event "status" member be 8 bits or 32 bits wide? This member
will provide the return status (system error number) of an event
operation.

William Breathitt Gray (22):
  docs: counter: Consolidate Counter sysfs attributes documentation
  docs: counter: Fix spelling
  counter: 104-quad-8: Return error when invalid mode during
    ceiling_write
  counter: 104-quad-8: Annotate hardware config module parameter
  counter: 104-quad-8: Add const qualifiers for
    quad8_preset_register_set
  counter: 104-quad-8: Add const qualifier for functions_list array
  counter: 104-quad-8: Add const qualifier for actions_list array
  counter: ftm-quaddec: Add const qualifier for actions_list array
  counter: Return error code on invalid modes
  counter: Standardize to ERANGE for limit exceeded errors
  counter: Rename counter_signal_value to counter_signal_level
  counter: Rename counter_count_function to counter_function
  counter: Internalize sysfs interface code
  counter: Update counter.h comments to reflect sysfs internalization
  docs: counter: Update to reflect sysfs internalization
  counter: Move counter enums to uapi header
  counter: Add character device interface
  docs: counter: Document character device interface
  counter: Implement extension*_name sysfs attributes
  counter: Implement events_queue_size sysfs attribute
  counter: 104-quad-8: Replace mutex with spinlock
  counter: 104-quad-8: Add IRQ support for the ACCES 104-QUAD-8

 Documentation/ABI/testing/sysfs-bus-counter   |  100 +-
 .../ABI/testing/sysfs-bus-counter-104-quad-8  |   61 -
 .../ABI/testing/sysfs-bus-counter-ftm-quaddec |   16 -
 Documentation/driver-api/generic-counter.rst  |  426 ++++-
 .../userspace-api/ioctl/ioctl-number.rst      |    1 +
 MAINTAINERS                                   |    6 +-
 drivers/counter/104-quad-8.c                  |  751 +++++----
 drivers/counter/Kconfig                       |    6 +-
 drivers/counter/Makefile                      |    1 +
 drivers/counter/counter-chrdev.c              |  519 ++++++
 drivers/counter/counter-chrdev.h              |   18 +
 drivers/counter/counter-core.c                |  185 ++
 drivers/counter/counter-sysfs.c               |  889 ++++++++++
 drivers/counter/counter-sysfs.h               |   13 +
 drivers/counter/counter.c                     | 1496 -----------------
 drivers/counter/ftm-quaddec.c                 |   69 +-
 drivers/counter/microchip-tcb-capture.c       |  105 +-
 drivers/counter/stm32-lptimer-cnt.c           |  186 +-
 drivers/counter/stm32-timer-cnt.c             |  187 +--
 drivers/counter/ti-eqep.c                     |  226 ++-
 include/linux/counter.h                       |  716 ++++----
 include/linux/counter_enum.h                  |   45 -
 include/uapi/linux/counter.h                  |  126 ++
 23 files changed, 3363 insertions(+), 2785 deletions(-)
 delete mode 100644 Documentation/ABI/testing/sysfs-bus-counter-104-quad-8
 delete mode 100644 Documentation/ABI/testing/sysfs-bus-counter-ftm-quaddec
 create mode 100644 drivers/counter/counter-chrdev.c
 create mode 100644 drivers/counter/counter-chrdev.h
 create mode 100644 drivers/counter/counter-core.c
 create mode 100644 drivers/counter/counter-sysfs.c
 create mode 100644 drivers/counter/counter-sysfs.h
 delete mode 100644 drivers/counter/counter.c
 delete mode 100644 include/linux/counter_enum.h
 create mode 100644 include/uapi/linux/counter.h


base-commit: b72d4f6a5122a78941ce5a3147685d6a44939a75
-- 
2.30.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
