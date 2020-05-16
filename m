Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 247461D63C4
	for <lists+linux-stm32@lfdr.de>; Sat, 16 May 2020 21:20:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5D95C36B20;
	Sat, 16 May 2020 19:20:40 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7A4FC36B16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 May 2020 19:20:38 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id n22so2440785qtv.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 May 2020 12:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A+aLXLfOYBWa1/HiefX3BKCNHYEqJEEFJy3sI8Yp4bg=;
 b=gtJrwqrkIiMt1lIBICE5TKChEkcoX4uRghpXgVp0gcUVaHoEKEAn5BVmUG5DuqTqDn
 ddTxrD8pHjfRhgvusaEnLvz4PfqkoGJeXQKsQN4oa1nBZr8diMUvrUUeuZcaO5XdcCXu
 voxZV1QlM5dkgMbQJb7xhWVkdo9LOgI+KAYvS6bUmecGHFWSo6rnPj3gIEy+tw0K9yGW
 4xT+NHutuiFVbv+iQ4KQWwI7I4+vazq/8zc0JSztir5P6QAAeXhJ6VrB2Ryq2fmVlCxt
 OVJjUMeZQ0KzsjcIkjhwcFQcWLQwNAI3AXdKw0CUcVA4ICj8AXjBgpbUp7zObuz3hF+f
 tSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A+aLXLfOYBWa1/HiefX3BKCNHYEqJEEFJy3sI8Yp4bg=;
 b=csykJj6o4tj1787hTVijpzV6UUQpGcIwou5ASrwDbzZJy98GZdiR8genVpoBKp3ZOn
 DtKO3nyvAMTueSGbSc/+i5KFOQGg8CZYyu1SlMsNDE59VITY7CeksLUUpLKk+f4CmXM/
 7zOtAZCoag8Avx4Iu6X74OcMGKf7VaYJOLgf4tRw0hMS5XylshqUglAFLOyh/nVDK3JN
 z2fBsw1i+shEF9H/G8nDSLV5oO54HL3fGMKG6jRR9tJznToLHRS2cRqsgkImCPUSsom3
 cFUB605DXeXqiiSZGJWkrtDYMkwAEtUpO2Jyl93qKmEnTPGZCw1Ju/UQ26rFcP13Y20O
 eOxA==
X-Gm-Message-State: AOAM530YxRhU8wCE25AEOOKMVmG8uz64Q4ji+tm+iWU6ID9qDuT5r28a
 ehRePMYiF/3PXpU15aytbuE=
X-Google-Smtp-Source: ABdhPJwy3Hp+RUbGKSSIfrwp9LYEzn56fOCcU0k1xw7kcgwNZKmf9EhmtGs70IUxQsaMI/xLI/AzEQ==
X-Received: by 2002:aed:2496:: with SMTP id t22mr9502815qtc.2.1589656837437;
 Sat, 16 May 2020 12:20:37 -0700 (PDT)
Received: from localhost.localdomain (072-189-064-225.res.spectrum.com.
 [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id g19sm3160409qke.32.2020.05.16.12.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2020 12:20:36 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Sat, 16 May 2020 15:19:58 -0400
Message-Id: <cover.1589654470.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, William Breathitt Gray <vilhelm.gray@gmail.com>,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/4] Introduce the Counter character device
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

Changes in v2:
 - Use fixed-width data types to represent Counter data types
 - Use union of function prototypes to store read/write callbacks
 - Eliminate the counter-strings and counter-sysfs-callback files by
   inlining relevant code
 - Reimplement chrdev code to handle read/write calls instead of ioctl
 - Remove struct counter_enum (I'm postponing this development until I
   get the core functionality solid)
 - Remove devm_counter_unregister as unnecessary

Over the past couple years we have noticed some shortcomings with the
Counter sysfs interface. Although useful in the majority of situations,
there are certain use-cases where interacting through sysfs attributes
can become cumbersome and inefficient. A desire to support more advanced
functionality such as timestamps, multi-axis positioning tables, and
other such latency-sensitive applications, has motivated a reevaluation
of the Counter subsystem. I believe a character device interface will be
helpful for this more niche area of counter device use.

To quell any concerns from the offset: this patchset makes no changes to
the existing Counter sysfs userspace interface -- existing userspace
applications will continue to work with no modifications necessary. I
request that driver maintainers please test their applications to verify
that this is true, and report any discrepancies if they arise.

However, this patchset does contain a major reimplementation of the
Counter subsystem core and driver API. A reimplementation was necessary
in order to separate the sysfs code from the counter device drivers and
internalize it as a dedicated component of the core Counter subsystem
module. A minor benefit from all of this is that the sysfs interface is
now ensured a certain amount of consistency because the translation is
performed outside of individual counter device drivers.

Essentially, the reimplementation has enabled counter device drivers to
pass and handle data as native C datatypes now rather than the sysfs
strings from before. A high-level view of how a count value is passed
down from a counter device driver can be exemplified by the following:

                 ----------------------
                / Counter device       \
                +----------------------+
                | Count register: 0x28 |
                +----------------------+
                        |
                 -----------------
                / raw count data /
                -----------------
                        |
                        V
                +----------------------------+
                | Counter device driver      |----------+
                +----------------------------+          |
                | Processes data from device |   -------------------
                |----------------------------|  / driver callbacks /
                | Type: u64                  |  -------------------
                | Value: 42                  |          |
                +----------------------------+          |
                        |                               |
                 ----------                             |
                / u64     /                             |
                ----------                              |
                        |                               |
                        |                               V
                        |               +----------------------+
                        |               | Counter core         |
                        |               +----------------------+
                        |               | Routes device driver |
                        |               | callbacks to the     |
                        |               | userspace interfaces |
                        |               +----------------------+
                        |                       |
                        |                -------------------
                        |               / driver callbacks /
                        |               -------------------
                        |                       |
                +-------+---------------+       |
                |                       |       |
                |               +-------|-------+
                |               |       |
                V               |       V
        +--------------------+  |  +---------------------+
        | Counter sysfs      |<-+->| Counter chrdev      |
        +--------------------+     +---------------------+
        | Translates to the  |     | Translates to the   |
        | standard Counter   |     | standard Counter    |
        | sysfs output       |     | character device    |
        |--------------------|     |---------------------+
        | Type: const char * |     | Type: u64           |
        | Value: "42"        |     | Value: 42           |
        +--------------------+     +---------------------+
                |                               |
         ---------------                 ----------
        / const char * /                / u64     /
        ---------------                 ----------
                |                               |
                |                               V
                |                       +-----------+
                |                       | read      |
                |                       +-----------+
                |                       \ Count: 42 /
                |                        -----------
                |
                V
        +--------------------------------------------------+
        | `/sys/bus/counter/devices/counterX/countY/count` |
        +--------------------------------------------------+
        \ Count: "42"                                      /
         --------------------------------------------------

I am aware that an in-kernel API can simplify the data transfer between
counter device drivers and the userspace interfaces, but I want to
postpone that development until after the new Counter character device
interface is solidified. A userspace ABI is effectively immutable so I
want to make sure we get that right before working on an in-kernel API
that is more flexible to change. However, when we do develop an
in-kernel API, it will likely be housed as part of the Counter core
component, through which the userspace interfaces will then communicate.

Interaction with Counter character devices occurs via standard character
device read/write operations. This allows userspace applications to
access and set counter data using native C datatypes rather than working
through string translations.

The following are some questions I have about this patchset:

1. Should the data format of the character device be configured via a
   sysfs attribute?

   In this patchset, the first 196095 bytes of the character device are
   dedicated as a selection area to choose which Counter components or
   extensions should be exposed; the subsequent bytes are the actual
   data for the Counter components and extensions that were selected.

   Moving this selection to a sysfs attribute and dedicating the
   character device to just data transfer might be a better design. If
   such a design is chosen, should the selection attribute be
   human-readable or binary?

2. How much space should allotted for strings?

   Each Counter component and extension has a respective size allotted
   for its data (u8 data is allotted 1 byte, u64 data is allotted 8
   bytes, etc.); I have arbitrarily chosen to allot 64 bytes for
   strings. Is this an apt size, or should string data be allotted more
   or less space?

3. Should the owning component of an extension be handled by the device
   driver or Counter subsystem?

   The Counter subsystem figures out the owner (enum counter_owner_type)
   for each component/extension in the counter-sysfs and counter-chrdev
   code. When a callback must be executed, there are various switch
   statements throughout the code to check whether the respective
   Device, Signal, or Count version of the callback should be executed;
   similarly, the appropriate owner type must match for the struct
   counter_data macros such as COUNTER_DATA_DEVICE_U64,
   COUNTER_DATA_SIGNAL_U64, COUNTER_DATA_COUNT_U64, etc.

   All this complexity in the Counter subsystem code can be eliminated
   if a single callback type with a `void *owner` parameter is defined
   for use with all three owner types (Device, Signal, and Count). The
   device driver would then be responsible for casting the callback
   argument to the appropriate owner type; but in theory, this should
   not be much of a problem since the device driver is responsible for
   assigning the callbacks to the owning component anyway.

William Breathitt Gray (4):
  counter: Internalize sysfs interface code
  docs: counter: Update to reflect sysfs internalization
  counter: Add character device interface
  docs: counter: Document character device interface

 Documentation/driver-api/generic-counter.rst |  275 +++-
 MAINTAINERS                                  |    3 +-
 drivers/counter/104-quad-8.c                 |  547 +++----
 drivers/counter/Makefile                     |    1 +
 drivers/counter/counter-chrdev.c             |  656 ++++++++
 drivers/counter/counter-chrdev.h             |   16 +
 drivers/counter/counter-core.c               |  187 +++
 drivers/counter/counter-sysfs.c              |  881 +++++++++++
 drivers/counter/counter-sysfs.h              |   14 +
 drivers/counter/counter.c                    | 1496 ------------------
 drivers/counter/ftm-quaddec.c                |   89 +-
 drivers/counter/stm32-lptimer-cnt.c          |  161 +-
 drivers/counter/stm32-timer-cnt.c            |  139 +-
 drivers/counter/ti-eqep.c                    |  211 +--
 include/linux/counter.h                      |  626 ++++----
 include/linux/counter_enum.h                 |   45 -
 include/uapi/linux/counter-types.h           |   45 +
 17 files changed, 2826 insertions(+), 2566 deletions(-)
 create mode 100644 drivers/counter/counter-chrdev.c
 create mode 100644 drivers/counter/counter-chrdev.h
 create mode 100644 drivers/counter/counter-core.c
 create mode 100644 drivers/counter/counter-sysfs.c
 create mode 100644 drivers/counter/counter-sysfs.h
 delete mode 100644 drivers/counter/counter.c
 delete mode 100644 include/linux/counter_enum.h
 create mode 100644 include/uapi/linux/counter-types.h

-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
