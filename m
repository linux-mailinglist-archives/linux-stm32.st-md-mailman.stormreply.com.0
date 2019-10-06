Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7422CD90D
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Oct 2019 22:03:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71A41C36B0B;
	Sun,  6 Oct 2019 20:03:36 +0000 (UTC)
Received: from mail-yw1-f48.google.com (mail-yw1-f48.google.com
 [209.85.161.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80CC5C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Oct 2019 20:03:33 +0000 (UTC)
Received: by mail-yw1-f48.google.com with SMTP id d192so4354914ywa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 06 Oct 2019 13:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oi1lDkMlTFONnp6bwWaGnqUvaiX5vepqhjmjsnY4BQc=;
 b=LBbx5c6oe/DCoJegdyvkhilRsrfMIqU1E1Q/6QHocTi1xd4DvJDg8qxjOgu91Ccd7X
 IpFtmWi/mtWV2ozmStU60+ocRReTEq6hwuhohf1gODtt8k9IYFNYGW+EkxMq8dvk02bv
 y8SdobV4fvu1QSDn/FYcCnGV0FvMFdjT/oN4UPm2zEVen9phKHif2qtoHAVTkOc9kW1v
 ibGVflyXht7pQOoCLpAFbfS7E63yZWS5KYtCiT56ma9BCRdR1zNsDozbirkm4Fi+f6N+
 F28mr8vQ/dEEy/SobhSt9P8nzh5aRzlM6XQfx88QE0A7MLf1pga0IqiOyPu6KQOTmlwN
 GkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oi1lDkMlTFONnp6bwWaGnqUvaiX5vepqhjmjsnY4BQc=;
 b=EgkH4R2msUt/K7Kin/AeMAPBIRdIUm9MyEAs2EJ/2GQRgsBFTkZ2FJR+yCO2Y9IeBX
 48PxnPnZMdanhY4WGbWJSJO16R8/lvHjqeSmiNEno5vJTeaZ2Qb5i6A4NlW7P7RWgmDV
 glqL5IAjaD1amZKwL+GbGLWs/FASmz8fvIt3++31TZh+7g3Kdvj0qR4DWPTNGFzSiZun
 eAmegJ1VqamC5w3FD3QKxMjoCbOP8Zr+whPrtWrXwT91EAxNF0vDtQf4tWjEgJ5oIxOt
 KTlMR7o9Wy52cSq0zRBums2a44taHscSVBqe5IQNffzOy9D/VSzIEFyOBwGOewCV1niv
 TUCw==
X-Gm-Message-State: APjAAAUgMnHYQV0e6PRMDqYfL22zVn7SN9wCBOwXzyVqCNIofZExgvHR
 RmH8eLuymg91+oeHQjfzLdo=
X-Google-Smtp-Source: APXvYqyW8RVmQI6J41bkpIKVj8Zd5IiblHuEB0TjHzh3r1P2DVY6tYSPzDgwRTyxamsLWg/zD4eouA==
X-Received: by 2002:a81:7a02:: with SMTP id v2mr17797467ywc.398.1570392212146; 
 Sun, 06 Oct 2019 13:03:32 -0700 (PDT)
Received: from localhost.localdomain (072-189-084-142.res.spectrum.com.
 [72.189.84.142])
 by smtp.gmail.com with ESMTPSA id x16sm3765266ywx.103.2019.10.06.13.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2019 13:03:31 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Sun,  6 Oct 2019 16:03:10 -0400
Message-Id: <927b67f2c645faab1182229625e93913c2a267ef.1570391994.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1570391994.git.vilhelm.gray@gmail.com>
References: <cover.1570391994.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: benjamin.gaignard@linaro.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, linux-kernel@vger.kernel.org,
 William Breathitt Gray <vilhelm.gray@gmail.com>, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, david@lechnology.com
Subject: [Linux-stm32] [PATCH v5 2/3] docs: driver-api: generic-counter:
	Update Count and Signal data types
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

Count data is now always represented as an unsigned integer, while
Signal data is either SIGNAL_LOW or SIGNAL_HIGH. In addition,
clarification changes and additions are made to better explain the
theory of the Generic Counter interface and its use.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 Documentation/driver-api/generic-counter.rst | 162 +++++++++++--------
 1 file changed, 92 insertions(+), 70 deletions(-)

diff --git a/Documentation/driver-api/generic-counter.rst b/Documentation/driver-api/generic-counter.rst
index 8382f01a53e3..e622f8f6e56a 100644
--- a/Documentation/driver-api/generic-counter.rst
+++ b/Documentation/driver-api/generic-counter.rst
@@ -7,7 +7,7 @@ Generic Counter Interface
 Introduction
 ============
 
-Counter devices are prevalent within a diverse spectrum of industries.
+Counter devices are prevalent among a diverse spectrum of industries.
 The ubiquitous presence of these devices necessitates a common interface
 and standard of interaction and exposure. This driver API attempts to
 resolve the issue of duplicate code found among existing counter device
@@ -26,23 +26,72 @@ the Generic Counter interface.
 
 There are three core components to a counter:
 
-* Count:
-  Count data for a set of Signals.
-
 * Signal:
-  Input data that is evaluated by the counter to determine the count
-  data.
+  Stream of data to be evaluated by the counter.
 
 * Synapse:
-  The association of a Signal with a respective Count.
+  Association of a Signal, and evaluation trigger, with a Count.
+
+* Count:
+  Accumulation of the effects of connected Synapses.
+
+SIGNAL
+------
+A Signal represents a stream of data. This is the input data that is
+evaluated by the counter to determine the count data; e.g. a quadrature
+signal output line of a rotary encoder. Not all counter devices provide
+user access to the Signal data, so exposure is optional for drivers.
+
+When the Signal data is available for user access, the Generic Counter
+interface provides the following available signal values:
+
+* SIGNAL_LOW:
+  Signal line is in a low state.
+
+* SIGNAL_HIGH:
+  Signal line is in a high state.
+
+A Signal may be associated with one or more Counts.
+
+SYNAPSE
+-------
+A Synapse represents the association of a Signal with a Count. Signal
+data affects respective Count data, and the Synapse represents this
+relationship.
+
+The Synapse action mode specifies the Signal data condition that
+triggers the respective Count's count function evaluation to update the
+count data. The Generic Counter interface provides the following
+available action modes:
+
+* None:
+  Signal does not trigger the count function. In Pulse-Direction count
+  function mode, this Signal is evaluated as Direction.
+
+* Rising Edge:
+  Low state transitions to high state.
+
+* Falling Edge:
+  High state transitions to low state.
+
+* Both Edges:
+  Any state transition.
+
+A counter is defined as a set of input signals associated with count
+data that are generated by the evaluation of the state of the associated
+input signals as defined by the respective count functions. Within the
+context of the Generic Counter interface, a counter consists of Counts
+each associated with a set of Signals, whose respective Synapse
+instances represent the count function update conditions for the
+associated Counts.
+
+A Synapse associates one Signal with one Count.
 
 COUNT
 -----
-A Count represents the count data for a set of Signals. The Generic
-Counter interface provides the following available count data types:
-
-* COUNT_POSITION:
-  Unsigned integer value representing position.
+A Count represents the accumulation of the effects of connected
+Synapses; i.e. the count data for a set of Signals. The Generic
+Counter interface represents the count data as a natural number.
 
 A Count has a count function mode which represents the update behavior
 for the count data. The Generic Counter interface provides the following
@@ -86,60 +135,7 @@ available count function modes:
     Any state transition on either quadrature pair signals updates the
     respective count. Quadrature encoding determines the direction.
 
-A Count has a set of one or more associated Signals.
-
-SIGNAL
-------
-A Signal represents a counter input data; this is the input data that is
-evaluated by the counter to determine the count data; e.g. a quadrature
-signal output line of a rotary encoder. Not all counter devices provide
-user access to the Signal data.
-
-The Generic Counter interface provides the following available signal
-data types for when the Signal data is available for user access:
-
-* SIGNAL_LEVEL:
-  Signal line state level. The following states are possible:
-
-  - SIGNAL_LEVEL_LOW:
-    Signal line is in a low state.
-
-  - SIGNAL_LEVEL_HIGH:
-    Signal line is in a high state.
-
-A Signal may be associated with one or more Counts.
-
-SYNAPSE
--------
-A Synapse represents the association of a Signal with a respective
-Count. Signal data affects respective Count data, and the Synapse
-represents this relationship.
-
-The Synapse action mode specifies the Signal data condition which
-triggers the respective Count's count function evaluation to update the
-count data. The Generic Counter interface provides the following
-available action modes:
-
-* None:
-  Signal does not trigger the count function. In Pulse-Direction count
-  function mode, this Signal is evaluated as Direction.
-
-* Rising Edge:
-  Low state transitions to high state.
-
-* Falling Edge:
-  High state transitions to low state.
-
-* Both Edges:
-  Any state transition.
-
-A counter is defined as a set of input signals associated with count
-data that are generated by the evaluation of the state of the associated
-input signals as defined by the respective count functions. Within the
-context of the Generic Counter interface, a counter consists of Counts
-each associated with a set of Signals, whose respective Synapse
-instances represent the count function update conditions for the
-associated Counts.
+A Count has a set of one or more associated Synapses.
 
 Paradigm
 ========
@@ -286,10 +282,36 @@ if device memory-managed registration is desired.
 Extension sysfs attributes can be created for auxiliary functionality
 and data by passing in defined counter_device_ext, counter_count_ext,
 and counter_signal_ext structures. In these cases, the
-counter_device_ext structure is used for global configuration of the
-respective Counter device, while the counter_count_ext and
-counter_signal_ext structures allow for auxiliary exposure and
-configuration of a specific Count or Signal respectively.
+counter_device_ext structure is used for global/miscellaneous exposure
+and configuration of the respective Counter device, while the
+counter_count_ext and counter_signal_ext structures allow for auxiliary
+exposure and configuration of a specific Count or Signal respectively.
+
+Determining the type of extension to create is a matter of scope.
+
+* Signal extensions are attributes that expose information/control
+  specific to a Signal. These types of attributes will exist under a
+  Signal's directory in sysfs.
+
+  For example, if you have an invert feature for a Signal, you can have
+  a Signal extension called "invert" that toggles that feature:
+  /sys/bus/counter/devices/counterX/signalY/invert
+
+* Count extensions are attributes that expose information/control
+  specific to a Count. These type of attributes will exist under a
+  Count's directory in sysfs.
+
+  For example, if you want to pause/unpause a Count from updating, you
+  can have a Count extension called "enable" that toggles such:
+  /sys/bus/counter/devices/counterX/countY/enable
+
+* Device extensions are attributes that expose information/control
+  non-specific to a particular Count or Signal. This is where you would
+  put your global features or other miscellanous functionality.
+
+  For example, if your device has an overtemp sensor, you can report the
+  chip overheated via a device extension called "error_overtemp":
+  /sys/bus/counter/devices/counterX/error_overtemp
 
 Architecture
 ============
-- 
2.23.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
