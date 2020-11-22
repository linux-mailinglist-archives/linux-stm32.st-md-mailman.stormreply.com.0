Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 741112BC91F
	for <lists+linux-stm32@lfdr.de>; Sun, 22 Nov 2020 21:30:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E58ABC5663D;
	Sun, 22 Nov 2020 20:30:13 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FB64C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Nov 2020 20:30:11 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id v143so14763755qkb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Nov 2020 12:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kFhanjy6cq9u6pCyJCDCCRZRA7jLll7R0Ehj4TdK5o0=;
 b=N4ywAcKD2IvWeShu0qjc9ql+G8i0AyKLEQGeqLAX04FUo8WFkupSvGjf6I5PinnkpY
 6KF9/k1gOcY832IArpj9f/54rNcebtRsmh9n08YwLmQ7IBG/CP7foNwWTRLJgxlX6mzr
 Pku/98VSxlAXi9yWYKctM+f3tJkZw4PD7GZ9LPC2p6ZoxxE7QH8/5zgABnVb5DbzG9pi
 u/y3d9WNjqhT+gldyR6dsHZyXEXAyQnISKn1cTo5MWlG8VkhpDFzuLKAExbe0VOhP61b
 5PzZKvHVYWp9bojqZYUSAL0c1x9B1eGZZ8h+vXtfzHv/aeSconyzYn5a2mgkD7hIOFrW
 vvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kFhanjy6cq9u6pCyJCDCCRZRA7jLll7R0Ehj4TdK5o0=;
 b=GM476FGKWdP5gYO7IKNUQ5Oh4Eyje0YNO4xrdND/mHFvmcEOSV8NRoUwcyUOEY2imf
 ICgLY81u+UNJQFaAtlUk0Bb68Hubq508DL+01bq59MnPliozSOzpg3BooYV4aUuu8ODp
 gE4U3oWQ3y0T1nUlMQ6jFi7NEynSgVVPxH/1AjpJQmi1NLwy2qYKdRMH+zqdZtyq6d2k
 G0eV4WllnzKY+YfrppVYRibRcord7iHK+TzLSQ2n5CpQmvEOMdJ6QrTWTcZwjm/VUK8z
 3FaMExbn13DPoW9Zu2jBRrcnx8nzfUb1QxsSYFq1Q2YSogtGiJrpixzwr8CJGzkIiwP9
 VMJA==
X-Gm-Message-State: AOAM531Wvm4de3TLRxiIh5aBRBdtMZ05Mwcrq2hLNiejJjoZ1RnJKJM/
 LFZW7i4p4U/an8vSsfOqCy4=
X-Google-Smtp-Source: ABdhPJzq54eLjNm5Ffz3tvoJrUF/q/GsxjpylgX1f2FqFwqX4injx0UeWHvV3YrXi1CDe/3CrnEYaQ==
X-Received: by 2002:a37:5103:: with SMTP id f3mr6622004qkb.460.1606077010337; 
 Sun, 22 Nov 2020 12:30:10 -0800 (PST)
Received: from localhost.localdomain (072-189-064-225.res.spectrum.com.
 [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id p73sm7446522qka.79.2020.11.22.12.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2020 12:30:09 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Sun, 22 Nov 2020 15:29:51 -0500
Message-Id: <cover.1606075915.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 0/5] Introduce the Counter character device
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

Changes in v6:
 - Consolidated the value member of struct counter_event down to a
   single u64; u64 should be capable of representing all component
   values
 - Removed extension width sysfs attributes; no longer needed when value
   is always u64
 - Implemented COUNTER_COMPONENT_DUMMY to allow timestamp grabs without
   component data reads
 - Implemented events_config() callback; called during
   COUNTER_CLEAR_WATCHES_IOCTL and COUNTER_LOAD_WATCHES_IOCTL in order
   to allow devices a chance to adjust (enable/disable IRQ, etc.) for
   the new events configuration requested by the user
 - Simplified example code in Documentation by removing confusing use of
   poll() call
 - Removed redundant ida_simple_remove() from counter_register()
 - Renamed devm_counter_unreg() to devm_counter_unregister()
 - Renamed functions in counter-sysfs.c to be clearer
 - Fixed miscellaneous typos throughout files
 - Added more kernel doc comments; I've left some defines without
   comments if they seemed obvious -- but please let me know if further
   documentation is needed
 - Refactored quad8_irq_handler() to use WARN_ONCE() instead of
   returning on error; this should prevent interrupts from entering an
   endless loop
 - General refactoring and additional comments for clarity
 - Returns EOPNOTSUPP instead of EFAULT now if a Counter watch is added
   for unsupported component
 - Renamed COUNTER_SET_WATCH_IOCTL TO COUNTER_ADD_WATCH_IOCTL to make
   the use clear
 - Reimplemented the parent and id members of struct counter_component
   as __u8 instead of __u64; it's unlikely we'll ever have a device that
   supports more than 255 components
 - Reimplement __u64 variables in include/uapi/linux/counter.h as
   __aligned_u64 to prevent 32-bit vs 64-bit alignment issues
 - Fixed return value bug in counter_comp_u8_store(); enums set to a
   value with index > 0 should now work correctly
 - Fixed spectre issues in counter-chrdev.c
 - Removed redundant get_device() call from counter_register()
 - Moved put_device() to after the events_list is freed lest we leak
   memory

I'm skipping the introduction blurb because it was just a rehashing of
information included in the documentation patches within this patchset.
Instead I will focus this cover letter on discussions about this
patchset and the userspace interface implications.

1. Should standard Counter component data types be defined as u8 or u32?

   Many standard Counter component types such COUNTER_COMP_SIGNAL_LEVEL
   have standard values defined (e.g. COUNTER_SIGNAL_LEVEL_LOW and
   COUNTER_SIGNAL_LEVEL_HIGH). These values are currently handled by the
   Counter subsystem code as u8 data types.

   If u32 is used for these values instead, C enum structures could be
   used by driver authors to implicitly cast these values via the driver
   callback parameters.

   This question is primarily addressed to David Lechner. I'm somewhat
   confused about how this setup would look in device drivers. I've gone
   ahead and refactored the code to support u32 enums, and pushed it to
   a separate branch on my repository called counter_chrdev_v6_u32_enum:
   https://gitlab.com/vilhelmgray/iio/-/tree/counter_chrdev_v6_u32_enum

   Please check it out and let me know what you think. Is this the
   support you had in mind? I'm curious to see an example of how would
   your driver callback functions would look in this case. Is everything
   works out fine, then I'll submit this branch as v7 of this patchset.

2. How should we handle "raw" timestamps?

   Ahmad Fatoum brought up the possibility of returning "raw" timestamps
   similar to what the network stack offers (see the network stack
   SOF_TIMESTAMPING_{RAW,SYS}_HARDWARE support).

   I'm not very familiar with the networking stack code, but if I
   understand correctly the SOF_TIMESTAMPING_RAW_HARDWARE timestamps are
   values returned from the device. If so, I suspect we would be able to
   support these "raw" timestamps by defining them as Counter Extensions
   and returning them in struct counter_event elements similar to the
   other Extension values.

William Breathitt Gray (5):
  counter: Internalize sysfs interface code
  docs: counter: Update to reflect sysfs internalization
  counter: Add character device interface
  docs: counter: Document character device interface
  counter: 104-quad-8: Add IRQ support for the ACCES 104-QUAD-8

 Documentation/ABI/testing/sysfs-bus-counter   |   18 +-
 .../ABI/testing/sysfs-bus-counter-104-quad-8  |   32 +
 Documentation/driver-api/generic-counter.rst  |  411 ++++-
 .../userspace-api/ioctl/ioctl-number.rst      |    1 +
 MAINTAINERS                                   |    2 +-
 drivers/counter/104-quad-8.c                  |  778 +++++----
 drivers/counter/Kconfig                       |    6 +-
 drivers/counter/Makefile                      |    1 +
 drivers/counter/counter-chrdev.c              |  476 ++++++
 drivers/counter/counter-chrdev.h              |   16 +
 drivers/counter/counter-core.c                |  183 ++
 drivers/counter/counter-sysfs.c               |  806 +++++++++
 drivers/counter/counter-sysfs.h               |   13 +
 drivers/counter/counter.c                     | 1496 -----------------
 drivers/counter/ftm-quaddec.c                 |   60 +-
 drivers/counter/microchip-tcb-capture.c       |  114 +-
 drivers/counter/stm32-lptimer-cnt.c           |  175 +-
 drivers/counter/stm32-timer-cnt.c             |  145 +-
 drivers/counter/ti-eqep.c                     |  224 +--
 include/linux/counter.h                       |  676 ++++----
 include/linux/counter_enum.h                  |   45 -
 include/uapi/linux/counter.h                  |  105 ++
 22 files changed, 3094 insertions(+), 2689 deletions(-)
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
