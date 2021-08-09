Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A52183E45B0
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Aug 2021 14:37:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58666C57B51;
	Mon,  9 Aug 2021 12:37:57 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D016AC56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Aug 2021 12:37:54 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id a5so477196plh.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Aug 2021 05:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SRRfOMGRdWmSmqR/jCwDTPGfm5oA2KrQYIknx7HPYGM=;
 b=I02Ftysn1jyRMA2SJeLr+43VRYWurwqgoEHDJmLgc1b1Bd0xeN53XOIO9KbKJr9Yfi
 Dk7wx7icdBf8R9qnHBk3xNey7IMzRYLbggFRZNTbiL8HhqPNw6KT789G43ca4XxfaKxT
 KEMQHvo8riJOkZAwS+gskQLWsGhlCjCWTJKw8ix3nn8YR6mUd80sm/Jc6Kx2rCWXAoHt
 +nhO5BJabIqH9RS952X36lHKN6WISl/Wire8zRq8iy/Iud9RX+V3IiTHdBDFlrg+Gfa8
 dOLTjfR79K5QngmF9PGd3kVrgV993G4v+kH65wrzKdivXYj8rHZaWYZ0oq336p/AyUIm
 joqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SRRfOMGRdWmSmqR/jCwDTPGfm5oA2KrQYIknx7HPYGM=;
 b=NKa7ZuxL7ZqFnwt/aqqYMtnHJ/c8gpkfFK9Z/Za5tjyZkB7/ssRjk7BWj/QaoeelOD
 nlNKIC+2cgyX6rcyQjO1gOQFvLl1JEZl0HimhNAGrNq18zTSGvRDGREkckhQ1tr0txgn
 a7UUWJl/UEKjl1XD9eVnfi2LIUkLydSaRWM9n83QUEycnKryXeS3qCB5RFfP9FE4R5pc
 dAm9MQAMJwntjlqaqIluV1nowaBc6VaB81vnAVrIbSM3i/NFtGZiiLBhqHtXS2WUTExs
 v3tN2B7l56/NBB28h5ruF1hNuo8deWSVf8PuQfnS3BmassCAaA6GqfpKOJuIOHciq4BW
 ncAA==
X-Gm-Message-State: AOAM530UK26oyGps6Wrc1AADkqFgV32j+J7UaAo8Gds3L5CP5hcwyRXM
 01PEPSxfM3eboVEVfzZ+gDc=
X-Google-Smtp-Source: ABdhPJzZQp34WPlUWoCcv5TWsKqOi0aBXJs0mxrtXU6YexojYGaftCiT8EJK3MwGkNBMYo1lUU97Rg==
X-Received: by 2002:a05:6a00:bd3:b029:3c6:9c64:9771 with SMTP id
 x19-20020a056a000bd3b02903c69c649771mr23237597pfu.78.1628512673418; 
 Mon, 09 Aug 2021 05:37:53 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id e35sm22382177pjk.28.2021.08.09.05.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 05:37:52 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Mon,  9 Aug 2021 21:37:25 +0900
Message-Id: <cover.1628511445.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v15 00/13] Introduce the Counter character
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

Changes in v15:
 - Move the description for the member 'lock' in the 'quad8' structure
   as a separate patch
 - Reorganize the "counter: Internalize sysfs interface code" patch to
   not call chrdev code; respective code moved to the "counter: Add
   character device interface" patch with the other chrdev code
 - Custom enums removed from the ftm-quaddec.c, stm32-lptimer-cnt.c, and
   stm32-timer-cnt.c files; respective drivers refactored to use the
   COUNTER_FUNCTION_* and COUNTER_SYNAPSE_* enum constants instead

For convenience, this patchset is also available on my personal git
repo: https://gitlab.com/vilhelmgray/iio/-/tree/counter_chrdev_v15

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

William Breathitt Gray (13):
  counter: 104-quad-8: Describe member 'lock' in 'quad8'
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
 Documentation/driver-api/generic-counter.rst  |  358 +++-
 .../userspace-api/ioctl/ioctl-number.rst      |    1 +
 MAINTAINERS                                   |    3 +-
 drivers/counter/104-quad-8.c                  |  700 ++++----
 drivers/counter/Kconfig                       |    6 +-
 drivers/counter/Makefile                      |    1 +
 drivers/counter/counter-chrdev.c              |  553 ++++++
 drivers/counter/counter-chrdev.h              |   14 +
 drivers/counter/counter-core.c                |  191 +++
 drivers/counter/counter-sysfs.c               |  962 +++++++++++
 drivers/counter/counter-sysfs.h               |   13 +
 drivers/counter/counter.c                     | 1496 -----------------
 drivers/counter/ftm-quaddec.c                 |   60 +-
 drivers/counter/intel-qep.c                   |  144 +-
 drivers/counter/interrupt-cnt.c               |   62 +-
 drivers/counter/microchip-tcb-capture.c       |   91 +-
 drivers/counter/stm32-lptimer-cnt.c           |  226 +--
 drivers/counter/stm32-timer-cnt.c             |  179 +-
 drivers/counter/ti-eqep.c                     |  180 +-
 include/linux/counter.h                       |  715 ++++----
 include/linux/counter_enum.h                  |   45 -
 include/uapi/linux/counter.h                  |  154 ++
 tools/Makefile                                |   13 +-
 tools/counter/Build                           |    1 +
 tools/counter/Makefile                        |   53 +
 tools/counter/counter_example.c               |   93 +
 27 files changed, 3568 insertions(+), 2784 deletions(-)
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


base-commit: c886885336b0b5f1a08ce580f7201a2ca30ab041
prerequisite-patch-id: 8ca55ffcdd5d060dd5fa2b4dd50bf01dc1026da6
prerequisite-patch-id: 46ef2668ca6bdc0d08dd488fe1d2b886189a5652
prerequisite-patch-id: 2df1946c917d6408148306db30a071e67b00ad73
prerequisite-patch-id: f81579f50552e6041a95403cc743c5f36962b111
prerequisite-patch-id: 8a6860e75cdec162812c56dc39c5d7fc6fc5154e
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
