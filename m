Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD789341ACB
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:03:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 927A7C58D5C;
	Fri, 19 Mar 2021 11:03:23 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6D12C58D5C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:03:21 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id bt4so4459307pjb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qfBy20t0xI6zB3lks2ke3zCFkHNH96tCN0m1kLgEiJI=;
 b=agpYO6qpTp9CmQ9Ivq0mKYpB7LcRFxWNp4HeJsPnMRCskwHmsmoFhr4s2VN3q4O/LH
 9nDiKDVEuI33O6JhCq+31909c3O28IDCyF+BoUT5Aau7S064/0AS7Rz4VIWH/faclpTF
 Kkv2Tofgo/QczyYAh6e2ZSfcrOG++ix2W5rg0fDtlOEfPTKCSzB3HXSX2vbD/rCO7MbY
 sl5UX8BWqBGph8knYOWZ21U+fujYNdhYITCBzR+UXgJRCzFdBZT1WgpexMAfNZ3kV0Ud
 F9Z1SoRjcUnX3FgtFMxXvHtMVMBjOYDrkfVHkeImobaVWWispN0O/hQPoM5OlyEdayPQ
 xfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qfBy20t0xI6zB3lks2ke3zCFkHNH96tCN0m1kLgEiJI=;
 b=qXdmsFUs+vO8Uj9AtZjTC0qPtNFHiuS2/BXRpmxKLIO9A0i1QicAkudg5jlPNAOBx7
 dJSwkNsdeXWWw43a3YjEf+OQvOnoN1KxAOUXMmPKy7RxJ5J0zlliY0kUFcIpk5qsOgez
 6FQlhMrYVlCAQ/EARhZoxdmMeeqgrmHV/munQIybd3fveZvk/f87JTzVKTx7a0FvTT6M
 45VJlC+dKAAFUhZNrnlYFd3XR0Id7QjKlwzBIxK7C7wFuD5zyCMhRFTtaNfMlKnPUbXI
 muUh7iPEXwTXINTmFW0b47PhoLy6SeeXiFGhcvboNpJ/giNw+7QYQaDwPSMw0BMnFsuB
 zYxg==
X-Gm-Message-State: AOAM532P5HqusFiMoK3waAXhX8yonSuJ5ZDbujT/iBfTi12gIgpfep+4
 /oLPN1Vroid+RE6VgnvvC/Y=
X-Google-Smtp-Source: ABdhPJzQhjGMekbr+F9XaDqYxgfQpKReUANW6Tjzx7xHkZeDKekLP3tQ7zyPF/5SwHiyFOpPe66Y5A==
X-Received: by 2002:a17:90a:ea91:: with SMTP id
 h17mr9165828pjz.66.1616151800346; 
 Fri, 19 Mar 2021 04:03:20 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i22sm4879042pjz.56.2021.03.19.04.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:03:19 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 19 Mar 2021 20:00:46 +0900
Message-Id: <c952fbc009b2ed34868f07c5dd7f7086c667be63.1616150619.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616150619.git.vilhelm.gray@gmail.com>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v10 27/33] docs: counter: Document character
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

This patch adds high-level documentation about the Counter subsystem
character device interface.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 Documentation/driver-api/generic-counter.rst  | 185 ++++++++++++++----
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 2 files changed, 145 insertions(+), 41 deletions(-)

diff --git a/Documentation/driver-api/generic-counter.rst b/Documentation/driver-api/generic-counter.rst
index f6397218aa4c..62a702e7f994 100644
--- a/Documentation/driver-api/generic-counter.rst
+++ b/Documentation/driver-api/generic-counter.rst
@@ -223,19 +223,6 @@ whether an input line is differential or single-ended) and instead focus
 on the core idea of what the data and process represent (e.g. position
 as interpreted from quadrature encoding data).
 
-Userspace Interface
-===================
-
-Several sysfs attributes are generated by the Generic Counter interface,
-and reside under the /sys/bus/counter/devices/counterX directory, where
-counterX refers to the respective counter device. Please see
-Documentation/ABI/testing/sysfs-bus-counter for detailed
-information on each Generic Counter interface sysfs attribute.
-
-Through these sysfs attributes, programs and scripts may interact with
-the Generic Counter paradigm Counts, Signals, and Synapses of respective
-counter devices.
-
 Driver API
 ==========
 
@@ -388,16 +375,16 @@ userspace interface components::
                         / driver callbacks /
                         -------------------
                                 |
-                +---------------+
-                |
-                V
-        +--------------------+
-        | Counter sysfs      |
-        +--------------------+
-        | Translates to the  |
-        | standard Counter   |
-        | sysfs output       |
-        +--------------------+
+                +---------------+---------------+
+                |                               |
+                V                               V
+        +--------------------+          +---------------------+
+        | Counter sysfs      |          | Counter chrdev      |
+        +--------------------+          +---------------------+
+        | Translates to the  |          | Translates to the   |
+        | standard Counter   |          | standard Counter    |
+        | sysfs output       |          | character device    |
+        +--------------------+          +---------------------+
 
 Thereafter, data can be transferred directly between the Counter device
 driver and Counter userspace interface::
@@ -428,23 +415,30 @@ driver and Counter userspace interface::
                         / u64     /
                         ----------
                                 |
-                +---------------+
-                |
-                V
-        +--------------------+
-        | Counter sysfs      |
-        +--------------------+
-        | Translates to the  |
-        | standard Counter   |
-        | sysfs output       |
-        |--------------------|
-        | Type: const char * |
-        | Value: "42"        |
-        +--------------------+
-                |
-         ---------------
-        / const char * /
-        ---------------
+                +---------------+---------------+
+                |                               |
+                V                               V
+        +--------------------+          +---------------------+
+        | Counter sysfs      |          | Counter chrdev      |
+        +--------------------+          +---------------------+
+        | Translates to the  |          | Translates to the   |
+        | standard Counter   |          | standard Counter    |
+        | sysfs output       |          | character device    |
+        |--------------------|          |---------------------|
+        | Type: const char * |          | Type: u64           |
+        | Value: "42"        |          | Value: 42           |
+        +--------------------+          +---------------------+
+                |                               |
+         ---------------                 -----------------------
+        / const char * /                / struct counter_event /
+        ---------------                 -----------------------
+                |                               |
+                |                               V
+                |                       +-----------+
+                |                       | read      |
+                |                       +-----------+
+                |                       \ Count: 42 /
+                |                        -----------
                 |
                 V
         +--------------------------------------------------+
@@ -453,7 +447,7 @@ driver and Counter userspace interface::
         \ Count: "42"                                      /
          --------------------------------------------------
 
-There are three primary components involved:
+There are four primary components involved:
 
 Counter device driver
 ---------------------
@@ -473,3 +467,112 @@ and vice versa.
 Please refer to the ``Documentation/ABI/testing/sysfs-bus-counter`` file
 for a detailed breakdown of the available Generic Counter interface
 sysfs attributes.
+
+Counter chrdev
+--------------
+Translates counter data to the standard Counter character device; data
+is transferred via standard character device read calls, while Counter
+events are configured via ioctl calls.
+
+Sysfs Interface
+===============
+
+Several sysfs attributes are generated by the Generic Counter interface,
+and reside under the ``/sys/bus/counter/devices/counterX`` directory,
+where ``X`` is to the respective counter device id. Please see
+``Documentation/ABI/testing/sysfs-bus-counter`` for detailed information
+on each Generic Counter interface sysfs attribute.
+
+Through these sysfs attributes, programs and scripts may interact with
+the Generic Counter paradigm Counts, Signals, and Synapses of respective
+counter devices.
+
+Counter Character Device
+========================
+
+Counter character device nodes are created under the ``/dev`` directory
+as ``counterX``, where ``X`` is the respective counter device id.
+Defines for the standard Counter data types are exposed via the
+userspace ``include/uapi/linux/counter.h`` file.
+
+Counter events
+--------------
+Counter device drivers can support Counter events by utilizing the
+``counter_push_event`` function::
+
+        void counter_push_event(struct counter_device *const counter, const u8 event,
+                                const u8 channel);
+
+The event id is specified by the ``event`` parameter; the event channel
+id is specified by the ``channel`` parameter. When this function is
+called, the Counter data associated with the respective event is
+gathered, and a ``struct counter_event`` is generated for each datum and
+pushed to userspace.
+
+Counter events can be configured by users to report various Counter
+data of interest. This can be conceptualized as a list of Counter
+component read calls to perform. For example::
+
+        +~~~~~~~~~~~~~~~~~~~~~~~~+~~~~~~~~~~~~~~~~~~~~~~~~+
+        | COUNTER_EVENT_OVERFLOW | COUNTER_EVENT_INDEX    |
+        +~~~~~~~~~~~~~~~~~~~~~~~~+~~~~~~~~~~~~~~~~~~~~~~~~+
+        | Channel 0              | Channel 0              |
+        +------------------------+------------------------+
+        | * Count 0              | * Signal 0             |
+        | * Count 1              | * Signal 0 Extension 0 |
+        | * Signal 3             | * Extension 4          |
+        | * Count 4 Extension 2  +------------------------+
+        | * Signal 5 Extension 0 | Channel 1              |
+        |                        +------------------------+
+        |                        | * Signal 4             |
+        |                        | * Signal 4 Extension 0 |
+        |                        | * Count 7              |
+        +------------------------+------------------------+
+
+When ``counter_push_event(counter, COUNTER_EVENT_INDEX, 1)`` is called
+for example, it will go down the list for the ``COUNTER_EVENT_INDEX``
+event channel 1 and execute the read callbacks for Signal 4, Signal 4
+Extension 0, and Count 4 -- the data returned for each is pushed to a
+kfifo as a ``struct counter_event``, which userspace can retrieve via a
+standard read operation on the respective character device node.
+
+Userspace
+---------
+Userspace applications can configure Counter events via ioctl operations
+on the Counter character device node. There following ioctl codes are
+supported and provided by the ``linux/counter.h`` userspace header file:
+
+* COUNTER_ADD_WATCH_IOCTL:
+  Queues a Counter watch for the specified event. The queued watches
+  will not be applied until ``COUNTER_ENABLE_EVENTS_IOCTL`` is called.
+
+* COUNTER_ENABLE_EVENTS_IOCTL:
+  Enables monitoring the events specified by the Counter watches that
+  were queued by ``COUNTER_ADD_WATCH_IOCTL``. If events are already
+  enabled, the new set of watches replaces the old one. Calling this
+  ioctl also has the effect of clearing the queue of watches added by
+  ``COUNTER_ADD_WATCH_IOCTL``.
+
+* COUNTER_DISABLE_EVENTS_IOCTL:
+  Stops monitoring the previously enabled events.
+
+To configure events to gather Counter data, users first populate a
+``struct counter_watch`` with the relevant event id, event channel id,
+and the information for the desired Counter component from which to
+read, and then pass it via the ``COUNTER_ADD_WATCH_IOCTL`` ioctl
+command.
+
+Note that an event can be watched without gathering Counter data by
+setting the ``component.type`` member equal to
+``COUNTER_COMPONENT_NONE``. With this configuration the Counter
+character device will simply populate the event timestamps for those
+respective ``struct counter_event`` elements and ignore the component
+value.
+
+The ``COUNTER_ADD_WATCH_IOCTL`` command will buffer these Counter
+watches. When ready, the ``COUNTER_ENABLE_EVENTS_IOCTL`` ioctl command
+may be used to activate these Counter watches.
+
+Userspace applications can then execute a ``read`` operation (optionally
+calling ``poll`` first) on the Counter character device node to retrieve
+``struct counter_event`` elements with the desired data.
diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 96b2ae9f277f..bb57eac06f6b 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -88,6 +88,7 @@ Code  Seq#    Include File                                           Comments
                                                                      <http://infiniband.sourceforge.net/>
 0x20  all    drivers/cdrom/cm206.h
 0x22  all    scsi/sg.h
+0x3E  00-0F  linux/counter.h                                         <mailto:linux-iio@vger.kernel.org>
 '!'   00-1F  uapi/linux/seccomp.h
 '#'   00-3F                                                          IEEE 1394 Subsystem
                                                                      Block for the entire subsystem
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
