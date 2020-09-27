Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 403D9279D78
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Sep 2020 04:18:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4A91C3FAD4;
	Sun, 27 Sep 2020 02:18:37 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47124C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Sep 2020 02:18:35 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id n10so5659290qtv.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Sep 2020 19:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6jkl7vNPFtvBxlWV2KeH9eoUepDDSh+STAgXaBbRvsc=;
 b=kX8VBgyQVBJW+7uBi2aRBS3aEzPAoFZpBGFGFpWSeXrp+AusoFRwU5DX2zuOPHojZi
 rowZckruCbRU/azdpCOauPKrmWvlXpz+qExS50WmStvqBL1CdCDhRtOHDDkBgN1ZG8/u
 ovkPDg6h9CwgnQqzBlFMCgC+v6Zwr0dUSseQmbDF4mg4si8/qjp/RtB6TPxoIXO64k9o
 uLjety8SCuDFTrBYjrPGnqTtr5D4zhvX6ppNTRkaTDQOnfkss2k1ATbtRd0WyiiRYY1n
 fbPM+kwKZDsWSjPnh1+ZPPbPsUec9HUZpOUXsNDs+/WDyHSOjHS47QFSIUUX5GkKdq+I
 qurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6jkl7vNPFtvBxlWV2KeH9eoUepDDSh+STAgXaBbRvsc=;
 b=OnkzGMAydbYs9YfFKpRWAqPVejAuRrCX0UokBAnyd+0EAkkU4G0NbIZ/5G+bmnPIXt
 En6HfF+NIZRX9FQd2eLqu5PvkOa9CvFaWr8SxMB6aI3KPeWxHgYt0yGM0uGO5Qs0NbJR
 cnI3SDgwol2cfzF8Fz4SJ1SexzohyMtk/aZz4xh0Pw7uOvsNxNENEe+bGXm3xXZRe383
 XphqvEZww5p0uEHtfrAnIYN8PIzYMMFPiiQYscHby1EmA/eg5pd1eza5eSZIuhQ+lxoY
 iHRY8dD9VLkw/UZJN/nmv6qBINtLYGTfB7VuCD1ap9FtSq41ZYb3bWdgnnXkGqxOqVT0
 5OLw==
X-Gm-Message-State: AOAM530ayWYVIkGw2HON/OvnoUh+piOCqjtC8OZYY46V7rMn5LtGYkQT
 74X1kdyqpLU8VCbbPqfJpj8=
X-Google-Smtp-Source: ABdhPJyWclbfBUCxZ0CQqrbnS3dhIvPrkpJ60mUOMh+lAznAHlspDzeZBuTK0LZO2JlraUl4bfaCIw==
X-Received: by 2002:aed:37a3:: with SMTP id j32mr7041381qtb.133.1601173113930; 
 Sat, 26 Sep 2020 19:18:33 -0700 (PDT)
Received: from localhost.localdomain (072-189-064-225.res.spectrum.com.
 [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id f12sm5276906qti.70.2020.09.26.19.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 19:18:33 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Sat, 26 Sep 2020 22:18:13 -0400
Message-Id: <cover.1601170670.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, William Breathitt Gray <vilhelm.gray@gmail.com>,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 0/5] Introduce the Counter character device
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

Changes in v5:
 - Fixed typographical errors in documentation and comments
 - Updated flow charts in documentation for clarity
 - Moved uapi header to be part of the character device intro patch
 - Fix git squash mistake in 104-quad-8.c; remove redundant changes
 - Fix git merge mistake in 104-quad-8.c; fix locking race condition
 - Minor code cleanup for clarity; adjust whitespace/flow
 - Use put_device if device_add fails
 - Document sysfs structures
 - Rename "owner" symbols to "scope"; more apt name
 - Use resource-managed devm_* allocation functions
 - Rename *_free functions to *_remove; following common convention
 - Rename COUNTER_DATA* to COUNTER_COMP*; more obvious meaning
 - Rename various symbol and define names for clarity
 - Bring back static ops function; more secure to have static const
 - Rename counter_available union members to "enums" and "strs"
 - Implement COUNTER_EVENT* constants; event types are now standard
 - Implement atomic Counter watches swap; no more racy event config

Over the past couple years we have noticed some shortcomings with the
Counter sysfs interface. Although useful in the majority of situations,
there are certain use-cases where interacting through sysfs attributes
can become cumbersome and inefficient. A desire to support more advanced
functionality such as timestamps, multi-axes positioning tables, and
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
strings from before.

A high-level view of how a count value is passed down from a counter
driver is exemplified by the following. The driver callbacks are first
registered to the Counter core component for use by the Counter
userspace interface components:

                        +----------------------------+
	                | Counter device driver      |
                        +----------------------------+
                        | Processes data from device |
                        +----------------------------+
                                |
                         -------------------
                        / driver callbacks /
                        -------------------
                                |
                                V
                        +----------------------+
                        | Counter core         |
                        +----------------------+
                        | Routes device driver |
                        | callbacks to the     |
                        | userspace interfaces |
                        +----------------------+
                                |
                         -------------------
                        / driver callbacks /
                        -------------------
                                |
                +---------------+---------------+
                |                               |
                V                               V
        +--------------------+          +---------------------+
        | Counter sysfs      |          | Counter chrdev      |
        +--------------------+          +---------------------+
        | Translates to the  |          | Translates to the   |
        | standard Counter   |          | standard Counter    |
        | sysfs output       |          | character device    |
        +--------------------+          +---------------------+

Thereafter, data can be transferred directly between the Counter device
driver and Counter userspace interface:

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
                        | Counter device driver      |
                        +----------------------------+
                        | Processes data from device |
                        |----------------------------|
                        | Type: u64                  |
                        | Value: 42                  |
                        +----------------------------+
                                |
                         ----------
                        / u64     /
                        ----------
                                |
                +---------------+---------------+
                |                               |
                V                               V
        +--------------------+          +---------------------+
        | Counter sysfs      |          | Counter chrdev      |
        +--------------------+          +---------------------+
        | Translates to the  |          | Translates to the   |
        | standard Counter   |          | standard Counter    |
        | sysfs output       |          | character device    |
        |--------------------|          |---------------------|
        | Type: const char * |          | Type: u64           |
        | Value: "42"        |          | Value: 42           |
        +--------------------+          +---------------------+
                |                               |
         ---------------                 -----------------------
        / const char * /                / struct counter_event /
        ---------------                 -----------------------
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

Counter device data is exposed through standard character device read
operations. Device data is gathered when a Counter event is pushed by
the respective Counter device driver. Configuration is handled via ioctl
operations on the respective Counter character device node.

The following are some questions I have about this patchset:

1. Should standard Counter component data types be defined as u8 or u32?

   Many standard Counter component types such COUNTER_COMP_SIGNAL_LEVEL
   have standard values defined (e.g. COUNTER_SIGNAL_LEVEL_LOW and
   COUNTER_SIGNAL_LEVEL_HIGH). These values are currently handled by the
   Counter subsystem code as u8 data types.

   If u32 is used for these values instead, C enum structures could be
   used by driver authors to implicit cast these values via the driver
   callback parameters; userspace would still use u32 with no issue.

   In theory this can work because GCC will treat enums are having a
   32-bit size; but I worry about the possibility of build targets that
   have -fshort-enums enabled, resulting in enums having a size less
   than 32 bits. Would this be a problem?

2. Should I have reserved members in the userspace structures?

   The structures in include/uapi/linux/counter.h are available to
   userspace applications. Should I reserve space in these structures
   for future additions and usage? Will endianess and packing be a
   concern here?

William Breathitt Gray (5):
  counter: Internalize sysfs interface code
  docs: counter: Update to reflect sysfs internalization
  counter: Add character device interface
  docs: counter: Document character device interface
  counter: 104-quad-8: Add IRQ support for the ACCES 104-QUAD-8

 Documentation/ABI/testing/sysfs-bus-counter   |   18 +
 .../ABI/testing/sysfs-bus-counter-104-quad-8  |   32 +
 Documentation/driver-api/generic-counter.rst  |  408 ++++-
 .../userspace-api/ioctl/ioctl-number.rst      |    1 +
 MAINTAINERS                                   |    2 +-
 drivers/counter/104-quad-8.c                  |  775 +++++----
 drivers/counter/Kconfig                       |    6 +-
 drivers/counter/Makefile                      |    1 +
 drivers/counter/counter-chrdev.c              |  451 +++++
 drivers/counter/counter-chrdev.h              |   16 +
 drivers/counter/counter-core.c                |  190 +++
 drivers/counter/counter-sysfs.c               |  862 ++++++++++
 drivers/counter/counter-sysfs.h               |   13 +
 drivers/counter/counter.c                     | 1496 -----------------
 drivers/counter/ftm-quaddec.c                 |   60 +-
 drivers/counter/microchip-tcb-capture.c       |  100 +-
 drivers/counter/stm32-lptimer-cnt.c           |  175 +-
 drivers/counter/stm32-timer-cnt.c             |  145 +-
 drivers/counter/ti-eqep.c                     |  226 +--
 include/linux/counter.h                       |  618 +++----
 include/linux/counter_enum.h                  |   45 -
 include/uapi/linux/counter.h                  |   99 ++
 22 files changed, 3053 insertions(+), 2686 deletions(-)
 create mode 100644 drivers/counter/counter-chrdev.c
 create mode 100644 drivers/counter/counter-chrdev.h
 create mode 100644 drivers/counter/counter-core.c
 create mode 100644 drivers/counter/counter-sysfs.c
 create mode 100644 drivers/counter/counter-sysfs.h
 delete mode 100644 drivers/counter/counter.c
 delete mode 100644 include/linux/counter_enum.h
 create mode 100644 include/uapi/linux/counter.h

-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
