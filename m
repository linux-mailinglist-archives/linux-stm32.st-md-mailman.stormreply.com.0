Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEBB332672
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 14:20:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C6B1C57196;
	Tue,  9 Mar 2021 13:20:14 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27043C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:20:13 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id l2so8750589pgb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 05:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/UQXlkoZL9oIV4Vm/y3H2dkMxHwkxK4VsNYeOuqh9c0=;
 b=nZnVTGDqVOA4wPPRl/vxLH1zpDwIVKmhxegagbYco/EsThrlk3Npxs2ax9l80v9SZR
 eh4cODZzz7wtWcxfM9hn9d/S1TLT0Q0ChkQsGT7Q1p33e6p+b8siIF1XyXaL59XMZV0I
 zWrT6K2nVkesRY1+lzmYTRI26kicxcvBVr4sBr3VjMWZX1fxDAPsHC95UrE7sXYBQ6G0
 k2JvmPiTlIREN8r7fcBsyXb2N0LEJy1AtU4colTytxWyt/H5IDS8OkfXzwE5O/gKhoxL
 3Ab/9iu7DQIU9qRIYPuHmBKAJTZEgLRxIivVDziEUxJphgGo9k+v5a/ZRCcplClA3UAF
 ZvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/UQXlkoZL9oIV4Vm/y3H2dkMxHwkxK4VsNYeOuqh9c0=;
 b=nngpFXJakdbizfW3i3+fdPpAdfWRCHo2KNIp5lECKeJckqvKOOd2Z//33XXhS9oMCR
 WxPwOEkMsgVCAubtveezAFw54Qlvyg5VkcvQcGXMyvj1ieoC8oABHZsKUGAtpV8tg2eJ
 QLK1zvvQKq5hsXQqCQCOKMfFhFpchXC1CkhssjnlAJnn9oHFkx1ElA406T+ROo7AcA5n
 h6Y44/2wSChZVRU9imqRHChaY8Ik0rcK8PaZoLw44Pweldhhdr9xFUBGJON+paJjJN4+
 gxZ17iepgjpmqGUqOQctjOzRCYgcsKNUT7mkZQ74NaOofn/l7ivH8WL1bX5zSvU2qcNU
 HkUg==
X-Gm-Message-State: AOAM5338JXky3HQNa9KUgsaxm2mXWhcTIm1ECeaCy0O0+NFUQY0qW7un
 jr1wzSgosQ8oXJ+qwwFrU04=
X-Google-Smtp-Source: ABdhPJxITphI+0Q1/mUBxAdrWpnlO5YBUHufs2D1Mk5a7ka6o7dmWAEbqklf8Zm62u5NOVP0XmW32A==
X-Received: by 2002:a63:df10:: with SMTP id u16mr7437528pgg.308.1615296011574; 
 Tue, 09 Mar 2021 05:20:11 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y9sm7647421pfl.201.2021.03.09.05.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:20:10 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  9 Mar 2021 22:19:13 +0900
Message-Id: <cover.1615293276.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v9 00/33] Introduce the Counter character
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

Changes in v9:
 - Implemented example userspace counter application under tools/counter
 - Replaced extension*_name attributes with *_component_id attributes;
   this should hopefully be a more intuitive way to find the desired IDs
 - Changed to use regular spinlock because raw_spinlock is not needed
 - Implemented chrdev_lock mutex to limit chrdev to a single open() at a
   time
 - Improved struct counter_component documentation with examples
 - Reverted "counter_count_function" to "counter_function" naming change
   for drivers; individual maintainers can change this if they so desire
 - Utilized "return 0" in switch blocks to return early where possible
 - Utilized default cases in switch blocks to improve clarity and intent
 - Refactored counter_register to make use of cdev_add_device();
   counter_chrdev_add() has been simplified as a result
 - Inlined counter_chrdev_realloc_queue() because it is only used by the
   events_queue_size sysfs attribute
 - Replaced deprecated ida_simple_* calls with ida_alloc()/ida_free()
 - Made use of struct device "id" member to construct the cdev node name
 - Made use of kfifo_size() instead of rolling my own
 - Implemented changes necessary to migrate interrupt-cnt driver

Note that this revision is based on top of 5 prerequisite patches:
* counter: add IRQ or GPIO based counter
* dt-bindings: counter: add interrupt-counter binding
* counter: stm32-timer-cnt: fix ceiling miss-alignment with reload register
* counter: stm32-timer-cnt: fix ceiling write max value
* counter: stm32-timer-cnt: Report count function when SLAVE_MODE_DISABLED

I pulled out a lot of bits and pieces to their own patches; hopefully
that makes reviewing this patchset much simpler than before. This
patchset is also available on my personal public git repo for anyone who
wants a quick way to clone:
https://gitlab.com/vilhelmgray/iio/-/tree/counter_chrdev_v9

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

William Breathitt Gray (33):
  docs: counter: Consolidate Counter sysfs attributes documentation
  docs: counter: Fix spelling
  counter: 104-quad-8: Remove pointless comment
  counter: 104-quad-8: Return error when invalid mode during
    ceiling_write
  counter: 104-quad-8: Annotate hardware config module parameter
  counter: 104-quad-8: Add const qualifiers for
    quad8_preset_register_set
  counter: 104-quad-8: Add const qualifier for functions_list array
  counter: interrupt-cnt: Add const qualifier for functions_list array
  counter: microchip-tcb-capture: Add const qualifier for functions_list
    array
  counter: stm32-lptimer-cnt: Add const qualifier for functions_list
    array
  counter: stm32-timer-cnt: Add const qualifier for functions_list array
  counter: 104-quad-8: Add const qualifier for actions_list array
  counter: ftm-quaddec: Add const qualifier for actions_list array
  counter: interrupt-cnt: Add const qualifier for actions_list array
  counter: microchip-tcb-capture: Add const qualifier for actions_list
    array
  counter: stm32-lptimer-cnt: Add const qualifier for actions_list array
  counter: stm32-timer-cnt: Add const qualifier for actions_list array
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
  tools/counter: Create Counter tools
  counter: Implement signalZ_action_component_id sysfs attribute
  counter: Implement *_component_id sysfs attributes
  counter: Implement events_queue_size sysfs attribute
  counter: 104-quad-8: Replace mutex with spinlock
  counter: 104-quad-8: Add IRQ support for the ACCES 104-QUAD-8

 Documentation/ABI/testing/sysfs-bus-counter   |  112 +-
 .../ABI/testing/sysfs-bus-counter-104-quad-8  |   61 -
 .../ABI/testing/sysfs-bus-counter-ftm-quaddec |   16 -
 Documentation/driver-api/generic-counter.rst  |  368 +++-
 .../userspace-api/ioctl/ioctl-number.rst      |    1 +
 MAINTAINERS                                   |    7 +-
 drivers/counter/104-quad-8.c                  |  739 ++++----
 drivers/counter/Kconfig                       |    6 +-
 drivers/counter/Makefile                      |    1 +
 drivers/counter/counter-chrdev.c              |  486 ++++++
 drivers/counter/counter-chrdev.h              |   14 +
 drivers/counter/counter-core.c                |  192 +++
 drivers/counter/counter-sysfs.c               |  953 +++++++++++
 drivers/counter/counter-sysfs.h               |   13 +
 drivers/counter/counter.c                     | 1496 -----------------
 drivers/counter/ftm-quaddec.c                 |   61 +-
 drivers/counter/interrupt-cnt.c               |   75 +-
 drivers/counter/microchip-tcb-capture.c       |  105 +-
 drivers/counter/stm32-lptimer-cnt.c           |  176 +-
 drivers/counter/stm32-timer-cnt.c             |  149 +-
 drivers/counter/ti-eqep.c                     |  221 +--
 include/linux/counter.h                       |  716 ++++----
 include/linux/counter_enum.h                  |   45 -
 include/uapi/linux/counter.h                  |  133 ++
 tools/Makefile                                |   13 +-
 tools/counter/Build                           |    1 +
 tools/counter/Makefile                        |   53 +
 tools/counter/counter_example.c               |   95 ++
 28 files changed, 3522 insertions(+), 2786 deletions(-)
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
 create mode 100644 tools/counter/Build
 create mode 100644 tools/counter/Makefile
 create mode 100644 tools/counter/counter_example.c


base-commit: 4ef57c4862e38e6034978d8b247a511292d7055a
prerequisite-patch-id: 41fda3a386861edad110c644567fad373a5a175e
prerequisite-patch-id: c6c2ab3173f5a0136d1e9b7b96ccd115fa35d66e
prerequisite-patch-id: 7e3cd78924d79890b690f3029e0d4f5b3902a73c
prerequisite-patch-id: 98f0a6c1d188a7dec01a5587fb7566ac637385a1
prerequisite-patch-id: 884299e23b6426ea43282e9701996e794cb6aa34
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
