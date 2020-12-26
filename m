Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5A52E2CA0
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Dec 2020 01:15:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA794C57189;
	Sat, 26 Dec 2020 00:15:52 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93F6EC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Dec 2020 00:15:50 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id w79so4787593qkb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Dec 2020 16:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PxAgU1WfL6A6iPu2j2hj5dVAGCk6SFni6uPVy6sVa4U=;
 b=KgXghmdXGDretIAEABqOWL0eoPX37qPaCDeklcNS5Cc675+ckqkSyLRb0LVy+ZT43k
 amqOZ3R9oC6uEUBT5AfnPJv5fJqxNDlM9geoBYKzbvzLuCbiW6d8MuaAPbTMgkBBL4mD
 By7IwSel4EkybwOZWLCnfUxfyo5HuhlGdhn5MhVqPc7UVH0FRri0NrnLM58IP9mWvXZX
 yDOl1TKzuN8KwENqsbZWj1ck1tzOL37GPT1HFs0pAgnHStvyKWo95uYtNB23a8B3y0/0
 55XztVvdGS4bbzgXrONnLAAWgl8hACCp7x/X9ZtyQdmffvC9u2PoGsgIKbTU9l01biun
 P7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PxAgU1WfL6A6iPu2j2hj5dVAGCk6SFni6uPVy6sVa4U=;
 b=Cc26NBZ1G2JiwztbranZEdnNZ0yo3G4yMHlBDoA2N9eXdnYtWW5YgQ5fGJKeNDmdFp
 q8lEVd0ODxXAk6ZOv12HVMSP+/eFlM/iqf7TYLkQ/XEnZs58LT6GSoc9LEtXHMz4Q9M4
 6V9ICDB5DZ7t+dz2h//54eefZsmhJkXHI32yH9IrbB1VqzTKMujFnjoDjaZdtfYoGK2L
 fOiBmJsTQjfIaqAUkuoKhK3gb1Xjbjv4kL8z01spSSQHKIi6X2LqaMUrqIRDbU730+oQ
 Dk09+G+QZOa4kbYGVTpzUWiFYrHuxdmX2DubVHXX0mUFm75DYV1W/Dla+wvNWxn7iAeW
 uIkg==
X-Gm-Message-State: AOAM533zWIeBGu1vTMZX6WkAvjarcFp7kHwiifR5no1OqfaHbkELuAXP
 5Bgle09QJZOUZM19IEA/MWk=
X-Google-Smtp-Source: ABdhPJwYzhbeaVR/f5XOKlEzuNoPvW3K6Aimy7b8lbQAbk+c2cusQw76b0O3LyyJF3gX+vq/lgv22w==
X-Received: by 2002:a37:416:: with SMTP id 22mr34998246qke.480.1608941749304; 
 Fri, 25 Dec 2020 16:15:49 -0800 (PST)
Received: from localhost.localdomain (072-189-064-225.res.spectrum.com.
 [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id b14sm18349966qtx.36.2020.12.25.16.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Dec 2020 16:15:48 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 25 Dec 2020 19:15:37 -0500
Message-Id: <1e69b7beae4cf352bddb379220d0d52b20db0634.1608935587.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608935587.git.vilhelm.gray@gmail.com>
References: <cover.1608935587.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 4/5] docs: counter: Document character
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
 Documentation/ABI/testing/sysfs-bus-counter   |   9 +
 Documentation/driver-api/generic-counter.rst  | 236 +++++++++++++++---
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 3 files changed, 205 insertions(+), 41 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Documentation/ABI/testing/sysfs-bus-counter
index 1820ce2f9183..8f6ea0a50b75 100644
--- a/Documentation/ABI/testing/sysfs-bus-counter
+++ b/Documentation/ABI/testing/sysfs-bus-counter
@@ -99,6 +99,15 @@ Description:
 		Read-only attribute that indicates whether excessive noise is
 		present at the channel Y counter inputs.
 
+What:		/sys/bus/counter/devices/counterX/countY/extensionZ_name
+What:		/sys/bus/counter/devices/counterX/extensionZ_name
+What:		/sys/bus/counter/devices/counterX/signalY/extensionZ_name
+KernelVersion:	5.12
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Read-only attribute that indicates the component name of
+		Extension Z.
+
 What:		/sys/bus/counter/devices/counterX/countY/function
 KernelVersion:	5.2
 Contact:	linux-iio@vger.kernel.org
diff --git a/Documentation/driver-api/generic-counter.rst b/Documentation/driver-api/generic-counter.rst
index b842ddbbd8a0..4775dcaff557 100644
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
 
@@ -387,16 +374,16 @@ userspace interface components::
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
@@ -427,23 +414,30 @@ driver and Counter userspace interface::
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
@@ -452,7 +446,7 @@ driver and Counter userspace interface::
         \ Count: "42"                                      /
          --------------------------------------------------
 
-There are three primary components involved:
+There are four primary components involved:
 
 Counter device driver
 ---------------------
@@ -472,3 +466,163 @@ and vice versa.
 Please refer to the `Documentation/ABI/testing/sysfs-bus-counter` file
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
+and reside under the `/sys/bus/counter/devices/counterX` directory,
+where `X` is to the respective counter device id. Please see
+`Documentation/ABI/testing/sysfs-bus-counter` for detailed information
+on each Generic Counter interface sysfs attribute.
+
+Through these sysfs attributes, programs and scripts may interact with
+the Generic Counter paradigm Counts, Signals, and Synapses of respective
+counter devices.
+
+Counter Character Device
+========================
+
+Counter character device nodes are created under the `/dev` directory as
+`counterX`, where `X` is the respective counter device id. Defines for
+the standard Counter data types are exposed via the userspace
+`include/uapi/linux/counter.h` file.
+
+Counter events
+--------------
+Counter device drivers can support Counter events by utilizing the
+`counter_push_event` function::
+
+        int counter_push_event(struct counter_device *const counter, const u8 event,
+                               const u8 channel);
+
+The event id is specified by the `event` parameter; the event channel id
+is specified by the `channel` parameter. When this function is called,
+the Counter data associated with the respective event is gathered, and a
+`struct counter_event` is generated for each datum and pushed to
+userspace.
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
+When `counter_push_event(counter, COUNTER_EVENT_INDEX, 1)` is called for
+example, it will go down the list for the `COUNTER_EVENT_INDEX` event
+channel 1 and execute the read callbacks for Signal 4, Signal 4
+Extension 0, and Count 4 -- the data returned for each is pushed to a
+kfifo as a `struct counter_event`, which userspace can retrieve via a
+standard read operation on the respective character device node.
+
+Userspace
+---------
+Userspace applications can configure Counter events via ioctl operations
+on the Counter character device node. There following ioctl codes are
+supported and provided by the `linux/counter.h` userspace header file:
+
+* COUNTER_CLEAR_WATCHES_IOCTL:
+  Clear all Counter watches from all events
+
+* COUNTER_ADD_WATCH_IOCTL:
+  Add a Counter watch for the specified event
+
+* COUNTER_LOAD_WATCHES_IOCTL:
+  Activates the Counter watches added earlier
+
+To configure events to gather Counter data, users first populate a
+`struct counter_watch` with the relevant event id, event channel id, and
+the information for the desired Counter component from which to read,
+and then pass it via the `COUNTER_ADD_WATCH_IOCTL` ioctl command.
+
+Note that an event can be watched without gathering Counter data by
+setting the `component.type` member equal to `COUNTER_COMPONENT_NONE`.
+With this configuration the Counter character device will simply
+populate the event timestamps for those respective
+`struct counter_event` elements and ignore the component value.
+
+The `COUNTER_ADD_WATCH_IOCTL` command will buffer these Counter watches.
+When ready, the `COUNTER_LOAD_WATCHES_IOCTL` ioctl command may be used
+to activate these Counter watches.
+
+Userspace applications can then execute a `read` operation (optionally
+calling `poll` first) on the Counter character device node to retrieve
+`struct counter_event` elements with the desired data.
+
+For example, the following userspace code opens `/dev/counter0`,
+configures the `COUNTER_EVENT_INDEX` event channel 0 to gather Count 0
+and Count 1, and prints out the data as it becomes available on the
+character device node::
+
+        #include <fcntl.h>
+        #include <linux/counter.h>
+        #include <stdio.h>
+        #include <string.h>
+        #include <sys/ioctl.h>
+        #include <unistd.h>
+
+        struct counter_watch watches[2] = {
+                {
+                        .component.type = COUNTER_COMPONENT_COUNT,
+                        .component.scope = COUNTER_SCOPE_COUNT,
+                        .component.parent = 0,
+                        .event = COUNTER_EVENT_INDEX,
+                        .channel = 0,
+                },
+                {
+                        .component.type = COUNTER_COMPONENT_COUNT,
+                        .component.scope = COUNTER_SCOPE_COUNT,
+                        .component.parent = 1,
+                        .event = COUNTER_EVENT_INDEX,
+                        .channel = 0,
+                },
+        };
+
+        int main(void)
+        {
+                int fd;
+                struct counter_event event_data[2];
+
+                fd = open("/dev/counter0", O_RDWR);
+
+                ioctl(fd, COUNTER_ADD_WATCH_IOCTL, watches);
+                ioctl(fd, COUNTER_ADD_WATCH_IOCTL, watches + 1);
+                ioctl(fd, COUNTER_LOAD_WATCHES_IOCTL);
+
+                for (;;) {
+                        read(fd, event_data, sizeof(event_data));
+
+                        printf("Timestamp 0: %llu\tCount 0: %llu\n"
+                               "Error Message 0: %s\n"
+                               "Timestamp 1: %llu\tCount 1: %llu\n"
+                               "Error Message 1: %s\n",
+                               (unsigned long long)event_data[0].timestamp,
+                               (unsigned long long)event_data[0].value,
+                               strerror(event_data[0].errno),
+                               (unsigned long long)event_data[1].timestamp,
+                               (unsigned long long)event_data[1].value,
+                               strerror(event_data[1].errno));
+                }
+
+                return 0;
+        }
diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 55a2d9b2ce33..b7761ceb82a7 100644
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
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
