Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C60C43BB8B3
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Jul 2021 10:19:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BEDBC57B53;
	Mon,  5 Jul 2021 08:19:28 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10BDAC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jul 2021 08:19:25 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id n11so11295942pjo.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jul 2021 01:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z1P0C+fJT3E1BmyLma3Hvt+LmdbtbvRdt4PGsDvZhDo=;
 b=hbAxn5PkjyDIa6lxUCJXoInHZZziGv78nTgayqagi4cPk6CZAHbU6uAkYcE9ckzcBL
 lXmrxyWAcdQUgSxTak7vyp6yD+8kwgGIzFpuk/4nHM6A7OvByeaF38nm4f2SQilizy1j
 dF8aiUS9VDps+5xuRFEpgXt9Wm23VPxUwbzjBCzdjpRdvJAMzH/XYEILlAuPYYxlgPR8
 YJO8cvgoyw6KtHDnICzUV+FmvSgJD/6vfyqfnGithRmnD5rH9XfcKUTIRdsdDoDzSIQq
 MUfKS1D/YjhygvLbXvy/YlfnX2hEy34tjVkj+eR+4vX8oEKOi4nvbeKDQsCk3PgMZVXt
 mP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z1P0C+fJT3E1BmyLma3Hvt+LmdbtbvRdt4PGsDvZhDo=;
 b=kmdwg75XLYTw59MyFOr5EwxLGKDZPz1Zgx8PPQM7XwUmPtSTJBPwLo42RuArk1inlN
 BN795MruITtZJ7gcA4DvIleIB5UOHHPi+AO9TPoqXi9JQ8+E4+QdUBiftbzOrGZ2i1Cn
 yWv/qKED8Qs/6c+ptaubMoZkQduZX3S/yHtO4dG9McQqE68moM2BCRgAKaiLKYy/GB/2
 rpf7I0p9VDfSMtE2PAfvEY4jCERrai9bY9JVXCuvGp2RNp+dEaL91HnICf4IKxxvbBZR
 sKge+u/H9CmbCt1ihMduH+bktgmYKT4fdWCrcGb+PEDZ4fEdlqNogAdZ5V2EbuB5YyA+
 XqIw==
X-Gm-Message-State: AOAM532VV64XOloSvpxBbLv05BL6IpjMPP8sBQDFIwLwv+z/6FI94zLD
 0e4Lm3YjJr6/RL992xTLZfw=
X-Google-Smtp-Source: ABdhPJyW07EURk2obQnItNdqKcxAHzpBo8dwmgWrp9zIifIAudIWcCD5SxYkGAzC63Rwk+MqT8t6hA==
X-Received: by 2002:a17:90a:5401:: with SMTP id
 z1mr13788644pjh.7.1625473164317; 
 Mon, 05 Jul 2021 01:19:24 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y11sm12209986pfo.160.2021.07.05.01.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 01:19:23 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Mon,  5 Jul 2021 17:18:48 +0900
Message-Id: <cover.1625471640.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v12 00/17] Introduce the Counter character
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

Changes in v12:
 - Move unlock to after register set in quad8_count_ceiling_write()
 - Add locking protection to counter_set_event_node()
 - Fix sparse warning by using {} instead of {0}
 - Clean up and organize comments for clarity
 - Reduce boilerplate by utilizing devm_add_action_or_reset()
 - Use switch statements in ti_eqep_action_read() to make possible cases
   more obvious

I pulled out a lot of bits and pieces to their own patches; hopefully
that makes reviewing this patchset much simpler than before. This
patchset is also available on my personal git repo for convenience:
https://gitlab.com/vilhelmgray/iio/-/tree/counter_chrdev_v12

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

William Breathitt Gray (17):
  counter: 104-quad-8: Return error when invalid mode during
    ceiling_write
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

 Documentation/ABI/testing/sysfs-bus-counter   |   38 +-
 Documentation/driver-api/generic-counter.rst  |  366 +++-
 .../userspace-api/ioctl/ioctl-number.rst      |    1 +
 MAINTAINERS                                   |    3 +-
 drivers/counter/104-quad-8.c                  |  728 ++++----
 drivers/counter/Kconfig                       |    6 +-
 drivers/counter/Makefile                      |    1 +
 drivers/counter/counter-chrdev.c              |  498 ++++++
 drivers/counter/counter-chrdev.h              |   14 +
 drivers/counter/counter-core.c                |  182 ++
 drivers/counter/counter-sysfs.c               |  953 +++++++++++
 drivers/counter/counter-sysfs.h               |   13 +
 drivers/counter/counter.c                     | 1496 -----------------
 drivers/counter/ftm-quaddec.c                 |   59 +-
 drivers/counter/intel-qep.c                   |  150 +-
 drivers/counter/interrupt-cnt.c               |   73 +-
 drivers/counter/microchip-tcb-capture.c       |  103 +-
 drivers/counter/stm32-lptimer-cnt.c           |  176 +-
 drivers/counter/stm32-timer-cnt.c             |  147 +-
 drivers/counter/ti-eqep.c                     |  205 ++-
 include/linux/counter.h                       |  716 ++++----
 include/linux/counter_enum.h                  |   45 -
 include/uapi/linux/counter.h                  |  133 ++
 tools/Makefile                                |   13 +-
 tools/counter/Build                           |    1 +
 tools/counter/Makefile                        |   53 +
 tools/counter/counter_example.c               |   95 ++
 27 files changed, 3501 insertions(+), 2767 deletions(-)
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


base-commit: 6cbb3aa0f9d5d23221df787cf36f74d3866fdb78
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
